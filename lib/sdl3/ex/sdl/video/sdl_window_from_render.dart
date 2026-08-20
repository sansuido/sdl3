part of '../../../sdl.dart';

extension SdlWindowPointerFromRenderEx on Pointer<SdlWindow> {
  ///
  /// Create a 2D rendering context for a window.
  ///
  /// If you want a specific renderer, you can specify its name here. A list of
  /// available renderers can be obtained by calling SDL_GetRenderDriver()
  /// multiple times, with indices from 0 to SDL_GetNumRenderDrivers()-1. If you
  /// don't need a specific renderer, specify NULL and SDL will attempt to choose
  /// the best option for you, based on what is available on the user's system.
  ///
  /// If `name` is a comma-separated list, SDL will try each name, in the order
  /// listed, until one succeeds or all of them fail.
  ///
  /// By default the rendering size matches the window size in pixels, but you
  /// can call SDL_SetRenderLogicalPresentation() to change the content size and
  /// scaling options.
  ///
  /// \param window the window where rendering is displayed.
  /// \param name the name of the rendering driver to initialize, or NULL to let
  /// SDL choose one.
  /// \returns a valid rendering context or NULL if there was an error; call
  /// SDL_GetError() for more information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_CreateRendererWithProperties
  /// \sa SDL_CreateSoftwareRenderer
  /// \sa SDL_DestroyRenderer
  /// \sa SDL_GetNumRenderDrivers
  /// \sa SDL_GetRenderDriver
  /// \sa SDL_GetRendererName
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Renderer * SDLCALL SDL_CreateRenderer(SDL_Window *window, const char *name)
  /// ```
  ///
  /// See also:
  /// - [SDL_CreateRenderer - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_CreateRenderer)
  ///
  /// {@category render}
  Pointer<SdlRenderer> createRenderer({String? name}) =>
      sdlCreateRenderer(this, name);

  ///
  /// Get the renderer associated with a window.
  ///
  /// \param window the window to query.
  /// \returns the rendering context on success or NULL on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Renderer * SDLCALL SDL_GetRenderer(SDL_Window *window)
  /// ```
  ///
  /// See also:
  /// - [SDL_GetRenderer - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetRenderer)
  ///
  /// {@category render}
  Pointer<SdlRenderer> getRenderer() => sdlGetRenderer(this);
}
