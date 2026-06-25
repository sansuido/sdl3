part of '../../sdl_ttf.dart';

extension TtfTextPointerEx on Pointer<TtfText> {
  ///
  /// Draw text to an SDL surface.
  ///
  /// `text` must have been created using a TTF_TextEngine from
  /// TTF_CreateSurfaceTextEngine().
  ///
  /// \param text the text to draw.
  /// \param x the x coordinate in pixels, positive from the left edge towards
  /// the right.
  /// \param y the y coordinate in pixels, positive from the top edge towards the
  /// bottom.
  /// \param surface the surface to draw on.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_CreateSurfaceTextEngine
  /// \sa TTF_CreateText
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL TTF_DrawSurfaceText(TTF_Text *text, int x, int y, SDL_Surface *surface)
  /// ```
  /// {@category ttf}
  bool drawSurface(int x, int y, Pointer<SdlSurface> surface) =>
      ttfDrawSurfaceText(this, x, y, surface);

  ///
  /// Draw text to an SDL renderer.
  ///
  /// `text` must have been created using a TTF_TextEngine from
  /// TTF_CreateRendererTextEngine(), and will draw using the renderer passed to
  /// that function.
  ///
  /// \param text the text to draw.
  /// \param x the x coordinate in pixels, positive from the left edge towards
  /// the right.
  /// \param y the y coordinate in pixels, positive from the top edge towards the
  /// bottom.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_CreateRendererTextEngine
  /// \sa TTF_CreateText
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL TTF_DrawRendererText(TTF_Text *text, float x, float y)
  /// ```
  /// {@category ttf}
  bool drawRenderer(double x, double y) => ttfDrawRendererText(this, x, y);

  ///
  /// Get the geometry data needed for drawing the text.
  ///
  /// `text` must have been created using a TTF_TextEngine from
  /// TTF_CreateGPUTextEngine().
  ///
  /// The positive X-axis is taken towards the right and the positive Y-axis is
  /// taken upwards for both the vertex and the texture coordinates, i.e, it
  /// follows the same convention used by the SDL_GPU API. If you want to use a
  /// different coordinate system you will need to transform the vertices
  /// yourself.
  ///
  /// If the text looks blocky use linear filtering.
  ///
  /// \param text the text to draw.
  /// \returns a NULL terminated linked list of TTF_GPUAtlasDrawSequence objects
  /// or NULL if the passed text is empty or in case of failure; call
  /// SDL_GetError() for more information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_CreateGPUTextEngine
  /// \sa TTF_CreateText
  ///
  /// ```c
  /// extern SDL_DECLSPEC TTF_GPUAtlasDrawSequence * SDLCALL TTF_GetGPUTextDrawData(TTF_Text *text)
  /// ```
  /// {@category ttf}
  Pointer<TtfGpuAtlasDrawSequence> getGpuDrawData() =>
      ttfGetGpuTextDrawData(this);

  ///
  /// Get the geometry data needed for drawing the text.
  ///
  /// `text` must have been created using a TTF_TextEngine from
  /// TTF_CreateGLTextEngine().
  ///
  /// The positive X-axis is taken towards the right and the positive Y-axis is
  /// taken upwards for both the vertex and the texture coordinates, i.e, it
  /// follows the same convention used by the OpenGL API. If you want to use a
  /// different coordinate system you will need to transform the vertices
  /// yourself.
  ///
  /// If the text looks blocky use linear filtering.
  ///
  /// \param text the text to draw.
  /// \returns a NULL terminated linked list of TTF_GLAtlasDrawSequence objects
  /// or NULL if the passed text is empty or in case of failure; call
  /// SDL_GetError() for more information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.3.0.
  ///
  /// \sa TTF_CreateGLTextEngine
  /// \sa TTF_CreateText
  ///
  /// ```c
  /// extern SDL_DECLSPEC TTF_GLAtlasDrawSequence * SDLCALL TTF_GetGLTextDrawData(TTF_Text *text)
  /// ```
  /// {@category ttf}
  Pointer<TtfGlAtlasDrawSequence> getGlDrawData() => ttfGetGlTextDrawData(this);

  ///
  /// Get the properties associated with a text object.
  ///
  /// \param text the TTF_Text to query.
  /// \returns a valid property ID on success or 0 on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_PropertiesID SDLCALL TTF_GetTextProperties(TTF_Text *text)
  /// ```
  /// {@category ttf}
  int getProperties() => ttfGetTextProperties(this);

  ///
  /// Set the text engine used by a text object.
  ///
  /// This function may cause the internal text representation to be rebuilt.
  ///
  /// \param text the TTF_Text to modify.
  /// \param engine the text engine to use for drawing.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_GetTextEngine
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL TTF_SetTextEngine(TTF_Text *text, TTF_TextEngine *engine)
  /// ```
  /// {@category ttf}
  bool setEngine(Pointer<TtfTextEngine> engine) =>
      ttfSetTextEngine(this, engine);

  ///
  /// Get the text engine used by a text object.
  ///
  /// \param text the TTF_Text to query.
  /// \returns the TTF_TextEngine used by the text on success or NULL on failure;
  /// call SDL_GetError() for more information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_SetTextEngine
  ///
  /// ```c
  /// extern SDL_DECLSPEC TTF_TextEngine * SDLCALL TTF_GetTextEngine(TTF_Text *text)
  /// ```
  /// {@category ttf}
  Pointer<TtfTextEngine> getEngine() => ttfGetTextEngine(this);

  ///
  /// Set the font used by a text object.
  ///
  /// When a text object has a font, any changes to the font will automatically
  /// regenerate the text. If you set the font to NULL, the text will continue to
  /// render but changes to the font will no longer affect the text.
  ///
  /// This function may cause the internal text representation to be rebuilt.
  ///
  /// \param text the TTF_Text to modify.
  /// \param font the font to use, may be NULL.
  /// \returns false if the text pointer is null; otherwise, true. call
  /// SDL_GetError() for more information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_GetTextFont
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL TTF_SetTextFont(TTF_Text *text, TTF_Font *font)
  /// ```
  /// {@category ttf}
  bool setFont(Pointer<TtfFont> font) => ttfSetTextFont(this, font);

  ///
  /// Get the font used by a text object.
  ///
  /// \param text the TTF_Text to query.
  /// \returns the TTF_Font used by the text on success or NULL on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_SetTextFont
  ///
  /// ```c
  /// extern SDL_DECLSPEC TTF_Font * SDLCALL TTF_GetTextFont(TTF_Text *text)
  /// ```
  /// {@category ttf}
  Pointer<TtfFont> getFont() => ttfGetTextFont(this);

  ///
  /// Set the direction to be used for text shaping a text object.
  ///
  /// This function only supports left-to-right text shaping if SDL_ttf was not
  /// built with HarfBuzz support.
  ///
  /// \param text the text to modify.
  /// \param direction the new direction for text to flow.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL TTF_SetTextDirection(TTF_Text *text, TTF_Direction direction)
  /// ```
  /// {@category ttf}
  bool setDirection(int direction) => ttfSetTextDirection(this, direction);

  ///
  /// Get the direction to be used for text shaping a text object.
  ///
  /// This defaults to the direction of the font used by the text object.
  ///
  /// \param text the text to query.
  /// \returns the direction to be used for text shaping.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC TTF_Direction SDLCALL TTF_GetTextDirection(TTF_Text *text)
  /// ```
  /// {@category ttf}
  int getDirection() => ttfGetTextDirection(this);

  ///
  /// Set the script to be used for text shaping a text object.
  ///
  /// This returns false if SDL_ttf isn't built with HarfBuzz support.
  ///
  /// \param text the text to modify.
  /// \param script an
  /// [ISO 15924 code](https://unicode.org/iso15924/iso15924-codes.html)
  /// .
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_StringToTag
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL TTF_SetTextScript(TTF_Text *text, Uint32 script)
  /// ```
  /// {@category ttf}
  bool setScript(int script) => ttfSetTextScript(this, script);

  ///
  /// Get the script used for text shaping a text object.
  ///
  /// This defaults to the script of the font used by the text object.
  ///
  /// \param text the text to query.
  /// \returns an
  /// [ISO 15924 code](https://unicode.org/iso15924/iso15924-codes.html)
  /// or 0 if a script hasn't been set on either the text object or the
  /// font.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_TagToString
  ///
  /// ```c
  /// extern SDL_DECLSPEC Uint32 SDLCALL TTF_GetTextScript(TTF_Text *text)
  /// ```
  /// {@category ttf}
  int getScript() => ttfGetTextScript(this);

  ///
  /// Set the color of a text object.
  ///
  /// The default text color is white (255, 255, 255, 255).
  ///
  /// \param text the TTF_Text to modify.
  /// \param r the red color value in the range of 0-255.
  /// \param g the green color value in the range of 0-255.
  /// \param b the blue color value in the range of 0-255.
  /// \param a the alpha value in the range of 0-255.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_GetTextColor
  /// \sa TTF_SetTextColorFloat
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL TTF_SetTextColor(TTF_Text *text, Uint8 r, Uint8 g, Uint8 b, Uint8 a)
  /// ```
  /// {@category ttf}
  bool setColor(SdlxColor color) => ttfxSetTextColor(this, color);

  ///
  /// Set the color of a text object.
  ///
  /// The default text color is white (1.0f, 1.0f, 1.0f, 1.0f).
  ///
  /// \param text the TTF_Text to modify.
  /// \param r the red color value, normally in the range of 0-1.
  /// \param g the green color value, normally in the range of 0-1.
  /// \param b the blue color value, normally in the range of 0-1.
  /// \param a the alpha value in the range of 0-1.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_GetTextColorFloat
  /// \sa TTF_SetTextColor
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL TTF_SetTextColorFloat(TTF_Text *text, float r, float g, float b, float a)
  /// ```
  /// {@category ttf}
  bool setColorFloat(SdlxFColor color) => ttfxSetTextColorFloat(this, color);

  ///
  /// Get the color of a text object.
  ///
  /// \param text the TTF_Text to query.
  /// \param r a pointer filled in with the red color value in the range of
  /// 0-255, may be NULL.
  /// \param g a pointer filled in with the green color value in the range of
  /// 0-255, may be NULL.
  /// \param b a pointer filled in with the blue color value in the range of
  /// 0-255, may be NULL.
  /// \param a a pointer filled in with the alpha value in the range of 0-255,
  /// may be NULL.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_GetTextColorFloat
  /// \sa TTF_SetTextColor
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL TTF_GetTextColor(TTF_Text *text, Uint8 *r, Uint8 *g, Uint8 *b, Uint8 *a)
  /// ```
  /// {@category ttf}
  SdlxColor? getColor() => ttfxGetTextColor(this);

  ///
  /// Get the color of a text object.
  ///
  /// \param text the TTF_Text to query.
  /// \param r a pointer filled in with the red color value, normally in the
  /// range of 0-1, may be NULL.
  /// \param g a pointer filled in with the green color value, normally in the
  /// range of 0-1, may be NULL.
  /// \param b a pointer filled in with the blue color value, normally in the
  /// range of 0-1, may be NULL.
  /// \param a a pointer filled in with the alpha value in the range of 0-1, may
  /// be NULL.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_GetTextColor
  /// \sa TTF_SetTextColorFloat
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL TTF_GetTextColorFloat(TTF_Text *text, float *r, float *g, float *b, float *a)
  /// ```
  /// {@category ttf}
  SdlxFColor? getColorFloat() => ttfxGetTextColorFloat(this);

  ///
  /// Set the position of a text object.
  ///
  /// This can be used to position multiple text objects within a single wrapping
  /// text area.
  ///
  /// This function may cause the internal text representation to be rebuilt.
  ///
  /// \param text the TTF_Text to modify.
  /// \param x the x offset of the upper left corner of this text in pixels.
  /// \param y the y offset of the upper left corner of this text in pixels.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_GetTextPosition
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL TTF_SetTextPosition(TTF_Text *text, int x, int y)
  /// ```
  /// {@category ttf}
  bool setPosition(SdlxPoint position) => ttfxSetTextPosition(this, position);

  ///
  /// Get the position of a text object.
  ///
  /// \param text the TTF_Text to query.
  /// \param x a pointer filled in with the x offset of the upper left corner of
  /// this text in pixels, may be NULL.
  /// \param y a pointer filled in with the y offset of the upper left corner of
  /// this text in pixels, may be NULL.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_SetTextPosition
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL TTF_GetTextPosition(TTF_Text *text, int *x, int *y)
  /// ```
  /// {@category ttf}
  SdlxPoint? getPosition() => ttfxGetTextPosition(this);

  ///
  /// Set whether wrapping is enabled on a text object.
  ///
  /// This function may cause the internal text representation to be rebuilt.
  ///
  /// \param text the TTF_Text to modify.
  /// \param wrap_width the maximum width in pixels, 0 to wrap on newline
  /// characters.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_GetTextWrapWidth
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL TTF_SetTextWrapWidth(TTF_Text *text, int wrap_width)
  /// ```
  /// {@category ttf}
  bool setWrapWidth(int wrapWidth) => ttfSetTextWrapWidth(this, wrapWidth);

  ///
  /// Get whether wrapping is enabled on a text object.
  ///
  /// \param text the TTF_Text to query.
  /// \param wrap_width a pointer filled in with the maximum width in pixels or 0
  /// if the text is being wrapped on newline characters.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_SetTextWrapWidth
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL TTF_GetTextWrapWidth(TTF_Text *text, int *wrap_width)
  /// ```
  /// {@category ttf}
  int? getWrapWidth() => ttfxGetTextWrapWidth(this);

  ///
  /// Return whether whitespace is shown when wrapping a text object.
  ///
  /// \param text the TTF_Text to query.
  /// \returns true if whitespace is shown when wrapping text, or false
  /// otherwise.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_SetTextWrapWhitespaceVisible
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL TTF_TextWrapWhitespaceVisible(TTF_Text *text)
  /// ```
  /// {@category ttf}
  bool wrapWhitespaceVisible() => ttfTextWrapWhitespaceVisible(this);

  ///
  /// Set the UTF-8 text used by a text object.
  ///
  /// This function may cause the internal text representation to be rebuilt.
  ///
  /// \param text the TTF_Text to modify.
  /// \param string the UTF-8 text to use, may be NULL.
  /// \param length the length of the text, in bytes, or 0 for null terminated
  /// text.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_AppendTextString
  /// \sa TTF_DeleteTextString
  /// \sa TTF_InsertTextString
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL TTF_SetTextString(TTF_Text *text, const char *string, size_t length)
  /// ```
  /// {@category ttf}
  bool setString(String string) => ttfSetTextString(this, string);

  ///
  /// Insert UTF-8 text into a text object.
  ///
  /// This function may cause the internal text representation to be rebuilt.
  ///
  /// \param text the TTF_Text to modify.
  /// \param offset the offset, in bytes, from the beginning of the string if >=
  /// 0, the offset from the end of the string if < 0. Note that
  /// this does not do UTF-8 validation, so you should only insert
  /// at UTF-8 sequence boundaries.
  /// \param string the UTF-8 text to insert.
  /// \param length the length of the text, in bytes, or 0 for null terminated
  /// text.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_AppendTextString
  /// \sa TTF_DeleteTextString
  /// \sa TTF_SetTextString
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL TTF_InsertTextString(TTF_Text *text, int offset, const char *string, size_t length)
  /// ```
  /// {@category ttf}
  bool insertString(int offset, String string) =>
      ttfInsertTextString(this, offset, string);

  ///
  /// Append UTF-8 text to a text object.
  ///
  /// This function may cause the internal text representation to be rebuilt.
  ///
  /// \param text the TTF_Text to modify.
  /// \param string the UTF-8 text to insert.
  /// \param length the length of the text, in bytes, or 0 for null terminated
  /// text.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_DeleteTextString
  /// \sa TTF_InsertTextString
  /// \sa TTF_SetTextString
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL TTF_AppendTextString(TTF_Text *text, const char *string, size_t length)
  /// ```
  /// {@category ttf}
  bool appendString(String string) => ttfAppendTextString(this, string);

  ///
  /// Delete UTF-8 text from a text object.
  ///
  /// This function may cause the internal text representation to be rebuilt.
  ///
  /// \param text the TTF_Text to modify.
  /// \param offset the offset, in bytes, from the beginning of the string if >=
  /// 0, the offset from the end of the string if < 0. Note that
  /// this does not do UTF-8 validation, so you should only delete
  /// at UTF-8 sequence boundaries.
  /// \param length the length of text to delete, in bytes, or -1 for the
  /// remainder of the string.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_AppendTextString
  /// \sa TTF_InsertTextString
  /// \sa TTF_SetTextString
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL TTF_DeleteTextString(TTF_Text *text, int offset, int length)
  /// ```
  /// {@category ttf}
  bool deleteString(int offset, int length) =>
      ttfDeleteTextString(this, offset, length);

  ///
  /// Get the size of a text object.
  ///
  /// The size of the text may change when the font or font style and size
  /// change.
  ///
  /// \param text the TTF_Text to query.
  /// \param w a pointer filled in with the width of the text, in pixels, may be
  /// NULL.
  /// \param h a pointer filled in with the height of the text, in pixels, may be
  /// NULL.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL TTF_GetTextSize(TTF_Text *text, int *w, int *h)
  /// ```
  /// {@category ttf}
  SdlxPoint? getSize() => ttfxGetTextSize(this);

  ///
  /// Get the substring of a text object that surrounds a text offset.
  ///
  /// If `offset` is less than 0, this will return a zero length substring at the
  /// beginning of the text with the TTF_SUBSTRING_TEXT_START flag set. If
  /// `offset` is greater than or equal to the length of the text string, this
  /// will return a zero length substring at the end of the text with the
  /// TTF_SUBSTRING_TEXT_END flag set.
  ///
  /// \param text the TTF_Text to query.
  /// \param offset a byte offset into the text string.
  /// \param substring a pointer filled in with the substring containing the
  /// offset.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL TTF_GetTextSubString(TTF_Text *text, int offset, TTF_SubString *substring)
  /// ```
  /// {@category ttf}
  TtfxSubString? getSubString(int offset) => ttfxGetTextSubString(this, offset);

  ///
  /// Get the substring of a text object that contains the given line.
  ///
  /// If `line` is less than 0, this will return a zero length substring at the
  /// beginning of the text with the TTF_SUBSTRING_TEXT_START flag set. If `line`
  /// is greater than or equal to `text->num_lines` this will return a zero
  /// length substring at the end of the text with the TTF_SUBSTRING_TEXT_END
  /// flag set.
  ///
  /// \param text the TTF_Text to query.
  /// \param line a zero-based line index, in the range [0 .. text->num_lines-1].
  /// \param substring a pointer filled in with the substring containing the
  /// offset.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL TTF_GetTextSubStringForLine(TTF_Text *text, int line, TTF_SubString *substring)
  /// ```
  /// {@category ttf}
  TtfxSubString? getSubStringForLine(int offset) =>
      ttfxGetTextSubStringForLine(this, offset);

  ///
  /// Get the substrings of a text object that contain a range of text.
  ///
  /// \param text the TTF_Text to query.
  /// \param offset a byte offset into the text string.
  /// \param length the length of the range being queried, in bytes, or -1 for
  /// the remainder of the string.
  /// \param count a pointer filled in with the number of substrings returned,
  /// may be NULL.
  /// \returns a NULL terminated array of substring pointers or NULL on failure;
  /// call SDL_GetError() for more information. This is a single
  /// allocation that should be freed with SDL_free() when it is no
  /// longer needed.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC TTF_SubString ** SDLCALL TTF_GetTextSubStringsForRange(TTF_Text *text, int offset, int length, int *count)
  /// ```
  /// {@category ttf}
  List<TtfxSubString> getSubStringsForRange(int offset, int length) =>
      ttfxGetTextSubStringsForRange(this, offset, length);

  ///
  /// Get the portion of a text string that is closest to a point.
  ///
  /// This will return the closest substring of text to the given point.
  ///
  /// \param text the TTF_Text to query.
  /// \param x the x coordinate relative to the left side of the text, may be
  /// outside the bounds of the text area.
  /// \param y the y coordinate relative to the top side of the text, may be
  /// outside the bounds of the text area.
  /// \param substring a pointer filled in with the closest substring of text to
  /// the given point.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL TTF_GetTextSubStringForPoint(TTF_Text *text, int x, int y, TTF_SubString *substring)
  /// ```
  /// {@category ttf}
  TtfxSubString? getSubStringForPoint(int x, int y) =>
      ttfxGetTextSubStringForPoint(this, x, y);

  ///
  /// Get the previous substring in a text object
  ///
  /// If called at the start of the text, this will return a zero length
  /// substring with the TTF_SUBSTRING_TEXT_START flag set.
  ///
  /// \param text the TTF_Text to query.
  /// \param substring the TTF_SubString to query.
  /// \param previous a pointer filled in with the previous substring in the text
  /// object.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL TTF_GetPreviousTextSubString(TTF_Text *text, const TTF_SubString *substring, TTF_SubString *previous)
  /// ```
  /// {@category ttf}
  TtfxSubString? getPreviousSubString(TtfxSubString substring) =>
      ttfxGetPreviousTextSubString(this, substring);

  ///
  /// Get the next substring in a text object
  ///
  /// If called at the end of the text, this will return a zero length substring
  /// with the TTF_SUBSTRING_TEXT_END flag set.
  ///
  /// \param text the TTF_Text to query.
  /// \param substring the TTF_SubString to query.
  /// \param next a pointer filled in with the next substring.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL TTF_GetNextTextSubString(TTF_Text *text, const TTF_SubString *substring, TTF_SubString *next)
  /// ```
  /// {@category ttf}
  TtfxSubString? getNextSubString(TtfxSubString substring) =>
      ttfxGetNextTextSubString(this, substring);

  ///
  /// Update the layout of a text object.
  ///
  /// This is automatically done when the layout is requested or the text is
  /// rendered, but you can call this if you need more control over the timing of
  /// when the layout and text engine representation are updated.
  ///
  /// \param text the TTF_Text to update.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL TTF_UpdateText(TTF_Text *text)
  /// ```
  /// {@category ttf}
  bool update() => ttfUpdateText(this);

  ///
  /// Destroy a text object created by a text engine.
  ///
  /// \param text the text to destroy.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// text.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_CreateText
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL TTF_DestroyText(TTF_Text *text)
  /// ```
  /// {@category ttf}
  void destroy() => ttfDestroyText(this);
}
