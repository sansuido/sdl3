// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Allocate uninitialized memory.
///
/// The allocated memory returned by this function must be freed with
/// SDL_free().
///
/// If `size` is 0, it will be set to 1.
///
/// If you want to allocate memory aligned to a specific alignment, consider
/// using SDL_aligned_alloc().
///
/// \param size the size to allocate.
/// \returns a pointer to the allocated memory, or NULL if allocation failed.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_free
/// \sa SDL_calloc
/// \sa SDL_realloc
/// \sa SDL_aligned_alloc
///
/// ```c
/// extern SDL_DECLSPEC SDL_MALLOC void * SDLCALL SDL_malloc(size_t size)
/// ```
Pointer<NativeType> sdlMalloc(int size) {
  final sdlMallocLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(Uint32 size),
      Pointer<NativeType> Function(int size)>('SDL_malloc');
  return sdlMallocLookupFunction(size);
}

///
/// Free allocated memory.
///
/// The pointer is no longer valid after this call and cannot be dereferenced
/// anymore.
///
/// If `mem` is NULL, this function does nothing.
///
/// \param mem a pointer to allocated memory, or NULL.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_malloc
/// \sa SDL_calloc
/// \sa SDL_realloc
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_free(void *mem)
/// ```
void sdlFree(Pointer<NativeType> mem) {
  final sdlFreeLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<NativeType> mem),
      void Function(Pointer<NativeType> mem)>('SDL_free');
  return sdlFreeLookupFunction(mem);
}

///
/// Get the original set of SDL memory functions.
///
/// This is what SDL_malloc and friends will use by default, if there has been
/// no call to SDL_SetMemoryFunctions. This is not necessarily using the C
/// runtime's `malloc` functions behind the scenes! Different platforms and
/// build configurations might do any number of unexpected things.
///
/// \param malloc_func filled with malloc function.
/// \param calloc_func filled with calloc function.
/// \param realloc_func filled with realloc function.
/// \param free_func filled with free function.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_GetOriginalMemoryFunctions(SDL_malloc_func *malloc_func, SDL_calloc_func *calloc_func, SDL_realloc_func *realloc_func, SDL_free_func *free_func)
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
/// Get the current set of SDL memory functions.
///
/// \param malloc_func filled with malloc function.
/// \param calloc_func filled with calloc function.
/// \param realloc_func filled with realloc function.
/// \param free_func filled with free function.
///
/// \threadsafety This does not hold a lock, so do not call this in the
/// unlikely event of a background thread calling
/// SDL_SetMemoryFunctions simultaneously.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetMemoryFunctions
/// \sa SDL_GetOriginalMemoryFunctions
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_GetMemoryFunctions(SDL_malloc_func *malloc_func, SDL_calloc_func *calloc_func, SDL_realloc_func *realloc_func, SDL_free_func *free_func)
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
/// Replace SDL's memory allocation functions with a custom set.
///
/// It is not safe to call this function once any allocations have been made,
/// as future calls to SDL_free will use the new allocator, even if they came
/// from an SDL_malloc made with the old one!
///
/// If used, usually this needs to be the first call made into the SDL library,
/// if not the very first thing done at program startup time.
///
/// \param malloc_func custom malloc function.
/// \param calloc_func custom calloc function.
/// \param realloc_func custom realloc function.
/// \param free_func custom free function.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread, but one
/// should not replace the memory functions once any allocations
/// are made!
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetMemoryFunctions
/// \sa SDL_GetOriginalMemoryFunctions
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetMemoryFunctions(SDL_malloc_func malloc_func, SDL_calloc_func calloc_func, SDL_realloc_func realloc_func, SDL_free_func free_func)
/// ```
bool sdlSetMemoryFunctions(
    Pointer<NativeFunction<SdlMallocFunc>> mallocFunc,
    Pointer<NativeFunction<SdlCallocFunc>> callocFunc,
    Pointer<NativeFunction<SdlReallocFunc>> reallocFunc,
    Pointer<NativeFunction<SdlFreeFunc>> freeFunc) {
  final sdlSetMemoryFunctionsLookupFunction = libSdl3.lookupFunction<
          Uint8 Function(
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
          mallocFunc, callocFunc, reallocFunc, freeFunc) ==
      1;
}

///
/// Allocate memory aligned to a specific alignment.
///
/// The memory returned by this function must be freed with SDL_aligned_free(),
/// _not_ SDL_free().
///
/// If `alignment` is less than the size of `void *`, it will be increased to
/// match that.
///
/// The returned memory address will be a multiple of the alignment value, and
/// the size of the memory allocated will be a multiple of the alignment value.
///
/// \param alignment the alignment of the memory.
/// \param size the size to allocate.
/// \returns a pointer to the aligned memory, or NULL if allocation failed.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_aligned_free
///
/// ```c
/// extern SDL_DECLSPEC SDL_MALLOC void * SDLCALL SDL_aligned_alloc(size_t alignment, size_t size)
/// ```
Pointer<NativeType> sdlAlignedAlloc(int alignment, int size) {
  final sdlAlignedAllocLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(Uint32 alignment, Uint32 size),
      Pointer<NativeType> Function(
          int alignment, int size)>('SDL_aligned_alloc');
  return sdlAlignedAllocLookupFunction(alignment, size);
}

///
/// Free memory allocated by SDL_aligned_alloc().
///
/// The pointer is no longer valid after this call and cannot be dereferenced
/// anymore.
///
/// If `mem` is NULL, this function does nothing.
///
/// \param mem a pointer previously returned by SDL_aligned_alloc(), or NULL.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_aligned_alloc
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_aligned_free(void *mem)
/// ```
void sdlAlignedFree(Pointer<NativeType> mem) {
  final sdlAlignedFreeLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<NativeType> mem),
      void Function(Pointer<NativeType> mem)>('SDL_aligned_free');
  return sdlAlignedFreeLookupFunction(mem);
}

///
/// Get the number of outstanding (unfreed) allocations.
///
/// \returns the number of allocations.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetNumAllocations(void)
/// ```
int sdlGetNumAllocations() {
  final sdlGetNumAllocationsLookupFunction =
      libSdl3.lookupFunction<Int32 Function(), int Function()>(
          'SDL_GetNumAllocations');
  return sdlGetNumAllocationsLookupFunction();
}

///
/// Get the process environment.
///
/// This is initialized at application start and is not affected by setenv()
/// and unsetenv() calls after that point. Use SDL_SetEnvironmentVariable() and
/// SDL_UnsetEnvironmentVariable() if you want to modify this environment, or
/// SDL_setenv_unsafe() or SDL_unsetenv_unsafe() if you want changes to persist
/// in the C runtime environment after SDL_Quit().
///
/// \returns a pointer to the environment for the process or NULL on failure;
/// call SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetEnvironmentVariable
/// \sa SDL_GetEnvironmentVariables
/// \sa SDL_SetEnvironmentVariable
/// \sa SDL_UnsetEnvironmentVariable
///
/// ```c
/// extern SDL_DECLSPEC SDL_Environment * SDLCALL SDL_GetEnvironment(void)
/// ```
Pointer<SdlEnvironment> sdlGetEnvironment() {
  final sdlGetEnvironmentLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlEnvironment> Function(),
      Pointer<SdlEnvironment> Function()>('SDL_GetEnvironment');
  return sdlGetEnvironmentLookupFunction();
}

///
/// Create a set of environment variables
///
/// \param populated true to initialize it from the C runtime environment,
/// false to create an empty environment.
/// \returns a pointer to the new environment or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety If `populated` is false, it is safe to call this function
/// from any thread, otherwise it is safe if no other threads are
/// calling setenv() or unsetenv()
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetEnvironmentVariable
/// \sa SDL_GetEnvironmentVariables
/// \sa SDL_SetEnvironmentVariable
/// \sa SDL_UnsetEnvironmentVariable
/// \sa SDL_DestroyEnvironment
///
/// ```c
/// extern SDL_DECLSPEC SDL_Environment * SDLCALL SDL_CreateEnvironment(bool populated)
/// ```
Pointer<SdlEnvironment> sdlCreateEnvironment(bool populated) {
  final sdlCreateEnvironmentLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlEnvironment> Function(Uint8 populated),
      Pointer<SdlEnvironment> Function(int populated)>('SDL_CreateEnvironment');
  return sdlCreateEnvironmentLookupFunction(populated ? 1 : 0);
}

///
/// Get the value of a variable in the environment.
///
/// \param env the environment to query.
/// \param name the name of the variable to get.
/// \returns a pointer to the value of the variable or NULL if it can't be
/// found.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetEnvironment
/// \sa SDL_CreateEnvironment
/// \sa SDL_GetEnvironmentVariables
/// \sa SDL_SetEnvironmentVariable
/// \sa SDL_UnsetEnvironmentVariable
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetEnvironmentVariable(SDL_Environment *env, const char *name)
/// ```
String? sdlGetEnvironmentVariable(Pointer<SdlEnvironment> env, String? name) {
  final sdlGetEnvironmentVariableLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Pointer<SdlEnvironment> env, Pointer<Utf8> name),
      Pointer<Utf8> Function(Pointer<SdlEnvironment> env,
          Pointer<Utf8> name)>('SDL_GetEnvironmentVariable');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlGetEnvironmentVariableLookupFunction(env, namePointer);
  calloc.free(namePointer);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get all variables in the environment.
///
/// \param env the environment to query.
/// \returns a NULL terminated array of pointers to environment variables in
/// the form "variable=value" or NULL on failure; call SDL_GetError()
/// for more information. This is a single allocation that should be
/// freed with SDL_free() when it is no longer needed.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetEnvironment
/// \sa SDL_CreateEnvironment
/// \sa SDL_GetEnvironmentVariables
/// \sa SDL_SetEnvironmentVariable
/// \sa SDL_UnsetEnvironmentVariable
///
/// ```c
/// extern SDL_DECLSPEC char ** SDLCALL SDL_GetEnvironmentVariables(SDL_Environment *env)
/// ```
Pointer<Pointer<Int8>> sdlGetEnvironmentVariables(Pointer<SdlEnvironment> env) {
  final sdlGetEnvironmentVariablesLookupFunction = libSdl3.lookupFunction<
      Pointer<Pointer<Int8>> Function(Pointer<SdlEnvironment> env),
      Pointer<Pointer<Int8>> Function(
          Pointer<SdlEnvironment> env)>('SDL_GetEnvironmentVariables');
  return sdlGetEnvironmentVariablesLookupFunction(env);
}

///
/// Set the value of a variable in the environment.
///
/// \param env the environment to modify.
/// \param name the name of the variable to set.
/// \param value the value of the variable to set.
/// \param overwrite true to overwrite the variable if it exists, false to
/// return success without setting the variable if it already
/// exists.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetEnvironment
/// \sa SDL_CreateEnvironment
/// \sa SDL_GetEnvironmentVariable
/// \sa SDL_GetEnvironmentVariables
/// \sa SDL_UnsetEnvironmentVariable
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetEnvironmentVariable(SDL_Environment *env, const char *name, const char *value, bool overwrite)
/// ```
bool sdlSetEnvironmentVariable(
    Pointer<SdlEnvironment> env, String? name, String? value, bool overwrite) {
  final sdlSetEnvironmentVariableLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlEnvironment> env, Pointer<Utf8> name,
          Pointer<Utf8> value, Uint8 overwrite),
      int Function(Pointer<SdlEnvironment> env, Pointer<Utf8> name,
          Pointer<Utf8> value, int overwrite)>('SDL_SetEnvironmentVariable');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final valuePointer = value != null ? value.toNativeUtf8() : nullptr;
  final result = sdlSetEnvironmentVariableLookupFunction(
          env, namePointer, valuePointer, overwrite ? 1 : 0) ==
      1;
  calloc.free(namePointer);
  calloc.free(valuePointer);
  return result;
}

///
/// Clear a variable from the environment.
///
/// \param env the environment to modify.
/// \param name the name of the variable to unset.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetEnvironment
/// \sa SDL_CreateEnvironment
/// \sa SDL_GetEnvironmentVariable
/// \sa SDL_GetEnvironmentVariables
/// \sa SDL_SetEnvironmentVariable
/// \sa SDL_UnsetEnvironmentVariable
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_UnsetEnvironmentVariable(SDL_Environment *env, const char *name)
/// ```
bool sdlUnsetEnvironmentVariable(Pointer<SdlEnvironment> env, String? name) {
  final sdlUnsetEnvironmentVariableLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlEnvironment> env, Pointer<Utf8> name),
      int Function(Pointer<SdlEnvironment> env,
          Pointer<Utf8> name)>('SDL_UnsetEnvironmentVariable');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result =
      sdlUnsetEnvironmentVariableLookupFunction(env, namePointer) == 1;
  calloc.free(namePointer);
  return result;
}

///
/// Destroy a set of environment variables.
///
/// \param env the environment to destroy.
///
/// \threadsafety It is safe to call this function from any thread, as long as
/// the environment is no longer in use.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_CreateEnvironment
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_DestroyEnvironment(SDL_Environment *env)
/// ```
void sdlDestroyEnvironment(Pointer<SdlEnvironment> env) {
  final sdlDestroyEnvironmentLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlEnvironment> env),
      void Function(Pointer<SdlEnvironment> env)>('SDL_DestroyEnvironment');
  return sdlDestroyEnvironmentLookupFunction(env);
}

///
/// Get the value of a variable in the environment.
///
/// This function uses SDL's cached copy of the environment and is thread-safe.
///
/// \param name the name of the variable to get.
/// \returns a pointer to the value of the variable or NULL if it can't be
/// found.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_getenv(const char *name)
/// ```
String? sdlGetenv(String? name) {
  final sdlGetenvLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Pointer<Utf8> name),
      Pointer<Utf8> Function(Pointer<Utf8> name)>('SDL_getenv');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlGetenvLookupFunction(namePointer);
  calloc.free(namePointer);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get the value of a variable in the environment.
///
/// This function bypasses SDL's cached copy of the environment and is not
/// thread-safe.
///
/// \param name the name of the variable to get.
/// \returns a pointer to the value of the variable or NULL if it can't be
/// found.
///
/// \threadsafety This function is not thread safe, consider using SDL_getenv()
/// instead.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_getenv
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_getenv_unsafe(const char *name)
/// ```
String? sdlGetenvUnsafe(String? name) {
  final sdlGetenvUnsafeLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Pointer<Utf8> name),
      Pointer<Utf8> Function(Pointer<Utf8> name)>('SDL_getenv_unsafe');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlGetenvUnsafeLookupFunction(namePointer);
  calloc.free(namePointer);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Set the value of a variable in the environment.
///
/// \param name the name of the variable to set.
/// \param value the value of the variable to set.
/// \param overwrite 1 to overwrite the variable if it exists, 0 to return
/// success without setting the variable if it already exists.
/// \returns 0 on success, -1 on error.
///
/// \threadsafety This function is not thread safe, consider using
/// SDL_SetEnvironmentVariable() instead.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetEnvironmentVariable
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_setenv_unsafe(const char *name, const char *value, int overwrite)
/// ```
int sdlSetenvUnsafe(String? name, String? value, int overwrite) {
  final sdlSetenvUnsafeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Utf8> name, Pointer<Utf8> value, Int32 overwrite),
      int Function(Pointer<Utf8> name, Pointer<Utf8> value,
          int overwrite)>('SDL_setenv_unsafe');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final valuePointer = value != null ? value.toNativeUtf8() : nullptr;
  final result =
      sdlSetenvUnsafeLookupFunction(namePointer, valuePointer, overwrite);
  calloc.free(namePointer);
  calloc.free(valuePointer);
  return result;
}

///
/// Clear a variable from the environment.
///
/// \param name the name of the variable to unset.
/// \returns 0 on success, -1 on error.
///
/// \threadsafety This function is not thread safe, consider using
/// SDL_UnsetEnvironmentVariable() instead.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_UnsetEnvironmentVariable
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_unsetenv_unsafe(const char *name)
/// ```
int sdlUnsetenvUnsafe(String? name) {
  final sdlUnsetenvUnsafeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Utf8> name),
      int Function(Pointer<Utf8> name)>('SDL_unsetenv_unsafe');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlUnsetenvUnsafeLookupFunction(namePointer);
  calloc.free(namePointer);
  return result;
}

/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_qsort(void *base, size_t nmemb, size_t size, SDL_CompareCallback compare)
/// ```
void sdlQsort(Pointer<NativeType> base, int nmemb, int size,
    Pointer<NativeFunction<SdlCompareCallback>> compare) {
  final sdlQsortLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<NativeType> base, Uint32 nmemb, Uint32 size,
          Pointer<NativeFunction<SdlCompareCallback>> compare),
      void Function(Pointer<NativeType> base, int nmemb, int size,
          Pointer<NativeFunction<SdlCompareCallback>> compare)>('SDL_qsort');
  return sdlQsortLookupFunction(base, nmemb, size, compare);
}

/// ```c
/// extern SDL_DECLSPEC void * SDLCALL SDL_bsearch(const void *key, const void *base, size_t nmemb, size_t size, SDL_CompareCallback compare)
/// ```
Pointer<NativeType> sdlBsearch(
    Pointer<NativeType> key,
    Pointer<NativeType> base,
    int nmemb,
    int size,
    Pointer<NativeFunction<SdlCompareCallback>> compare) {
  final sdlBsearchLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(
          Pointer<NativeType> key,
          Pointer<NativeType> base,
          Uint32 nmemb,
          Uint32 size,
          Pointer<NativeFunction<SdlCompareCallback>> compare),
      Pointer<NativeType> Function(
          Pointer<NativeType> key,
          Pointer<NativeType> base,
          int nmemb,
          int size,
          Pointer<NativeFunction<SdlCompareCallback>> compare)>('SDL_bsearch');
  return sdlBsearchLookupFunction(key, base, nmemb, size, compare);
}

/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_qsort_r(void *base, size_t nmemb, size_t size, SDL_CompareCallback_r compare, void *userdata)
/// ```
void sdlQsortR(
    Pointer<NativeType> base,
    int nmemb,
    int size,
    Pointer<NativeFunction<SdlCompareCallbackR>> compare,
    Pointer<NativeType> userdata) {
  final sdlQsortRLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Pointer<NativeType> base,
          Uint32 nmemb,
          Uint32 size,
          Pointer<NativeFunction<SdlCompareCallbackR>> compare,
          Pointer<NativeType> userdata),
      void Function(
          Pointer<NativeType> base,
          int nmemb,
          int size,
          Pointer<NativeFunction<SdlCompareCallbackR>> compare,
          Pointer<NativeType> userdata)>('SDL_qsort_r');
  return sdlQsortRLookupFunction(base, nmemb, size, compare, userdata);
}

/// ```c
/// extern SDL_DECLSPEC void * SDLCALL SDL_bsearch_r(const void *key, const void *base, size_t nmemb, size_t size, SDL_CompareCallback_r compare, void *userdata)
/// ```
Pointer<NativeType> sdlBsearchR(
    Pointer<NativeType> key,
    Pointer<NativeType> base,
    int nmemb,
    int size,
    Pointer<NativeFunction<SdlCompareCallbackR>> compare,
    Pointer<NativeType> userdata) {
  final sdlBsearchRLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(
          Pointer<NativeType> key,
          Pointer<NativeType> base,
          Uint32 nmemb,
          Uint32 size,
          Pointer<NativeFunction<SdlCompareCallbackR>> compare,
          Pointer<NativeType> userdata),
      Pointer<NativeType> Function(
          Pointer<NativeType> key,
          Pointer<NativeType> base,
          int nmemb,
          int size,
          Pointer<NativeFunction<SdlCompareCallbackR>> compare,
          Pointer<NativeType> userdata)>('SDL_bsearch_r');
  return sdlBsearchRLookupFunction(key, base, nmemb, size, compare, userdata);
}

/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_abs(int x)
/// ```
int sdlAbs(int x) {
  final sdlAbsLookupFunction = libSdl3
      .lookupFunction<Int32 Function(Int32 x), int Function(int x)>('SDL_abs');
  return sdlAbsLookupFunction(x);
}

///
/// Query if a character is alphabetic (a letter).
///
/// **WARNING**: Regardless of system locale, this will only treat ASCII values
/// for English 'a-z' and 'A-Z' as true.
///
/// \param x character value to check.
/// \returns non-zero if x falls within the character class, zero otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_isalpha(int x)
/// ```
int sdlIsalpha(int x) {
  final sdlIsalphaLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Int32 x), int Function(int x)>(
          'SDL_isalpha');
  return sdlIsalphaLookupFunction(x);
}

///
/// Query if a character is alphabetic (a letter) or a number.
///
/// **WARNING**: Regardless of system locale, this will only treat ASCII values
/// for English 'a-z', 'A-Z', and '0-9' as true.
///
/// \param x character value to check.
/// \returns non-zero if x falls within the character class, zero otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_isalnum(int x)
/// ```
int sdlIsalnum(int x) {
  final sdlIsalnumLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Int32 x), int Function(int x)>(
          'SDL_isalnum');
  return sdlIsalnumLookupFunction(x);
}

///
/// Report if a character is blank (a space or tab).
///
/// **WARNING**: Regardless of system locale, this will only treat ASCII values
/// 0x20 (space) or 0x9 (tab) as true.
///
/// \param x character value to check.
/// \returns non-zero if x falls within the character class, zero otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_isblank(int x)
/// ```
int sdlIsblank(int x) {
  final sdlIsblankLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Int32 x), int Function(int x)>(
          'SDL_isblank');
  return sdlIsblankLookupFunction(x);
}

///
/// Report if a character is a control character.
///
/// **WARNING**: Regardless of system locale, this will only treat ASCII values
/// 0 through 0x1F, and 0x7F, as true.
///
/// \param x character value to check.
/// \returns non-zero if x falls within the character class, zero otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_iscntrl(int x)
/// ```
int sdlIscntrl(int x) {
  final sdlIscntrlLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Int32 x), int Function(int x)>(
          'SDL_iscntrl');
  return sdlIscntrlLookupFunction(x);
}

///
/// Report if a character is a numeric digit.
///
/// **WARNING**: Regardless of system locale, this will only treat ASCII values
/// '0' (0x30) through '9' (0x39), as true.
///
/// \param x character value to check.
/// \returns non-zero if x falls within the character class, zero otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_isdigit(int x)
/// ```
int sdlIsdigit(int x) {
  final sdlIsdigitLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Int32 x), int Function(int x)>(
          'SDL_isdigit');
  return sdlIsdigitLookupFunction(x);
}

///
/// Report if a character is a hexadecimal digit.
///
/// **WARNING**: Regardless of system locale, this will only treat ASCII values
/// 'A' through 'F', 'a' through 'f', and '0' through '9', as true.
///
/// \param x character value to check.
/// \returns non-zero if x falls within the character class, zero otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_isxdigit(int x)
/// ```
int sdlIsxdigit(int x) {
  final sdlIsxdigitLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Int32 x), int Function(int x)>(
          'SDL_isxdigit');
  return sdlIsxdigitLookupFunction(x);
}

///
/// Report if a character is a punctuation mark.
///
/// **WARNING**: Regardless of system locale, this is equivalent to
/// `((SDL_isgraph(x)) && (!SDL_isalnum(x)))`.
///
/// \param x character value to check.
/// \returns non-zero if x falls within the character class, zero otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_isgraph
/// \sa SDL_isalnum
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_ispunct(int x)
/// ```
int sdlIspunct(int x) {
  final sdlIspunctLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Int32 x), int Function(int x)>(
          'SDL_ispunct');
  return sdlIspunctLookupFunction(x);
}

///
/// Report if a character is whitespace.
///
/// **WARNING**: Regardless of system locale, this will only treat the
/// following ASCII values as true:
///
/// - space (0x20)
/// - tab (0x09)
/// - newline (0x0A)
/// - vertical tab (0x0B)
/// - form feed (0x0C)
/// - return (0x0D)
///
/// \param x character value to check.
/// \returns non-zero if x falls within the character class, zero otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_isspace(int x)
/// ```
int sdlIsspace(int x) {
  final sdlIsspaceLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Int32 x), int Function(int x)>(
          'SDL_isspace');
  return sdlIsspaceLookupFunction(x);
}

///
/// Report if a character is upper case.
///
/// **WARNING**: Regardless of system locale, this will only treat ASCII values
/// 'A' through 'Z' as true.
///
/// \param x character value to check.
/// \returns non-zero if x falls within the character class, zero otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_isupper(int x)
/// ```
int sdlIsupper(int x) {
  final sdlIsupperLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Int32 x), int Function(int x)>(
          'SDL_isupper');
  return sdlIsupperLookupFunction(x);
}

///
/// Report if a character is lower case.
///
/// **WARNING**: Regardless of system locale, this will only treat ASCII values
/// 'a' through 'z' as true.
///
/// \param x character value to check.
/// \returns non-zero if x falls within the character class, zero otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_islower(int x)
/// ```
int sdlIslower(int x) {
  final sdlIslowerLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Int32 x), int Function(int x)>(
          'SDL_islower');
  return sdlIslowerLookupFunction(x);
}

///
/// Report if a character is "printable".
///
/// Be advised that "printable" has a definition that goes back to text
/// terminals from the dawn of computing, making this a sort of special case
/// function that is not suitable for Unicode (or most any) text management.
///
/// **WARNING**: Regardless of system locale, this will only treat ASCII values
/// ' ' (0x20) through '~' (0x7E) as true.
///
/// \param x character value to check.
/// \returns non-zero if x falls within the character class, zero otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_isprint(int x)
/// ```
int sdlIsprint(int x) {
  final sdlIsprintLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Int32 x), int Function(int x)>(
          'SDL_isprint');
  return sdlIsprintLookupFunction(x);
}

///
/// Report if a character is any "printable" except space.
///
/// Be advised that "printable" has a definition that goes back to text
/// terminals from the dawn of computing, making this a sort of special case
/// function that is not suitable for Unicode (or most any) text management.
///
/// **WARNING**: Regardless of system locale, this is equivalent to
/// `(SDL_isprint(x)) && ((x) != ' ')`.
///
/// \param x character value to check.
/// \returns non-zero if x falls within the character class, zero otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_isprint
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_isgraph(int x)
/// ```
int sdlIsgraph(int x) {
  final sdlIsgraphLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Int32 x), int Function(int x)>(
          'SDL_isgraph');
  return sdlIsgraphLookupFunction(x);
}

///
/// Convert low-ASCII English letters to uppercase.
///
/// **WARNING**: Regardless of system locale, this will only convert ASCII
/// values 'a' through 'z' to uppercase.
///
/// This function returns the uppercase equivalent of `x`. If a character
/// cannot be converted, or is already uppercase, this function returns `x`.
///
/// \param x character value to check.
/// \returns capitalized version of x, or x if no conversion available.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_toupper(int x)
/// ```
int sdlToupper(int x) {
  final sdlToupperLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Int32 x), int Function(int x)>(
          'SDL_toupper');
  return sdlToupperLookupFunction(x);
}

///
/// Convert low-ASCII English letters to lowercase.
///
/// **WARNING**: Regardless of system locale, this will only convert ASCII
/// values 'A' through 'Z' to lowercase.
///
/// This function returns the lowercase equivalent of `x`. If a character
/// cannot be converted, or is already lowercase, this function returns `x`.
///
/// \param x character value to check.
/// \returns lowercase version of x, or x if no conversion available.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_tolower(int x)
/// ```
int sdlTolower(int x) {
  final sdlTolowerLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Int32 x), int Function(int x)>(
          'SDL_tolower');
  return sdlTolowerLookupFunction(x);
}

/// ```c
/// extern SDL_DECLSPEC Uint16 SDLCALL SDL_crc16(Uint16 crc, const void *data, size_t len)
/// ```
int sdlCrc16(int crc, Pointer<NativeType> data, int len) {
  final sdlCrc16LookupFunction = libSdl3.lookupFunction<
      Uint16 Function(Uint16 crc, Pointer<NativeType> data, Uint32 len),
      int Function(int crc, Pointer<NativeType> data, int len)>('SDL_crc16');
  return sdlCrc16LookupFunction(crc, data, len);
}

/// ```c
/// extern SDL_DECLSPEC Uint32 SDLCALL SDL_crc32(Uint32 crc, const void *data, size_t len)
/// ```
int sdlCrc32(int crc, Pointer<NativeType> data, int len) {
  final sdlCrc32LookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Uint32 crc, Pointer<NativeType> data, Uint32 len),
      int Function(int crc, Pointer<NativeType> data, int len)>('SDL_crc32');
  return sdlCrc32LookupFunction(crc, data, len);
}

/// ```c
/// extern SDL_DECLSPEC Uint32 SDLCALL SDL_murmur3_32(const void *data, size_t len, Uint32 seed)
/// ```
int sdlMurmur332(Pointer<NativeType> data, int len, int seed) {
  final sdlMurmur332LookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<NativeType> data, Uint32 len, Uint32 seed),
      int Function(
          Pointer<NativeType> data, int len, int seed)>('SDL_murmur3_32');
  return sdlMurmur332LookupFunction(data, len, seed);
}

///
/// Copy non-overlapping memory.
///
/// The memory regions must not overlap. If they do, use SDL_memmove() instead.
///
/// \param dst The destination memory region. Must not be NULL, and must not
/// overlap with `src`.
/// \param src The source memory region. Must not be NULL, and must not overlap
/// with `dst`.
/// \param len The length in bytes of both `dst` and `src`.
/// \returns `dst`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_memmove
///
/// ```c
/// extern SDL_DECLSPEC void * SDLCALL SDL_memcpy(SDL_OUT_BYTECAP(len) void *dst, SDL_IN_BYTECAP(len) const void *src, size_t len)
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

///
/// Copy memory.
///
/// It is okay for the memory regions to overlap. If you are confident that the
/// regions never overlap, using SDL_memcpy() may improve performance.
///
/// \param dst The destination memory region. Must not be NULL.
/// \param src The source memory region. Must not be NULL.
/// \param len The length in bytes of both `dst` and `src`.
/// \returns `dst`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_memcpy
///
/// ```c
/// extern SDL_DECLSPEC void * SDLCALL SDL_memmove(SDL_OUT_BYTECAP(len) void *dst, SDL_IN_BYTECAP(len) const void *src, size_t len)
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
/// extern SDL_DECLSPEC void * SDLCALL SDL_memset(SDL_OUT_BYTECAP(len) void *dst, int c, size_t len)
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
/// extern SDL_DECLSPEC void * SDLCALL SDL_memset4(void *dst, Uint32 val, size_t dwords)
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
/// extern SDL_DECLSPEC int SDLCALL SDL_memcmp(const void *s1, const void *s2, size_t len)
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
/// extern SDL_DECLSPEC size_t SDLCALL SDL_wcslen(const wchar_t *wstr)
/// ```
int sdlWcslen(Pointer<Int16> wstr) {
  final sdlWcslenLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<Int16> wstr),
      int Function(Pointer<Int16> wstr)>('SDL_wcslen');
  return sdlWcslenLookupFunction(wstr);
}

/// ```c
/// extern SDL_DECLSPEC size_t SDLCALL SDL_wcsnlen(const wchar_t *wstr, size_t maxlen)
/// ```
int sdlWcsnlen(Pointer<Int16> wstr, int maxlen) {
  final sdlWcsnlenLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<Int16> wstr, Uint32 maxlen),
      int Function(Pointer<Int16> wstr, int maxlen)>('SDL_wcsnlen');
  return sdlWcsnlenLookupFunction(wstr, maxlen);
}

///
/// Copy a wide string.
///
/// This function copies `maxlen` - 1 wide characters from `src` to `dst`, then
/// appends a null terminator.
///
/// `src` and `dst` must not overlap.
///
/// If `maxlen` is 0, no wide characters are copied and no null terminator is
/// written.
///
/// \param dst The destination buffer. Must not be NULL, and must not overlap
/// with `src`.
/// \param src The null-terminated wide string to copy. Must not be NULL, and
/// must not overlap with `dst`.
/// \param maxlen The length (in wide characters) of the destination buffer.
/// \returns The length (in wide characters, excluding the null terminator) of
/// `src`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_wcslcat
///
/// ```c
/// extern SDL_DECLSPEC size_t SDLCALL SDL_wcslcpy(SDL_OUT_Z_CAP(maxlen) wchar_t *dst, const wchar_t *src, size_t maxlen)
/// ```
int sdlWcslcpy(Pointer<NativeType> arg0, Pointer<Int16> src, int maxlen) {
  final sdlWcslcpyLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(
          Pointer<NativeType> arg0, Pointer<Int16> src, Uint32 maxlen),
      int Function(Pointer<NativeType> arg0, Pointer<Int16> src,
          int maxlen)>('SDL_wcslcpy');
  return sdlWcslcpyLookupFunction(arg0, src, maxlen);
}

///
/// Concatenate wide strings.
///
/// This function appends up to `maxlen` - SDL_wcslen(dst) - 1 wide characters
/// from `src` to the end of the wide string in `dst`, then appends a null
/// terminator.
///
/// `src` and `dst` must not overlap.
///
/// If `maxlen` - SDL_wcslen(dst) - 1 is less than or equal to 0, then `dst` is
/// unmodified.
///
/// \param dst The destination buffer already containing the first
/// null-terminated wide string. Must not be NULL and must not
/// overlap with `src`.
/// \param src The second null-terminated wide string. Must not be NULL, and
/// must not overlap with `dst`.
/// \param maxlen The length (in wide characters) of the destination buffer.
/// \returns The length (in wide characters, excluding the null terminator) of
/// the string in `dst` plus the length of `src`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_wcslcpy
///
/// ```c
/// extern SDL_DECLSPEC size_t SDLCALL SDL_wcslcat(SDL_INOUT_Z_CAP(maxlen) wchar_t *dst, const wchar_t *src, size_t maxlen)
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
/// extern SDL_DECLSPEC wchar_t * SDLCALL SDL_wcsdup(const wchar_t *wstr)
/// ```
Pointer<Int16> sdlWcsdup(Pointer<Int16> wstr) {
  final sdlWcsdupLookupFunction = libSdl3.lookupFunction<
      Pointer<Int16> Function(Pointer<Int16> wstr),
      Pointer<Int16> Function(Pointer<Int16> wstr)>('SDL_wcsdup');
  return sdlWcsdupLookupFunction(wstr);
}

/// ```c
/// extern SDL_DECLSPEC wchar_t * SDLCALL SDL_wcsstr(const wchar_t *haystack, const wchar_t *needle)
/// ```
Pointer<Int16> sdlWcsstr(Pointer<Int16> haystack, Pointer<Int16> needle) {
  final sdlWcsstrLookupFunction = libSdl3.lookupFunction<
      Pointer<Int16> Function(Pointer<Int16> haystack, Pointer<Int16> needle),
      Pointer<Int16> Function(
          Pointer<Int16> haystack, Pointer<Int16> needle)>('SDL_wcsstr');
  return sdlWcsstrLookupFunction(haystack, needle);
}

/// ```c
/// extern SDL_DECLSPEC wchar_t * SDLCALL SDL_wcsnstr(const wchar_t *haystack, const wchar_t *needle, size_t maxlen)
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

///
/// Compare two null-terminated wide strings.
///
/// This only compares wchar_t values until it hits a null-terminating
/// character; it does not care if the string is well-formed UTF-16 (or UTF-32,
/// depending on your platform's wchar_t size), or uses valid Unicode values.
///
/// \param str1 the first string to compare. NULL is not permitted!
/// \param str2 the second string to compare. NULL is not permitted!
/// \returns less than zero if str1 is "less than" str2, greater than zero if
/// str1 is "greater than" str2, and zero if the strings match
/// exactly.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_wcscmp(const wchar_t *str1, const wchar_t *str2)
/// ```
int sdlWcscmp(Pointer<Int16> str1, Pointer<Int16> str2) {
  final sdlWcscmpLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Int16> str1, Pointer<Int16> str2),
      int Function(Pointer<Int16> str1, Pointer<Int16> str2)>('SDL_wcscmp');
  return sdlWcscmpLookupFunction(str1, str2);
}

///
/// Compare two wide strings up to a number of wchar_t values.
///
/// This only compares wchar_t values; it does not care if the string is
/// well-formed UTF-16 (or UTF-32, depending on your platform's wchar_t size),
/// or uses valid Unicode values.
///
/// Note that while this function is intended to be used with UTF-16 (or
/// UTF-32, depending on your platform's definition of wchar_t), it is
/// comparing raw wchar_t values and not Unicode codepoints: `maxlen` specifies
/// a wchar_t limit! If the limit lands in the middle of a multi-wchar UTF-16
/// sequence, it will only compare a portion of the final character.
///
/// `maxlen` specifies a maximum number of wchar_t to compare; if the strings
/// match to this number of wide chars (or both have matched to a
/// null-terminator character before this count), they will be considered
/// equal.
///
/// \param str1 the first string to compare. NULL is not permitted!
/// \param str2 the second string to compare. NULL is not permitted!
/// \param maxlen the maximum number of wchar_t to compare.
/// \returns less than zero if str1 is "less than" str2, greater than zero if
/// str1 is "greater than" str2, and zero if the strings match
/// exactly.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_wcsncmp(const wchar_t *str1, const wchar_t *str2, size_t maxlen)
/// ```
int sdlWcsncmp(Pointer<Int16> str1, Pointer<Int16> str2, int maxlen) {
  final sdlWcsncmpLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Int16> str1, Pointer<Int16> str2, Uint32 maxlen),
      int Function(
          Pointer<Int16> str1, Pointer<Int16> str2, int maxlen)>('SDL_wcsncmp');
  return sdlWcsncmpLookupFunction(str1, str2, maxlen);
}

///
/// Compare two null-terminated wide strings, case-insensitively.
///
/// This will work with Unicode strings, using a technique called
/// "case-folding" to handle the vast majority of case-sensitive human
/// languages regardless of system locale. It can deal with expanding values: a
/// German Eszett character can compare against two ASCII 's' chars and be
/// considered a match, for example. A notable exception: it does not handle
/// the Turkish 'i' character; human language is complicated!
///
/// Depending on your platform, "wchar_t" might be 2 bytes, and expected to be
/// UTF-16 encoded (like Windows), or 4 bytes in UTF-32 format. Since this
/// handles Unicode, it expects the string to be well-formed and not a
/// null-terminated string of arbitrary bytes. Characters that are not valid
/// UTF-16 (or UTF-32) are treated as Unicode character U+FFFD (REPLACEMENT
/// CHARACTER), which is to say two strings of random bits may turn out to
/// match if they convert to the same amount of replacement characters.
///
/// \param str1 the first string to compare. NULL is not permitted!
/// \param str2 the second string to compare. NULL is not permitted!
/// \returns less than zero if str1 is "less than" str2, greater than zero if
/// str1 is "greater than" str2, and zero if the strings match
/// exactly.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_wcscasecmp(const wchar_t *str1, const wchar_t *str2)
/// ```
int sdlWcscasecmp(Pointer<Int16> str1, Pointer<Int16> str2) {
  final sdlWcscasecmpLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Int16> str1, Pointer<Int16> str2),
      int Function(Pointer<Int16> str1, Pointer<Int16> str2)>('SDL_wcscasecmp');
  return sdlWcscasecmpLookupFunction(str1, str2);
}

///
/// Compare two wide strings, case-insensitively, up to a number of wchar_t.
///
/// This will work with Unicode strings, using a technique called
/// "case-folding" to handle the vast majority of case-sensitive human
/// languages regardless of system locale. It can deal with expanding values: a
/// German Eszett character can compare against two ASCII 's' chars and be
/// considered a match, for example. A notable exception: it does not handle
/// the Turkish 'i' character; human language is complicated!
///
/// Depending on your platform, "wchar_t" might be 2 bytes, and expected to be
/// UTF-16 encoded (like Windows), or 4 bytes in UTF-32 format. Since this
/// handles Unicode, it expects the string to be well-formed and not a
/// null-terminated string of arbitrary bytes. Characters that are not valid
/// UTF-16 (or UTF-32) are treated as Unicode character U+FFFD (REPLACEMENT
/// CHARACTER), which is to say two strings of random bits may turn out to
/// match if they convert to the same amount of replacement characters.
///
/// Note that while this function might deal with variable-sized characters,
/// `maxlen` specifies a _wchar_ limit! If the limit lands in the middle of a
/// multi-byte UTF-16 sequence, it may convert a portion of the final character
/// to one or more Unicode character U+FFFD (REPLACEMENT CHARACTER) so as not
/// to overflow a buffer.
///
/// `maxlen` specifies a maximum number of wchar_t values to compare; if the
/// strings match to this number of wchar_t (or both have matched to a
/// null-terminator character before this number of bytes), they will be
/// considered equal.
///
/// \param str1 the first string to compare. NULL is not permitted!
/// \param str2 the second string to compare. NULL is not permitted!
/// \param maxlen the maximum number of wchar_t values to compare.
/// \returns less than zero if str1 is "less than" str2, greater than zero if
/// str1 is "greater than" str2, and zero if the strings match
/// exactly.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_wcsncasecmp(const wchar_t *str1, const wchar_t *str2, size_t maxlen)
/// ```
int sdlWcsncasecmp(Pointer<Int16> str1, Pointer<Int16> str2, int maxlen) {
  final sdlWcsncasecmpLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Int16> str1, Pointer<Int16> str2, Uint32 maxlen),
      int Function(Pointer<Int16> str1, Pointer<Int16> str2,
          int maxlen)>('SDL_wcsncasecmp');
  return sdlWcsncasecmpLookupFunction(str1, str2, maxlen);
}

///
/// Parse a `long` from a wide string.
///
/// If `str` starts with whitespace, then those whitespace characters are
/// skipped before attempting to parse the number.
///
/// If the parsed number does not fit inside a `long`, the result is clamped to
/// the minimum and maximum representable `long` values.
///
/// \param str The null-terminated wide string to read. Must not be NULL.
/// \param endp If not NULL, the address of the first invalid wide character
/// (i.e. the next character after the parsed number) will be
/// written to this pointer.
/// \param base The base of the integer to read. Supported values are 0 and 2
/// to 36 inclusive. If 0, the base will be inferred from the
/// number's prefix (0x for hexadecimal, 0 for octal, decimal
/// otherwise).
/// \returns The parsed `long`, or 0 if no number could be parsed.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_strtol
///
/// ```c
/// extern SDL_DECLSPEC long SDLCALL SDL_wcstol(const wchar_t *str, wchar_t **endp, int base)
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
/// extern SDL_DECLSPEC size_t SDLCALL SDL_strlen(const char *str)
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
/// extern SDL_DECLSPEC size_t SDLCALL SDL_strnlen(const char *str, size_t maxlen)
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

///
/// Copy a string.
///
/// This function copies up to `maxlen` - 1 characters from `src` to `dst`,
/// then appends a null terminator.
///
/// If `maxlen` is 0, no characters are copied and no null terminator is
/// written.
///
/// If you want to copy an UTF-8 string but need to ensure that multi-byte
/// sequences are not truncated, consider using SDL_utf8strlcpy().
///
/// \param dst The destination buffer. Must not be NULL, and must not overlap
/// with `src`.
/// \param src The null-terminated string to copy. Must not be NULL, and must
/// not overlap with `dst`.
/// \param maxlen The length (in characters) of the destination buffer.
/// \returns The length (in characters, excluding the null terminator) of
/// `src`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_strlcat
/// \sa SDL_utf8strlcpy
///
/// ```c
/// extern SDL_DECLSPEC size_t SDLCALL SDL_strlcpy(SDL_OUT_Z_CAP(maxlen) char *dst, const char *src, size_t maxlen)
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

///
/// Copy an UTF-8 string.
///
/// This function copies up to `dst_bytes` - 1 bytes from `src` to `dst` while
/// also ensuring that the string written to `dst` does not end in a truncated
/// multi-byte sequence. Finally, it appends a null terminator.
///
/// `src` and `dst` must not overlap.
///
/// Note that unlike SDL_strlcpy(), this function returns the number of bytes
/// written, not the length of `src`.
///
/// \param dst The destination buffer. Must not be NULL, and must not overlap
/// with `src`.
/// \param src The null-terminated UTF-8 string to copy. Must not be NULL, and
/// must not overlap with `dst`.
/// \param dst_bytes The length (in bytes) of the destination buffer. Must not
/// be 0.
/// \returns The number of bytes written, excluding the null terminator.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_strlcpy
///
/// ```c
/// extern SDL_DECLSPEC size_t SDLCALL SDL_utf8strlcpy(SDL_OUT_Z_CAP(dst_bytes) char *dst, const char *src, size_t dst_bytes)
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

///
/// Concatenate strings.
///
/// This function appends up to `maxlen` - SDL_strlen(dst) - 1 characters from
/// `src` to the end of the string in `dst`, then appends a null terminator.
///
/// `src` and `dst` must not overlap.
///
/// If `maxlen` - SDL_strlen(dst) - 1 is less than or equal to 0, then `dst` is
/// unmodified.
///
/// \param dst The destination buffer already containing the first
/// null-terminated string. Must not be NULL and must not overlap
/// with `src`.
/// \param src The second null-terminated string. Must not be NULL, and must
/// not overlap with `dst`.
/// \param maxlen The length (in characters) of the destination buffer.
/// \returns The length (in characters, excluding the null terminator) of the
/// string in `dst` plus the length of `src`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_strlcpy
///
/// ```c
/// extern SDL_DECLSPEC size_t SDLCALL SDL_strlcat(SDL_INOUT_Z_CAP(maxlen) char *dst, const char *src, size_t maxlen)
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
/// extern SDL_DECLSPEC SDL_MALLOC char * SDLCALL SDL_strdup(const char *str)
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
/// extern SDL_DECLSPEC SDL_MALLOC char * SDLCALL SDL_strndup(const char *str, size_t maxlen)
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
/// extern SDL_DECLSPEC char * SDLCALL SDL_strrev(char *str)
/// ```
Pointer<Int8> sdlStrrev(Pointer<Int8> str) {
  final sdlStrrevLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(Pointer<Int8> str),
      Pointer<Int8> Function(Pointer<Int8> str)>('SDL_strrev');
  return sdlStrrevLookupFunction(str);
}

///
/// Convert a string to uppercase.
///
/// **WARNING**: Regardless of system locale, this will only convert ASCII
/// values 'A' through 'Z' to uppercase.
///
/// This function operates on a null-terminated string of bytes--even if it is
/// malformed UTF-8!--and converts ASCII characters 'a' through 'z' to their
/// uppercase equivalents in-place, returning the original `str` pointer.
///
/// \param str the string to convert in-place. Can not be NULL.
/// \returns the `str` pointer passed into this function.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_strlwr
///
/// ```c
/// extern SDL_DECLSPEC char * SDLCALL SDL_strupr(char *str)
/// ```
Pointer<Int8> sdlStrupr(Pointer<Int8> str) {
  final sdlStruprLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(Pointer<Int8> str),
      Pointer<Int8> Function(Pointer<Int8> str)>('SDL_strupr');
  return sdlStruprLookupFunction(str);
}

///
/// Convert a string to lowercase.
///
/// **WARNING**: Regardless of system locale, this will only convert ASCII
/// values 'A' through 'Z' to lowercase.
///
/// This function operates on a null-terminated string of bytes--even if it is
/// malformed UTF-8!--and converts ASCII characters 'A' through 'Z' to their
/// lowercase equivalents in-place, returning the original `str` pointer.
///
/// \param str the string to convert in-place. Can not be NULL.
/// \returns the `str` pointer passed into this function.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_strupr
///
/// ```c
/// extern SDL_DECLSPEC char * SDLCALL SDL_strlwr(char *str)
/// ```
Pointer<Int8> sdlStrlwr(Pointer<Int8> str) {
  final sdlStrlwrLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(Pointer<Int8> str),
      Pointer<Int8> Function(Pointer<Int8> str)>('SDL_strlwr');
  return sdlStrlwrLookupFunction(str);
}

/// ```c
/// extern SDL_DECLSPEC char * SDLCALL SDL_strchr(const char *str, int c)
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
/// extern SDL_DECLSPEC char * SDLCALL SDL_strrchr(const char *str, int c)
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
/// extern SDL_DECLSPEC char * SDLCALL SDL_strstr(const char *haystack, const char *needle)
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
/// extern SDL_DECLSPEC char * SDLCALL SDL_strnstr(const char *haystack, const char *needle, size_t maxlen)
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
/// extern SDL_DECLSPEC char * SDLCALL SDL_strcasestr(const char *haystack, const char *needle)
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
/// extern SDL_DECLSPEC char * SDLCALL SDL_strtok_r(char *s1, const char *s2, char **saveptr)
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
/// extern SDL_DECLSPEC size_t SDLCALL SDL_utf8strlen(const char *str)
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
/// extern SDL_DECLSPEC size_t SDLCALL SDL_utf8strnlen(const char *str, size_t bytes)
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
/// extern SDL_DECLSPEC char * SDLCALL SDL_itoa(int value, char *str, int radix)
/// ```
Pointer<Int8> sdlItoa(int value, Pointer<Int8> str, int radix) {
  final sdlItoaLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(Int32 value, Pointer<Int8> str, Int32 radix),
      Pointer<Int8> Function(
          int value, Pointer<Int8> str, int radix)>('SDL_itoa');
  return sdlItoaLookupFunction(value, str, radix);
}

/// ```c
/// extern SDL_DECLSPEC char * SDLCALL SDL_uitoa(unsigned int value, char *str, int radix)
/// ```
Pointer<Int8> sdlUitoa(int value, Pointer<Int8> str, int radix) {
  final sdlUitoaLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(Uint32 value, Pointer<Int8> str, Int32 radix),
      Pointer<Int8> Function(
          int value, Pointer<Int8> str, int radix)>('SDL_uitoa');
  return sdlUitoaLookupFunction(value, str, radix);
}

/// ```c
/// extern SDL_DECLSPEC char * SDLCALL SDL_ltoa(long value, char *str, int radix)
/// ```
Pointer<Int8> sdlLtoa(int value, Pointer<Int8> str, int radix) {
  final sdlLtoaLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(Int32 value, Pointer<Int8> str, Int32 radix),
      Pointer<Int8> Function(
          int value, Pointer<Int8> str, int radix)>('SDL_ltoa');
  return sdlLtoaLookupFunction(value, str, radix);
}

/// ```c
/// extern SDL_DECLSPEC char * SDLCALL SDL_ultoa(unsigned long value, char *str, int radix)
/// ```
Pointer<Int8> sdlUltoa(int value, Pointer<Int8> str, int radix) {
  final sdlUltoaLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(Uint32 value, Pointer<Int8> str, Int32 radix),
      Pointer<Int8> Function(
          int value, Pointer<Int8> str, int radix)>('SDL_ultoa');
  return sdlUltoaLookupFunction(value, str, radix);
}

/// ```c
/// extern SDL_DECLSPEC char * SDLCALL SDL_lltoa(long long value, char *str, int radix)
/// ```
Pointer<Int8> sdlLltoa(
    Pointer<NativeType> value, Pointer<Int8> str, int radix) {
  final sdlLltoaLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(
          Pointer<NativeType> value, Pointer<Int8> str, Int32 radix),
      Pointer<Int8> Function(Pointer<NativeType> value, Pointer<Int8> str,
          int radix)>('SDL_lltoa');
  return sdlLltoaLookupFunction(value, str, radix);
}

/// ```c
/// extern SDL_DECLSPEC char * SDLCALL SDL_ulltoa(unsigned long long value, char *str, int radix)
/// ```
Pointer<Int8> sdlUlltoa(
    Pointer<NativeType> value, Pointer<Int8> str, int radix) {
  final sdlUlltoaLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(
          Pointer<NativeType> value, Pointer<Int8> str, Int32 radix),
      Pointer<Int8> Function(Pointer<NativeType> value, Pointer<Int8> str,
          int radix)>('SDL_ulltoa');
  return sdlUlltoaLookupFunction(value, str, radix);
}

///
/// Parse an `int` from a string.
///
/// The result of calling `SDL_atoi(str)` is equivalent to
/// `(int)SDL_strtol(str, NULL, 10)`.
///
/// \param str The null-terminated string to read. Must not be NULL.
/// \returns The parsed `int`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_atof
/// \sa SDL_strtol
/// \sa SDL_strtoul
/// \sa SDL_strtoll
/// \sa SDL_strtoull
/// \sa SDL_strtod
/// \sa SDL_itoa
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_atoi(const char *str)
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

///
/// Parse a `double` from a string.
///
/// The result of calling `SDL_atof(str)` is equivalent to `SDL_strtod(str,
/// NULL)`.
///
/// \param str The null-terminated string to read. Must not be NULL.
/// \returns The parsed `double`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_atoi
/// \sa SDL_strtol
/// \sa SDL_strtoul
/// \sa SDL_strtoll
/// \sa SDL_strtoull
/// \sa SDL_strtod
///
/// ```c
/// extern SDL_DECLSPEC double SDLCALL SDL_atof(const char *str)
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

///
/// Parse a `long` from a string.
///
/// If `str` starts with whitespace, then those whitespace characters are
/// skipped before attempting to parse the number.
///
/// If the parsed number does not fit inside a `long`, the result is clamped to
/// the minimum and maximum representable `long` values.
///
/// \param str The null-terminated string to read. Must not be NULL.
/// \param endp If not NULL, the address of the first invalid character (i.e.
/// the next character after the parsed number) will be written to
/// this pointer.
/// \param base The base of the integer to read. Supported values are 0 and 2
/// to 36 inclusive. If 0, the base will be inferred from the
/// number's prefix (0x for hexadecimal, 0 for octal, decimal
/// otherwise).
/// \returns The parsed `long`, or 0 if no number could be parsed.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_atoi
/// \sa SDL_atof
/// \sa SDL_strtoul
/// \sa SDL_strtoll
/// \sa SDL_strtoull
/// \sa SDL_strtod
/// \sa SDL_ltoa
/// \sa SDL_wcstol
///
/// ```c
/// extern SDL_DECLSPEC long SDLCALL SDL_strtol(const char *str, char **endp, int base)
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

///
/// Parse an `unsigned long` from a string.
///
/// If `str` starts with whitespace, then those whitespace characters are
/// skipped before attempting to parse the number.
///
/// If the parsed number does not fit inside an `unsigned long`, the result is
/// clamped to the maximum representable `unsigned long` value.
///
/// \param str The null-terminated string to read. Must not be NULL.
/// \param endp If not NULL, the address of the first invalid character (i.e.
/// the next character after the parsed number) will be written to
/// this pointer.
/// \param base The base of the integer to read. Supported values are 0 and 2
/// to 36 inclusive. If 0, the base will be inferred from the
/// number's prefix (0x for hexadecimal, 0 for octal, decimal
/// otherwise).
/// \returns The parsed `unsigned long`, or 0 if no number could be parsed.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_atoi
/// \sa SDL_atof
/// \sa SDL_strtol
/// \sa SDL_strtoll
/// \sa SDL_strtoull
/// \sa SDL_strtod
/// \sa SDL_ultoa
///
/// ```c
/// extern SDL_DECLSPEC unsigned long SDLCALL SDL_strtoul(const char *str, char **endp, int base)
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

///
/// Parse a `long long` from a string.
///
/// If `str` starts with whitespace, then those whitespace characters are
/// skipped before attempting to parse the number.
///
/// If the parsed number does not fit inside a `long long`, the result is
/// clamped to the minimum and maximum representable `long long` values.
///
/// \param str The null-terminated string to read. Must not be NULL.
/// \param endp If not NULL, the address of the first invalid character (i.e.
/// the next character after the parsed number) will be written to
/// this pointer.
/// \param base The base of the integer to read. Supported values are 0 and 2
/// to 36 inclusive. If 0, the base will be inferred from the
/// number's prefix (0x for hexadecimal, 0 for octal, decimal
/// otherwise).
/// \returns The parsed `long long`, or 0 if no number could be parsed.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_atoi
/// \sa SDL_atof
/// \sa SDL_strtol
/// \sa SDL_strtoul
/// \sa SDL_strtoull
/// \sa SDL_strtod
/// \sa SDL_lltoa
///
/// ```c
/// extern SDL_DECLSPEC long long SDLCALL SDL_strtoll(const char *str, char **endp, int base)
/// ```
Pointer<NativeType> sdlStrtoll(
    String? str, Pointer<Pointer<Int8>> endp, int base) {
  final sdlStrtollLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(
          Pointer<Utf8> str, Pointer<Pointer<Int8>> endp, Int32 base),
      Pointer<NativeType> Function(Pointer<Utf8> str,
          Pointer<Pointer<Int8>> endp, int base)>('SDL_strtoll');
  final strPointer = str != null ? str.toNativeUtf8() : nullptr;
  final result = sdlStrtollLookupFunction(strPointer, endp, base);
  calloc.free(strPointer);
  return result;
}

///
/// Parse an `unsigned long long` from a string.
///
/// If `str` starts with whitespace, then those whitespace characters are
/// skipped before attempting to parse the number.
///
/// If the parsed number does not fit inside an `unsigned long long`, the
/// result is clamped to the maximum representable `unsigned long long` value.
///
/// \param str The null-terminated string to read. Must not be NULL.
/// \param endp If not NULL, the address of the first invalid character (i.e.
/// the next character after the parsed number) will be written to
/// this pointer.
/// \param base The base of the integer to read. Supported values are 0 and 2
/// to 36 inclusive. If 0, the base will be inferred from the
/// number's prefix (0x for hexadecimal, 0 for octal, decimal
/// otherwise).
/// \returns The parsed `unsigned long long`, or 0 if no number could be
/// parsed.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_atoi
/// \sa SDL_atof
/// \sa SDL_strtol
/// \sa SDL_strtoll
/// \sa SDL_strtoul
/// \sa SDL_strtod
/// \sa SDL_ulltoa
///
/// ```c
/// extern SDL_DECLSPEC unsigned long long SDLCALL SDL_strtoull(const char *str, char **endp, int base)
/// ```
Pointer<NativeType> sdlStrtoull(
    String? str, Pointer<Pointer<Int8>> endp, int base) {
  final sdlStrtoullLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(
          Pointer<Utf8> str, Pointer<Pointer<Int8>> endp, Int32 base),
      Pointer<NativeType> Function(Pointer<Utf8> str,
          Pointer<Pointer<Int8>> endp, int base)>('SDL_strtoull');
  final strPointer = str != null ? str.toNativeUtf8() : nullptr;
  final result = sdlStrtoullLookupFunction(strPointer, endp, base);
  calloc.free(strPointer);
  return result;
}

///
/// Parse a `double` from a string.
///
/// This function makes fewer guarantees than the C runtime `strtod`:
///
/// - Only decimal notation is guaranteed to be supported. The handling of
/// scientific and hexadecimal notation is unspecified.
/// - Whether or not INF and NAN can be parsed is unspecified.
/// - The precision of the result is unspecified.
///
/// \param str The null-terminated string to read. Must not be NULL.
/// \param endp If not NULL, the address of the first invalid character (i.e.
/// the next character after the parsed number) will be written to
/// this pointer.
/// \returns The parsed `double`, or 0 if no number could be parsed.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_atoi
/// \sa SDL_atof
/// \sa SDL_strtol
/// \sa SDL_strtoll
/// \sa SDL_strtoul
/// \sa SDL_strtoull
///
/// ```c
/// extern SDL_DECLSPEC double SDLCALL SDL_strtod(const char *str, char **endp)
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

///
/// Compare two null-terminated UTF-8 strings.
///
/// Due to the nature of UTF-8 encoding, this will work with Unicode strings,
/// since effectively this function just compares bytes until it hits a
/// null-terminating character. Also due to the nature of UTF-8, this can be
/// used with SDL_qsort() to put strings in (roughly) alphabetical order.
///
/// \param str1 the first string to compare. NULL is not permitted!
/// \param str2 the second string to compare. NULL is not permitted!
/// \returns less than zero if str1 is "less than" str2, greater than zero if
/// str1 is "greater than" str2, and zero if the strings match
/// exactly.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_strcmp(const char *str1, const char *str2)
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

///
/// Compare two UTF-8 strings up to a number of bytes.
///
/// Due to the nature of UTF-8 encoding, this will work with Unicode strings,
/// since effectively this function just compares bytes until it hits a
/// null-terminating character. Also due to the nature of UTF-8, this can be
/// used with SDL_qsort() to put strings in (roughly) alphabetical order.
///
/// Note that while this function is intended to be used with UTF-8, it is
/// doing a bytewise comparison, and `maxlen` specifies a _byte_ limit! If the
/// limit lands in the middle of a multi-byte UTF-8 sequence, it will only
/// compare a portion of the final character.
///
/// `maxlen` specifies a maximum number of bytes to compare; if the strings
/// match to this number of bytes (or both have matched to a null-terminator
/// character before this number of bytes), they will be considered equal.
///
/// \param str1 the first string to compare. NULL is not permitted!
/// \param str2 the second string to compare. NULL is not permitted!
/// \param maxlen the maximum number of _bytes_ to compare.
/// \returns less than zero if str1 is "less than" str2, greater than zero if
/// str1 is "greater than" str2, and zero if the strings match
/// exactly.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_strncmp(const char *str1, const char *str2, size_t maxlen)
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

///
/// Compare two null-terminated UTF-8 strings, case-insensitively.
///
/// This will work with Unicode strings, using a technique called
/// "case-folding" to handle the vast majority of case-sensitive human
/// languages regardless of system locale. It can deal with expanding values: a
/// German Eszett character can compare against two ASCII 's' chars and be
/// considered a match, for example. A notable exception: it does not handle
/// the Turkish 'i' character; human language is complicated!
///
/// Since this handles Unicode, it expects the string to be well-formed UTF-8
/// and not a null-terminated string of arbitrary bytes. Bytes that are not
/// valid UTF-8 are treated as Unicode character U+FFFD (REPLACEMENT
/// CHARACTER), which is to say two strings of random bits may turn out to
/// match if they convert to the same amount of replacement characters.
///
/// \param str1 the first string to compare. NULL is not permitted!
/// \param str2 the second string to compare. NULL is not permitted!
/// \returns less than zero if str1 is "less than" str2, greater than zero if
/// str1 is "greater than" str2, and zero if the strings match
/// exactly.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_strcasecmp(const char *str1, const char *str2)
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

///
/// Compare two UTF-8 strings, case-insensitively, up to a number of bytes.
///
/// This will work with Unicode strings, using a technique called
/// "case-folding" to handle the vast majority of case-sensitive human
/// languages regardless of system locale. It can deal with expanding values: a
/// German Eszett character can compare against two ASCII 's' chars and be
/// considered a match, for example. A notable exception: it does not handle
/// the Turkish 'i' character; human language is complicated!
///
/// Since this handles Unicode, it expects the string to be well-formed UTF-8
/// and not a null-terminated string of arbitrary bytes. Bytes that are not
/// valid UTF-8 are treated as Unicode character U+FFFD (REPLACEMENT
/// CHARACTER), which is to say two strings of random bits may turn out to
/// match if they convert to the same amount of replacement characters.
///
/// Note that while this function is intended to be used with UTF-8, `maxlen`
/// specifies a _byte_ limit! If the limit lands in the middle of a multi-byte
/// UTF-8 sequence, it may convert a portion of the final character to one or
/// more Unicode character U+FFFD (REPLACEMENT CHARACTER) so as not to overflow
/// a buffer.
///
/// `maxlen` specifies a maximum number of bytes to compare; if the strings
/// match to this number of bytes (or both have matched to a null-terminator
/// character before this number of bytes), they will be considered equal.
///
/// \param str1 the first string to compare. NULL is not permitted!
/// \param str2 the second string to compare. NULL is not permitted!
/// \param maxlen the maximum number of bytes to compare.
/// \returns less than zero if str1 is "less than" str2, greater than zero if
/// str1 is "greater than" str2, and zero if the strings match
/// exactly.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_strncasecmp(const char *str1, const char *str2, size_t maxlen)
/// ```
int sdlStrncasecmp(String? str1, String? str2, int maxlen) {
  final sdlStrncasecmpLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Utf8> str1, Pointer<Utf8> str2, Uint32 maxlen),
      int Function(Pointer<Utf8> str1, Pointer<Utf8> str2,
          int maxlen)>('SDL_strncasecmp');
  final str1Pointer = str1 != null ? str1.toNativeUtf8() : nullptr;
  final str2Pointer = str2 != null ? str2.toNativeUtf8() : nullptr;
  final result = sdlStrncasecmpLookupFunction(str1Pointer, str2Pointer, maxlen);
  calloc.free(str1Pointer);
  calloc.free(str2Pointer);
  return result;
}

///
/// Searches a string for the first occurence of any character contained in a
/// breakset, and returns a pointer from the string to that character.
///
/// \param str The null-terminated string to be searched. Must not be NULL, and
/// must not overlap with `breakset`.
/// \param breakset A null-terminated string containing the list of characters
/// to look for. Must not be NULL, and must not overlap with
/// `str`.
/// \returns A pointer to the location, in str, of the first occurence of a
/// character present in the breakset, or NULL if none is found.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC char * SDLCALL SDL_strpbrk(const char *str, const char *breakset)
/// ```
Pointer<Int8> sdlStrpbrk(String? str, String? breakset) {
  final sdlStrpbrkLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(Pointer<Utf8> str, Pointer<Utf8> breakset),
      Pointer<Int8> Function(
          Pointer<Utf8> str, Pointer<Utf8> breakset)>('SDL_strpbrk');
  final strPointer = str != null ? str.toNativeUtf8() : nullptr;
  final breaksetPointer = breakset != null ? breakset.toNativeUtf8() : nullptr;
  final result = sdlStrpbrkLookupFunction(strPointer, breaksetPointer);
  calloc.free(strPointer);
  calloc.free(breaksetPointer);
  return result;
}

///
/// Decode a UTF-8 string, one Unicode codepoint at a time.
///
/// This will return the first Unicode codepoint in the UTF-8 encoded string in
/// `*pstr`, and then advance `*pstr` past any consumed bytes before returning.
///
/// It will not access more than `*pslen` bytes from the string. `*pslen` will
/// be adjusted, as well, subtracting the number of bytes consumed.
///
/// `pslen` is allowed to be NULL, in which case the string _must_ be
/// NULL-terminated, as the function will blindly read until it sees the NULL
/// char.
///
/// if `*pslen` is zero, it assumes the end of string is reached and returns a
/// zero codepoint regardless of the contents of the string buffer.
///
/// If the resulting codepoint is zero (a NULL terminator), or `*pslen` is
/// zero, it will not advance `*pstr` or `*pslen` at all.
///
/// Generally this function is called in a loop until it returns zero,
/// adjusting its parameters each iteration.
///
/// If an invalid UTF-8 sequence is encountered, this function returns
/// SDL_INVALID_UNICODE_CODEPOINT and advances the string/length by one byte
/// (which is to say, a multibyte sequence might produce several
/// SDL_INVALID_UNICODE_CODEPOINT returns before it syncs to the next valid
/// UTF-8 sequence).
///
/// Several things can generate invalid UTF-8 sequences, including overlong
/// encodings, the use of UTF-16 surrogate values, and truncated data. Please
/// refer to
/// [RFC3629](https://www.ietf.org/rfc/rfc3629.txt)
/// for details.
///
/// \param pstr a pointer to a UTF-8 string pointer to be read and adjusted.
/// \param pslen a pointer to the number of bytes in the string, to be read and
/// adjusted. NULL is allowed.
/// \returns the first Unicode codepoint in the string.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC Uint32 SDLCALL SDL_StepUTF8(const char **pstr, size_t *pslen)
/// ```
int sdlStepUtf8(Pointer<Pointer<Int8>> pstr, Pointer<Uint32> pslen) {
  final sdlStepUtf8LookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<Pointer<Int8>> pstr, Pointer<Uint32> pslen),
      int Function(
          Pointer<Pointer<Int8>> pstr, Pointer<Uint32> pslen)>('SDL_StepUTF8');
  return sdlStepUtf8LookupFunction(pstr, pslen);
}

///
/// Convert a single Unicode codepoint to UTF-8.
///
/// The buffer pointed to by `dst` must be at least 4 bytes long, as this
/// function may generate between 1 and 4 bytes of output.
///
/// This function returns the first byte _after_ the newly-written UTF-8
/// sequence, which is useful for encoding multiple codepoints in a loop, or
/// knowing where to write a NULL-terminator character to end the string (in
/// either case, plan to have a buffer of _more_ than 4 bytes!).
///
/// If `codepoint` is an invalid value (outside the Unicode range, or a UTF-16
/// surrogate value, etc), this will use U+FFFD (REPLACEMENT CHARACTER) for the
/// codepoint instead, and not set an error.
///
/// If `dst` is NULL, this returns NULL immediately without writing to the
/// pointer and without setting an error.
///
/// \param codepoint a Unicode codepoint to convert to UTF-8.
/// \param dst the location to write the encoded UTF-8. Must point to at least
/// 4 bytes!
/// \returns the first byte past the newly-written UTF-8 sequence.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC char * SDLCALL SDL_UCS4ToUTF8(Uint32 codepoint, char *dst)
/// ```
Pointer<Int8> sdlUcs4ToUtf8(int codepoint, Pointer<Int8> dst) {
  final sdlUcs4ToUtf8LookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(Uint32 codepoint, Pointer<Int8> dst),
      Pointer<Int8> Function(
          int codepoint, Pointer<Int8> dst)>('SDL_UCS4ToUTF8');
  return sdlUcs4ToUtf8LookupFunction(codepoint, dst);
}

/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_sscanf(const char *text, SDL_SCANF_FORMAT_STRING const char *fmt, ...) SDL_SCANF_VARARG_FUNC(2)
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
/// extern SDL_DECLSPEC int SDLCALL SDL_vsscanf(const char *text, SDL_SCANF_FORMAT_STRING const char *fmt, va_list ap) SDL_SCANF_VARARG_FUNCV(2)
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
/// extern SDL_DECLSPEC int SDLCALL SDL_snprintf(SDL_OUT_Z_CAP(maxlen) char *text, size_t maxlen, SDL_PRINTF_FORMAT_STRING const char *fmt, ...) SDL_PRINTF_VARARG_FUNC(3)
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
/// extern SDL_DECLSPEC int SDLCALL SDL_swprintf(SDL_OUT_Z_CAP(maxlen) wchar_t *text, size_t maxlen, SDL_PRINTF_FORMAT_STRING const wchar_t *fmt, ...) SDL_WPRINTF_VARARG_FUNC(3)
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
/// extern SDL_DECLSPEC int SDLCALL SDL_vsnprintf(SDL_OUT_Z_CAP(maxlen) char *text, size_t maxlen, SDL_PRINTF_FORMAT_STRING const char *fmt, va_list ap) SDL_PRINTF_VARARG_FUNCV(3)
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
/// extern SDL_DECLSPEC int SDLCALL SDL_vswprintf(SDL_OUT_Z_CAP(maxlen) wchar_t *text, size_t maxlen, SDL_PRINTF_FORMAT_STRING const wchar_t *fmt, va_list ap) SDL_WPRINTF_VARARG_FUNCV(3)
/// ```
int sdlVswprintf(Pointer<NativeType> arg0, int maxlen, Pointer<Int16> fmt,
    Pointer<NativeType> arg3) {
  final sdlVswprintfLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<NativeType> arg0, Uint32 maxlen,
          Pointer<Int16> fmt, Pointer<NativeType> arg3),
      int Function(Pointer<NativeType> arg0, int maxlen, Pointer<Int16> fmt,
          Pointer<NativeType> arg3)>('SDL_vswprintf');
  return sdlVswprintfLookupFunction(arg0, maxlen, fmt, arg3);
}

/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_asprintf(char **strp, SDL_PRINTF_FORMAT_STRING const char *fmt, ...) SDL_PRINTF_VARARG_FUNC(2)
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
/// extern SDL_DECLSPEC int SDLCALL SDL_vasprintf(char **strp, SDL_PRINTF_FORMAT_STRING const char *fmt, va_list ap) SDL_PRINTF_VARARG_FUNCV(2)
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
/// Seeds the pseudo-random number generator.
///
/// Reusing the seed number will cause SDL_rand_*() to repeat the same stream
/// of 'random' numbers.
///
/// \param seed the value to use as a random number seed, or 0 to use
/// SDL_GetPerformanceCounter().
///
/// \threadsafety This should be called on the same thread that calls
/// SDL_rand*()
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_rand
/// \sa SDL_rand_bits
/// \sa SDL_randf
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_srand(Uint64 seed)
/// ```
void sdlSrand(int seed) {
  final sdlSrandLookupFunction = libSdl3.lookupFunction<
      Void Function(Uint64 seed), void Function(int seed)>('SDL_srand');
  return sdlSrandLookupFunction(seed);
}

///
/// Generate a pseudo-random number less than n for positive n
///
/// The method used is faster and of better quality than `rand() % n`. Odds are
/// roughly 99.9% even for n = 1 million. Evenness is better for smaller n, and
/// much worse as n gets bigger.
///
/// Example: to simulate a d6 use `SDL_rand(6) + 1` The +1 converts 0..5 to
/// 1..6
///
/// If you want to generate a pseudo-random number in the full range of Sint32,
/// you should use: (Sint32)SDL_rand_bits()
///
/// If you want reproducible output, be sure to initialize with SDL_srand()
/// first.
///
/// There are no guarantees as to the quality of the random sequence produced,
/// and this should not be used for security (cryptography, passwords) or where
/// money is on the line (loot-boxes, casinos). There are many random number
/// libraries available with different characteristics and you should pick one
/// of those to meet any serious needs.
///
/// \param n the number of possible outcomes. n must be positive.
/// \returns a random value in the range of [0 .. n-1].
///
/// \threadsafety All calls should be made from a single thread
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_srand
/// \sa SDL_randf
///
/// ```c
/// extern SDL_DECLSPEC Sint32 SDLCALL SDL_rand(Sint32 n)
/// ```
int sdlRand(int n) {
  final sdlRandLookupFunction = libSdl3
      .lookupFunction<Int32 Function(Int32 n), int Function(int n)>('SDL_rand');
  return sdlRandLookupFunction(n);
}

///
/// Generate a uniform pseudo-random floating point number less than 1.0
///
/// If you want reproducible output, be sure to initialize with SDL_srand()
/// first.
///
/// There are no guarantees as to the quality of the random sequence produced,
/// and this should not be used for security (cryptography, passwords) or where
/// money is on the line (loot-boxes, casinos). There are many random number
/// libraries available with different characteristics and you should pick one
/// of those to meet any serious needs.
///
/// \returns a random value in the range of [0.0, 1.0).
///
/// \threadsafety All calls should be made from a single thread
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_srand
/// \sa SDL_rand
///
/// ```c
/// extern SDL_DECLSPEC float SDLCALL SDL_randf(void)
/// ```
double sdlRandf() {
  final sdlRandfLookupFunction =
      libSdl3.lookupFunction<Float Function(), double Function()>('SDL_randf');
  return sdlRandfLookupFunction();
}

///
/// Generate 32 pseudo-random bits.
///
/// You likely want to use SDL_rand() to get a psuedo-random number instead.
///
/// There are no guarantees as to the quality of the random sequence produced,
/// and this should not be used for security (cryptography, passwords) or where
/// money is on the line (loot-boxes, casinos). There are many random number
/// libraries available with different characteristics and you should pick one
/// of those to meet any serious needs.
///
/// \returns a random value in the range of [0-SDL_MAX_UINT32].
///
/// \threadsafety All calls should be made from a single thread
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_rand
/// \sa SDL_randf
/// \sa SDL_srand
///
/// ```c
/// extern SDL_DECLSPEC Uint32 SDLCALL SDL_rand_bits(void)
/// ```
int sdlRandBits() {
  final sdlRandBitsLookupFunction = libSdl3
      .lookupFunction<Uint32 Function(), int Function()>('SDL_rand_bits');
  return sdlRandBitsLookupFunction();
}

///
/// Generate a pseudo-random number less than n for positive n
///
/// The method used is faster and of better quality than `rand() % n`. Odds are
/// roughly 99.9% even for n = 1 million. Evenness is better for smaller n, and
/// much worse as n gets bigger.
///
/// Example: to simulate a d6 use `SDL_rand_r(state, 6) + 1` The +1 converts
/// 0..5 to 1..6
///
/// If you want to generate a pseudo-random number in the full range of Sint32,
/// you should use: (Sint32)SDL_rand_bits_r(state)
///
/// There are no guarantees as to the quality of the random sequence produced,
/// and this should not be used for security (cryptography, passwords) or where
/// money is on the line (loot-boxes, casinos). There are many random number
/// libraries available with different characteristics and you should pick one
/// of those to meet any serious needs.
///
/// \param state a pointer to the current random number state, this may not be
/// NULL.
/// \param n the number of possible outcomes. n must be positive.
/// \returns a random value in the range of [0 .. n-1].
///
/// \threadsafety This function is thread-safe, as long as the state pointer
/// isn't shared between threads.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_rand
/// \sa SDL_rand_bits_r
/// \sa SDL_randf_r
///
/// ```c
/// extern SDL_DECLSPEC Sint32 SDLCALL SDL_rand_r(Uint64 *state, Sint32 n)
/// ```
int sdlRandR(Pointer<Uint64> state, int n) {
  final sdlRandRLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Uint64> state, Int32 n),
      int Function(Pointer<Uint64> state, int n)>('SDL_rand_r');
  return sdlRandRLookupFunction(state, n);
}

///
/// Generate a uniform pseudo-random floating point number less than 1.0
///
/// If you want reproducible output, be sure to initialize with SDL_srand()
/// first.
///
/// There are no guarantees as to the quality of the random sequence produced,
/// and this should not be used for security (cryptography, passwords) or where
/// money is on the line (loot-boxes, casinos). There are many random number
/// libraries available with different characteristics and you should pick one
/// of those to meet any serious needs.
///
/// \param state a pointer to the current random number state, this may not be
/// NULL.
/// \returns a random value in the range of [0.0, 1.0).
///
/// \threadsafety This function is thread-safe, as long as the state pointer
/// isn't shared between threads.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_rand_bits_r
/// \sa SDL_rand_r
/// \sa SDL_randf
///
/// ```c
/// extern SDL_DECLSPEC float SDLCALL SDL_randf_r(Uint64 *state)
/// ```
double sdlRandfR(Pointer<Uint64> state) {
  final sdlRandfRLookupFunction = libSdl3.lookupFunction<
      Float Function(Pointer<Uint64> state),
      double Function(Pointer<Uint64> state)>('SDL_randf_r');
  return sdlRandfRLookupFunction(state);
}

///
/// Generate 32 pseudo-random bits.
///
/// You likely want to use SDL_rand_r() to get a psuedo-random number instead.
///
/// There are no guarantees as to the quality of the random sequence produced,
/// and this should not be used for security (cryptography, passwords) or where
/// money is on the line (loot-boxes, casinos). There are many random number
/// libraries available with different characteristics and you should pick one
/// of those to meet any serious needs.
///
/// \param state a pointer to the current random number state, this may not be
/// NULL.
/// \returns a random value in the range of [0-SDL_MAX_UINT32].
///
/// \threadsafety This function is thread-safe, as long as the state pointer
/// isn't shared between threads.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_rand_r
/// \sa SDL_randf_r
///
/// ```c
/// extern SDL_DECLSPEC Uint32 SDLCALL SDL_rand_bits_r(Uint64 *state)
/// ```
int sdlRandBitsR(Pointer<Uint64> state) {
  final sdlRandBitsRLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<Uint64> state),
      int Function(Pointer<Uint64> state)>('SDL_rand_bits_r');
  return sdlRandBitsRLookupFunction(state);
}

///
/// Compute the arc cosine of `x`.
///
/// The definition of `y = acos(x)` is `x = cos(y)`.
///
/// Domain: `-1 <= x <= 1`
///
/// Range: `0 <= y <= Pi`
///
/// This function operates on double-precision floating point values, use
/// SDL_acosf for single-precision floats.
///
/// This function may use a different approximation across different versions,
/// platforms and configurations. i.e, it can return a different value given
/// the same input on different machines or operating systems, or if SDL is
/// updated.
///
/// \param x floating point value.
/// \returns arc cosine of `x`, in radians.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_acosf
/// \sa SDL_asin
/// \sa SDL_cos
///
/// ```c
/// extern SDL_DECLSPEC double SDLCALL SDL_acos(double x)
/// ```
double sdlAcos(double x) {
  final sdlAcosLookupFunction = libSdl3.lookupFunction<
      Double Function(Double x), double Function(double x)>('SDL_acos');
  return sdlAcosLookupFunction(x);
}

///
/// Compute the arc cosine of `x`.
///
/// The definition of `y = acos(x)` is `x = cos(y)`.
///
/// Domain: `-1 <= x <= 1`
///
/// Range: `0 <= y <= Pi`
///
/// This function operates on single-precision floating point values, use
/// SDL_acos for double-precision floats.
///
/// This function may use a different approximation across different versions,
/// platforms and configurations. i.e, it can return a different value given
/// the same input on different machines or operating systems, or if SDL is
/// updated.
///
/// \param x floating point value.
/// \returns arc cosine of `x`, in radians.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_acos
/// \sa SDL_asinf
/// \sa SDL_cosf
///
/// ```c
/// extern SDL_DECLSPEC float SDLCALL SDL_acosf(float x)
/// ```
double sdlAcosf(double x) {
  final sdlAcosfLookupFunction = libSdl3.lookupFunction<Float Function(Float x),
      double Function(double x)>('SDL_acosf');
  return sdlAcosfLookupFunction(x);
}

///
/// Compute the arc sine of `x`.
///
/// The definition of `y = asin(x)` is `x = sin(y)`.
///
/// Domain: `-1 <= x <= 1`
///
/// Range: `-Pi/2 <= y <= Pi/2`
///
/// This function operates on double-precision floating point values, use
/// SDL_asinf for single-precision floats.
///
/// This function may use a different approximation across different versions,
/// platforms and configurations. i.e, it can return a different value given
/// the same input on different machines or operating systems, or if SDL is
/// updated.
///
/// \param x floating point value.
/// \returns arc sine of `x`, in radians.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_asinf
/// \sa SDL_acos
/// \sa SDL_sin
///
/// ```c
/// extern SDL_DECLSPEC double SDLCALL SDL_asin(double x)
/// ```
double sdlAsin(double x) {
  final sdlAsinLookupFunction = libSdl3.lookupFunction<
      Double Function(Double x), double Function(double x)>('SDL_asin');
  return sdlAsinLookupFunction(x);
}

///
/// Compute the arc sine of `x`.
///
/// The definition of `y = asin(x)` is `x = sin(y)`.
///
/// Domain: `-1 <= x <= 1`
///
/// Range: `-Pi/2 <= y <= Pi/2`
///
/// This function operates on single-precision floating point values, use
/// SDL_asin for double-precision floats.
///
/// This function may use a different approximation across different versions,
/// platforms and configurations. i.e, it can return a different value given
/// the same input on different machines or operating systems, or if SDL is
/// updated.
///
/// \param x floating point value.
/// \returns arc sine of `x`, in radians.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_asin
/// \sa SDL_acosf
/// \sa SDL_sinf
///
/// ```c
/// extern SDL_DECLSPEC float SDLCALL SDL_asinf(float x)
/// ```
double sdlAsinf(double x) {
  final sdlAsinfLookupFunction = libSdl3.lookupFunction<Float Function(Float x),
      double Function(double x)>('SDL_asinf');
  return sdlAsinfLookupFunction(x);
}

///
/// Compute the arc tangent of `x`.
///
/// The definition of `y = atan(x)` is `x = tan(y)`.
///
/// Domain: `-INF <= x <= INF`
///
/// Range: `-Pi/2 <= y <= Pi/2`
///
/// This function operates on double-precision floating point values, use
/// SDL_atanf for single-precision floats.
///
/// To calculate the arc tangent of y / x, use SDL_atan2.
///
/// This function may use a different approximation across different versions,
/// platforms and configurations. i.e, it can return a different value given
/// the same input on different machines or operating systems, or if SDL is
/// updated.
///
/// \param x floating point value.
/// \returns arc tangent of of `x` in radians, or 0 if `x = 0`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_atanf
/// \sa SDL_atan2
/// \sa SDL_tan
///
/// ```c
/// extern SDL_DECLSPEC double SDLCALL SDL_atan(double x)
/// ```
double sdlAtan(double x) {
  final sdlAtanLookupFunction = libSdl3.lookupFunction<
      Double Function(Double x), double Function(double x)>('SDL_atan');
  return sdlAtanLookupFunction(x);
}

///
/// Compute the arc tangent of `x`.
///
/// The definition of `y = atan(x)` is `x = tan(y)`.
///
/// Domain: `-INF <= x <= INF`
///
/// Range: `-Pi/2 <= y <= Pi/2`
///
/// This function operates on single-precision floating point values, use
/// SDL_atan for dboule-precision floats.
///
/// To calculate the arc tangent of y / x, use SDL_atan2f.
///
/// This function may use a different approximation across different versions,
/// platforms and configurations. i.e, it can return a different value given
/// the same input on different machines or operating systems, or if SDL is
/// updated.
///
/// \param x floating point value.
/// \returns arc tangent of of `x` in radians, or 0 if `x = 0`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_atan
/// \sa SDL_atan2f
/// \sa SDL_tanf
///
/// ```c
/// extern SDL_DECLSPEC float SDLCALL SDL_atanf(float x)
/// ```
double sdlAtanf(double x) {
  final sdlAtanfLookupFunction = libSdl3.lookupFunction<Float Function(Float x),
      double Function(double x)>('SDL_atanf');
  return sdlAtanfLookupFunction(x);
}

///
/// Compute the arc tangent of `y / x`, using the signs of x and y to adjust
/// the result's quadrant.
///
/// The definition of `z = atan2(x, y)` is `y = x tan(z)`, where the quadrant
/// of z is determined based on the signs of x and y.
///
/// Domain: `-INF <= x <= INF`, `-INF <= y <= INF`
///
/// Range: `-Pi/2 <= y <= Pi/2`
///
/// This function operates on double-precision floating point values, use
/// SDL_atan2f for single-precision floats.
///
/// To calculate the arc tangent of a single value, use SDL_atan.
///
/// This function may use a different approximation across different versions,
/// platforms and configurations. i.e, it can return a different value given
/// the same input on different machines or operating systems, or if SDL is
/// updated.
///
/// \param y floating point value of the numerator (y coordinate).
/// \param x floating point value of the denominator (x coordinate).
/// \returns arc tangent of of `y / x` in radians, or, if `x = 0`, either
/// `-Pi/2`, `0`, or `Pi/2`, depending on the value of `y`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_atan2f
/// \sa SDL_atan
/// \sa SDL_tan
///
/// ```c
/// extern SDL_DECLSPEC double SDLCALL SDL_atan2(double y, double x)
/// ```
double sdlAtan2(double y, double x) {
  final sdlAtan2LookupFunction = libSdl3.lookupFunction<
      Double Function(Double y, Double x),
      double Function(double y, double x)>('SDL_atan2');
  return sdlAtan2LookupFunction(y, x);
}

///
/// Compute the arc tangent of `y / x`, using the signs of x and y to adjust
/// the result's quadrant.
///
/// The definition of `z = atan2(x, y)` is `y = x tan(z)`, where the quadrant
/// of z is determined based on the signs of x and y.
///
/// Domain: `-INF <= x <= INF`, `-INF <= y <= INF`
///
/// Range: `-Pi/2 <= y <= Pi/2`
///
/// This function operates on single-precision floating point values, use
/// SDL_atan2 for double-precision floats.
///
/// To calculate the arc tangent of a single value, use SDL_atanf.
///
/// This function may use a different approximation across different versions,
/// platforms and configurations. i.e, it can return a different value given
/// the same input on different machines or operating systems, or if SDL is
/// updated.
///
/// \param y floating point value of the numerator (y coordinate).
/// \param x floating point value of the denominator (x coordinate).
/// \returns arc tangent of of `y / x` in radians, or, if `x = 0`, either
/// `-Pi/2`, `0`, or `Pi/2`, depending on the value of `y`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_atan2f
/// \sa SDL_atan
/// \sa SDL_tan
///
/// ```c
/// extern SDL_DECLSPEC float SDLCALL SDL_atan2f(float y, float x)
/// ```
double sdlAtan2f(double y, double x) {
  final sdlAtan2fLookupFunction = libSdl3.lookupFunction<
      Float Function(Float y, Float x),
      double Function(double y, double x)>('SDL_atan2f');
  return sdlAtan2fLookupFunction(y, x);
}

///
/// Compute the ceiling of `x`.
///
/// The ceiling of `x` is the smallest integer `y` such that `y > x`, i.e `x`
/// rounded up to the nearest integer.
///
/// Domain: `-INF <= x <= INF`
///
/// Range: `-INF <= y <= INF`, y integer
///
/// This function operates on double-precision floating point values, use
/// SDL_ceilf for single-precision floats.
///
/// \param x floating point value.
/// \returns the ceiling of `x`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_ceilf
/// \sa SDL_floor
/// \sa SDL_trunc
/// \sa SDL_round
/// \sa SDL_lround
///
/// ```c
/// extern SDL_DECLSPEC double SDLCALL SDL_ceil(double x)
/// ```
double sdlCeil(double x) {
  final sdlCeilLookupFunction = libSdl3.lookupFunction<
      Double Function(Double x), double Function(double x)>('SDL_ceil');
  return sdlCeilLookupFunction(x);
}

///
/// Compute the ceiling of `x`.
///
/// The ceiling of `x` is the smallest integer `y` such that `y > x`, i.e `x`
/// rounded up to the nearest integer.
///
/// Domain: `-INF <= x <= INF`
///
/// Range: `-INF <= y <= INF`, y integer
///
/// This function operates on single-precision floating point values, use
/// SDL_ceil for double-precision floats.
///
/// \param x floating point value.
/// \returns the ceiling of `x`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_ceil
/// \sa SDL_floorf
/// \sa SDL_truncf
/// \sa SDL_roundf
/// \sa SDL_lroundf
///
/// ```c
/// extern SDL_DECLSPEC float SDLCALL SDL_ceilf(float x)
/// ```
double sdlCeilf(double x) {
  final sdlCeilfLookupFunction = libSdl3.lookupFunction<Float Function(Float x),
      double Function(double x)>('SDL_ceilf');
  return sdlCeilfLookupFunction(x);
}

///
/// Copy the sign of one floating-point value to another.
///
/// The definition of copysign is that ``copysign(x, y) = abs(x) * sign(y)``.
///
/// Domain: `-INF <= x <= INF`, ``-INF <= y <= f``
///
/// Range: `-INF <= z <= INF`
///
/// This function operates on double-precision floating point values, use
/// SDL_copysignf for single-precision floats.
///
/// \param x floating point value to use as the magnitude.
/// \param y floating point value to use as the sign.
/// \returns the floating point value with the sign of y and the magnitude of
/// x.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_copysignf
/// \sa SDL_fabs
///
/// ```c
/// extern SDL_DECLSPEC double SDLCALL SDL_copysign(double x, double y)
/// ```
double sdlCopysign(double x, double y) {
  final sdlCopysignLookupFunction = libSdl3.lookupFunction<
      Double Function(Double x, Double y),
      double Function(double x, double y)>('SDL_copysign');
  return sdlCopysignLookupFunction(x, y);
}

///
/// Copy the sign of one floating-point value to another.
///
/// The definition of copysign is that ``copysign(x, y) = abs(x) * sign(y)``.
///
/// Domain: `-INF <= x <= INF`, ``-INF <= y <= f``
///
/// Range: `-INF <= z <= INF`
///
/// This function operates on single-precision floating point values, use
/// SDL_copysign for double-precision floats.
///
/// \param x floating point value to use as the magnitude.
/// \param y floating point value to use as the sign.
/// \returns the floating point value with the sign of y and the magnitude of
/// x.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_copysignf
/// \sa SDL_fabsf
///
/// ```c
/// extern SDL_DECLSPEC float SDLCALL SDL_copysignf(float x, float y)
/// ```
double sdlCopysignf(double x, double y) {
  final sdlCopysignfLookupFunction = libSdl3.lookupFunction<
      Float Function(Float x, Float y),
      double Function(double x, double y)>('SDL_copysignf');
  return sdlCopysignfLookupFunction(x, y);
}

///
/// Compute the cosine of `x`.
///
/// Domain: `-INF <= x <= INF`
///
/// Range: `-1 <= y <= 1`
///
/// This function operates on double-precision floating point values, use
/// SDL_cosf for single-precision floats.
///
/// This function may use a different approximation across different versions,
/// platforms and configurations. i.e, it can return a different value given
/// the same input on different machines or operating systems, or if SDL is
/// updated.
///
/// \param x floating point value, in radians.
/// \returns cosine of `x`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_cosf
/// \sa SDL_acos
/// \sa SDL_sin
///
/// ```c
/// extern SDL_DECLSPEC double SDLCALL SDL_cos(double x)
/// ```
double sdlCos(double x) {
  final sdlCosLookupFunction = libSdl3.lookupFunction<Double Function(Double x),
      double Function(double x)>('SDL_cos');
  return sdlCosLookupFunction(x);
}

///
/// Compute the cosine of `x`.
///
/// Domain: `-INF <= x <= INF`
///
/// Range: `-1 <= y <= 1`
///
/// This function operates on single-precision floating point values, use
/// SDL_cos for double-precision floats.
///
/// This function may use a different approximation across different versions,
/// platforms and configurations. i.e, it can return a different value given
/// the same input on different machines or operating systems, or if SDL is
/// updated.
///
/// \param x floating point value, in radians.
/// \returns cosine of `x`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_cos
/// \sa SDL_acosf
/// \sa SDL_sinf
///
/// ```c
/// extern SDL_DECLSPEC float SDLCALL SDL_cosf(float x)
/// ```
double sdlCosf(double x) {
  final sdlCosfLookupFunction = libSdl3.lookupFunction<Float Function(Float x),
      double Function(double x)>('SDL_cosf');
  return sdlCosfLookupFunction(x);
}

///
/// Compute the exponential of `x`.
///
/// The definition of `y = exp(x)` is `y = e^x`, where `e` is the base of the
/// natural logarithm. The inverse is the natural logarithm, SDL_log.
///
/// Domain: `-INF <= x <= INF`
///
/// Range: `0 <= y <= INF`
///
/// The output will overflow if `exp(x)` is too large to be represented.
///
/// This function operates on double-precision floating point values, use
/// SDL_expf for single-precision floats.
///
/// This function may use a different approximation across different versions,
/// platforms and configurations. i.e, it can return a different value given
/// the same input on different machines or operating systems, or if SDL is
/// updated.
///
/// \param x floating point value.
/// \returns value of `e^x`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_expf
/// \sa SDL_log
///
/// ```c
/// extern SDL_DECLSPEC double SDLCALL SDL_exp(double x)
/// ```
double sdlExp(double x) {
  final sdlExpLookupFunction = libSdl3.lookupFunction<Double Function(Double x),
      double Function(double x)>('SDL_exp');
  return sdlExpLookupFunction(x);
}

///
/// Compute the exponential of `x`.
///
/// The definition of `y = exp(x)` is `y = e^x`, where `e` is the base of the
/// natural logarithm. The inverse is the natural logarithm, SDL_logf.
///
/// Domain: `-INF <= x <= INF`
///
/// Range: `0 <= y <= INF`
///
/// The output will overflow if `exp(x)` is too large to be represented.
///
/// This function operates on single-precision floating point values, use
/// SDL_exp for double-precision floats.
///
/// This function may use a different approximation across different versions,
/// platforms and configurations. i.e, it can return a different value given
/// the same input on different machines or operating systems, or if SDL is
/// updated.
///
/// \param x floating point value.
/// \returns value of `e^x`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_exp
/// \sa SDL_logf
///
/// ```c
/// extern SDL_DECLSPEC float SDLCALL SDL_expf(float x)
/// ```
double sdlExpf(double x) {
  final sdlExpfLookupFunction = libSdl3.lookupFunction<Float Function(Float x),
      double Function(double x)>('SDL_expf');
  return sdlExpfLookupFunction(x);
}

///
/// Compute the absolute value of `x`
///
/// Domain: `-INF <= x <= INF`
///
/// Range: `0 <= y <= INF`
///
/// This function operates on double-precision floating point values, use
/// SDL_copysignf for single-precision floats.
///
/// \param x floating point value to use as the magnitude.
/// \returns the absolute value of `x`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_fabsf
///
/// ```c
/// extern SDL_DECLSPEC double SDLCALL SDL_fabs(double x)
/// ```
double sdlFabs(double x) {
  final sdlFabsLookupFunction = libSdl3.lookupFunction<
      Double Function(Double x), double Function(double x)>('SDL_fabs');
  return sdlFabsLookupFunction(x);
}

///
/// Compute the absolute value of `x`
///
/// Domain: `-INF <= x <= INF`
///
/// Range: `0 <= y <= INF`
///
/// This function operates on single-precision floating point values, use
/// SDL_copysignf for double-precision floats.
///
/// \param x floating point value to use as the magnitude.
/// \returns the absolute value of `x`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_fabs
///
/// ```c
/// extern SDL_DECLSPEC float SDLCALL SDL_fabsf(float x)
/// ```
double sdlFabsf(double x) {
  final sdlFabsfLookupFunction = libSdl3.lookupFunction<Float Function(Float x),
      double Function(double x)>('SDL_fabsf');
  return sdlFabsfLookupFunction(x);
}

///
/// Compute the floor of `x`.
///
/// The floor of `x` is the largest integer `y` such that `y > x`, i.e `x`
/// rounded down to the nearest integer.
///
/// Domain: `-INF <= x <= INF`
///
/// Range: `-INF <= y <= INF`, y integer
///
/// This function operates on double-precision floating point values, use
/// SDL_floorf for single-precision floats.
///
/// \param x floating point value.
/// \returns the floor of `x`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_floorf
/// \sa SDL_ceil
/// \sa SDL_trunc
/// \sa SDL_round
/// \sa SDL_lround
///
/// ```c
/// extern SDL_DECLSPEC double SDLCALL SDL_floor(double x)
/// ```
double sdlFloor(double x) {
  final sdlFloorLookupFunction = libSdl3.lookupFunction<
      Double Function(Double x), double Function(double x)>('SDL_floor');
  return sdlFloorLookupFunction(x);
}

///
/// Compute the floor of `x`.
///
/// The floor of `x` is the largest integer `y` such that `y > x`, i.e `x`
/// rounded down to the nearest integer.
///
/// Domain: `-INF <= x <= INF`
///
/// Range: `-INF <= y <= INF`, y integer
///
/// This function operates on single-precision floating point values, use
/// SDL_floorf for double-precision floats.
///
/// \param x floating point value.
/// \returns the floor of `x`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_floor
/// \sa SDL_ceilf
/// \sa SDL_truncf
/// \sa SDL_roundf
/// \sa SDL_lroundf
///
/// ```c
/// extern SDL_DECLSPEC float SDLCALL SDL_floorf(float x)
/// ```
double sdlFloorf(double x) {
  final sdlFloorfLookupFunction = libSdl3.lookupFunction<
      Float Function(Float x), double Function(double x)>('SDL_floorf');
  return sdlFloorfLookupFunction(x);
}

///
/// Truncate `x` to an integer.
///
/// Rounds `x` to the next closest integer to 0. This is equivalent to removing
/// the fractional part of `x`, leaving only the integer part.
///
/// Domain: `-INF <= x <= INF`
///
/// Range: `-INF <= y <= INF`, y integer
///
/// This function operates on double-precision floating point values, use
/// SDL_truncf for single-precision floats.
///
/// \param x floating point value.
/// \returns `x` truncated to an integer.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_truncf
/// \sa SDL_fmod
/// \sa SDL_ceil
/// \sa SDL_floor
/// \sa SDL_round
/// \sa SDL_lround
///
/// ```c
/// extern SDL_DECLSPEC double SDLCALL SDL_trunc(double x)
/// ```
double sdlTrunc(double x) {
  final sdlTruncLookupFunction = libSdl3.lookupFunction<
      Double Function(Double x), double Function(double x)>('SDL_trunc');
  return sdlTruncLookupFunction(x);
}

///
/// Truncate `x` to an integer.
///
/// Rounds `x` to the next closest integer to 0. This is equivalent to removing
/// the fractional part of `x`, leaving only the integer part.
///
/// Domain: `-INF <= x <= INF`
///
/// Range: `-INF <= y <= INF`, y integer
///
/// This function operates on single-precision floating point values, use
/// SDL_truncf for double-precision floats.
///
/// \param x floating point value.
/// \returns `x` truncated to an integer.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_trunc
/// \sa SDL_fmodf
/// \sa SDL_ceilf
/// \sa SDL_floorf
/// \sa SDL_roundf
/// \sa SDL_lroundf
///
/// ```c
/// extern SDL_DECLSPEC float SDLCALL SDL_truncf(float x)
/// ```
double sdlTruncf(double x) {
  final sdlTruncfLookupFunction = libSdl3.lookupFunction<
      Float Function(Float x), double Function(double x)>('SDL_truncf');
  return sdlTruncfLookupFunction(x);
}

///
/// Return the floating-point remainder of `x / y`
///
/// Divides `x` by `y`, and returns the remainder.
///
/// Domain: `-INF <= x <= INF`, `-INF <= y <= INF`, `y != 0`
///
/// Range: `-y <= z <= y`
///
/// This function operates on double-precision floating point values, use
/// SDL_fmodf for single-precision floats.
///
/// \param x the numerator.
/// \param y the denominator. Must not be 0.
/// \returns the remainder of `x / y`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_fmodf
/// \sa SDL_modf
/// \sa SDL_trunc
/// \sa SDL_ceil
/// \sa SDL_floor
/// \sa SDL_round
/// \sa SDL_lround
///
/// ```c
/// extern SDL_DECLSPEC double SDLCALL SDL_fmod(double x, double y)
/// ```
double sdlFmod(double x, double y) {
  final sdlFmodLookupFunction = libSdl3.lookupFunction<
      Double Function(Double x, Double y),
      double Function(double x, double y)>('SDL_fmod');
  return sdlFmodLookupFunction(x, y);
}

///
/// Return the floating-point remainder of `x / y`
///
/// Divides `x` by `y`, and returns the remainder.
///
/// Domain: `-INF <= x <= INF`, `-INF <= y <= INF`, `y != 0`
///
/// Range: `-y <= z <= y`
///
/// This function operates on single-precision floating point values, use
/// SDL_fmod for single-precision floats.
///
/// \param x the numerator.
/// \param y the denominator. Must not be 0.
/// \returns the remainder of `x / y`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_fmod
/// \sa SDL_truncf
/// \sa SDL_modff
/// \sa SDL_ceilf
/// \sa SDL_floorf
/// \sa SDL_roundf
/// \sa SDL_lroundf
///
/// ```c
/// extern SDL_DECLSPEC float SDLCALL SDL_fmodf(float x, float y)
/// ```
double sdlFmodf(double x, double y) {
  final sdlFmodfLookupFunction = libSdl3.lookupFunction<
      Float Function(Float x, Float y),
      double Function(double x, double y)>('SDL_fmodf');
  return sdlFmodfLookupFunction(x, y);
}

///
/// Return whether the value is infinity.
///
/// \param x double-precision floating point value.
/// \returns non-zero if the value is infinity, 0 otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_isinff
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_isinf(double x)
/// ```
int sdlIsinf(double x) {
  final sdlIsinfLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Double x), int Function(double x)>(
          'SDL_isinf');
  return sdlIsinfLookupFunction(x);
}

///
/// Return whether the value is infinity.
///
/// \param x floating point value.
/// \returns non-zero if the value is infinity, 0 otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_isinf
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_isinff(float x)
/// ```
int sdlIsinff(double x) {
  final sdlIsinffLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Float x), int Function(double x)>(
          'SDL_isinff');
  return sdlIsinffLookupFunction(x);
}

///
/// Return whether the value is NaN.
///
/// \param x double-precision floating point value.
/// \returns non-zero if the value is NaN, 0 otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_isnanf
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_isnan(double x)
/// ```
int sdlIsnan(double x) {
  final sdlIsnanLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Double x), int Function(double x)>(
          'SDL_isnan');
  return sdlIsnanLookupFunction(x);
}

///
/// Return whether the value is NaN.
///
/// \param x floating point value.
/// \returns non-zero if the value is NaN, 0 otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_isnan
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_isnanf(float x)
/// ```
int sdlIsnanf(double x) {
  final sdlIsnanfLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Float x), int Function(double x)>(
          'SDL_isnanf');
  return sdlIsnanfLookupFunction(x);
}

///
/// Compute the natural logarithm of `x`.
///
/// Domain: `0 < x <= INF`
///
/// Range: `-INF <= y <= INF`
///
/// It is an error for `x` to be less than or equal to 0.
///
/// This function operates on single-precision floating point values, use
/// SDL_log for double-precision floats.
///
/// This function may use a different approximation across different versions,
/// platforms and configurations. i.e, it can return a different value given
/// the same input on different machines or operating systems, or if SDL is
/// updated.
///
/// \param x floating point value. Must be greater than 0.
/// \returns the natural logarithm of `x`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_log
/// \sa SDL_expf
///
/// ```c
/// extern SDL_DECLSPEC float SDLCALL SDL_logf(float x)
/// ```
double sdlLogf(double x) {
  final sdlLogfLookupFunction = libSdl3.lookupFunction<Float Function(Float x),
      double Function(double x)>('SDL_logf');
  return sdlLogfLookupFunction(x);
}

///
/// Compute the base-10 logarithm of `x`.
///
/// Domain: `0 < x <= INF`
///
/// Range: `-INF <= y <= INF`
///
/// It is an error for `x` to be less than or equal to 0.
///
/// This function operates on double-precision floating point values, use
/// SDL_log10f for single-precision floats.
///
/// This function may use a different approximation across different versions,
/// platforms and configurations. i.e, it can return a different value given
/// the same input on different machines or operating systems, or if SDL is
/// updated.
///
/// \param x floating point value. Must be greater than 0.
/// \returns the logarithm of `x`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_log10f
/// \sa SDL_log
/// \sa SDL_pow
///
/// ```c
/// extern SDL_DECLSPEC double SDLCALL SDL_log10(double x)
/// ```
double sdlLog10(double x) {
  final sdlLog10LookupFunction = libSdl3.lookupFunction<
      Double Function(Double x), double Function(double x)>('SDL_log10');
  return sdlLog10LookupFunction(x);
}

///
/// Compute the base-10 logarithm of `x`.
///
/// Domain: `0 < x <= INF`
///
/// Range: `-INF <= y <= INF`
///
/// It is an error for `x` to be less than or equal to 0.
///
/// This function operates on single-precision floating point values, use
/// SDL_log10 for double-precision floats.
///
/// This function may use a different approximation across different versions,
/// platforms and configurations. i.e, it can return a different value given
/// the same input on different machines or operating systems, or if SDL is
/// updated.
///
/// \param x floating point value. Must be greater than 0.
/// \returns the logarithm of `x`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_log10
/// \sa SDL_logf
/// \sa SDL_powf
///
/// ```c
/// extern SDL_DECLSPEC float SDLCALL SDL_log10f(float x)
/// ```
double sdlLog10f(double x) {
  final sdlLog10fLookupFunction = libSdl3.lookupFunction<
      Float Function(Float x), double Function(double x)>('SDL_log10f');
  return sdlLog10fLookupFunction(x);
}

///
/// Split `x` into integer and fractional parts
///
/// This function operates on double-precision floating point values, use
/// SDL_modff for single-precision floats.
///
/// \param x floating point value.
/// \param y output pointer to store the integer part of `x`.
/// \returns the fractional part of `x`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_modff
/// \sa SDL_trunc
/// \sa SDL_fmod
///
/// ```c
/// extern SDL_DECLSPEC double SDLCALL SDL_modf(double x, double *y)
/// ```
double sdlModf(double x, Pointer<Double> y) {
  final sdlModfLookupFunction = libSdl3.lookupFunction<
      Double Function(Double x, Pointer<Double> y),
      double Function(double x, Pointer<Double> y)>('SDL_modf');
  return sdlModfLookupFunction(x, y);
}

///
/// Split `x` into integer and fractional parts
///
/// This function operates on single-precision floating point values, use
/// SDL_modf for double-precision floats.
///
/// \param x floating point value.
/// \param y output pointer to store the integer part of `x`.
/// \returns the fractional part of `x`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_modf
/// \sa SDL_truncf
/// \sa SDL_fmodf
///
/// ```c
/// extern SDL_DECLSPEC float SDLCALL SDL_modff(float x, float *y)
/// ```
double sdlModff(double x, Pointer<Float> y) {
  final sdlModffLookupFunction = libSdl3.lookupFunction<
      Float Function(Float x, Pointer<Float> y),
      double Function(double x, Pointer<Float> y)>('SDL_modff');
  return sdlModffLookupFunction(x, y);
}

///
/// Raise `x` to the power `y`
///
/// Domain: `-INF <= x <= INF`, `-INF <= y <= INF`
///
/// Range: `-INF <= z <= INF`
///
/// If `y` is the base of the natural logarithm (e), consider using SDL_exp
/// instead.
///
/// This function operates on double-precision floating point values, use
/// SDL_powf for single-precision floats.
///
/// This function may use a different approximation across different versions,
/// platforms and configurations. i.e, it can return a different value given
/// the same input on different machines or operating systems, or if SDL is
/// updated.
///
/// \param x the base.
/// \param y the exponent.
/// \returns `x` raised to the power `y`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_powf
/// \sa SDL_exp
/// \sa SDL_log
///
/// ```c
/// extern SDL_DECLSPEC double SDLCALL SDL_pow(double x, double y)
/// ```
double sdlPow(double x, double y) {
  final sdlPowLookupFunction = libSdl3.lookupFunction<
      Double Function(Double x, Double y),
      double Function(double x, double y)>('SDL_pow');
  return sdlPowLookupFunction(x, y);
}

///
/// Raise `x` to the power `y`
///
/// Domain: `-INF <= x <= INF`, `-INF <= y <= INF`
///
/// Range: `-INF <= z <= INF`
///
/// If `y` is the base of the natural logarithm (e), consider using SDL_exp
/// instead.
///
/// This function operates on single-precision floating point values, use
/// SDL_powf for double-precision floats.
///
/// This function may use a different approximation across different versions,
/// platforms and configurations. i.e, it can return a different value given
/// the same input on different machines or operating systems, or if SDL is
/// updated.
///
/// \param x the base.
/// \param y the exponent.
/// \returns `x` raised to the power `y`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_pow
/// \sa SDL_expf
/// \sa SDL_logf
///
/// ```c
/// extern SDL_DECLSPEC float SDLCALL SDL_powf(float x, float y)
/// ```
double sdlPowf(double x, double y) {
  final sdlPowfLookupFunction = libSdl3.lookupFunction<
      Float Function(Float x, Float y),
      double Function(double x, double y)>('SDL_powf');
  return sdlPowfLookupFunction(x, y);
}

///
/// Round `x` to the nearest integer.
///
/// Rounds `x` to the nearest integer. Values halfway between integers will be
/// rounded away from zero.
///
/// Domain: `-INF <= x <= INF`
///
/// Range: `-INF <= y <= INF`, y integer
///
/// This function operates on double-precision floating point values, use
/// SDL_roundf for single-precision floats. To get the result as an integer
/// type, use SDL_lround.
///
/// \param x floating point value.
/// \returns the nearest integer to `x`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_roundf
/// \sa SDL_lround
/// \sa SDL_floor
/// \sa SDL_ceil
/// \sa SDL_trunc
///
/// ```c
/// extern SDL_DECLSPEC double SDLCALL SDL_round(double x)
/// ```
double sdlRound(double x) {
  final sdlRoundLookupFunction = libSdl3.lookupFunction<
      Double Function(Double x), double Function(double x)>('SDL_round');
  return sdlRoundLookupFunction(x);
}

///
/// Round `x` to the nearest integer.
///
/// Rounds `x` to the nearest integer. Values halfway between integers will be
/// rounded away from zero.
///
/// Domain: `-INF <= x <= INF`
///
/// Range: `-INF <= y <= INF`, y integer
///
/// This function operates on double-precision floating point values, use
/// SDL_roundf for single-precision floats. To get the result as an integer
/// type, use SDL_lroundf.
///
/// \param x floating point value.
/// \returns the nearest integer to `x`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_round
/// \sa SDL_lroundf
/// \sa SDL_floorf
/// \sa SDL_ceilf
/// \sa SDL_truncf
///
/// ```c
/// extern SDL_DECLSPEC float SDLCALL SDL_roundf(float x)
/// ```
double sdlRoundf(double x) {
  final sdlRoundfLookupFunction = libSdl3.lookupFunction<
      Float Function(Float x), double Function(double x)>('SDL_roundf');
  return sdlRoundfLookupFunction(x);
}

///
/// Round `x` to the nearest integer representable as a long
///
/// Rounds `x` to the nearest integer. Values halfway between integers will be
/// rounded away from zero.
///
/// Domain: `-INF <= x <= INF`
///
/// Range: `MIN_LONG <= y <= MAX_LONG`
///
/// This function operates on double-precision floating point values, use
/// SDL_lround for single-precision floats. To get the result as a
/// floating-point type, use SDL_round.
///
/// \param x floating point value.
/// \returns the nearest integer to `x`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_lroundf
/// \sa SDL_round
/// \sa SDL_floor
/// \sa SDL_ceil
/// \sa SDL_trunc
///
/// ```c
/// extern SDL_DECLSPEC long SDLCALL SDL_lround(double x)
/// ```
int sdlLround(double x) {
  final sdlLroundLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Double x), int Function(double x)>(
          'SDL_lround');
  return sdlLroundLookupFunction(x);
}

///
/// Round `x` to the nearest integer representable as a long
///
/// Rounds `x` to the nearest integer. Values halfway between integers will be
/// rounded away from zero.
///
/// Domain: `-INF <= x <= INF`
///
/// Range: `MIN_LONG <= y <= MAX_LONG`
///
/// This function operates on single-precision floating point values, use
/// SDL_lroundf for double-precision floats. To get the result as a
/// floating-point type, use SDL_roundf,
///
/// \param x floating point value.
/// \returns the nearest integer to `x`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_lround
/// \sa SDL_roundf
/// \sa SDL_floorf
/// \sa SDL_ceilf
/// \sa SDL_truncf
///
/// ```c
/// extern SDL_DECLSPEC long SDLCALL SDL_lroundf(float x)
/// ```
int sdlLroundf(double x) {
  final sdlLroundfLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Float x), int Function(double x)>(
          'SDL_lroundf');
  return sdlLroundfLookupFunction(x);
}

///
/// Scale `x` by an integer power of two.
///
/// Multiplies `x` by the `n`th power of the floating point radix (always 2).
///
/// Domain: `-INF <= x <= INF`, `n` integer
///
/// Range: `-INF <= y <= INF`
///
/// This function operates on double-precision floating point values, use
/// SDL_scalbnf for single-precision floats.
///
/// \param x floating point value to be scaled.
/// \param n integer exponent.
/// \returns `x * 2^n`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_scalbnf
/// \sa SDL_pow
///
/// ```c
/// extern SDL_DECLSPEC double SDLCALL SDL_scalbn(double x, int n)
/// ```
double sdlScalbn(double x, int n) {
  final sdlScalbnLookupFunction = libSdl3.lookupFunction<
      Double Function(Double x, Int32 n),
      double Function(double x, int n)>('SDL_scalbn');
  return sdlScalbnLookupFunction(x, n);
}

///
/// Scale `x` by an integer power of two.
///
/// Multiplies `x` by the `n`th power of the floating point radix (always 2).
///
/// Domain: `-INF <= x <= INF`, `n` integer
///
/// Range: `-INF <= y <= INF`
///
/// This function operates on single-precision floating point values, use
/// SDL_scalbn for double-precision floats.
///
/// \param x floating point value to be scaled.
/// \param n integer exponent.
/// \returns `x * 2^n`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_scalbn
/// \sa SDL_powf
///
/// ```c
/// extern SDL_DECLSPEC float SDLCALL SDL_scalbnf(float x, int n)
/// ```
double sdlScalbnf(double x, int n) {
  final sdlScalbnfLookupFunction = libSdl3.lookupFunction<
      Float Function(Float x, Int32 n),
      double Function(double x, int n)>('SDL_scalbnf');
  return sdlScalbnfLookupFunction(x, n);
}

///
/// Compute the sine of `x`.
///
/// Domain: `-INF <= x <= INF`
///
/// Range: `-1 <= y <= 1`
///
/// This function operates on double-precision floating point values, use
/// SDL_sinf for single-precision floats.
///
/// This function may use a different approximation across different versions,
/// platforms and configurations. i.e, it can return a different value given
/// the same input on different machines or operating systems, or if SDL is
/// updated.
///
/// \param x floating point value, in radians.
/// \returns sine of `x`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_sinf
/// \sa SDL_asin
/// \sa SDL_cos
///
/// ```c
/// extern SDL_DECLSPEC double SDLCALL SDL_sin(double x)
/// ```
double sdlSin(double x) {
  final sdlSinLookupFunction = libSdl3.lookupFunction<Double Function(Double x),
      double Function(double x)>('SDL_sin');
  return sdlSinLookupFunction(x);
}

///
/// Compute the sine of `x`.
///
/// Domain: `-INF <= x <= INF`
///
/// Range: `-1 <= y <= 1`
///
/// This function operates on single-precision floating point values, use
/// SDL_sinf for double-precision floats.
///
/// This function may use a different approximation across different versions,
/// platforms and configurations. i.e, it can return a different value given
/// the same input on different machines or operating systems, or if SDL is
/// updated.
///
/// \param x floating point value, in radians.
/// \returns sine of `x`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_sin
/// \sa SDL_asinf
/// \sa SDL_cosf
///
/// ```c
/// extern SDL_DECLSPEC float SDLCALL SDL_sinf(float x)
/// ```
double sdlSinf(double x) {
  final sdlSinfLookupFunction = libSdl3.lookupFunction<Float Function(Float x),
      double Function(double x)>('SDL_sinf');
  return sdlSinfLookupFunction(x);
}

///
/// Compute the square root of `x`.
///
/// Domain: `0 <= x <= INF`
///
/// Range: `0 <= y <= INF`
///
/// This function operates on double-precision floating point values, use
/// SDL_sqrtf for single-precision floats.
///
/// This function may use a different approximation across different versions,
/// platforms and configurations. i.e, it can return a different value given
/// the same input on different machines or operating systems, or if SDL is
/// updated.
///
/// \param x floating point value. Must be greater than or equal to 0.
/// \returns square root of `x`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_sqrtf
///
/// ```c
/// extern SDL_DECLSPEC double SDLCALL SDL_sqrt(double x)
/// ```
double sdlSqrt(double x) {
  final sdlSqrtLookupFunction = libSdl3.lookupFunction<
      Double Function(Double x), double Function(double x)>('SDL_sqrt');
  return sdlSqrtLookupFunction(x);
}

///
/// Compute the square root of `x`.
///
/// Domain: `0 <= x <= INF`
///
/// Range: `0 <= y <= INF`
///
/// This function operates on single-precision floating point values, use
/// SDL_sqrt for double-precision floats.
///
/// This function may use a different approximation across different versions,
/// platforms and configurations. i.e, it can return a different value given
/// the same input on different machines or operating systems, or if SDL is
/// updated.
///
/// \param x floating point value. Must be greater than or equal to 0.
/// \returns square root of `x`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_sqrt
///
/// ```c
/// extern SDL_DECLSPEC float SDLCALL SDL_sqrtf(float x)
/// ```
double sdlSqrtf(double x) {
  final sdlSqrtfLookupFunction = libSdl3.lookupFunction<Float Function(Float x),
      double Function(double x)>('SDL_sqrtf');
  return sdlSqrtfLookupFunction(x);
}

///
/// Compute the tangent of `x`.
///
/// Domain: `-INF <= x <= INF`
///
/// Range: `-INF <= y <= INF`
///
/// This function operates on double-precision floating point values, use
/// SDL_tanf for single-precision floats.
///
/// This function may use a different approximation across different versions,
/// platforms and configurations. i.e, it can return a different value given
/// the same input on different machines or operating systems, or if SDL is
/// updated.
///
/// \param x floating point value, in radians.
/// \returns tangent of `x`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_tanf
/// \sa SDL_sin
/// \sa SDL_cos
/// \sa SDL_atan
/// \sa SDL_atan2
///
/// ```c
/// extern SDL_DECLSPEC double SDLCALL SDL_tan(double x)
/// ```
double sdlTan(double x) {
  final sdlTanLookupFunction = libSdl3.lookupFunction<Double Function(Double x),
      double Function(double x)>('SDL_tan');
  return sdlTanLookupFunction(x);
}

///
/// Compute the tangent of `x`.
///
/// Domain: `-INF <= x <= INF`
///
/// Range: `-INF <= y <= INF`
///
/// This function operates on single-precision floating point values, use
/// SDL_tanf for double-precision floats.
///
/// This function may use a different approximation across different versions,
/// platforms and configurations. i.e, it can return a different value given
/// the same input on different machines or operating systems, or if SDL is
/// updated.
///
/// \param x floating point value, in radians.
/// \returns tangent of `x`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_tan
/// \sa SDL_sinf
/// \sa SDL_cosf
/// \sa SDL_atanf
/// \sa SDL_atan2f
///
/// ```c
/// extern SDL_DECLSPEC float SDLCALL SDL_tanf(float x)
/// ```
double sdlTanf(double x) {
  final sdlTanfLookupFunction = libSdl3.lookupFunction<Float Function(Float x),
      double Function(double x)>('SDL_tanf');
  return sdlTanfLookupFunction(x);
}

///
/// This function allocates a context for the specified character set
/// conversion.
///
/// \param tocode The target character encoding, must not be NULL.
/// \param fromcode The source character encoding, must not be NULL.
/// \returns a handle that must be freed with SDL_iconv_close, or
/// SDL_ICONV_ERROR on failure.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_iconv
/// \sa SDL_iconv_close
/// \sa SDL_iconv_string
///
/// ```c
/// extern SDL_DECLSPEC SDL_iconv_t SDLCALL SDL_iconv_open(const char *tocode, const char *fromcode)
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

///
/// This function frees a context used for character set conversion.
///
/// \param cd The character set conversion handle.
/// \returns 0 on success, or -1 on failure.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_iconv
/// \sa SDL_iconv_open
/// \sa SDL_iconv_string
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_iconv_close(SDL_iconv_t cd)
/// ```
int sdlIconvClose(Pointer<SdlIconvT> cd) {
  final sdlIconvCloseLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlIconvT> cd),
      int Function(Pointer<SdlIconvT> cd)>('SDL_iconv_close');
  return sdlIconvCloseLookupFunction(cd);
}

///
/// This function converts text between encodings, reading from and writing to
/// a buffer.
///
/// It returns the number of succesful conversions.
///
/// \param cd The character set conversion context, created in
/// SDL_iconv_open().
/// \param inbuf Address of variable that points to the first character of the
/// input sequence.
/// \param inbytesleft The number of bytes in the input buffer.
/// \param outbuf Address of variable that points to the output buffer.
/// \param outbytesleft The number of bytes in the output buffer.
/// \returns the number of conversions on success, else SDL_ICONV_E2BIG is
/// returned when the output buffer is too small, or SDL_ICONV_EILSEQ
/// is returned when an invalid input sequence is encountered, or
/// SDL_ICONV_EINVAL is returned when an incomplete input sequence is
/// encountered.
///
/// On exit:
///
/// - inbuf will point to the beginning of the next multibyte
/// sequence. On error, this is the location of the problematic
/// input sequence. On success, this is the end of the input
/// sequence. - inbytesleft will be set to the number of bytes left
/// to convert, which will be 0 on success. - outbuf will point to
/// the location where to store the next output byte. - outbytesleft
/// will be set to the number of bytes left in the output buffer.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_iconv_open
/// \sa SDL_iconv_close
/// \sa SDL_iconv_string
///
/// ```c
/// extern SDL_DECLSPEC size_t SDLCALL SDL_iconv(SDL_iconv_t cd, const char **inbuf, size_t *inbytesleft, char **outbuf, size_t *outbytesleft)
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
/// Helper function to convert a string's encoding in one call.
///
/// This function converts a buffer or string between encodings in one pass.
///
/// The string does not need to be NULL-terminated; this function operates on
/// the number of bytes specified in `inbytesleft` whether there is a NULL
/// character anywhere in the buffer.
///
/// The returned string is owned by the caller, and should be passed to
/// SDL_free when no longer needed.
///
/// \param tocode the character encoding of the output string. Examples are
/// "UTF-8", "UCS-4", etc.
/// \param fromcode the character encoding of data in `inbuf`.
/// \param inbuf the string to convert to a different encoding.
/// \param inbytesleft the size of the input string _in bytes_.
/// \returns a new string, converted to the new encoding, or NULL on error.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_iconv_open
/// \sa SDL_iconv_close
/// \sa SDL_iconv
///
/// ```c
/// extern SDL_DECLSPEC char * SDLCALL SDL_iconv_string(const char *tocode, const char *fromcode, const char *inbuf, size_t inbytesleft)
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
