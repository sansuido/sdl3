part of '../../sdl_ttf.dart';

extension TtfTextEnginePointerEx on Pointer<TtfTextEngine> {
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL TTF_DestroySurfaceTextEngine(TTF_TextEngine *engine)
  /// ```
  void destroySurface() => ttfDestroySurfaceTextEngine(this);

  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL TTF_DestroyRendererTextEngine(TTF_TextEngine *engine)
  /// ```
  void destroyRenderer() => ttfDestroyRendererTextEngine(this);

  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL TTF_DestroyGPUTextEngine(TTF_TextEngine *engine)
  /// ```
  void destroyGpu() => ttfDestroyGpuTextEngine(this);

  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL TTF_SetGPUTextEngineWinding(TTF_TextEngine *engine, TTF_GPUTextEngineWinding winding)
  /// ```
  void setGpuWinding(int winding) => ttfSetGpuTextEngineWinding(this, winding);

  /// ```c
  /// extern SDL_DECLSPEC TTF_GPUTextEngineWinding SDLCALL TTF_GetGPUTextEngineWinding(const TTF_TextEngine *engine)
  /// ```
  int getGpuWinding() => ttfGetGpuTextEngineWinding(this);

  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL TTF_DestroyGLTextEngine(TTF_TextEngine *engine)
  /// ```
  void destroyGl() => ttfDestroyGlTextEngine(this);

  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL TTF_SetGLTextEngineWinding(TTF_TextEngine *engine, TTF_GLTextEngineWinding winding)
  /// ```
  void setGlWinding(int winding) => ttfSetGlTextEngineWinding(this, winding);

  /// ```c
  /// extern SDL_DECLSPEC TTF_GLTextEngineWinding SDLCALL TTF_GetGLTextEngineWinding(const TTF_TextEngine *engine)
  /// ```
  int getGlWinding() => ttfGetGlTextEngineWinding(this);

  /// ```c
  /// extern SDL_DECLSPEC TTF_Text * SDLCALL TTF_CreateText(TTF_TextEngine *engine, TTF_Font *font, const char *text, size_t length)
  /// ```
  Pointer<TtfText> createText(Pointer<TtfFont> font, String text) =>
      ttfCreateText(this, font, text);
}
