// Copyright (c) Microsoft. All rights reserved.
// Licensed under the MIT license. See LICENSE file in the project root for full license information.

// These are just sanity checks for the CorInfoInlineRestrictions to make sure that nothing in the jit breaks
// when we are prevented from inlining something.

.assembly extern mscorlib {}
.assembly test {}
.module test.il

.class private auto ansi beforefieldinit Test
       extends [mscorlib]System.Object
{
  .field static int32 i

  .method public hidebysig specialname rtspecialname instance void .ctor() cil managed
  {
    ldarg.0
    call       instance void [mscorlib]System.Object::.ctor()
    ret
  }

  .method public hidebysig static string myString() cil managed
  {
    ldstr "foo"
    ret
  }

  .method public hidebysig static void myHelperCall() cil managed
  {
    call void Test::myCall()
    ret
  }

  .method public hidebysig static void myCall() cil managed
  {
    ldc.i4.0
    ldc.i4.1
    add
    pop
    ldsfld int32 Test::i
    ldc.i4.0
    beq End
    ldsfld int32 Test::i
    ldc.i4.1
    sub
    stsfld int32 Test::i
    call void Test::myHelperCall()
    End:  ret
  }

  .method public hidebysig instance int32 func() cil managed
  {
    ldc.i4.3
    ret
  }

  .method public hidebysig instance void this() cil managed
  {
    newobj instance void Test::.ctor()
    call instance int32 Test::func()
    pop
    ret
  }

  .method public hidebysig static int32  Main() cil managed
  {
    .entrypoint
    .locals init (class Test V_0)
    ldc.i4 10
    stsfld int32 Test::i
    call void Test::myCall()
    newobj instance void Test::.ctor()
    stloc V_0
    ldloc V_0
    call instance int32 Test::func()
    pop
    call string Test::myString()
    call void [mscorlib]System.Console::WriteLine(string)
    ldc.i4 100
    ret
  }
}
