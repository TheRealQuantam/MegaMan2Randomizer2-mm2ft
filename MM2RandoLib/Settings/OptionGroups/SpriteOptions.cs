using MM2RandoLib.Settings.Options;
using MM2Randomizer.Settings.Options;
using System.ComponentModel;

namespace MM2Randomizer.Settings.OptionGroups
{
    public class SpriteOptions : OptionGroup
    {
        [Description("Randomize Boss Sprites")]
        // No action as it requires special logic
        public BoolOption RandomizeBossSprites { get; } = new(true);

        [Description("Randomize Enemy Sprites")]
        [ApplyOneIpsPerDir("SpritePatches.Enemies")]
        public BoolOption RandomizeEnemySprites { get; } = new(true);

        [Description("Randomize Special Weapon Sprites")]
        [ApplyOneIpsPerDir("SpritePatches.Weapons")]
        public BoolOption RandomizeSpecialWeaponSprites { get; } = new(true);

        [Description("Randomize Item Pickup Sprites")]
        [ApplyOneIpsPerDir("SpritePatches.Pickups")]
        public BoolOption RandomizeItemPickupSprites { get; } = new(true);

        [Description("Randomize Environment Sprites")]
        [ApplyOneIpsPerDir("SpritePatches.Environment", ApplyRebaseIps = true, RebaseIps = false)]
        public BoolOption RandomizeEnvironmentSprites { get; } = new(true);
    }
}
