using System;
using System.Collections.Generic;
using System.Linq;

// Attributes that may be placed on options to automatically apply different actions based on the value of the option.

namespace MM2RandoLib.Settings.Options;

/// <summary>
/// Base class for all option action attributes.
/// </summary>
[AttributeUsage(AttributeTargets.Field | AttributeTargets.Property, AllowMultiple = true, Inherited = true)]
public abstract class OptionActionAttribute : Attribute
{

}

/// <summary>
/// When applied to an option, defines the specified symbol with the value of the option.
/// </summary>
public sealed class DefineValueSymbolAttribute : OptionActionAttribute
{
    /// <summary>
    /// The name of the symbol to define.
    /// </summary>
    public string SymbolName { get; }

    public DefineValueSymbolAttribute(string symbol) => SymbolName = symbol;
}

/// <summary>
/// When applied to an option, writes the integer value of the option (either bool or enum) to the ROM at the specified location.
/// </summary>
public sealed class WriteValueToRomAttribute : OptionActionAttribute
{
    /// <summary>
    /// The ROM file offset to write the value.
    /// </summary>
    public int RomOffset { get; }

    public WriteValueToRomAttribute(int offset) => RomOffset = offset;

    public WriteValueToRomAttribute(
        int bankIdx,
        int address,
        int bankSize = 0x4000)
        : this(bankIdx * bankSize + (address % bankSize) + 0x10)
    { }
}

/// <summary>
/// Base class for all option action attributes that are specific to a particular value of that option.
/// </summary>
public abstract class OptionValueActionAttribute : OptionActionAttribute
{
    /// <summary>
    /// The value of the option to apply the action to. If null, the default will be used based on the option type. For BoolOptions the default is true.
    /// </summary>
    public object? OptionValue { get; init; } = null;
}

/// <summary>
/// When applied to an option, defines a symbol that is provided to assembly modules.
/// </summary>
public sealed class DefineSymbolAttribute : OptionValueActionAttribute
{
    /// <summary>
    /// The name of the symbol to define.
    /// </summary>
    public string SymbolName { get; }

    /// <summary>
    /// The value to assign the symbol. If null, the symbol is defined with no value.
    /// </summary>
    public int? Value { get; init; } = null;

    public DefineSymbolAttribute(string symbol) => SymbolName = symbol;
}

/// <summary>
/// When applied to an option, causes the specified file to be assembled.
/// </summary>
public sealed class AssembleFileAttribute : OptionValueActionAttribute
{
    /// <summary>
    /// The path of the assembly file relative to the Asm directory.
    /// </summary>
    public string Path { get; }

    public AssembleFileAttribute(string path) => Path = path;
}

public abstract class RomOffsetAttribute : OptionValueActionAttribute
{
    /// <summary>
    /// The ROM file offset to apply the patch.
    /// </summary>
    public int RomOffset { get; }

    public RomOffsetAttribute(int offset) => RomOffset = offset;

    public RomOffsetAttribute(
        int bankIdx,
        int address,
        int bankSize = 0x4000)
        : this(bankIdx * bankSize + (address % bankSize) + 0x10)
    {}
}

/// <summary>
/// When applied to an option, performs a simple byte patch at the specified ROM location.
/// </summary>
public sealed class PatchRomAttribute : RomOffsetAttribute
{
    /// <summary>
    /// The data to place at the specified offset.
    /// </summary>
    public byte[] Data { get; }

    public PatchRomAttribute(int offset, byte[] data)
        : base(offset)
        => Data = data;

    public PatchRomAttribute(int offset, byte data)
        : this(offset, new byte[] { data })
    {}

    public PatchRomAttribute(int offset, string hexData)
        : this(offset, Convert.FromHexString(hexData))
    {}

    public PatchRomAttribute(
        int bankIdx,
        int address,
        byte[] data,
        int bankSize = 0x4000)
        : base(bankIdx, address, bankSize)
        => Data = data;

    public PatchRomAttribute(
        int bankIdx, 
        int address, 
        byte data, 
        int bankSize = 0x4000)
        : this(bankIdx, address, new byte[] { data }, bankSize)
    {}

    public PatchRomAttribute(
        int bankIdx, 
        int address, 
        string hexData, 
        int bankSize = 0x4000)
        : this(bankIdx, address, Convert.FromHexString(hexData), bankSize)
    {}
}

/// <summary>
/// When applied to an option, applies one IPS file from each subdirectory of the specified root at random.
/// </summary>
public sealed class ApplyOneIpsPerDirAttribute : OptionValueActionAttribute
{
    /// <summary>
    /// The root of the subtree to search for subdirectories with IPS files to apply, relative to Resources.
    /// </summary>
    public string RootPath { get; }

    /// <summary>
    /// Whether "none" (no IPS) is a valid choice for each directory.
    /// </summary>
    public bool AllowNone { get; init; } = true;

    public bool ApplyRebaseIps { get; init; } = false;

    /// <summary>
    /// If true IPS writes to the common bank will be automatically relocated (IPS is not aware of the ROM resize), if false they will not (IPS is aware of the ROM resize). If null, IPS writes to the common bank will be rebased only if the IPS makes no writes outside the original ROM size.
    /// </summary>
    public bool RebaseIps { get; init; } = true;

    public ApplyOneIpsPerDirAttribute(string rootPath) => RootPath = rootPath;
}
