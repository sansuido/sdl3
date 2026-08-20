part of '../../../sdl.dart';

extension SdlRendererPointerFromTtfEx on Pointer<SdlRenderer> {
  ///
  /// Create a text engine for drawing text on an SDL renderer.
  ///
  /// \param renderer the renderer to use for creating textures and drawing text.
  /// \returns a TTF_TextEngine object or NULL on failure; call SDL_GetError()
  /// for more information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// renderer.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_DestroyRendererTextEngine
  /// \sa TTF_DrawRendererText
  /// \sa TTF_CreateRendererTextEngineWithProperties
  ///
  /// ```c
  /// extern SDL_DECLSPEC TTF_TextEngine * SDLCALL TTF_CreateRendererTextEngine(SDL_Renderer *renderer)
  /// ```
  ///
  /// See also:
  /// - [TTF_CreateRendererTextEngine - SDL3 Wiki](https://wiki.libsdl.org/SDL3/TTF_CreateRendererTextEngine)
  ///
  /// {@category ttf}
  Pointer<ttf.TtfTextEngine> createTextEngine() =>
      ttf.ttfCreateRendererTextEngine(this);
}
