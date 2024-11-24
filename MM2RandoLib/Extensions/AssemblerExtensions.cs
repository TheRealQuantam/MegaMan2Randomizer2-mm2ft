using js65;
using System;
using System.Diagnostics;
using System.Threading.Tasks;

namespace MM2Randomizer.Extensions
{
    public static class AssemblerExtensions
    {
        public static byte[] ApplySynchronously(this Assembler asm, byte[] rom)
        {
            var task = Task.Run(async () => await asm.Apply(rom));
            var res = task.Result;
            Debug.Assert(res is not null);

            return res;
        }
    }
}
