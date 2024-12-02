using System.ComponentModel;

namespace MM2Randomizer.Settings.Options;

public enum ChargingSpeedOptionWithInstant
{
    [Description("Instant")]
    Instant = 0xff,
    [Description("8x Normal")]
    Normalx8 = 0x0,
    [Description("4x Normal")]
    Normalx4 = 0x1,
    [Description("2x Normal")]
    Normalx2 = 0x3,
    [Description("Normal")]
    Normal = 0x7,
}
