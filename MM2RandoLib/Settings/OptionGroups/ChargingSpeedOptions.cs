using MM2RandoLib.Settings.Options;
using MM2Randomizer.Settings.Options;
using System.ComponentModel;

namespace MM2Randomizer.Settings.OptionGroups
{
    public class ChargingSpeedOptions : OptionGroup
    {
        [Description("Hit Point Charging Speed")]
        [DefineValueSymbol("HEALTH_REFILL_SPEED_MASK")]
        public EnumOption<ChargingSpeedOptionWithInstant> HitPoints { get; } = new(ChargingSpeedOptionWithInstant.Instant);

        [Description("Weapon Energy Charging Speed")]
        [DefineValueSymbol("ENERGY_REFILL_SPEED_MASK")]
        public EnumOption<ChargingSpeedOptionWithInstant> WeaponEnergy { get; } = new(ChargingSpeedOptionWithInstant.Instant);

        [Description("Energy Tank Charging Speed")]
        [DefineValueSymbol("ETANK_REFILL_SPEED_MASK")]
        public EnumOption<ChargingSpeedOptionWithInstant> EnergyTank { get; } = new(ChargingSpeedOptionWithInstant.Instant);

        [Description("Robot Master Energy Charging Speed")]
        [WriteValueToRom(0x2C142)]
        public EnumOption<ChargingSpeedOption> RobotMasterEnergy { get; } = new(ChargingSpeedOption.Fastest);

        [Description("Castle Boss Energy Charging Speed")]
        [WriteValueToRom(0x2E12B)]
        public EnumOption<ChargingSpeedOption> CastleBossEnergy { get; } = new(ChargingSpeedOption.Fastest);
    }
}
