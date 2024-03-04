// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

/// ```c
/// extern DECLSPEC SDL_MALLOC void *SDLCALL SDL_malloc(size_t size)
/// ```
Pointer<NativeType> sdlMalloc(int size) {
  final sdlMallocLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(Uint32 size),
      Pointer<NativeType> Function(int size)>('SDL_malloc');
  return sdlMallocLookupFunction(size);
}

/// ```c
/// extern DECLSPEC void SDLCALL SDL_free(void *mem)
/// ```
void sdlFree(Pointer<NativeType> mem) {
  final sdlFreeLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<NativeType> mem),
      void Function(Pointer<NativeType> mem)>('SDL_free');
  return sdlFreeLookupFunction(mem);
}

///
/// Get the original set of SDL memory functions
///
/// \param malloc_func filled with malloc function
/// \param calloc_func filled with calloc function
/// \param realloc_func filled with realloc function
/// \param free_func filled with free function
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_GetOriginalMemoryFunctions(SDL_malloc_func *malloc_func, SDL_calloc_func *calloc_func, SDL_realloc_func *realloc_func, SDL_free_func *free_func)
/// ```
void sdlGetOriginalMemoryFunctions(
    Pointer<Pointer<NativeFunction<SdlMallocFunc>>> mallocFunc,
    Pointer<Pointer<NativeFunction<SdlCallocFunc>>> callocFunc,
    Pointer<Pointer<NativeFunction<SdlReallocFunc>>> reallocFunc,
    Pointer<Pointer<NativeFunction<SdlFreeFunc>>> freeFunc) {
  final sdlGetOriginalMemoryFunctionsLookupFunction = libSdl3.lookupFunction<
          Void Function(
              Pointer<Pointer<NativeFunction<SdlMallocFunc>>> mallocFunc,
              Pointer<Pointer<NativeFunction<SdlCallocFunc>>> callocFunc,
              Pointer<Pointer<NativeFunction<SdlReallocFunc>>> reallocFunc,
              Pointer<Pointer<NativeFunction<SdlFreeFunc>>> freeFunc),
          void Function(
              Pointer<Pointer<NativeFunction<SdlMallocFunc>>> mallocFunc,
              Pointer<Pointer<NativeFunction<SdlCallocFunc>>> callocFunc,
              Pointer<Pointer<NativeFunction<SdlReallocFunc>>> reallocFunc,
              Pointer<Pointer<NativeFunction<SdlFreeFunc>>> freeFunc)>(
      'SDL_GetOriginalMemoryFunctions');
  return sdlGetOriginalMemoryFunctionsLookupFunction(
      mallocFunc, callocFunc, reallocFunc, freeFunc);
}

///
/// Get the current set of SDL memory functions
///
/// \param malloc_func filled with malloc function
/// \param calloc_func filled with calloc function
/// \param realloc_func filled with realloc function
/// \param free_func filled with free function
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_GetMemoryFunctions(SDL_malloc_func *malloc_func, SDL_calloc_func *calloc_func, SDL_realloc_func *realloc_func, SDL_free_func *free_func)
/// ```
void sdlGetMemoryFunctions(
    Pointer<Pointer<NativeFunction<SdlMallocFunc>>> mallocFunc,
    Pointer<Pointer<NativeFunction<SdlCallocFunc>>> callocFunc,
    Pointer<Pointer<NativeFunction<SdlReallocFunc>>> reallocFunc,
    Pointer<Pointer<NativeFunction<SdlFreeFunc>>> freeFunc) {
  final sdlGetMemoryFunctionsLookupFunction = libSdl3.lookupFunction<
          Void Function(
              Pointer<Pointer<NativeFunction<SdlMallocFunc>>> mallocFunc,
              Pointer<Pointer<NativeFunction<SdlCallocFunc>>> callocFunc,
              Pointer<Pointer<NativeFunction<SdlReallocFunc>>> reallocFunc,
              Pointer<Pointer<NativeFunction<SdlFreeFunc>>> freeFunc),
          void Function(
              Pointer<Pointer<NativeFunction<SdlMallocFunc>>> mallocFunc,
              Pointer<Pointer<NativeFunction<SdlCallocFunc>>> callocFunc,
              Pointer<Pointer<NativeFunction<SdlReallocFunc>>> reallocFunc,
              Pointer<Pointer<NativeFunction<SdlFreeFunc>>> freeFunc)>(
      'SDL_GetMemoryFunctions');
  return sdlGetMemoryFunctionsLookupFunction(
      mallocFunc, callocFunc, reallocFunc, freeFunc);
}

///
/// Replace SDL's memory allocation functions with a custom set
///
/// \param malloc_func custom malloc function
/// \param calloc_func custom calloc function
/// \param realloc_func custom realloc function
/// \param free_func custom free function
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_SetMemoryFunctions(SDL_malloc_func malloc_func, SDL_calloc_func calloc_func, SDL_realloc_func realloc_func, SDL_free_func free_func)
/// ```
int sdlSetMemoryFunctions(
    Pointer<NativeFunction<SdlMallocFunc>> mallocFunc,
    Pointer<NativeFunction<SdlCallocFunc>> callocFunc,
    Pointer<NativeFunction<SdlReallocFunc>> reallocFunc,
    Pointer<NativeFunction<SdlFreeFunc>> freeFunc) {
  final sdlSetMemoryFunctionsLookupFunction = libSdl3.lookupFunction<
          Int32 Function(
              Pointer<NativeFunction<SdlMallocFunc>> mallocFunc,
              Pointer<NativeFunction<SdlCallocFunc>> callocFunc,
              Pointer<NativeFunction<SdlReallocFunc>> reallocFunc,
              Pointer<NativeFunction<SdlFreeFunc>> freeFunc),
          int Function(
              Pointer<NativeFunction<SdlMallocFunc>> mallocFunc,
              Pointer<NativeFunction<SdlCallocFunc>> callocFunc,
              Pointer<NativeFunction<SdlReallocFunc>> reallocFunc,
              Pointer<NativeFunction<SdlFreeFunc>> freeFunc)>(
      'SDL_SetMemoryFunctions');
  return sdlSetMemoryFunctionsLookupFunction(
      mallocFunc, callocFunc, reallocFunc, freeFunc);
}

///
/// Allocate memory aligned to a specific value
///
/// If `alignment` is less than the size of `void *`, then it will be increased
/// to match that.
///
/// The returned memory address will be a multiple of the alignment value, and
/// the amount of memory allocated will be a multiple of the alignment value.
///
/// The memory returned by this function must be freed with SDL_aligned_free()
///
/// \param alignment the alignment requested
/// \param size the size to allocate
/// \returns a pointer to the aligned memory
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_aligned_free
///
/// ```c
/// extern DECLSPEC SDL_MALLOC void *SDLCALL SDL_aligned_alloc(size_t alignment, size_t size)
/// ```
Pointer<NativeType> sdlAlignedAlloc(int alignment, int size) {
  final sdlAlignedAllocLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(Uint32 alignment, Uint32 size),
      Pointer<NativeType> Function(
          int alignment, int size)>('SDL_aligned_alloc');
  return sdlAlignedAllocLookupFunction(alignment, size);
}

///
/// Free memory allocated by SDL_aligned_alloc()
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_aligned_alloc
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_aligned_free(void *mem)
/// ```
void sdlAlignedFree(Pointer<NativeType> mem) {
  final sdlAlignedFreeLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<NativeType> mem),
      void Function(Pointer<NativeType> mem)>('SDL_aligned_free');
  return sdlAlignedFreeLookupFunction(mem);
}

///
/// Get the number of outstanding (unfreed) allocations
///
/// \returns the number of allocations
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetNumAllocations(void)
/// ```
int sdlGetNumAllocations() {
  final sdlGetNumAllocationsLookupFunction =
      libSdl3.lookupFunction<Int32 Function(), int Function()>(
          'SDL_GetNumAllocations');
  return sdlGetNumAllocationsLookupFunction();
}

/// ```c
/// extern DECLSPEC char *SDLCALL SDL_getenv(const char *name)
/// ```
Pointer<Int8> sdlGetenv(String? name) {
  final sdlGetenvLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(Pointer<Utf8> name),
      Pointer<Int8> Function(Pointer<Utf8> name)>('SDL_getenv');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlGetenvLookupFunction(namePointer);
  calloc.free(namePointer);
  return result;
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_setenv(const char *name, const char *value, int overwrite)
/// ```
int sdlSetenv(String? name, String? value, int overwrite) {
  final sdlSetenvLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Utf8> name, Pointer<Utf8> value, Int32 overwrite),
      int Function(Pointer<Utf8> name, Pointer<Utf8> value,
          int overwrite)>('SDL_setenv');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final valuePointer = value != null ? value.toNativeUtf8() : nullptr;
  final result = sdlSetenvLookupFunction(namePointer, valuePointer, overwrite);
  calloc.free(namePointer);
  calloc.free(valuePointer);
  return result;
}

/// ```c
/// extern DECLSPEC void SDLCALL SDL_qsort(void *base, size_t nmemb, size_t size, int (SDLCALL *compare) (const void *, const void *))
/// ```
void sdlQsort(Pointer<NativeType> base, int nmemb, int size,
    Pointer<NativeType> compare) {
  final sdlQsortLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<NativeType> base, Uint32 nmemb, Uint32 size,
          Pointer<NativeType> compare),
      void Function(Pointer<NativeType> base, int nmemb, int size,
          Pointer<NativeType> compare)>('SDL_qsort');
  return sdlQsortLookupFunction(base, nmemb, size, compare);
}

/// ```c
/// extern DECLSPEC void * SDLCALL SDL_bsearch(const void *key, const void *base, size_t nmemb, size_t size, int (SDLCALL *compare) (const void *, const void *))
/// ```
Pointer<NativeType> sdlBsearch(
    Pointer<NativeType> key,
    Pointer<NativeType> base,
    int nmemb,
    int size,
    Pointer<NativeType> compare) {
  final sdlBsearchLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(
          Pointer<NativeType> key,
          Pointer<NativeType> base,
          Uint32 nmemb,
          Uint32 size,
          Pointer<NativeType> compare),
      Pointer<NativeType> Function(
          Pointer<NativeType> key,
          Pointer<NativeType> base,
          int nmemb,
          int size,
          Pointer<NativeType> compare)>('SDL_bsearch');
  return sdlBsearchLookupFunction(key, base, nmemb, size, compare);
}

/// ```c
/// extern DECLSPEC void SDLCALL SDL_qsort_r(void *base, size_t nmemb, size_t size, int (SDLCALL *compare) (void *, const void *, const void *), void *userdata)
/// ```
void sdlQsortR(Pointer<NativeType> base, int nmemb, int size,
    Pointer<NativeType> compare, Pointer<NativeType> userdata) {
  final sdlQsortRLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<NativeType> base, Uint32 nmemb, Uint32 size,
          Pointer<NativeType> compare, Pointer<NativeType> userdata),
      void Function(
          Pointer<NativeType> base,
          int nmemb,
          int size,
          Pointer<NativeType> compare,
          Pointer<NativeType> userdata)>('SDL_qsort_r');
  return sdlQsortRLookupFunction(base, nmemb, size, compare, userdata);
}

/// ```c
/// extern DECLSPEC void * SDLCALL SDL_bsearch_r(const void *key, const void *base, size_t nmemb, size_t size, int (SDLCALL *compare) (void *, const void *, const void *), void *userdata)
/// ```
Pointer<NativeType> sdlBsearchR(
    Pointer<NativeType> key,
    Pointer<NativeType> base,
    int nmemb,
    int size,
    Pointer<NativeType> compare,
    Pointer<NativeType> userdata) {
  final sdlBsearchRLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(
          Pointer<NativeType> key,
          Pointer<NativeType> base,
          Uint32 nmemb,
          Uint32 size,
          Pointer<NativeType> compare,
          Pointer<NativeType> userdata),
      Pointer<NativeType> Function(
          Pointer<NativeType> key,
          Pointer<NativeType> base,
          int nmemb,
          int size,
          Pointer<NativeType> compare,
          Pointer<NativeType> userdata)>('SDL_bsearch_r');
  return sdlBsearchRLookupFunction(key, base, nmemb, size, compare, userdata);
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_abs(int x)
/// ```
int sdlAbs(int x) {
  final sdlAbsLookupFunction = libSdl3
      .lookupFunction<Int32 Function(Int32 x), int Function(int x)>('SDL_abs');
  return sdlAbsLookupFunction(x);
}

/// NOTE: these double-evaluate their arguments, so you should never have side effects in the parameters
/// ```c
/// extern DECLSPEC int SDLCALL SDL_isalpha(int x)
/// ```
int sdlIsalpha(int x) {
  final sdlIsalphaLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Int32 x), int Function(int x)>(
          'SDL_isalpha');
  return sdlIsalphaLookupFunction(x);
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_isalnum(int x)
/// ```
int sdlIsalnum(int x) {
  final sdlIsalnumLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Int32 x), int Function(int x)>(
          'SDL_isalnum');
  return sdlIsalnumLookupFunction(x);
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_isblank(int x)
/// ```
int sdlIsblank(int x) {
  final sdlIsblankLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Int32 x), int Function(int x)>(
          'SDL_isblank');
  return sdlIsblankLookupFunction(x);
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_iscntrl(int x)
/// ```
int sdlIscntrl(int x) {
  final sdlIscntrlLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Int32 x), int Function(int x)>(
          'SDL_iscntrl');
  return sdlIscntrlLookupFunction(x);
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_isdigit(int x)
/// ```
int sdlIsdigit(int x) {
  final sdlIsdigitLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Int32 x), int Function(int x)>(
          'SDL_isdigit');
  return sdlIsdigitLookupFunction(x);
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_isxdigit(int x)
/// ```
int sdlIsxdigit(int x) {
  final sdlIsxdigitLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Int32 x), int Function(int x)>(
          'SDL_isxdigit');
  return sdlIsxdigitLookupFunction(x);
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_ispunct(int x)
/// ```
int sdlIspunct(int x) {
  final sdlIspunctLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Int32 x), int Function(int x)>(
          'SDL_ispunct');
  return sdlIspunctLookupFunction(x);
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_isspace(int x)
/// ```
int sdlIsspace(int x) {
  final sdlIsspaceLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Int32 x), int Function(int x)>(
          'SDL_isspace');
  return sdlIsspaceLookupFunction(x);
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_isupper(int x)
/// ```
int sdlIsupper(int x) {
  final sdlIsupperLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Int32 x), int Function(int x)>(
          'SDL_isupper');
  return sdlIsupperLookupFunction(x);
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_islower(int x)
/// ```
int sdlIslower(int x) {
  final sdlIslowerLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Int32 x), int Function(int x)>(
          'SDL_islower');
  return sdlIslowerLookupFunction(x);
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_isprint(int x)
/// ```
int sdlIsprint(int x) {
  final sdlIsprintLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Int32 x), int Function(int x)>(
          'SDL_isprint');
  return sdlIsprintLookupFunction(x);
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_isgraph(int x)
/// ```
int sdlIsgraph(int x) {
  final sdlIsgraphLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Int32 x), int Function(int x)>(
          'SDL_isgraph');
  return sdlIsgraphLookupFunction(x);
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_toupper(int x)
/// ```
int sdlToupper(int x) {
  final sdlToupperLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Int32 x), int Function(int x)>(
          'SDL_toupper');
  return sdlToupperLookupFunction(x);
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_tolower(int x)
/// ```
int sdlTolower(int x) {
  final sdlTolowerLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Int32 x), int Function(int x)>(
          'SDL_tolower');
  return sdlTolowerLookupFunction(x);
}

/// ```c
/// extern DECLSPEC Uint16 SDLCALL SDL_crc16(Uint16 crc, const void *data, size_t len)
/// ```
int sdlCrc16(int crc, Pointer<NativeType> data, int len) {
  final sdlCrc16LookupFunction = libSdl3.lookupFunction<
      Uint16 Function(Uint16 crc, Pointer<NativeType> data, Uint32 len),
      int Function(int crc, Pointer<NativeType> data, int len)>('SDL_crc16');
  return sdlCrc16LookupFunction(crc, data, len);
}

/// ```c
/// extern DECLSPEC Uint32 SDLCALL SDL_crc32(Uint32 crc, const void *data, size_t len)
/// ```
int sdlCrc32(int crc, Pointer<NativeType> data, int len) {
  final sdlCrc32LookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Uint32 crc, Pointer<NativeType> data, Uint32 len),
      int Function(int crc, Pointer<NativeType> data, int len)>('SDL_crc32');
  return sdlCrc32LookupFunction(crc, data, len);
}

/// ```c
/// extern DECLSPEC void *SDLCALL SDL_memcpy(SDL_OUT_BYTECAP(len) void *dst, SDL_IN_BYTECAP(len) const void *src, size_t len)
/// ```
Pointer<NativeType> sdlMemcpy(
    Pointer<NativeType> arg0, Pointer<NativeType> arg1, int len) {
  final sdlMemcpyLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(
          Pointer<NativeType> arg0, Pointer<NativeType> arg1, Uint32 len),
      Pointer<NativeType> Function(Pointer<NativeType> arg0,
          Pointer<NativeType> arg1, int len)>('SDL_memcpy');
  return sdlMemcpyLookupFunction(arg0, arg1, len);
}

/// Take advantage of compiler optimizations for memcpy
/// ```c
/// extern DECLSPEC void *SDLCALL SDL_memmove(SDL_OUT_BYTECAP(len) void *dst, SDL_IN_BYTECAP(len) const void *src, size_t len)
/// ```
Pointer<NativeType> sdlMemmove(
    Pointer<NativeType> arg0, Pointer<NativeType> arg1, int len) {
  final sdlMemmoveLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(
          Pointer<NativeType> arg0, Pointer<NativeType> arg1, Uint32 len),
      Pointer<NativeType> Function(Pointer<NativeType> arg0,
          Pointer<NativeType> arg1, int len)>('SDL_memmove');
  return sdlMemmoveLookupFunction(arg0, arg1, len);
}

/// Take advantage of compiler optimizations for memmove
/// ```c
/// extern DECLSPEC void *SDLCALL SDL_memset(SDL_OUT_BYTECAP(len) void *dst, int c, size_t len)
/// ```
Pointer<NativeType> sdlMemset(Pointer<NativeType> arg0, int c, int len) {
  final sdlMemsetLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(
          Pointer<NativeType> arg0, Int32 c, Uint32 len),
      Pointer<NativeType> Function(
          Pointer<NativeType> arg0, int c, int len)>('SDL_memset');
  return sdlMemsetLookupFunction(arg0, c, len);
}

/// ```c
/// extern DECLSPEC void *SDLCALL SDL_memset4(void *dst, Uint32 val, size_t dwords)
/// ```
Pointer<NativeType> sdlMemset4(Pointer<NativeType> dst, int val, int dwords) {
  final sdlMemset4LookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(
          Pointer<NativeType> dst, Uint32 val, Uint32 dwords),
      Pointer<NativeType> Function(
          Pointer<NativeType> dst, int val, int dwords)>('SDL_memset4');
  return sdlMemset4LookupFunction(dst, val, dwords);
}

/// Take advantage of compiler optimizations for memset
/// ```c
/// extern DECLSPEC int SDLCALL SDL_memcmp(const void *s1, const void *s2, size_t len)
/// ```
int sdlMemcmp(Pointer<NativeType> s1, Pointer<NativeType> s2, int len) {
  final sdlMemcmpLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<NativeType> s1, Pointer<NativeType> s2, Uint32 len),
      int Function(Pointer<NativeType> s1, Pointer<NativeType> s2,
          int len)>('SDL_memcmp');
  return sdlMemcmpLookupFunction(s1, s2, len);
}

/// ```c
/// extern DECLSPEC size_t SDLCALL SDL_wcslen(const wchar_t *wstr)
/// ```
int sdlWcslen(Pointer<Int16> wstr) {
  final sdlWcslenLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<Int16> wstr),
      int Function(Pointer<Int16> wstr)>('SDL_wcslen');
  return sdlWcslenLookupFunction(wstr);
}

/// ```c
/// extern DECLSPEC size_t SDLCALL SDL_wcsnlen(const wchar_t *wstr, size_t maxlen)
/// ```
int sdlWcsnlen(Pointer<Int16> wstr, int maxlen) {
  final sdlWcsnlenLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<Int16> wstr, Uint32 maxlen),
      int Function(Pointer<Int16> wstr, int maxlen)>('SDL_wcsnlen');
  return sdlWcsnlenLookupFunction(wstr, maxlen);
}

/// ```c
/// extern DECLSPEC size_t SDLCALL SDL_wcslcpy(SDL_OUT_Z_CAP(maxlen) wchar_t *dst, const wchar_t *src, size_t maxlen)
/// ```
int sdlWcslcpy(Pointer<NativeType> arg0, Pointer<Int16> src, int maxlen) {
  final sdlWcslcpyLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(
          Pointer<NativeType> arg0, Pointer<Int16> src, Uint32 maxlen),
      int Function(Pointer<NativeType> arg0, Pointer<Int16> src,
          int maxlen)>('SDL_wcslcpy');
  return sdlWcslcpyLookupFunction(arg0, src, maxlen);
}

/// ```c
/// extern DECLSPEC size_t SDLCALL SDL_wcslcat(SDL_INOUT_Z_CAP(maxlen) wchar_t *dst, const wchar_t *src, size_t maxlen)
/// ```
int sdlWcslcat(Pointer<NativeType> arg0, Pointer<Int16> src, int maxlen) {
  final sdlWcslcatLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(
          Pointer<NativeType> arg0, Pointer<Int16> src, Uint32 maxlen),
      int Function(Pointer<NativeType> arg0, Pointer<Int16> src,
          int maxlen)>('SDL_wcslcat');
  return sdlWcslcatLookupFunction(arg0, src, maxlen);
}

/// ```c
/// extern DECLSPEC wchar_t *SDLCALL SDL_wcsdup(const wchar_t *wstr)
/// ```
Pointer<Int16> sdlWcsdup(Pointer<Int16> wstr) {
  final sdlWcsdupLookupFunction = libSdl3.lookupFunction<
      Pointer<Int16> Function(Pointer<Int16> wstr),
      Pointer<Int16> Function(Pointer<Int16> wstr)>('SDL_wcsdup');
  return sdlWcsdupLookupFunction(wstr);
}

/// ```c
/// extern DECLSPEC wchar_t *SDLCALL SDL_wcsstr(const wchar_t *haystack, const wchar_t *needle)
/// ```
Pointer<Int16> sdlWcsstr(Pointer<Int16> haystack, Pointer<Int16> needle) {
  final sdlWcsstrLookupFunction = libSdl3.lookupFunction<
      Pointer<Int16> Function(Pointer<Int16> haystack, Pointer<Int16> needle),
      Pointer<Int16> Function(
          Pointer<Int16> haystack, Pointer<Int16> needle)>('SDL_wcsstr');
  return sdlWcsstrLookupFunction(haystack, needle);
}

/// ```c
/// extern DECLSPEC wchar_t *SDLCALL SDL_wcsnstr(const wchar_t *haystack, const wchar_t *needle, size_t maxlen)
/// ```
Pointer<Int16> sdlWcsnstr(
    Pointer<Int16> haystack, Pointer<Int16> needle, int maxlen) {
  final sdlWcsnstrLookupFunction = libSdl3.lookupFunction<
      Pointer<Int16> Function(
          Pointer<Int16> haystack, Pointer<Int16> needle, Uint32 maxlen),
      Pointer<Int16> Function(Pointer<Int16> haystack, Pointer<Int16> needle,
          int maxlen)>('SDL_wcsnstr');
  return sdlWcsnstrLookupFunction(haystack, needle, maxlen);
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_wcscmp(const wchar_t *str1, const wchar_t *str2)
/// ```
int sdlWcscmp(Pointer<Int16> str1, Pointer<Int16> str2) {
  final sdlWcscmpLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Int16> str1, Pointer<Int16> str2),
      int Function(Pointer<Int16> str1, Pointer<Int16> str2)>('SDL_wcscmp');
  return sdlWcscmpLookupFunction(str1, str2);
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_wcsncmp(const wchar_t *str1, const wchar_t *str2, size_t maxlen)
/// ```
int sdlWcsncmp(Pointer<Int16> str1, Pointer<Int16> str2, int maxlen) {
  final sdlWcsncmpLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Int16> str1, Pointer<Int16> str2, Uint32 maxlen),
      int Function(
          Pointer<Int16> str1, Pointer<Int16> str2, int maxlen)>('SDL_wcsncmp');
  return sdlWcsncmpLookupFunction(str1, str2, maxlen);
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_wcscasecmp(const wchar_t *str1, const wchar_t *str2)
/// ```
int sdlWcscasecmp(Pointer<Int16> str1, Pointer<Int16> str2) {
  final sdlWcscasecmpLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Int16> str1, Pointer<Int16> str2),
      int Function(Pointer<Int16> str1, Pointer<Int16> str2)>('SDL_wcscasecmp');
  return sdlWcscasecmpLookupFunction(str1, str2);
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_wcsncasecmp(const wchar_t *str1, const wchar_t *str2, size_t len)
/// ```
int sdlWcsncasecmp(Pointer<Int16> str1, Pointer<Int16> str2, int len) {
  final sdlWcsncasecmpLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Int16> str1, Pointer<Int16> str2, Uint32 len),
      int Function(Pointer<Int16> str1, Pointer<Int16> str2,
          int len)>('SDL_wcsncasecmp');
  return sdlWcsncasecmpLookupFunction(str1, str2, len);
}

/// ```c
/// extern DECLSPEC long SDLCALL SDL_wcstol(const wchar_t *str, wchar_t **endp, int base)
/// ```
int sdlWcstol(Pointer<Int16> str, Pointer<Pointer<Int16>> endp, int base) {
  final sdlWcstolLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<Int16> str, Pointer<Pointer<Int16>> endp, Int32 base),
      int Function(Pointer<Int16> str, Pointer<Pointer<Int16>> endp,
          int base)>('SDL_wcstol');
  return sdlWcstolLookupFunction(str, endp, base);
}

/// ```c
/// extern DECLSPEC size_t SDLCALL SDL_strlen(const char *str)
/// ```
int sdlStrlen(String? str) {
  final sdlStrlenLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<Utf8> str),
      int Function(Pointer<Utf8> str)>('SDL_strlen');
  final strPointer = str != null ? str.toNativeUtf8() : nullptr;
  final result = sdlStrlenLookupFunction(strPointer);
  calloc.free(strPointer);
  return result;
}

/// ```c
/// extern DECLSPEC size_t SDLCALL SDL_strnlen(const char *str, size_t maxlen)
/// ```
int sdlStrnlen(String? str, int maxlen) {
  final sdlStrnlenLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<Utf8> str, Uint32 maxlen),
      int Function(Pointer<Utf8> str, int maxlen)>('SDL_strnlen');
  final strPointer = str != null ? str.toNativeUtf8() : nullptr;
  final result = sdlStrnlenLookupFunction(strPointer, maxlen);
  calloc.free(strPointer);
  return result;
}

/// ```c
/// extern DECLSPEC size_t SDLCALL SDL_strlcpy(SDL_OUT_Z_CAP(maxlen) char *dst, const char *src, size_t maxlen)
/// ```
int sdlStrlcpy(Pointer<NativeType> arg0, String? src, int maxlen) {
  final sdlStrlcpyLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(
          Pointer<NativeType> arg0, Pointer<Utf8> src, Uint32 maxlen),
      int Function(Pointer<NativeType> arg0, Pointer<Utf8> src,
          int maxlen)>('SDL_strlcpy');
  final srcPointer = src != null ? src.toNativeUtf8() : nullptr;
  final result = sdlStrlcpyLookupFunction(arg0, srcPointer, maxlen);
  calloc.free(srcPointer);
  return result;
}

/// ```c
/// extern DECLSPEC size_t SDLCALL SDL_utf8strlcpy(SDL_OUT_Z_CAP(dst_bytes) char *dst, const char *src, size_t dst_bytes)
/// ```
int sdlUtf8strlcpy(Pointer<NativeType> arg0, String? src, int dstBytes) {
  final sdlUtf8strlcpyLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(
          Pointer<NativeType> arg0, Pointer<Utf8> src, Uint32 dstBytes),
      int Function(Pointer<NativeType> arg0, Pointer<Utf8> src,
          int dstBytes)>('SDL_utf8strlcpy');
  final srcPointer = src != null ? src.toNativeUtf8() : nullptr;
  final result = sdlUtf8strlcpyLookupFunction(arg0, srcPointer, dstBytes);
  calloc.free(srcPointer);
  return result;
}

/// ```c
/// extern DECLSPEC size_t SDLCALL SDL_strlcat(SDL_INOUT_Z_CAP(maxlen) char *dst, const char *src, size_t maxlen)
/// ```
int sdlStrlcat(Pointer<NativeType> arg0, String? src, int maxlen) {
  final sdlStrlcatLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(
          Pointer<NativeType> arg0, Pointer<Utf8> src, Uint32 maxlen),
      int Function(Pointer<NativeType> arg0, Pointer<Utf8> src,
          int maxlen)>('SDL_strlcat');
  final srcPointer = src != null ? src.toNativeUtf8() : nullptr;
  final result = sdlStrlcatLookupFunction(arg0, srcPointer, maxlen);
  calloc.free(srcPointer);
  return result;
}

/// ```c
/// extern DECLSPEC SDL_MALLOC char *SDLCALL SDL_strdup(const char *str)
/// ```
Pointer<Int8> sdlStrdup(String? str) {
  final sdlStrdupLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(Pointer<Utf8> str),
      Pointer<Int8> Function(Pointer<Utf8> str)>('SDL_strdup');
  final strPointer = str != null ? str.toNativeUtf8() : nullptr;
  final result = sdlStrdupLookupFunction(strPointer);
  calloc.free(strPointer);
  return result;
}

/// ```c
/// extern DECLSPEC SDL_MALLOC char *SDLCALL SDL_strndup(const char *str, size_t maxlen)
/// ```
Pointer<Int8> sdlStrndup(String? str, int maxlen) {
  final sdlStrndupLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(Pointer<Utf8> str, Uint32 maxlen),
      Pointer<Int8> Function(Pointer<Utf8> str, int maxlen)>('SDL_strndup');
  final strPointer = str != null ? str.toNativeUtf8() : nullptr;
  final result = sdlStrndupLookupFunction(strPointer, maxlen);
  calloc.free(strPointer);
  return result;
}

/// ```c
/// extern DECLSPEC char *SDLCALL SDL_strrev(char *str)
/// ```
Pointer<Int8> sdlStrrev(Pointer<Int8> str) {
  final sdlStrrevLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(Pointer<Int8> str),
      Pointer<Int8> Function(Pointer<Int8> str)>('SDL_strrev');
  return sdlStrrevLookupFunction(str);
}

/// ```c
/// extern DECLSPEC char *SDLCALL SDL_strupr(char *str)
/// ```
Pointer<Int8> sdlStrupr(Pointer<Int8> str) {
  final sdlStruprLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(Pointer<Int8> str),
      Pointer<Int8> Function(Pointer<Int8> str)>('SDL_strupr');
  return sdlStruprLookupFunction(str);
}

/// ```c
/// extern DECLSPEC char *SDLCALL SDL_strlwr(char *str)
/// ```
Pointer<Int8> sdlStrlwr(Pointer<Int8> str) {
  final sdlStrlwrLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(Pointer<Int8> str),
      Pointer<Int8> Function(Pointer<Int8> str)>('SDL_strlwr');
  return sdlStrlwrLookupFunction(str);
}

/// ```c
/// extern DECLSPEC char *SDLCALL SDL_strchr(const char *str, int c)
/// ```
Pointer<Int8> sdlStrchr(String? str, int c) {
  final sdlStrchrLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(Pointer<Utf8> str, Int32 c),
      Pointer<Int8> Function(Pointer<Utf8> str, int c)>('SDL_strchr');
  final strPointer = str != null ? str.toNativeUtf8() : nullptr;
  final result = sdlStrchrLookupFunction(strPointer, c);
  calloc.free(strPointer);
  return result;
}

/// ```c
/// extern DECLSPEC char *SDLCALL SDL_strrchr(const char *str, int c)
/// ```
Pointer<Int8> sdlStrrchr(String? str, int c) {
  final sdlStrrchrLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(Pointer<Utf8> str, Int32 c),
      Pointer<Int8> Function(Pointer<Utf8> str, int c)>('SDL_strrchr');
  final strPointer = str != null ? str.toNativeUtf8() : nullptr;
  final result = sdlStrrchrLookupFunction(strPointer, c);
  calloc.free(strPointer);
  return result;
}

/// ```c
/// extern DECLSPEC char *SDLCALL SDL_strstr(const char *haystack, const char *needle)
/// ```
Pointer<Int8> sdlStrstr(String? haystack, String? needle) {
  final sdlStrstrLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(Pointer<Utf8> haystack, Pointer<Utf8> needle),
      Pointer<Int8> Function(
          Pointer<Utf8> haystack, Pointer<Utf8> needle)>('SDL_strstr');
  final haystackPointer = haystack != null ? haystack.toNativeUtf8() : nullptr;
  final needlePointer = needle != null ? needle.toNativeUtf8() : nullptr;
  final result = sdlStrstrLookupFunction(haystackPointer, needlePointer);
  calloc.free(haystackPointer);
  calloc.free(needlePointer);
  return result;
}

/// ```c
/// extern DECLSPEC char *SDLCALL SDL_strnstr(const char *haystack, const char *needle, size_t maxlen)
/// ```
Pointer<Int8> sdlStrnstr(String? haystack, String? needle, int maxlen) {
  final sdlStrnstrLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(
          Pointer<Utf8> haystack, Pointer<Utf8> needle, Uint32 maxlen),
      Pointer<Int8> Function(Pointer<Utf8> haystack, Pointer<Utf8> needle,
          int maxlen)>('SDL_strnstr');
  final haystackPointer = haystack != null ? haystack.toNativeUtf8() : nullptr;
  final needlePointer = needle != null ? needle.toNativeUtf8() : nullptr;
  final result =
      sdlStrnstrLookupFunction(haystackPointer, needlePointer, maxlen);
  calloc.free(haystackPointer);
  calloc.free(needlePointer);
  return result;
}

/// ```c
/// extern DECLSPEC char *SDLCALL SDL_strcasestr(const char *haystack, const char *needle)
/// ```
Pointer<Int8> sdlStrcasestr(String? haystack, String? needle) {
  final sdlStrcasestrLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(Pointer<Utf8> haystack, Pointer<Utf8> needle),
      Pointer<Int8> Function(
          Pointer<Utf8> haystack, Pointer<Utf8> needle)>('SDL_strcasestr');
  final haystackPointer = haystack != null ? haystack.toNativeUtf8() : nullptr;
  final needlePointer = needle != null ? needle.toNativeUtf8() : nullptr;
  final result = sdlStrcasestrLookupFunction(haystackPointer, needlePointer);
  calloc.free(haystackPointer);
  calloc.free(needlePointer);
  return result;
}

/// ```c
/// extern DECLSPEC char *SDLCALL SDL_strtok_r(char *s1, const char *s2, char **saveptr)
/// ```
Pointer<Int8> sdlStrtokR(
    Pointer<Int8> s1, String? s2, Pointer<Pointer<Int8>> saveptr) {
  final sdlStrtokRLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(
          Pointer<Int8> s1, Pointer<Utf8> s2, Pointer<Pointer<Int8>> saveptr),
      Pointer<Int8> Function(Pointer<Int8> s1, Pointer<Utf8> s2,
          Pointer<Pointer<Int8>> saveptr)>('SDL_strtok_r');
  final s2Pointer = s2 != null ? s2.toNativeUtf8() : nullptr;
  final result = sdlStrtokRLookupFunction(s1, s2Pointer, saveptr);
  calloc.free(s2Pointer);
  return result;
}

/// ```c
/// extern DECLSPEC size_t SDLCALL SDL_utf8strlen(const char *str)
/// ```
int sdlUtf8strlen(String? str) {
  final sdlUtf8strlenLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<Utf8> str),
      int Function(Pointer<Utf8> str)>('SDL_utf8strlen');
  final strPointer = str != null ? str.toNativeUtf8() : nullptr;
  final result = sdlUtf8strlenLookupFunction(strPointer);
  calloc.free(strPointer);
  return result;
}

/// ```c
/// extern DECLSPEC size_t SDLCALL SDL_utf8strnlen(const char *str, size_t bytes)
/// ```
int sdlUtf8strnlen(String? str, int bytes) {
  final sdlUtf8strnlenLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<Utf8> str, Uint32 bytes),
      int Function(Pointer<Utf8> str, int bytes)>('SDL_utf8strnlen');
  final strPointer = str != null ? str.toNativeUtf8() : nullptr;
  final result = sdlUtf8strnlenLookupFunction(strPointer, bytes);
  calloc.free(strPointer);
  return result;
}

/// ```c
/// extern DECLSPEC char *SDLCALL SDL_itoa(int value, char *str, int radix)
/// ```
Pointer<Int8> sdlItoa(int value, Pointer<Int8> str, int radix) {
  final sdlItoaLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(Int32 value, Pointer<Int8> str, Int32 radix),
      Pointer<Int8> Function(
          int value, Pointer<Int8> str, int radix)>('SDL_itoa');
  return sdlItoaLookupFunction(value, str, radix);
}

/// ```c
/// extern DECLSPEC char *SDLCALL SDL_uitoa(unsigned int value, char *str, int radix)
/// ```
Pointer<Int8> sdlUitoa(int value, Pointer<Int8> str, int radix) {
  final sdlUitoaLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(Uint32 value, Pointer<Int8> str, Int32 radix),
      Pointer<Int8> Function(
          int value, Pointer<Int8> str, int radix)>('SDL_uitoa');
  return sdlUitoaLookupFunction(value, str, radix);
}

/// ```c
/// extern DECLSPEC char *SDLCALL SDL_ltoa(long value, char *str, int radix)
/// ```
Pointer<Int8> sdlLtoa(int value, Pointer<Int8> str, int radix) {
  final sdlLtoaLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(Int32 value, Pointer<Int8> str, Int32 radix),
      Pointer<Int8> Function(
          int value, Pointer<Int8> str, int radix)>('SDL_ltoa');
  return sdlLtoaLookupFunction(value, str, radix);
}

/// ```c
/// extern DECLSPEC char *SDLCALL SDL_ultoa(unsigned long value, char *str, int radix)
/// ```
Pointer<Int8> sdlUltoa(int value, Pointer<Int8> str, int radix) {
  final sdlUltoaLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(Uint32 value, Pointer<Int8> str, Int32 radix),
      Pointer<Int8> Function(
          int value, Pointer<Int8> str, int radix)>('SDL_ultoa');
  return sdlUltoaLookupFunction(value, str, radix);
}

/// ```c
/// extern DECLSPEC char *SDLCALL SDL_lltoa(Sint64 value, char *str, int radix)
/// ```
Pointer<Int8> sdlLltoa(int value, Pointer<Int8> str, int radix) {
  final sdlLltoaLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(Int64 value, Pointer<Int8> str, Int32 radix),
      Pointer<Int8> Function(
          int value, Pointer<Int8> str, int radix)>('SDL_lltoa');
  return sdlLltoaLookupFunction(value, str, radix);
}

/// ```c
/// extern DECLSPEC char *SDLCALL SDL_ulltoa(Uint64 value, char *str, int radix)
/// ```
Pointer<Int8> sdlUlltoa(int value, Pointer<Int8> str, int radix) {
  final sdlUlltoaLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(Uint64 value, Pointer<Int8> str, Int32 radix),
      Pointer<Int8> Function(
          int value, Pointer<Int8> str, int radix)>('SDL_ulltoa');
  return sdlUlltoaLookupFunction(value, str, radix);
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_atoi(const char *str)
/// ```
int sdlAtoi(String? str) {
  final sdlAtoiLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Utf8> str),
      int Function(Pointer<Utf8> str)>('SDL_atoi');
  final strPointer = str != null ? str.toNativeUtf8() : nullptr;
  final result = sdlAtoiLookupFunction(strPointer);
  calloc.free(strPointer);
  return result;
}

/// ```c
/// extern DECLSPEC double SDLCALL SDL_atof(const char *str)
/// ```
double sdlAtof(String? str) {
  final sdlAtofLookupFunction = libSdl3.lookupFunction<
      Double Function(Pointer<Utf8> str),
      double Function(Pointer<Utf8> str)>('SDL_atof');
  final strPointer = str != null ? str.toNativeUtf8() : nullptr;
  final result = sdlAtofLookupFunction(strPointer);
  calloc.free(strPointer);
  return result;
}

/// ```c
/// extern DECLSPEC long SDLCALL SDL_strtol(const char *str, char **endp, int base)
/// ```
int sdlStrtol(String? str, Pointer<Pointer<Int8>> endp, int base) {
  final sdlStrtolLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<Utf8> str, Pointer<Pointer<Int8>> endp, Int32 base),
      int Function(Pointer<Utf8> str, Pointer<Pointer<Int8>> endp,
          int base)>('SDL_strtol');
  final strPointer = str != null ? str.toNativeUtf8() : nullptr;
  final result = sdlStrtolLookupFunction(strPointer, endp, base);
  calloc.free(strPointer);
  return result;
}

/// ```c
/// extern DECLSPEC unsigned long SDLCALL SDL_strtoul(const char *str, char **endp, int base)
/// ```
int sdlStrtoul(String? str, Pointer<Pointer<Int8>> endp, int base) {
  final sdlStrtoulLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(
          Pointer<Utf8> str, Pointer<Pointer<Int8>> endp, Int32 base),
      int Function(Pointer<Utf8> str, Pointer<Pointer<Int8>> endp,
          int base)>('SDL_strtoul');
  final strPointer = str != null ? str.toNativeUtf8() : nullptr;
  final result = sdlStrtoulLookupFunction(strPointer, endp, base);
  calloc.free(strPointer);
  return result;
}

/// ```c
/// extern DECLSPEC Sint64 SDLCALL SDL_strtoll(const char *str, char **endp, int base)
/// ```
int sdlStrtoll(String? str, Pointer<Pointer<Int8>> endp, int base) {
  final sdlStrtollLookupFunction = libSdl3.lookupFunction<
      Int64 Function(
          Pointer<Utf8> str, Pointer<Pointer<Int8>> endp, Int32 base),
      int Function(Pointer<Utf8> str, Pointer<Pointer<Int8>> endp,
          int base)>('SDL_strtoll');
  final strPointer = str != null ? str.toNativeUtf8() : nullptr;
  final result = sdlStrtollLookupFunction(strPointer, endp, base);
  calloc.free(strPointer);
  return result;
}

/// ```c
/// extern DECLSPEC Uint64 SDLCALL SDL_strtoull(const char *str, char **endp, int base)
/// ```
int sdlStrtoull(String? str, Pointer<Pointer<Int8>> endp, int base) {
  final sdlStrtoullLookupFunction = libSdl3.lookupFunction<
      Uint64 Function(
          Pointer<Utf8> str, Pointer<Pointer<Int8>> endp, Int32 base),
      int Function(Pointer<Utf8> str, Pointer<Pointer<Int8>> endp,
          int base)>('SDL_strtoull');
  final strPointer = str != null ? str.toNativeUtf8() : nullptr;
  final result = sdlStrtoullLookupFunction(strPointer, endp, base);
  calloc.free(strPointer);
  return result;
}

/// ```c
/// extern DECLSPEC double SDLCALL SDL_strtod(const char *str, char **endp)
/// ```
double sdlStrtod(String? str, Pointer<Pointer<Int8>> endp) {
  final sdlStrtodLookupFunction = libSdl3.lookupFunction<
      Double Function(Pointer<Utf8> str, Pointer<Pointer<Int8>> endp),
      double Function(
          Pointer<Utf8> str, Pointer<Pointer<Int8>> endp)>('SDL_strtod');
  final strPointer = str != null ? str.toNativeUtf8() : nullptr;
  final result = sdlStrtodLookupFunction(strPointer, endp);
  calloc.free(strPointer);
  return result;
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_strcmp(const char *str1, const char *str2)
/// ```
int sdlStrcmp(String? str1, String? str2) {
  final sdlStrcmpLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Utf8> str1, Pointer<Utf8> str2),
      int Function(Pointer<Utf8> str1, Pointer<Utf8> str2)>('SDL_strcmp');
  final str1Pointer = str1 != null ? str1.toNativeUtf8() : nullptr;
  final str2Pointer = str2 != null ? str2.toNativeUtf8() : nullptr;
  final result = sdlStrcmpLookupFunction(str1Pointer, str2Pointer);
  calloc.free(str1Pointer);
  calloc.free(str2Pointer);
  return result;
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_strncmp(const char *str1, const char *str2, size_t maxlen)
/// ```
int sdlStrncmp(String? str1, String? str2, int maxlen) {
  final sdlStrncmpLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Utf8> str1, Pointer<Utf8> str2, Uint32 maxlen),
      int Function(
          Pointer<Utf8> str1, Pointer<Utf8> str2, int maxlen)>('SDL_strncmp');
  final str1Pointer = str1 != null ? str1.toNativeUtf8() : nullptr;
  final str2Pointer = str2 != null ? str2.toNativeUtf8() : nullptr;
  final result = sdlStrncmpLookupFunction(str1Pointer, str2Pointer, maxlen);
  calloc.free(str1Pointer);
  calloc.free(str2Pointer);
  return result;
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_strcasecmp(const char *str1, const char *str2)
/// ```
int sdlStrcasecmp(String? str1, String? str2) {
  final sdlStrcasecmpLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Utf8> str1, Pointer<Utf8> str2),
      int Function(Pointer<Utf8> str1, Pointer<Utf8> str2)>('SDL_strcasecmp');
  final str1Pointer = str1 != null ? str1.toNativeUtf8() : nullptr;
  final str2Pointer = str2 != null ? str2.toNativeUtf8() : nullptr;
  final result = sdlStrcasecmpLookupFunction(str1Pointer, str2Pointer);
  calloc.free(str1Pointer);
  calloc.free(str2Pointer);
  return result;
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_strncasecmp(const char *str1, const char *str2, size_t len)
/// ```
int sdlStrncasecmp(String? str1, String? str2, int len) {
  final sdlStrncasecmpLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Utf8> str1, Pointer<Utf8> str2, Uint32 len),
      int Function(
          Pointer<Utf8> str1, Pointer<Utf8> str2, int len)>('SDL_strncasecmp');
  final str1Pointer = str1 != null ? str1.toNativeUtf8() : nullptr;
  final str2Pointer = str2 != null ? str2.toNativeUtf8() : nullptr;
  final result = sdlStrncasecmpLookupFunction(str1Pointer, str2Pointer, len);
  calloc.free(str1Pointer);
  calloc.free(str2Pointer);
  return result;
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_sscanf(const char *text, SDL_SCANF_FORMAT_STRING const char *fmt, ...) SDL_SCANF_VARARG_FUNC(2)
/// ```
int sdlSscanf(String? text, String? fmt, Pointer<NativeType> arg2) {
  final sdlSscanfLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<Utf8> text, Pointer<Utf8> fmt, Pointer<NativeType> arg2),
      int Function(Pointer<Utf8> text, Pointer<Utf8> fmt,
          Pointer<NativeType> arg2)>('SDL_sscanf');
  final textPointer = text != null ? text.toNativeUtf8() : nullptr;
  final fmtPointer = fmt != null ? fmt.toNativeUtf8() : nullptr;
  final result = sdlSscanfLookupFunction(textPointer, fmtPointer, arg2);
  calloc.free(textPointer);
  calloc.free(fmtPointer);
  return result;
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_vsscanf(const char *text, SDL_SCANF_FORMAT_STRING const char *fmt, va_list ap) SDL_SCANF_VARARG_FUNCV(2)
/// ```
int sdlVsscanf(String? text, String? fmt, Pointer<NativeType> arg2) {
  final sdlVsscanfLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<Utf8> text, Pointer<Utf8> fmt, Pointer<NativeType> arg2),
      int Function(Pointer<Utf8> text, Pointer<Utf8> fmt,
          Pointer<NativeType> arg2)>('SDL_vsscanf');
  final textPointer = text != null ? text.toNativeUtf8() : nullptr;
  final fmtPointer = fmt != null ? fmt.toNativeUtf8() : nullptr;
  final result = sdlVsscanfLookupFunction(textPointer, fmtPointer, arg2);
  calloc.free(textPointer);
  calloc.free(fmtPointer);
  return result;
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_snprintf(SDL_OUT_Z_CAP(maxlen) char *text, size_t maxlen, SDL_PRINTF_FORMAT_STRING const char *fmt, ... ) SDL_PRINTF_VARARG_FUNC(3)
/// ```
int sdlSnprintf(Pointer<NativeType> arg0, int maxlen, String? fmt,
    Pointer<NativeType> arg3) {
  final sdlSnprintfLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<NativeType> arg0, Uint32 maxlen, Pointer<Utf8> fmt,
          Pointer<NativeType> arg3),
      int Function(Pointer<NativeType> arg0, int maxlen, Pointer<Utf8> fmt,
          Pointer<NativeType> arg3)>('SDL_snprintf');
  final fmtPointer = fmt != null ? fmt.toNativeUtf8() : nullptr;
  final result = sdlSnprintfLookupFunction(arg0, maxlen, fmtPointer, arg3);
  calloc.free(fmtPointer);
  return result;
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_swprintf(SDL_OUT_Z_CAP(maxlen) wchar_t *text, size_t maxlen, SDL_PRINTF_FORMAT_STRING const wchar_t *fmt, ... ) SDL_WPRINTF_VARARG_FUNC(3)
/// ```
int sdlSwprintf(Pointer<NativeType> arg0, int maxlen, Pointer<Int16> fmt,
    Pointer<NativeType> arg3) {
  final sdlSwprintfLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<NativeType> arg0, Uint32 maxlen,
          Pointer<Int16> fmt, Pointer<NativeType> arg3),
      int Function(Pointer<NativeType> arg0, int maxlen, Pointer<Int16> fmt,
          Pointer<NativeType> arg3)>('SDL_swprintf');
  return sdlSwprintfLookupFunction(arg0, maxlen, fmt, arg3);
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_vsnprintf(SDL_OUT_Z_CAP(maxlen) char *text, size_t maxlen, SDL_PRINTF_FORMAT_STRING const char *fmt, va_list ap) SDL_PRINTF_VARARG_FUNCV(3)
/// ```
int sdlVsnprintf(Pointer<NativeType> arg0, int maxlen, String? fmt,
    Pointer<NativeType> arg3) {
  final sdlVsnprintfLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<NativeType> arg0, Uint32 maxlen, Pointer<Utf8> fmt,
          Pointer<NativeType> arg3),
      int Function(Pointer<NativeType> arg0, int maxlen, Pointer<Utf8> fmt,
          Pointer<NativeType> arg3)>('SDL_vsnprintf');
  final fmtPointer = fmt != null ? fmt.toNativeUtf8() : nullptr;
  final result = sdlVsnprintfLookupFunction(arg0, maxlen, fmtPointer, arg3);
  calloc.free(fmtPointer);
  return result;
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_vswprintf(SDL_OUT_Z_CAP(maxlen) wchar_t *text, size_t maxlen, const wchar_t *fmt, va_list ap)
/// ```
int sdlVswprintf(Pointer<NativeType> arg0, int maxlen, Pointer<Int16> fmt,
    Pointer<NativeType> ap) {
  final sdlVswprintfLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<NativeType> arg0, Uint32 maxlen,
          Pointer<Int16> fmt, Pointer<NativeType> ap),
      int Function(Pointer<NativeType> arg0, int maxlen, Pointer<Int16> fmt,
          Pointer<NativeType> ap)>('SDL_vswprintf');
  return sdlVswprintfLookupFunction(arg0, maxlen, fmt, ap);
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_asprintf(char **strp, SDL_PRINTF_FORMAT_STRING const char *fmt, ...) SDL_PRINTF_VARARG_FUNC(2)
/// ```
int sdlAsprintf(
    Pointer<Pointer<Int8>> strp, String? fmt, Pointer<NativeType> arg2) {
  final sdlAsprintfLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Pointer<Int8>> strp, Pointer<Utf8> fmt,
          Pointer<NativeType> arg2),
      int Function(Pointer<Pointer<Int8>> strp, Pointer<Utf8> fmt,
          Pointer<NativeType> arg2)>('SDL_asprintf');
  final fmtPointer = fmt != null ? fmt.toNativeUtf8() : nullptr;
  final result = sdlAsprintfLookupFunction(strp, fmtPointer, arg2);
  calloc.free(fmtPointer);
  return result;
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_vasprintf(char **strp, SDL_PRINTF_FORMAT_STRING const char *fmt, va_list ap) SDL_PRINTF_VARARG_FUNCV(2)
/// ```
int sdlVasprintf(
    Pointer<Pointer<Int8>> strp, String? fmt, Pointer<NativeType> arg2) {
  final sdlVasprintfLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Pointer<Int8>> strp, Pointer<Utf8> fmt,
          Pointer<NativeType> arg2),
      int Function(Pointer<Pointer<Int8>> strp, Pointer<Utf8> fmt,
          Pointer<NativeType> arg2)>('SDL_vasprintf');
  final fmtPointer = fmt != null ? fmt.toNativeUtf8() : nullptr;
  final result = sdlVasprintfLookupFunction(strp, fmtPointer, arg2);
  calloc.free(fmtPointer);
  return result;
}

///
/// Use this function to compute arc cosine of `x`.
///
/// The definition of `y = acos(x)` is `x = cos(y)`.
///
/// Domain: `-1 <= x <= 1`
///
/// Range: `0 <= y <= Pi`
///
/// \param x floating point value, in radians.
/// \returns arc cosine of `x`.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC double SDLCALL SDL_acos(double x)
/// ```
double sdlAcos(double x) {
  final sdlAcosLookupFunction = libSdl3.lookupFunction<
      Double Function(Double x), double Function(double x)>('SDL_acos');
  return sdlAcosLookupFunction(x);
}

/// ```c
/// extern DECLSPEC float SDLCALL SDL_acosf(float x)
/// ```
double sdlAcosf(double x) {
  final sdlAcosfLookupFunction = libSdl3.lookupFunction<Float Function(Float x),
      double Function(double x)>('SDL_acosf');
  return sdlAcosfLookupFunction(x);
}

/// ```c
/// extern DECLSPEC double SDLCALL SDL_asin(double x)
/// ```
double sdlAsin(double x) {
  final sdlAsinLookupFunction = libSdl3.lookupFunction<
      Double Function(Double x), double Function(double x)>('SDL_asin');
  return sdlAsinLookupFunction(x);
}

/// ```c
/// extern DECLSPEC float SDLCALL SDL_asinf(float x)
/// ```
double sdlAsinf(double x) {
  final sdlAsinfLookupFunction = libSdl3.lookupFunction<Float Function(Float x),
      double Function(double x)>('SDL_asinf');
  return sdlAsinfLookupFunction(x);
}

/// ```c
/// extern DECLSPEC double SDLCALL SDL_atan(double x)
/// ```
double sdlAtan(double x) {
  final sdlAtanLookupFunction = libSdl3.lookupFunction<
      Double Function(Double x), double Function(double x)>('SDL_atan');
  return sdlAtanLookupFunction(x);
}

/// ```c
/// extern DECLSPEC float SDLCALL SDL_atanf(float x)
/// ```
double sdlAtanf(double x) {
  final sdlAtanfLookupFunction = libSdl3.lookupFunction<Float Function(Float x),
      double Function(double x)>('SDL_atanf');
  return sdlAtanfLookupFunction(x);
}

/// ```c
/// extern DECLSPEC double SDLCALL SDL_atan2(double y, double x)
/// ```
double sdlAtan2(double y, double x) {
  final sdlAtan2LookupFunction = libSdl3.lookupFunction<
      Double Function(Double y, Double x),
      double Function(double y, double x)>('SDL_atan2');
  return sdlAtan2LookupFunction(y, x);
}

/// ```c
/// extern DECLSPEC float SDLCALL SDL_atan2f(float y, float x)
/// ```
double sdlAtan2f(double y, double x) {
  final sdlAtan2fLookupFunction = libSdl3.lookupFunction<
      Float Function(Float y, Float x),
      double Function(double y, double x)>('SDL_atan2f');
  return sdlAtan2fLookupFunction(y, x);
}

/// ```c
/// extern DECLSPEC double SDLCALL SDL_ceil(double x)
/// ```
double sdlCeil(double x) {
  final sdlCeilLookupFunction = libSdl3.lookupFunction<
      Double Function(Double x), double Function(double x)>('SDL_ceil');
  return sdlCeilLookupFunction(x);
}

/// ```c
/// extern DECLSPEC float SDLCALL SDL_ceilf(float x)
/// ```
double sdlCeilf(double x) {
  final sdlCeilfLookupFunction = libSdl3.lookupFunction<Float Function(Float x),
      double Function(double x)>('SDL_ceilf');
  return sdlCeilfLookupFunction(x);
}

/// ```c
/// extern DECLSPEC double SDLCALL SDL_copysign(double x, double y)
/// ```
double sdlCopysign(double x, double y) {
  final sdlCopysignLookupFunction = libSdl3.lookupFunction<
      Double Function(Double x, Double y),
      double Function(double x, double y)>('SDL_copysign');
  return sdlCopysignLookupFunction(x, y);
}

/// ```c
/// extern DECLSPEC float SDLCALL SDL_copysignf(float x, float y)
/// ```
double sdlCopysignf(double x, double y) {
  final sdlCopysignfLookupFunction = libSdl3.lookupFunction<
      Float Function(Float x, Float y),
      double Function(double x, double y)>('SDL_copysignf');
  return sdlCopysignfLookupFunction(x, y);
}

/// ```c
/// extern DECLSPEC double SDLCALL SDL_cos(double x)
/// ```
double sdlCos(double x) {
  final sdlCosLookupFunction = libSdl3.lookupFunction<Double Function(Double x),
      double Function(double x)>('SDL_cos');
  return sdlCosLookupFunction(x);
}

/// ```c
/// extern DECLSPEC float SDLCALL SDL_cosf(float x)
/// ```
double sdlCosf(double x) {
  final sdlCosfLookupFunction = libSdl3.lookupFunction<Float Function(Float x),
      double Function(double x)>('SDL_cosf');
  return sdlCosfLookupFunction(x);
}

/// ```c
/// extern DECLSPEC double SDLCALL SDL_exp(double x)
/// ```
double sdlExp(double x) {
  final sdlExpLookupFunction = libSdl3.lookupFunction<Double Function(Double x),
      double Function(double x)>('SDL_exp');
  return sdlExpLookupFunction(x);
}

/// ```c
/// extern DECLSPEC float SDLCALL SDL_expf(float x)
/// ```
double sdlExpf(double x) {
  final sdlExpfLookupFunction = libSdl3.lookupFunction<Float Function(Float x),
      double Function(double x)>('SDL_expf');
  return sdlExpfLookupFunction(x);
}

/// ```c
/// extern DECLSPEC double SDLCALL SDL_fabs(double x)
/// ```
double sdlFabs(double x) {
  final sdlFabsLookupFunction = libSdl3.lookupFunction<
      Double Function(Double x), double Function(double x)>('SDL_fabs');
  return sdlFabsLookupFunction(x);
}

/// ```c
/// extern DECLSPEC float SDLCALL SDL_fabsf(float x)
/// ```
double sdlFabsf(double x) {
  final sdlFabsfLookupFunction = libSdl3.lookupFunction<Float Function(Float x),
      double Function(double x)>('SDL_fabsf');
  return sdlFabsfLookupFunction(x);
}

/// ```c
/// extern DECLSPEC double SDLCALL SDL_floor(double x)
/// ```
double sdlFloor(double x) {
  final sdlFloorLookupFunction = libSdl3.lookupFunction<
      Double Function(Double x), double Function(double x)>('SDL_floor');
  return sdlFloorLookupFunction(x);
}

/// ```c
/// extern DECLSPEC float SDLCALL SDL_floorf(float x)
/// ```
double sdlFloorf(double x) {
  final sdlFloorfLookupFunction = libSdl3.lookupFunction<
      Float Function(Float x), double Function(double x)>('SDL_floorf');
  return sdlFloorfLookupFunction(x);
}

/// ```c
/// extern DECLSPEC double SDLCALL SDL_trunc(double x)
/// ```
double sdlTrunc(double x) {
  final sdlTruncLookupFunction = libSdl3.lookupFunction<
      Double Function(Double x), double Function(double x)>('SDL_trunc');
  return sdlTruncLookupFunction(x);
}

/// ```c
/// extern DECLSPEC float SDLCALL SDL_truncf(float x)
/// ```
double sdlTruncf(double x) {
  final sdlTruncfLookupFunction = libSdl3.lookupFunction<
      Float Function(Float x), double Function(double x)>('SDL_truncf');
  return sdlTruncfLookupFunction(x);
}

/// ```c
/// extern DECLSPEC double SDLCALL SDL_fmod(double x, double y)
/// ```
double sdlFmod(double x, double y) {
  final sdlFmodLookupFunction = libSdl3.lookupFunction<
      Double Function(Double x, Double y),
      double Function(double x, double y)>('SDL_fmod');
  return sdlFmodLookupFunction(x, y);
}

/// ```c
/// extern DECLSPEC float SDLCALL SDL_fmodf(float x, float y)
/// ```
double sdlFmodf(double x, double y) {
  final sdlFmodfLookupFunction = libSdl3.lookupFunction<
      Float Function(Float x, Float y),
      double Function(double x, double y)>('SDL_fmodf');
  return sdlFmodfLookupFunction(x, y);
}

/// ```c
/// extern DECLSPEC float SDLCALL SDL_logf(float x)
/// ```
double sdlLogf(double x) {
  final sdlLogfLookupFunction = libSdl3.lookupFunction<Float Function(Float x),
      double Function(double x)>('SDL_logf');
  return sdlLogfLookupFunction(x);
}

/// ```c
/// extern DECLSPEC double SDLCALL SDL_log10(double x)
/// ```
double sdlLog10(double x) {
  final sdlLog10LookupFunction = libSdl3.lookupFunction<
      Double Function(Double x), double Function(double x)>('SDL_log10');
  return sdlLog10LookupFunction(x);
}

/// ```c
/// extern DECLSPEC float SDLCALL SDL_log10f(float x)
/// ```
double sdlLog10f(double x) {
  final sdlLog10fLookupFunction = libSdl3.lookupFunction<
      Float Function(Float x), double Function(double x)>('SDL_log10f');
  return sdlLog10fLookupFunction(x);
}

/// ```c
/// extern DECLSPEC double SDLCALL SDL_modf(double x, double *y)
/// ```
double sdlModf(double x, Pointer<Double> y) {
  final sdlModfLookupFunction = libSdl3.lookupFunction<
      Double Function(Double x, Pointer<Double> y),
      double Function(double x, Pointer<Double> y)>('SDL_modf');
  return sdlModfLookupFunction(x, y);
}

/// ```c
/// extern DECLSPEC float SDLCALL SDL_modff(float x, float *y)
/// ```
double sdlModff(double x, Pointer<Float> y) {
  final sdlModffLookupFunction = libSdl3.lookupFunction<
      Float Function(Float x, Pointer<Float> y),
      double Function(double x, Pointer<Float> y)>('SDL_modff');
  return sdlModffLookupFunction(x, y);
}

/// ```c
/// extern DECLSPEC double SDLCALL SDL_pow(double x, double y)
/// ```
double sdlPow(double x, double y) {
  final sdlPowLookupFunction = libSdl3.lookupFunction<
      Double Function(Double x, Double y),
      double Function(double x, double y)>('SDL_pow');
  return sdlPowLookupFunction(x, y);
}

/// ```c
/// extern DECLSPEC float SDLCALL SDL_powf(float x, float y)
/// ```
double sdlPowf(double x, double y) {
  final sdlPowfLookupFunction = libSdl3.lookupFunction<
      Float Function(Float x, Float y),
      double Function(double x, double y)>('SDL_powf');
  return sdlPowfLookupFunction(x, y);
}

/// ```c
/// extern DECLSPEC double SDLCALL SDL_round(double x)
/// ```
double sdlRound(double x) {
  final sdlRoundLookupFunction = libSdl3.lookupFunction<
      Double Function(Double x), double Function(double x)>('SDL_round');
  return sdlRoundLookupFunction(x);
}

/// ```c
/// extern DECLSPEC float SDLCALL SDL_roundf(float x)
/// ```
double sdlRoundf(double x) {
  final sdlRoundfLookupFunction = libSdl3.lookupFunction<
      Float Function(Float x), double Function(double x)>('SDL_roundf');
  return sdlRoundfLookupFunction(x);
}

/// ```c
/// extern DECLSPEC long SDLCALL SDL_lround(double x)
/// ```
int sdlLround(double x) {
  final sdlLroundLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Double x), int Function(double x)>(
          'SDL_lround');
  return sdlLroundLookupFunction(x);
}

/// ```c
/// extern DECLSPEC long SDLCALL SDL_lroundf(float x)
/// ```
int sdlLroundf(double x) {
  final sdlLroundfLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Float x), int Function(double x)>(
          'SDL_lroundf');
  return sdlLroundfLookupFunction(x);
}

/// ```c
/// extern DECLSPEC double SDLCALL SDL_scalbn(double x, int n)
/// ```
double sdlScalbn(double x, int n) {
  final sdlScalbnLookupFunction = libSdl3.lookupFunction<
      Double Function(Double x, Int32 n),
      double Function(double x, int n)>('SDL_scalbn');
  return sdlScalbnLookupFunction(x, n);
}

/// ```c
/// extern DECLSPEC float SDLCALL SDL_scalbnf(float x, int n)
/// ```
double sdlScalbnf(double x, int n) {
  final sdlScalbnfLookupFunction = libSdl3.lookupFunction<
      Float Function(Float x, Int32 n),
      double Function(double x, int n)>('SDL_scalbnf');
  return sdlScalbnfLookupFunction(x, n);
}

/// ```c
/// extern DECLSPEC double SDLCALL SDL_sin(double x)
/// ```
double sdlSin(double x) {
  final sdlSinLookupFunction = libSdl3.lookupFunction<Double Function(Double x),
      double Function(double x)>('SDL_sin');
  return sdlSinLookupFunction(x);
}

/// ```c
/// extern DECLSPEC float SDLCALL SDL_sinf(float x)
/// ```
double sdlSinf(double x) {
  final sdlSinfLookupFunction = libSdl3.lookupFunction<Float Function(Float x),
      double Function(double x)>('SDL_sinf');
  return sdlSinfLookupFunction(x);
}

/// ```c
/// extern DECLSPEC double SDLCALL SDL_sqrt(double x)
/// ```
double sdlSqrt(double x) {
  final sdlSqrtLookupFunction = libSdl3.lookupFunction<
      Double Function(Double x), double Function(double x)>('SDL_sqrt');
  return sdlSqrtLookupFunction(x);
}

/// ```c
/// extern DECLSPEC float SDLCALL SDL_sqrtf(float x)
/// ```
double sdlSqrtf(double x) {
  final sdlSqrtfLookupFunction = libSdl3.lookupFunction<Float Function(Float x),
      double Function(double x)>('SDL_sqrtf');
  return sdlSqrtfLookupFunction(x);
}

/// ```c
/// extern DECLSPEC double SDLCALL SDL_tan(double x)
/// ```
double sdlTan(double x) {
  final sdlTanLookupFunction = libSdl3.lookupFunction<Double Function(Double x),
      double Function(double x)>('SDL_tan');
  return sdlTanLookupFunction(x);
}

/// ```c
/// extern DECLSPEC float SDLCALL SDL_tanf(float x)
/// ```
double sdlTanf(double x) {
  final sdlTanfLookupFunction = libSdl3.lookupFunction<Float Function(Float x),
      double Function(double x)>('SDL_tanf');
  return sdlTanfLookupFunction(x);
}

/// ```c
/// extern DECLSPEC SDL_iconv_t SDLCALL SDL_iconv_open(const char *tocode, const char *fromcode)
/// ```
Pointer<SdlIconvT> sdlIconvOpen(String? tocode, String? fromcode) {
  final sdlIconvOpenLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlIconvT> Function(Pointer<Utf8> tocode, Pointer<Utf8> fromcode),
      Pointer<SdlIconvT> Function(
          Pointer<Utf8> tocode, Pointer<Utf8> fromcode)>('SDL_iconv_open');
  final tocodePointer = tocode != null ? tocode.toNativeUtf8() : nullptr;
  final fromcodePointer = fromcode != null ? fromcode.toNativeUtf8() : nullptr;
  final result = sdlIconvOpenLookupFunction(tocodePointer, fromcodePointer);
  calloc.free(tocodePointer);
  calloc.free(fromcodePointer);
  return result;
}

/// ```c
/// extern DECLSPEC int SDLCALL SDL_iconv_close(SDL_iconv_t cd)
/// ```
int sdlIconvClose(Pointer<SdlIconvT> cd) {
  final sdlIconvCloseLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlIconvT> cd),
      int Function(Pointer<SdlIconvT> cd)>('SDL_iconv_close');
  return sdlIconvCloseLookupFunction(cd);
}

/// ```c
/// extern DECLSPEC size_t SDLCALL SDL_iconv(SDL_iconv_t cd, const char **inbuf, size_t * inbytesleft, char **outbuf, size_t * outbytesleft)
/// ```
int sdlIconv(
    Pointer<SdlIconvT> cd,
    Pointer<Pointer<Int8>> inbuf,
    Pointer<Uint32> inbytesleft,
    Pointer<Pointer<Int8>> outbuf,
    Pointer<Uint32> outbytesleft) {
  final sdlIconvLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(
          Pointer<SdlIconvT> cd,
          Pointer<Pointer<Int8>> inbuf,
          Pointer<Uint32> inbytesleft,
          Pointer<Pointer<Int8>> outbuf,
          Pointer<Uint32> outbytesleft),
      int Function(
          Pointer<SdlIconvT> cd,
          Pointer<Pointer<Int8>> inbuf,
          Pointer<Uint32> inbytesleft,
          Pointer<Pointer<Int8>> outbuf,
          Pointer<Uint32> outbytesleft)>('SDL_iconv');
  return sdlIconvLookupFunction(cd, inbuf, inbytesleft, outbuf, outbytesleft);
}

///
/// This function converts a buffer or string between encodings in one pass,
/// returning a string that must be freed with SDL_free() or NULL on error.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC char *SDLCALL SDL_iconv_string(const char *tocode, const char *fromcode, const char *inbuf, size_t inbytesleft)
/// ```
Pointer<Int8> sdlIconvString(
    String? tocode, String? fromcode, String? inbuf, int inbytesleft) {
  final sdlIconvStringLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(Pointer<Utf8> tocode, Pointer<Utf8> fromcode,
          Pointer<Utf8> inbuf, Uint32 inbytesleft),
      Pointer<Int8> Function(Pointer<Utf8> tocode, Pointer<Utf8> fromcode,
          Pointer<Utf8> inbuf, int inbytesleft)>('SDL_iconv_string');
  final tocodePointer = tocode != null ? tocode.toNativeUtf8() : nullptr;
  final fromcodePointer = fromcode != null ? fromcode.toNativeUtf8() : nullptr;
  final inbufPointer = inbuf != null ? inbuf.toNativeUtf8() : nullptr;
  final result = sdlIconvStringLookupFunction(
      tocodePointer, fromcodePointer, inbufPointer, inbytesleft);
  calloc.free(tocodePointer);
  calloc.free(fromcodePointer);
  calloc.free(inbufPointer);
  return result;
}
