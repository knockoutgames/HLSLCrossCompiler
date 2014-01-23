//
// Generated by Microsoft (R) HLSL Shader Compiler 9.30.9200.20499
//
//
///
// Buffer Definitions: 
//
// Resource bind info for BufferOut
// {
//
//   struct MyStruct
//   {
//       
//       uint pixDiff;                  // Offset:    0
//       uint pixDiff2;                 // Offset:    4
//
//   } $Element;                        // Offset:    0 Size:     8
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim Slot Elements
// ------------------------------ ---------- ------- ----------- ---- --------
// TextureSampler                    sampler      NA          NA    0        1
// TextureA                          texture  float4          2d    0        1
// TextureB                          texture  float4          2d    1        1
// BufferOut                             UAV  struct         r/w    1        1
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// TEXCOORD                 0   xyzw        0     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t1
dcl_uav_structured u1, 8
dcl_input_ps linear v0.xy
dcl_output o0.xyzw
dcl_temps 4
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, v0.xyxx, t0.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, v0.xyxx, t1.xyzw, s0
add r0.xyzw, r0.xyzw, -r1.xyzw
dp4 r0.x, r0.xyzw, r0.xyzw
ne r0.x, r0.x, l(0.000000)
if_nz r0.x
  atomic_iadd u1, l(0, 0, 0, 0), l(1)
  imm_atomic_iadd r0.x, u1, l(0, 4, 0, 0), l(3)
else 
  imm_atomic_and r0.x, u1, l(0, 4, 0, 0), l(3)
endif 
imm_atomic_umin r1.x, u1, l(0, 0, 0, 0), l(6)
imm_atomic_umax r2.x, u1, l(0, 4, 0, 0), l(6)
atomic_cmp_store u1, l(0, 4, 0, 0), l(2), r1.x
imm_atomic_xor r3.x, u1, l(0, 0, 0, 0), l(15)
atomic_or u1, l(0, 4, 0, 0), r3.x
utof o0.y, r0.x
utof o0.z, r1.x
utof o0.w, r2.x
mov o0.x, l(1.000000)
ret 
// Approximately 21 instruction slots used
