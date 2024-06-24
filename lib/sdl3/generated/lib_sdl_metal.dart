// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Create a CAMetalLayer-backed NSView/UIView and attach it to the specified
/// window.
///
/// On macOS, this does *not* associate a MTLDevice with the CAMetalLayer on
/// its own. It is up to user code to do that.
///
/// The returned handle can be casted directly to a NSView or UIView. To access
/// the backing CAMetalLayer, call SDL_Metal_GetLayer().
///
/// \param window the window.
/// \returns handle NSView or UIView.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_Metal_DestroyView
/// \sa SDL_Metal_GetLayer
///
/// ```c
/// extern SDL_DECLSPEC SDL_MetalView SDLCALL SDL_Metal_CreateView(SDL_Window * window)
/// ```
Pointer<NativeType> sdlMetalCreateView(Pointer<SdlWindow> window) {
  final sdlMetalCreateViewLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(Pointer<SdlWindow> window),
      Pointer<NativeType> Function(
          Pointer<SdlWindow> window)>('SDL_Metal_CreateView');
  return sdlMetalCreateViewLookupFunction(window);
}

///
/// Destroy an existing SDL_MetalView object.
///
/// This should be called before SDL_DestroyWindow, if SDL_Metal_CreateView was
/// called after SDL_CreateWindow.
///
/// \param view the SDL_MetalView object.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_Metal_CreateView
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_Metal_DestroyView(SDL_MetalView view)
/// ```
void sdlMetalDestroyView(Pointer<NativeType> view) {
  final sdlMetalDestroyViewLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<NativeType> view),
      void Function(Pointer<NativeType> view)>('SDL_Metal_DestroyView');
  return sdlMetalDestroyViewLookupFunction(view);
}

///
/// Get a pointer to the backing CAMetalLayer for the given view.
///
/// \param view the SDL_MetalView object.
/// \returns a pointer.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void *SDLCALL SDL_Metal_GetLayer(SDL_MetalView view)
/// ```
Pointer<NativeType> sdlMetalGetLayer(Pointer<NativeType> view) {
  final sdlMetalGetLayerLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(Pointer<NativeType> view),
      Pointer<NativeType> Function(
          Pointer<NativeType> view)>('SDL_Metal_GetLayer');
  return sdlMetalGetLayerLookupFunction(view);
}
