part of '../../sdl_ttf.dart';

extension TtfTextEnginePointerEx on Pointer<TtfTextEngine> {
  ///
  /// Destroy a text engine created for drawing text on SDL surfaces.
  ///
  /// All text created by this engine should be destroyed before calling this
  /// function.
  ///
  /// \param engine a TTF_TextEngine object created with
  /// TTF_CreateSurfaceTextEngine().
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// engine.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_CreateSurfaceTextEngine
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL TTF_DestroySurfaceTextEngine(TTF_TextEngine *engine)
  /// ```
  /// {@category ttf}
  void destroySurface() => ttfDestroySurfaceTextEngine(this);

  ///
  /// Destroy a text engine created for drawing text on an SDL renderer.
  ///
  /// All text created by this engine should be destroyed before calling this
  /// function.
  ///
  /// \param engine a TTF_TextEngine object created with
  /// TTF_CreateRendererTextEngine().
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// engine.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_CreateRendererTextEngine
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL TTF_DestroyRendererTextEngine(TTF_TextEngine *engine)
  /// ```
  /// {@category ttf}
  void destroyRenderer() => ttfDestroyRendererTextEngine(this);

  ///
  /// Destroy a text engine created for drawing text with the SDL GPU API.
  ///
  /// All text created by this engine should be destroyed before calling this
  /// function.
  ///
  /// \param engine a TTF_TextEngine object created with
  /// TTF_CreateGPUTextEngine().
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// engine.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_CreateGPUTextEngine
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL TTF_DestroyGPUTextEngine(TTF_TextEngine *engine)
  /// ```
  /// {@category ttf}
  void destroyGpu() => ttfDestroyGpuTextEngine(this);

  ///
  /// Sets the winding order of the vertices returned by TTF_GetGPUTextDrawData
  /// for a particular GPU text engine.
  ///
  /// \param engine a TTF_TextEngine object created with
  /// TTF_CreateGPUTextEngine().
  /// \param winding the new winding order option.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// engine.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_GetGPUTextEngineWinding
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL TTF_SetGPUTextEngineWinding(TTF_TextEngine *engine, TTF_GPUTextEngineWinding winding)
  /// ```
  /// {@category ttf}
  void setGpuWinding(int winding) => ttfSetGpuTextEngineWinding(this, winding);

  ///
  /// Get the winding order of the vertices returned by TTF_GetGPUTextDrawData
  /// for a particular GPU text engine
  ///
  /// \param engine a TTF_TextEngine object created with
  /// TTF_CreateGPUTextEngine().
  /// \returns the winding order used by the GPU text engine or
  /// TTF_GPU_TEXTENGINE_WINDING_INVALID in case of error.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// engine.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_SetGPUTextEngineWinding
  ///
  /// ```c
  /// extern SDL_DECLSPEC TTF_GPUTextEngineWinding SDLCALL TTF_GetGPUTextEngineWinding(const TTF_TextEngine *engine)
  /// ```
  /// {@category ttf}
  int getGpuWinding() => ttfGetGpuTextEngineWinding(this);

  ///
  /// Destroy a text engine created for drawing text with OpenGL.
  ///
  /// All text created by this engine should be destroyed before calling this
  /// function.
  ///
  /// \param engine a TTF_TextEngine object created with
  /// TTF_CreateGLTextEngine().
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// engine.
  ///
  /// \since This function is available since SDL_ttf 3.3.0.
  ///
  /// \sa TTF_CreateGLTextEngine
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL TTF_DestroyGLTextEngine(TTF_TextEngine *engine)
  /// ```
  /// {@category ttf}
  void destroyGl() => ttfDestroyGlTextEngine(this);

  ///
  /// Sets the winding order of the vertices returned by TTF_GetGLTextDrawData
  /// for a particular GL text engine.
  ///
  /// \param engine a TTF_TextEngine object created with
  /// TTF_CreateGLTextEngine().
  /// \param winding the new winding order option.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// engine.
  ///
  /// \since This function is available since SDL_ttf 3.3.0.
  ///
  /// \sa TTF_GetGLTextEngineWinding
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL TTF_SetGLTextEngineWinding(TTF_TextEngine *engine, TTF_GLTextEngineWinding winding)
  /// ```
  /// {@category ttf}
  void setGlWinding(int winding) => ttfSetGlTextEngineWinding(this, winding);

  ///
  /// Get the winding order of the vertices returned by TTF_GetGLTextDrawData for
  /// a particular GL text engine.
  ///
  /// \param engine a TTF_TextEngine object created with
  /// TTF_CreateGLTextEngine().
  /// \returns the winding order used by the GL text engine or
  /// TTF_GL_TEXTENGINE_WINDING_INVALID in case of error.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// engine.
  ///
  /// \since This function is available since SDL_ttf 3.3.0.
  ///
  /// \sa TTF_SetGLTextEngineWinding
  ///
  /// ```c
  /// extern SDL_DECLSPEC TTF_GLTextEngineWinding SDLCALL TTF_GetGLTextEngineWinding(const TTF_TextEngine *engine)
  /// ```
  /// {@category ttf}
  int getGlWinding() => ttfGetGlTextEngineWinding(this);

  ///
  /// Create a text object from UTF-8 text and a text engine.
  ///
  /// \param engine the text engine to use when creating the text object, may be
  /// NULL.
  /// \param font the font to render with.
  /// \param text the text to use, in UTF-8 encoding.
  /// \param length the length of the text, in bytes, or 0 for null terminated
  /// text.
  /// \returns a TTF_Text object or NULL on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// font and text engine.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_DestroyText
  ///
  /// ```c
  /// extern SDL_DECLSPEC TTF_Text * SDLCALL TTF_CreateText(TTF_TextEngine *engine, TTF_Font *font, const char *text, size_t length)
  /// ```
  /// {@category ttf}
  Pointer<TtfText> createText(Pointer<TtfFont> font, String text) =>
      ttfCreateText(this, font, text);
}
