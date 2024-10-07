﻿using MM2Randomizer;
using MM2Randomizer.Patcher;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;

namespace MM2Randomizer.Resources
{
    using RNode = ResourceNode;
    using RNodeEnum = IEnumerable<ResourceNode>;

    struct StringArrayComparaer : IEqualityComparer<string[]>, IComparer<string[]>
    {
        public int GetHashCode(string[] array)
        {
            int hash = array.Length != 0 ? array[0].GetHashCode() : 0;
            foreach (var str in array.Skip(1))
                hash = HashCode.Combine(hash, str.GetHashCode());

            return hash;
        }

        public bool Equals(string[]? a, string[]? b)
        {
            if (a is null)
                return b is null;
            else if (b is null)
                return true;
            else
                return a.SequenceEqual(b);
        }

        public int Compare(string[]? a, string[]? b)
        {
            if (a is null)
                return b is null ? 0 : -1;
            else if (b is null)
                return 1;

            foreach (var (aPart, bPart) in a.Zip(b))
            {
                int cmp = string.CompareOrdinal(aPart, bPart);
                if (cmp != 0)
                    return cmp;
            }

            return a.Length.CompareTo(b.Length);
        }
    }

    struct ResourceNodeSearcher : IComparer<RNode>
    {
        public string SearchString;

        public ResourceNodeSearcher(string searchString)
        {
            SearchString = searchString;
        }

        public int Compare(RNode? node, RNode? dummy)
        {
            //// TODO: While not currently showing itself, I suspect there's a bug lurking here with dot sort order. When the search string is a filename with an extension, I suspect the comparison can potentially be incorrect due to how the dot is handled.
            Debug.Assert(node is not null);

            // This must be done manually because dots don't play nicely with the sort order
            foreach (var (a, b) in node.Name.Zip(SearchString))
            {
                if (b == '.' && a != '.')
                    // a can have a dot in it but for b it's basically a null
                    return 1;

                int cmp = a.CompareTo(b);
                if (cmp != 0) 
                    return cmp;
            }

            return (node.Name.Length < SearchString.Length 
                && SearchString[node.Name.Length] == '.')
                ? 0
                : node.Name.Length.CompareTo(SearchString.Length);
        }
    }

    public class ResourceNode
    {
        public string Name { get; }
        public string Path { get; }
        public bool IsFile { get; }
        public IReadOnlyList<RNode> Children => _children;
        public RNodeEnum Files => Children.Where(x => x.IsFile);
        public RNodeEnum Directories => Children.Where(x => !x.IsFile);
        public RNodeEnum Descendants => EnumDescendants();
        public RNodeEnum AllFiles => EnumDescendants().Where(x => x.IsFile);

        protected List<RNode> _children;

        public ResourceNode(
            string name, 
            string path, 
            IReadOnlyList<RNode> children, 
            bool isFile = true)
        {
            Name = name;
            Path = path;
            IsFile = isFile && children.Count == 0;
            _children = new(children);
        }

        public override string ToString() => Path;

        public RNode? TryFind(string path)
        {
            ResourceNodeSearcher cmp = new(path);
            int searchIdx = _children.BinarySearch(this, cmp);
            RNode? node = null;
            if (searchIdx >= 0)
            {
                node = _children[searchIdx];
                if (node.Name.Length == path.Length)
                    return node;

                Debug.Assert(string.Compare(node.Name, 0, path, 0, node.Name.Length) == 0);
                Debug.Assert(path[node.Name.Length] == '.');
            }
            else
            {
                searchIdx = ~searchIdx - 1;
                if (searchIdx < 0)
                    return null;

                int endIdx = Math.Min(searchIdx + 2, _children.Count);
                bool found = false;
                for (; searchIdx < endIdx; searchIdx++)
                {
                    node = _children[searchIdx];
                    if (node.Name.Length + 1 < path.Length
                        && path[node.Name.Length] == '.'
                        && string.Compare(node.Name, 0, path, 0, node.Name.Length) == 0)
                    {
                        found = true;
                        break;
                    }
                }

                if (!found)
                    return null;

                // Found the next node to descend to
                Debug.Assert(node is not null);
                Debug.Assert(node.Name.Length + 1 < path.Length);
            }

            return node.TryFind(path.Substring(node.Name.Length + 1));
        }

        public RNode Find(string path)
        {
            var node = TryFind(path);
            if (node is null)
                throw new FileNotFoundException();

            return node;
        }

        RNodeEnum EnumDescendants()
        {
            Stack<IEnumerator<RNode>> enStack = new();
            IEnumerator<RNode>? en = Children.GetEnumerator();
            while (en is not null)
            {
                while (!en.MoveNext())
                {
                    if (!enStack.TryPop(out en))
                        break;
                }

                if (en is not null)
                {
                    var node = en.Current;
                    yield return node;

                    if (node.Children.Count != 0)
                    {
                        enStack.Push(en);

                        en = node.Children.GetEnumerator();
                    }
                }
            }
        }
    }

    public class ResourceTree
    {
        public readonly Assembly Assembly;
        public readonly string Prefix;
        public readonly string EffectivePrefix;

        public readonly RNode Root;

        public RNodeEnum All => Root.Descendants.Prepend(Root);
        public RNodeEnum Files => Root.Files;
        public RNodeEnum AllFiles => Root.AllFiles;
        public RNodeEnum AllDirectories => All.Where(x => !x.IsFile);

        public ResourceTree(
            Assembly? asm = null,
            string? prefix = null,
            bool asmPre = true)
            : base()
        {
            if (asm is null)
                asm = Assembly.GetCallingAssembly();

            Assembly = asm;
            Prefix = prefix ?? string.Empty;
            EffectivePrefix = asm.GetResourcePrefix(asmPre, prefix) ?? string.Empty;

            // Get the list of paths
            var pathsParts = asm.GetResourceNames(asmPre, prefix)
                .Select(x => x.Split('.')).ToList();

            // Clean up the paths
            HashSet<string> cmnExts = new(pathsParts
                .GroupBy(x => x[^1].ToLowerInvariant())
                .Where(g => g.Count() > 1)
                .Select(g => g.Key),
                StringComparer.InvariantCultureIgnoreCase);

            //Dictionary<string[], List<string>> pathNames = new();
            List<string> newParts = new();
            for (int pathIdx = 0; pathIdx < pathsParts.Count; pathIdx++)
            {
                var parts = pathsParts[pathIdx];
                newParts.Clear();

                int partIdx = 0;
                while (partIdx < parts.Length)
                {
                    string part = parts[partIdx];
                    int endIdx = partIdx + 1;
                    if (part == string.Empty)
                    {
                        // Fuse to following parts
                        while (endIdx < parts.Length)
                        {
                            if (parts[++endIdx - 1] == string.Empty)
                                break;
                        }

                        part = string.Join(
                            ".", parts.Skip(partIdx).Take(endIdx - partIdx));
                    }

                    newParts.Add(part);

                    partIdx = endIdx;
                }

                // Check for extension
                int numDirParts = newParts.Count - 1;
                if (cmnExts.Contains(newParts[numDirParts]))
                    numDirParts--;

                string name = string.Join(".", newParts.Skip(numDirParts));
                pathsParts[pathIdx]
                    = newParts.Take(numDirParts).Append(name).ToArray();
            }

            // Finally, create the tree
            StringArrayComparaer cmp = new();
            pathsParts.Sort(cmp);

            Dictionary<string[], RNode> intNodes = new(cmp);

            Root = intNodes[Array.Empty<string>()] 
                = new("", "", Array.Empty<RNode>(), false);

            foreach (var parts in pathsParts)
            {
                RNode node = new(
                    parts[^1],
                    string.Join(".", parts),
                    Array.Empty<RNode>());

                for (int numParts = parts.Length - 1; numParts >= 0; numParts--)
                {
                    var dirParts = parts.Take(numParts).ToArray();
                    RNode? parent = null;
                    if (intNodes.TryGetValue(dirParts, out parent))
                    {
                        Debug.Assert(!parent.IsFile);

                        ((List<RNode>)parent.Children).Add(node);
                        break;
                    }

                    intNodes[dirParts] = parent = new(
                        dirParts[^1],
                        string.Join(".", dirParts),
                        Array.Empty<RNode>(),
                        false);

                    ((List<RNode>)parent.Children).Add(node);

                    node = parent;
                }
            }
        }

        public RNode? TryFind(string path) => Root.TryFind(path);
        public RNode Find(string path) => Root.Find(path);

        public byte[] LoadResource(RNode node)
        {
            Debug.Assert(node.IsFile);

            return Assembly.LoadResource(
                string.Concat(EffectivePrefix, node.Path), false);
        }

        public byte[] LoadResource(string path) => LoadResource(Find(path));

        public string LoadResource(RNode node, Encoding enc)
        {
            Debug.Assert(node.IsFile);

            return Assembly.LoadResource(
                string.Concat(EffectivePrefix, node.Path), enc, false);
        }

        public string LoadResource(string path, Encoding enc) 
            => LoadResource(Find(path), enc);

        public string LoadUtf8Resource(RNode node)
        {
            Debug.Assert(node.IsFile);

            return Assembly.LoadUtf8Resource(
                string.Concat(EffectivePrefix, node.Path), false);
        }

        public string LoadUtf8Resource(string path) => LoadUtf8Resource(Find(path));

        public void TestFind()
        {
            foreach (RNode node in Root.Descendants)
            {
                RNode? foundNode = Root.Find(node.Path);

                Debug.Assert(foundNode is not null);
                Debug.Assert(foundNode == node);
            }
        }

        public void TestPaths()
        {
            foreach (RNode node in AllFiles)
                Assembly.LoadResource(EffectivePrefix + node.Path, false);
        }
    }
}
