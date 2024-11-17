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
            var task = asm.Apply(rom);
            try
            {
                task.Start();
            }
            catch (InvalidOperationException)
            {
                // Task may already be started
                Debug.Assert(task.Status != TaskStatus.Created);
            }

            var res = task.Result;
            Debug.Assert(res is not null);

            return res;
        }
    }
}
