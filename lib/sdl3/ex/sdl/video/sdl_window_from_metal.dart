part of '../../../sdl.dart';

extension SdlWindowPointerFromMetalEx on Pointer<SdlWindow> {
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
  ///
  /// See also:
  /// - [SDL_Metal_CreateView - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_Metal_CreateView)
  ///
  /// {@category metal}
  SdlMetalView metalCreateView() => sdlMetalCreateView(this);
}
