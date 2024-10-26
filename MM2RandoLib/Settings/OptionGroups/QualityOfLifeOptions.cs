using MM2RandoLib.Settings.Options;
using MM2Randomizer.Settings.Options;
using System.ComponentModel;

namespace MM2Randomizer.Settings.OptionGroups
{
    public class QualityOfLifeOptions : OptionGroup
    {
        [Description("Disable Flashing Effects")]
        public BoolOption DisableFlashingEffects { get; } = new(true);

        [Description("Reduce Underwater Lag")]
        public BoolOption EnableUnderwaterLagReduction { get; } = new(true);

        [Description("Disable Waterfall")]
        [PatchRom(0xFE10, 1)] // Set Bubble Man number of palettes to 1
        public BoolOption DisableWaterfall { get; } = new(true);

        [Description("Allow Pause During Item Use")]
        [AssembleFile("Options.pause_with_items.asm")]
        public BoolOption DisablePauseLock { get; } = new(true);

        [Description("Enable Leftward Wall Ejection")]
        [AssembleFile("Options.pause_with_items.asm")]
        public BoolOption EnableLeftwardWallEjection { get; } = new(false);

        [Description("Fix Bird Object Despawn")]
        [AssembleFile("Options.bird_egg_fix.asm")]
        public BoolOption EnableBirdEggFix { get; } = new(true);

        [Description("Make Stage Select Default")]
        [Tooltip("Make Stage Select the default choice after obtaining weapons rather than Password.")]
        [PatchRom(0x37bea, 1)]
        public BoolOption StageSelectDefault { get; } = new(true);
    }
}
