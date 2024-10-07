using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Reflection.Metadata.Ecma335;
using System.Text;
using System.Xml.Linq;

namespace MM2Randomizer;

public static class AssemblyExtensions
{
    public static byte[] LoadResource(
        this Assembly asm, 
        string path, 
        bool asmPre = true)
    {
        using (var resStream = asm.GetResourceStream(path, asmPre))
        {
            var data = new byte[resStream.Length];
            resStream.ReadExactly(data, 0, data.Length);

            return data;
        }
    }

    public static string LoadResource(
        this Assembly asm, 
        string path, 
        Encoding enc,
        bool asmPre = true)
    {
        using (var resStream = asm.GetResourceStream(path, asmPre))
        {
            using (var reader = new StreamReader(resStream, enc))
                return reader.ReadToEnd();
        }
    }

    public static string LoadUtf8Resource(
        this Assembly asm, 
        string path,
        bool asmPre = true)
        => LoadResource(asm, path, Encoding.UTF8, asmPre);

    public static Stream GetResourceStream(
        this Assembly asm, 
        string path,
        bool asmPre = true)
    {
        if (asmPre)
            path = asm.GetResourcePrefix(true) + path
                ;
        var stream = asm.GetManifestResourceStream(path);
        if (stream is null)
            throw new FileNotFoundException("Resource not found", path);

        return stream;
    }

    public static string? GetResourcePrefix(
        this Assembly asm, 
        bool asmPrefix = true, 
        string? prefix = null,
        bool appendDot = true)
    {
        string dot = appendDot ? "." : "";
        if (string.IsNullOrEmpty(prefix))
        {
            return asmPrefix
                ? prefix = asm.GetName().Name + dot
                : null;
        }
        else if (!asmPrefix)
            return prefix + dot;
        else
            return $"{asm.GetName().Name}.{prefix}{dot}";

    }

    public static IEnumerable<string> GetResourceNames(
        this Assembly asm, 
        bool asmPrefix = true, 
        string? prefix = null)
    {
        prefix = asm.GetResourcePrefix(
            asmPrefix, 
            prefix,
            appendDot: prefix is null || !prefix.EndsWith("."));
        if (prefix is null)
            return asm.GetManifestResourceNames();
        else
        {
            return asm.GetManifestResourceNames()
                .Where(x => x.StartsWith(prefix))
                .Select(x => x.Substring(prefix.Length));
        }
    }
}
