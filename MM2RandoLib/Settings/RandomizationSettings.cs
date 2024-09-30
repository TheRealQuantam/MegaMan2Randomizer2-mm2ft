using System;
using System.Collections.Generic;
using MM2Randomizer.Random;
using MM2RandoLib.Settings.Options;
using MM2Randomizer.Settings.OptionGroups;
using System.Diagnostics;
using System.Reflection;
using System.Linq;
using System.Dynamic;
using System.ComponentModel;
using System.Linq.Expressions;
using System.Diagnostics.CodeAnalysis;

namespace MM2Randomizer.Settings
{
    public class RandomizationSettings
    {
        //
        // Constructor
        //

        public RandomizationSettings()
        {
            BuildOptionsMetadata();
        }


        //
        // Variable Properties
        //

        public String? SeedString { get; set; }

        public String RomSourcePath { get; set; } = String.Empty;

        public SettingsPreset? SettingsPreset 
        {
            get => _preset; 
            set
            {
                HashSet<IOption> optsSet = new(ReferenceEqualityComparer.Instance);
                if (value is not null)
                {
                    foreach (var opt in value.Options)
                    {
                        opt.Option.OverrideRandomize = opt.Randomize;
                        opt.Option.OverrideValue = opt.Value;
                        opt.Option.Override = true;

                        optsSet.Add(opt.Option);
                    }
                }

                foreach (var opt in Options.Except<IOption>(
                    optsSet, ReferenceEqualityComparer.Instance))
                    opt.Override = false;

                _preset = value;
            }
        }
        SettingsPreset? _preset = null;

        public Boolean CreateLogFile { get; set; }


        public bool IsTournament => !string.IsNullOrEmpty(
            _preset?.TournamentTitleScreenString);

        //
        // Option Categories
        //

        public GameplayOptions GameplayOptions { get; } = new();
        public SpriteOptions SpriteOptions { get; } = new();
        public ChargingSpeedOptions ChargingSpeedOptions { get; } = new();
        public QualityOfLifeOptions QualityOfLifeOptions { get; } = new();
        public CosmeticOptions CosmeticOptions { get; } = new();

        public IReadOnlyList<IOption> Options => opts;
        public IReadOnlyDictionary<string, IOption> OptionsByPath => optsByPath;
        public IReadOnlyDictionary<string, IReadOnlyList<IOption>> OptionsByGroup => optsByGroup;

        readonly List<IOption> opts = new();
        readonly Dictionary<string, IOption> optsByPath = new();
        readonly Dictionary<string, IReadOnlyList<IOption>> optsByGroup = new();

        //
        // Public Methods
        //

        public void ActualizeBehaviorSettings(ISeed in_Seed)
        {
            foreach (var opt in opts.Where(x => x.Info is not null && !x.Info.IsCosmetic))
                opt.Actualize(in_Seed);
        }

        public void ActualizeCosmeticSettings(ISeed in_Seed)
        {
            foreach (var opt in opts.Where(x => x.Info is not null && x.Info.IsCosmetic))
                opt.Actualize(in_Seed);
        }

        public void SetFromFlagString(String in_OptionsFlagString, String in_CosmeticFlagString)
        {
        }

        public String GetBehaviorFlagsString()
        {
            return GetFlagsString(
                new RandomizationFlags(28),
                opts.Where(x => x.Info is not null && !x.Info.IsCosmetic));
        }


        public String GetCosmeticFlagsString()
        {
            return GetFlagsString(
                new RandomizationFlags(14),
                opts.Where(x => x.Info is not null && x.Info.IsCosmetic));
        }

        void BuildOptionsMetadata()
        {
            Stack<MemberInfo> optPath = new();
            HashSet<object> checkedObjs = new(ReferenceEqualityComparer.Instance);

            BuildOptionsMetadata(optPath, this.GetType().GetTypeInfo(), this, false, checkedObjs);

            return;
        }

        void BuildOptionsMetadata(
            Stack<MemberInfo> optPath, 
            TypeInfo objType, 
            object obj, 
            bool isCosmetic,
            HashSet<object> checkedObjs)
        {
            Debug.Assert(!checkedObjs.Contains(obj));

            checkedObjs.Add(obj);

            foreach (var mbrInfo in objType.GetMembers())
            {
                TypeInfo? mbrType = null;
                IOption? opt = null;
                object? mbrObj = null;
                if (mbrInfo is FieldInfo fieldInfo)
                {
                    opt = fieldInfo.GetValue(obj) as IOption;
                    mbrType = fieldInfo.FieldType.GetTypeInfo();
                    mbrObj = fieldInfo.GetValue(obj);
                }
                else if (mbrInfo is PropertyInfo propInfo)
                {
                    opt = propInfo.GetValue(obj) as IOption;
                    mbrType = propInfo.PropertyType.GetTypeInfo();
                    mbrObj = propInfo.GetValue(obj);
                }
                else
                    continue;

                if (opt is not null)
                    AddOptionMetadata(optPath, mbrInfo, opt, isCosmetic);
                else
                {
                    var grpAttr = mbrInfo.GetCustomAttribute<OptionGroupAttribute>()
                        ?? mbrType.GetCustomAttribute<OptionGroupAttribute>();
                    if (grpAttr is null)
                        continue;

                    Debug.Assert(mbrObj is not null);

                    optPath.Push(mbrInfo);
                    try
                    {
                        BuildOptionsMetadata(optPath, mbrType, mbrObj, grpAttr.IsCosmetic, checkedObjs);
                    }
                    finally
                    {
                        optPath.Pop();
                    }
                }
            }

            return;
        }

        void AddOptionMetadata(
            Stack<MemberInfo> optPath,
            MemberInfo mbrInfo,
            IOption opt,
            bool isCosmetic)
        {
            opt.Info = new(optPath.Reverse().Append(mbrInfo), opt, isCosmetic);

            opts.Add(opt);
            optsByPath[opt.Info.PathString] = opt;

            string grpPath = string.Join(".", optPath.Reverse().Select(x => x.Name));
            List<IOption>? grpOpts = null;
            if (optsByGroup.ContainsKey(grpPath))
                grpOpts = (List<IOption>)optsByGroup[grpPath];
            else
                optsByGroup[grpPath] = grpOpts = new();

            grpOpts.Add(opt);
        }

        String GetFlagsString(
            RandomizationFlags flags, 
            IEnumerable<IOption> opts)
        {
            foreach (var iopt in opts)
            {
                flags.PushValue(iopt.EffectiveRandomize);
                if (iopt is BoolOption opt)
                    flags.PushValue(opt.EffectiveValue);
                else if (iopt is IEnumOption ienumOpt)
                    flags.PushValue(
                        ienumOpt.EnumValueIdcs[iopt.EffectiveValue],
                        Enum.GetValues(iopt.Type).Length);
                else
                    Debug.Assert(false);
            }

            return flags.ToFlagString('.');
        }
    }
}
