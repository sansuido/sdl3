// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Dynamically load a shared object.
///
/// \param sofile a system-dependent name of the object file.
/// \returns an opaque pointer to the object handle or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_LoadFunction
/// \sa SDL_UnloadObject
///
/// ```c
/// extern SDL_DECLSPEC SDL_SharedObject * SDLCALL SDL_LoadObject(const char *sofile)
/// ```
Pointer<SdlSharedObject> sdlLoadObject(String? sofile) {
  final sdlLoadObjectLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlSharedObject> Function(Pointer<Utf8> sofile),
      Pointer<SdlSharedObject> Function(
          Pointer<Utf8> sofile)>('SDL_LoadObject');
  final sofilePointer = sofile != null ? sofile.toNativeUtf8() : nullptr;
  final result = sdlLoadObjectLookupFunction(sofilePointer);
  calloc.free(sofilePointer);
  return result;
}

///
/// Look up the address of the named function in a shared object.
///
/// This function pointer is no longer valid after calling SDL_UnloadObject().
///
/// This function can only look up C function names. Other languages may have
/// name mangling and intrinsic language support that varies from compiler to
/// compiler.
///
/// Make sure you declare your function pointers with the same calling
/// convention as the actual library function. Your code will crash
/// mysteriously if you do not do this.
///
/// If the requested function doesn't exist, NULL is returned.
///
/// \param handle a valid shared object handle returned by SDL_LoadObject().
/// \param name the name of the function to look up.
/// \returns a pointer to the function or NULL on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_LoadObject
///
/// ```c
/// extern SDL_DECLSPEC SDL_FunctionPointer SDLCALL SDL_LoadFunction(SDL_SharedObject *handle, const char *name)
/// ```
Pointer<NativeType> sdlLoadFunction(
    Pointer<SdlSharedObject> handle, String? name) {
  final sdlLoadFunctionLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(
          Pointer<SdlSharedObject> handle, Pointer<Utf8> name),
      Pointer<NativeType> Function(Pointer<SdlSharedObject> handle,
          Pointer<Utf8> name)>('SDL_LoadFunction');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlLoadFunctionLookupFunction(handle, namePointer);
  calloc.free(namePointer);
  return result;
}

///
/// Unload a shared object from memory.
///
/// Note that any pointers from this object looked up through
/// SDL_LoadFunction() will no longer be valid.
///
/// \param handle a valid shared object handle returned by SDL_LoadObject().
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_LoadObject
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_UnloadObject(SDL_SharedObject *handle)
/// ```
void sdlUnloadObject(Pointer<SdlSharedObject> handle) {
  final sdlUnloadObjectLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlSharedObject> handle),
      void Function(Pointer<SdlSharedObject> handle)>('SDL_UnloadObject');
  return sdlUnloadObjectLookupFunction(handle);
}
