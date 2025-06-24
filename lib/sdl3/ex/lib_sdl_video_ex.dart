part of '../sdl.dart';

// typedef void (*SDLglproc)(void)
typedef SDLglprocDart = void Function();
typedef SDLglproc = Pointer<NativeFunction<Void Function()>>;

SDLglproc sdlGlGetProcAddressEx(String proc) {
  final sdlGlGetProcAddressExLookupFunction = _libSdl
      .lookupFunction<
        SDLglproc Function(Pointer<Utf8> proc),
        SDLglproc Function(Pointer<Utf8> proc)
      >('SDL_GL_GetProcAddress');
  final procPointer = proc.toNativeUtf8();
  final result = sdlGlGetProcAddressExLookupFunction(procPointer);
  calloc.free(procPointer);
  return result;
}
