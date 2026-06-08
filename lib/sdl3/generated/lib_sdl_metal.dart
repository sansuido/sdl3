// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
part of '../sdl.dart';

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
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_Metal_DestroyView
/// \sa SDL_Metal_GetLayer
///
/// ```c
/// extern SDL_DECLSPEC SDL_MetalView SDLCALL SDL_Metal_CreateView(SDL_Window *window)
/// ```
/// {@category metal}
SdlMetalView sdlMetalCreateView(Pointer<SdlWindow> window) {
  final sdlMetalCreateViewLookupFunction = _libSdl
      .lookupFunction<
        SdlMetalView Function(Pointer<SdlWindow> window),
        SdlMetalView Function(Pointer<SdlWindow> window)
      >('SDL_Metal_CreateView');
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
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_Metal_CreateView
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_Metal_DestroyView(SDL_MetalView view)
/// ```
/// {@category metal}
void sdlMetalDestroyView(SdlMetalView view) {
  final sdlMetalDestroyViewLookupFunction = _libSdl
      .lookupFunction<
        Void Function(SdlMetalView view),
        void Function(SdlMetalView view)
      >('SDL_Metal_DestroyView');
  return sdlMetalDestroyViewLookupFunction(view);
}

///
/// Get a pointer to the backing CAMetalLayer for the given view.
///
/// \param view the SDL_MetalView object.
/// \returns a pointer.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void * SDLCALL SDL_Metal_GetLayer(SDL_MetalView view)
/// ```
/// {@category metal}
Pointer<Void> sdlMetalGetLayer(SdlMetalView view) {
  final sdlMetalGetLayerLookupFunction = _libSdl
      .lookupFunction<
        Pointer<Void> Function(SdlMetalView view),
        Pointer<Void> Function(SdlMetalView view)
      >('SDL_Metal_GetLayer');
  return sdlMetalGetLayerLookupFunction(view);
}
