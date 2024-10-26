using System;
using System.Collections.Generic;
using System.Linq;

// Attributes that may be placed on options to automatically apply different actions based on the value of the option.

namespace MM2RandoLib.Settings.Options;

[AttributeUsage(AttributeTargets.Field | AttributeTargets.Property, AllowMultiple = true, Inherited = true)]
public abstract class OptionActionAttribute : Attribute
{
    /// <summary>
    /// The value of the option to apply the action to. If null, the default will be used based on the option type. For BoolOptions the default is true.
    /// </summary>
    public object? OptionValue { get; init; } = null;
}

/// <summary>
/// When applied to an option, defines a symbol that is provided to assembly modules.
/// </summary>
public sealed class DefineSymbolAttribute : OptionActionAttribute
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
public sealed class AssembleFileAttribute : OptionActionAttribute
{
    /// <summary>
    /// The path of the assembly file relative to the Asm directory.
    /// </summary>
    public string Path { get; }

    public AssembleFileAttribute(string path) => Path = path;
}

/// <summary>
/// When applied to an option, performs a simple byte patch at the specified ROM location.
/// </summary>
public sealed class PatchRomAttribute : OptionActionAttribute
{
    /// <summary>
    /// The ROM file offset to apply the patch.
    /// </summary>
    public int RomOffset { get; }

    /// <summary>
    /// The data to place at the specified offset.
    /// </summary>
    public byte[] Data { get; }

    public PatchRomAttribute(int offset, byte[] data)
    {
        RomOffset = offset;
        Data = data;
    }

    public PatchRomAttribute(int offset, byte data)
        : this(offset, new byte[] { data })
    {
    }

    public PatchRomAttribute(int offset, string hexData)
        : this(offset, Convert.FromHexString(hexData))
    {
    }

    public PatchRomAttribute(
        int bankIdx, 
        int address, 
        byte[] data, 
        int bankSize = 0x4000)
        : this(bankIdx * bankSize + (address % bankSize) + 0x10, data)
    {
    }

    public PatchRomAttribute(
        int bankIdx, 
        int address, 
        byte data, 
        int bankSize = 0x4000)
        : this(bankIdx, address, new byte[] { data }, bankSize)
    {
    }

    public PatchRomAttribute(
        int bankIdx, 
        int address, 
        string hexData, 
        int bankSize = 0x4000)
        : this(bankIdx, address, Convert.FromHexString(hexData), bankSize)
    {
    }
}