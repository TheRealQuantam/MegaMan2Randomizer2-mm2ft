using MM2RandoLib.Settings.Options;
using MM2Randomizer.Settings.Options;
using System;
using System.ComponentModel;

namespace MM2Randomizer.Settings.OptionGroups
{
    public class GameplayOptions : OptionGroup
    {
        [Description("Randomize Special Weapon Behavior")]
        public BoolOption RandomizeSpecialWeaponBehavior { get; } = new(true);

        [Description("Randomize Boss Weaknesses")]
        public BoolOption RandomizeBossWeaknesses { get; } = new(true);

        [Description("Randomize Robot Master Locations")]
        public BoolOption RandomizeRobotMasterLocations { get; } = new(true);

        [Description("Randomize Robot Master Behavior")]
        public BoolOption RandomizeRobotMasterBehavior { get; } = new(true);

        [Description("Randomize Special Item Locations")]
        public BoolOption RandomizeSpecialItemLocations { get; } = new(true);

        [Description("Randomize Enemy Spawns")]
        public BoolOption RandomizeEnemySpawns { get; } = new(true);

        [Description("Randomize Enemy Weaknesses")]
        public BoolOption RandomizeEnemyWeaknesses { get; } = new(true);

        [Description("Randomize False Floors")]
        public BoolOption RandomizeFalseFloors { get; } = new(true);

        [Description("Enable Faster Cutscene Text")]
        //// TODO: Make this an asm file
        [PatchRom(0x037D4A, 4)] // Weapon get text
        [PatchRom(0x038147, 0x60)] // READY text
        // This is the number of frames to wait after drawing the path on the map before fade out.
        // Default value 0x7D (125 frames), change to 0x10.
        [PatchRom(0x0359B8, 0x10)]
        // Skip 3 of the 4 extra pages of text that occur when receiving an item, and only show the last page "GET EQUIPPED WITH ITEM X"
        [PatchRom(0x037C88, "A62ABD81C24A09A08D2004EE20044CD0BC")]
        public BoolOption FasterCutsceneText { get; } = new(true);

        [Description("Enable Burst Chaser Mode")]
        public BoolOption BurstChaserMode { get; } = new(false);

        [Description("Hide Stage Names")]
        public BoolOption HideStageNames { get; } = new(false);

        [Description("Instant Death Ignores Invincibility")]
        [Tooltip("Instant death hazards such as spikes will be lethal regardless of invincibility frames like in Mega Man 1.")]
        [AssembleFile("Options.merciless.asm")]
        public BoolOption MercilessMode { get; } = new(false);

        [Description("Randomize PicoPico-kun Spawns")]
        public BoolOption RandomizePicoPicoSpawns { get; } = new(true);

        [NoCreateControl]
        public BoolOption RandomizeRefightTeleporters { get; } = new(true);
        [NoCreateControl]
        public BoolOption RandomizeRobotMasterStageSelection { get; } = new(true);
        [NoCreateControl]
        public BoolOption RandomizeSpecialWeaponReward { get; } = new(true);
    }
}
