// Copyright (c) Microsoft. All rights reserved.
// Licensed under the MIT license. See LICENSE file in the project root for full license information.

.assembly extern legacy library mscorlib {}
.assembly ILGEN_0xeed686f5 {}
.class ILGEN_0xeed686f5 {

.method static int32 main() {
.entrypoint
.maxstack	25
.try {
 ldc.i4 44
 newarr [mscorlib]System.Int64
 ldc.i4 44
 ldelem.i8
 ldc.i8 8
 div
 conv.i4
 ldc.i4 5
 xor
 conv.u8
 conv.r4
 conv.i4
 
  pop
  leave exit
} catch [mscorlib]System.IndexOutOfRangeException
{
  pop
  leave exit
}
exit:
  ldc.i4 100
  ret
}
}
