// Copyright (c) Microsoft. All rights reserved.
// Licensed under the MIT license. See LICENSE file in the project root for full license information.

.assembly extern legacy library mscorlib {}
.assembly ILGEN_0xbf04a0ad {}
.class ILGEN_0xbf04a0ad {
.method static int32 Main() {
.entrypoint
.maxstack	20
.locals (int16 local_0x6)
.try {
 ldc.i4 0x9eab1f64 
 stloc local_0x6
 ldloc local_0x6
 ldc.i4.0
 ldc.i4 0x97f26688 
 add.ovf
 mul.ovf.un

  pop
  leave out_of_here
} catch [mscorlib]System.OverflowException { 
  pop
  leave out_of_here
}
out_of_here: ldc.i4 100 ret
}
}
