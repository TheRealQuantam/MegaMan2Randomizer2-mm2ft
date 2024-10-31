using System;
using System.ComponentModel;

namespace MM2Randomizer.Settings.Options;

public enum PercentOption
{
    [Description("0%")]
    Percent0 = 0,

    [Description("10%")]
    Percent10 = 3,

    [Description("20%")]
    Percent20 = 6,

    [Description("30%")]
    Percent30 = 8,

    [Description("40%")]
    Percent40 = 11,

    [Description("50%")]
    Percent50 = 14,

    [Description("60%")]
    Percent60 = 17,

    [Description("70%")]
    Percent70 = 20,

    [Description("80%")]
    Percent80 = 22,

    [Description("90%")]
    Percent90 = 25,

    [Description("100%")]
    Percent100 = 28,
}
