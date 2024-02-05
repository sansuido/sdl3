// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'lib_sdl.dart';

///
/// Get the number of CPU cores available.
///
/// \returns the total number of logical CPU cores. On CPUs that include
/// technologies such as hyperthreading, the number of logical cores
/// may be more than the number of physical cores.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetCPUCount(void)
/// ```
int sdlGetCpuCount() {
  final sdlGetCpuCountLookupFunction = libSdl3
      .lookupFunction<Int32 Function(), int Function()>('SDL_GetCPUCount');
  return sdlGetCpuCountLookupFunction();
}

///
/// Determine the L1 cache line size of the CPU.
///
/// This is useful for determining multi-threaded structure padding or SIMD
/// prefetch sizes.
///
/// \returns the L1 cache line size of the CPU, in bytes.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetCPUCacheLineSize(void)
/// ```
int sdlGetCpuCacheLineSize() {
  final sdlGetCpuCacheLineSizeLookupFunction =
      libSdl3.lookupFunction<Int32 Function(), int Function()>(
          'SDL_GetCPUCacheLineSize');
  return sdlGetCpuCacheLineSizeLookupFunction();
}

///
/// Determine whether the CPU has AltiVec features.
///
/// This always returns false on CPUs that aren't using PowerPC instruction
/// sets.
///
/// \returns SDL_TRUE if the CPU has AltiVec features or SDL_FALSE if not.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_HasAVX
/// \sa SDL_HasAVX2
/// \sa SDL_HasAVX512F
/// \sa SDL_HasMMX
/// \sa SDL_HasSSE
/// \sa SDL_HasSSE2
/// \sa SDL_HasSSE3
/// \sa SDL_HasSSE41
/// \sa SDL_HasSSE42
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_HasAltiVec(void)
/// ```
bool sdlHasAltiVec() {
  final sdlHasAltiVecLookupFunction = libSdl3
      .lookupFunction<Int32 Function(), int Function()>('SDL_HasAltiVec');
  return sdlHasAltiVecLookupFunction() == 1;
}

///
/// Determine whether the CPU has MMX features.
///
/// This always returns false on CPUs that aren't using Intel instruction sets.
///
/// \returns SDL_TRUE if the CPU has MMX features or SDL_FALSE if not.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_HasAltiVec
/// \sa SDL_HasAVX
/// \sa SDL_HasAVX2
/// \sa SDL_HasAVX512F
/// \sa SDL_HasSSE
/// \sa SDL_HasSSE2
/// \sa SDL_HasSSE3
/// \sa SDL_HasSSE41
/// \sa SDL_HasSSE42
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_HasMMX(void)
/// ```
bool sdlHasMmx() {
  final sdlHasMmxLookupFunction =
      libSdl3.lookupFunction<Int32 Function(), int Function()>('SDL_HasMMX');
  return sdlHasMmxLookupFunction() == 1;
}

///
/// Determine whether the CPU has SSE features.
///
/// This always returns false on CPUs that aren't using Intel instruction sets.
///
/// \returns SDL_TRUE if the CPU has SSE features or SDL_FALSE if not.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_HasAltiVec
/// \sa SDL_HasAVX
/// \sa SDL_HasAVX2
/// \sa SDL_HasAVX512F
/// \sa SDL_HasMMX
/// \sa SDL_HasSSE2
/// \sa SDL_HasSSE3
/// \sa SDL_HasSSE41
/// \sa SDL_HasSSE42
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_HasSSE(void)
/// ```
bool sdlHasSse() {
  final sdlHasSseLookupFunction =
      libSdl3.lookupFunction<Int32 Function(), int Function()>('SDL_HasSSE');
  return sdlHasSseLookupFunction() == 1;
}

///
/// Determine whether the CPU has SSE2 features.
///
/// This always returns false on CPUs that aren't using Intel instruction sets.
///
/// \returns SDL_TRUE if the CPU has SSE2 features or SDL_FALSE if not.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_HasAltiVec
/// \sa SDL_HasAVX
/// \sa SDL_HasAVX2
/// \sa SDL_HasAVX512F
/// \sa SDL_HasMMX
/// \sa SDL_HasSSE
/// \sa SDL_HasSSE3
/// \sa SDL_HasSSE41
/// \sa SDL_HasSSE42
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_HasSSE2(void)
/// ```
bool sdlHasSse2() {
  final sdlHasSse2LookupFunction =
      libSdl3.lookupFunction<Int32 Function(), int Function()>('SDL_HasSSE2');
  return sdlHasSse2LookupFunction() == 1;
}

///
/// Determine whether the CPU has SSE3 features.
///
/// This always returns false on CPUs that aren't using Intel instruction sets.
///
/// \returns SDL_TRUE if the CPU has SSE3 features or SDL_FALSE if not.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_HasAltiVec
/// \sa SDL_HasAVX
/// \sa SDL_HasAVX2
/// \sa SDL_HasAVX512F
/// \sa SDL_HasMMX
/// \sa SDL_HasSSE
/// \sa SDL_HasSSE2
/// \sa SDL_HasSSE41
/// \sa SDL_HasSSE42
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_HasSSE3(void)
/// ```
bool sdlHasSse3() {
  final sdlHasSse3LookupFunction =
      libSdl3.lookupFunction<Int32 Function(), int Function()>('SDL_HasSSE3');
  return sdlHasSse3LookupFunction() == 1;
}

///
/// Determine whether the CPU has SSE4.1 features.
///
/// This always returns false on CPUs that aren't using Intel instruction sets.
///
/// \returns SDL_TRUE if the CPU has SSE4.1 features or SDL_FALSE if not.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_HasAltiVec
/// \sa SDL_HasAVX
/// \sa SDL_HasAVX2
/// \sa SDL_HasAVX512F
/// \sa SDL_HasMMX
/// \sa SDL_HasSSE
/// \sa SDL_HasSSE2
/// \sa SDL_HasSSE3
/// \sa SDL_HasSSE42
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_HasSSE41(void)
/// ```
bool sdlHasSse41() {
  final sdlHasSse41LookupFunction =
      libSdl3.lookupFunction<Int32 Function(), int Function()>('SDL_HasSSE41');
  return sdlHasSse41LookupFunction() == 1;
}

///
/// Determine whether the CPU has SSE4.2 features.
///
/// This always returns false on CPUs that aren't using Intel instruction sets.
///
/// \returns SDL_TRUE if the CPU has SSE4.2 features or SDL_FALSE if not.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_HasAltiVec
/// \sa SDL_HasAVX
/// \sa SDL_HasAVX2
/// \sa SDL_HasAVX512F
/// \sa SDL_HasMMX
/// \sa SDL_HasSSE
/// \sa SDL_HasSSE2
/// \sa SDL_HasSSE3
/// \sa SDL_HasSSE41
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_HasSSE42(void)
/// ```
bool sdlHasSse42() {
  final sdlHasSse42LookupFunction =
      libSdl3.lookupFunction<Int32 Function(), int Function()>('SDL_HasSSE42');
  return sdlHasSse42LookupFunction() == 1;
}

///
/// Determine whether the CPU has AVX features.
///
/// This always returns false on CPUs that aren't using Intel instruction sets.
///
/// \returns SDL_TRUE if the CPU has AVX features or SDL_FALSE if not.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_HasAltiVec
/// \sa SDL_HasAVX2
/// \sa SDL_HasAVX512F
/// \sa SDL_HasMMX
/// \sa SDL_HasSSE
/// \sa SDL_HasSSE2
/// \sa SDL_HasSSE3
/// \sa SDL_HasSSE41
/// \sa SDL_HasSSE42
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_HasAVX(void)
/// ```
bool sdlHasAvx() {
  final sdlHasAvxLookupFunction =
      libSdl3.lookupFunction<Int32 Function(), int Function()>('SDL_HasAVX');
  return sdlHasAvxLookupFunction() == 1;
}

///
/// Determine whether the CPU has AVX2 features.
///
/// This always returns false on CPUs that aren't using Intel instruction sets.
///
/// \returns SDL_TRUE if the CPU has AVX2 features or SDL_FALSE if not.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_HasAltiVec
/// \sa SDL_HasAVX
/// \sa SDL_HasAVX512F
/// \sa SDL_HasMMX
/// \sa SDL_HasSSE
/// \sa SDL_HasSSE2
/// \sa SDL_HasSSE3
/// \sa SDL_HasSSE41
/// \sa SDL_HasSSE42
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_HasAVX2(void)
/// ```
bool sdlHasAvx2() {
  final sdlHasAvx2LookupFunction =
      libSdl3.lookupFunction<Int32 Function(), int Function()>('SDL_HasAVX2');
  return sdlHasAvx2LookupFunction() == 1;
}

///
/// Determine whether the CPU has AVX-512F (foundation) features.
///
/// This always returns false on CPUs that aren't using Intel instruction sets.
///
/// \returns SDL_TRUE if the CPU has AVX-512F features or SDL_FALSE if not.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_HasAltiVec
/// \sa SDL_HasAVX
/// \sa SDL_HasAVX2
/// \sa SDL_HasMMX
/// \sa SDL_HasSSE
/// \sa SDL_HasSSE2
/// \sa SDL_HasSSE3
/// \sa SDL_HasSSE41
/// \sa SDL_HasSSE42
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_HasAVX512F(void)
/// ```
bool sdlHasAvx512F() {
  final sdlHasAvx512FLookupFunction = libSdl3
      .lookupFunction<Int32 Function(), int Function()>('SDL_HasAVX512F');
  return sdlHasAvx512FLookupFunction() == 1;
}

///
/// Determine whether the CPU has ARM SIMD (ARMv6) features.
///
/// This is different from ARM NEON, which is a different instruction set.
///
/// This always returns false on CPUs that aren't using ARM instruction sets.
///
/// \returns SDL_TRUE if the CPU has ARM SIMD features or SDL_FALSE if not.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_HasNEON
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_HasARMSIMD(void)
/// ```
bool sdlHasArmsimd() {
  final sdlHasArmsimdLookupFunction = libSdl3
      .lookupFunction<Int32 Function(), int Function()>('SDL_HasARMSIMD');
  return sdlHasArmsimdLookupFunction() == 1;
}

///
/// Determine whether the CPU has NEON (ARM SIMD) features.
///
/// This always returns false on CPUs that aren't using ARM instruction sets.
///
/// \returns SDL_TRUE if the CPU has ARM NEON features or SDL_FALSE if not.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_HasNEON(void)
/// ```
bool sdlHasNeon() {
  final sdlHasNeonLookupFunction =
      libSdl3.lookupFunction<Int32 Function(), int Function()>('SDL_HasNEON');
  return sdlHasNeonLookupFunction() == 1;
}

///
/// Determine whether the CPU has LSX (LOONGARCH SIMD) features.
///
/// This always returns false on CPUs that aren't using LOONGARCH instruction
/// sets.
///
/// \returns SDL_TRUE if the CPU has LOONGARCH LSX features or SDL_FALSE if
/// not.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_HasLSX(void)
/// ```
bool sdlHasLsx() {
  final sdlHasLsxLookupFunction =
      libSdl3.lookupFunction<Int32 Function(), int Function()>('SDL_HasLSX');
  return sdlHasLsxLookupFunction() == 1;
}

///
/// Determine whether the CPU has LASX (LOONGARCH SIMD) features.
///
/// This always returns false on CPUs that aren't using LOONGARCH instruction
/// sets.
///
/// \returns SDL_TRUE if the CPU has LOONGARCH LASX features or SDL_FALSE if
/// not.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_HasLASX(void)
/// ```
bool sdlHasLasx() {
  final sdlHasLasxLookupFunction =
      libSdl3.lookupFunction<Int32 Function(), int Function()>('SDL_HasLASX');
  return sdlHasLasxLookupFunction() == 1;
}

///
/// Get the amount of RAM configured in the system.
///
/// \returns the amount of RAM configured in the system in MiB.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetSystemRAM(void)
/// ```
int sdlGetSystemRam() {
  final sdlGetSystemRamLookupFunction = libSdl3
      .lookupFunction<Int32 Function(), int Function()>('SDL_GetSystemRAM');
  return sdlGetSystemRamLookupFunction();
}

///
/// Report the alignment this system needs for SIMD allocations.
///
/// This will return the minimum number of bytes to which a pointer must be
/// aligned to be compatible with SIMD instructions on the current machine. For
/// example, if the machine supports SSE only, it will return 16, but if it
/// supports AVX-512F, it'll return 64 (etc). This only reports values for
/// instruction sets SDL knows about, so if your SDL build doesn't have
/// SDL_HasAVX512F(), then it might return 16 for the SSE support it sees and
/// not 64 for the AVX-512 instructions that exist but SDL doesn't know about.
/// Plan accordingly.
///
/// \returns the alignment in bytes needed for available, known SIMD
/// instructions.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_aligned_alloc
/// \sa SDL_aligned_free
///
/// ```c
/// extern DECLSPEC size_t SDLCALL SDL_SIMDGetAlignment(void)
/// ```
int sdlSimdGetAlignment() {
  final sdlSimdGetAlignmentLookupFunction =
      libSdl3.lookupFunction<Uint32 Function(), int Function()>(
          'SDL_SIMDGetAlignment');
  return sdlSimdGetAlignmentLookupFunction();
}
