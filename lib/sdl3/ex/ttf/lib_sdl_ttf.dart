part of '../../sdl_ttf.dart';

///
/// Calculate the dimensions of a rendered string of UTF-8 text.
///
/// This will report the width and height, in pixels, of the space that the
/// specified string will take to fully render.
///
/// \param font the font to query.
/// \param text text to calculate, in UTF-8 encoding.
/// \param length the length of the text, in bytes, or 0 for null terminated
/// text.
/// \param w will be filled with width, in pixels, on return.
/// \param h will be filled with height, in pixels, on return.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL TTF_GetStringSize(TTF_Font *font, const char *text, size_t length, int *w, int *h)
/// ```
/// {@category ttf}
bool ttfxGetStringSize(Pointer<TtfFont> font, String? text, SdlxPoint size) {
  final wPointer = ffi.calloc<Int32>();
  final hPointer = ffi.calloc<Int32>();
  final result = ttfGetStringSize(font, text, wPointer, hPointer);
  if (result) {
    size
      ..x = wPointer.value
      ..y = hPointer.value;
  }
  ffi.calloc.free(wPointer);
  ffi.calloc.free(hPointer);
  return result;
}

///
/// Calculate the dimensions of a rendered string of UTF-8 text.
///
/// This will report the width and height, in pixels, of the space that the
/// specified string will take to fully render.
///
/// Text is wrapped to multiple lines on line endings and on word boundaries if
/// it extends beyond `wrap_width` in pixels.
///
/// If wrap_width is 0, this function will only wrap on newline characters.
///
/// \param font the font to query.
/// \param text text to calculate, in UTF-8 encoding.
/// \param length the length of the text, in bytes, or 0 for null terminated
/// text.
/// \param wrap_width the maximum width or 0 to wrap on newline characters.
/// \param w will be filled with width, in pixels, on return.
/// \param h will be filled with height, in pixels, on return.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL TTF_GetStringSizeWrapped(TTF_Font *font, const char *text, size_t length, int wrap_width, int *w, int *h)
/// ```
/// {@category ttf}
bool ttfxGetStringSizeWrapped(
  Pointer<TtfFont> font,
  String? text,
  int wrapWidth,
  SdlxPoint size,
) {
  final wPointer = ffi.calloc<Int32>();
  final hPointer = ffi.calloc<Int32>();
  final result = ttfGetStringSizeWrapped(
    font,
    text,
    wrapWidth,
    wPointer,
    hPointer,
  );
  if (result) {
    size
      ..x = wPointer.value
      ..y = hPointer.value;
  }
  ffi.calloc.free(wPointer);
  ffi.calloc.free(hPointer);
  return result;
}

///
/// Calculate how much of a UTF-8 string will fit in a given width.
///
/// This reports the number of characters that can be rendered before reaching
/// `max_width`.
///
/// This does not need to render the string to do this calculation.
///
/// \param font the font to query.
/// \param text text to calculate, in UTF-8 encoding.
/// \param length the length of the text, in bytes, or 0 for null terminated
/// text.
/// \param max_width maximum width, in pixels, available for the string, or 0
/// for unbounded width.
/// \param measured_width a pointer filled in with the width, in pixels, of the
/// string that will fit, may be NULL.
/// \param measured_length a pointer filled in with the length, in bytes, of
/// the string that will fit, may be NULL.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL TTF_MeasureString(TTF_Font *font, const char *text, size_t length, int max_width, int *measured_width, size_t *measured_length)
/// ```
/// {@category ttf}
bool ttfxMeasureString(
  Pointer<TtfFont> font,
  String? text,
  int maxWidth,
  SdlxPoint measured,
) {
  final measuredWidthPointer = ffi.calloc<Int32>();
  final measuredLengthPointer = ffi.calloc<Size>();
  final result = ttfMeasureString(
    font,
    text,
    maxWidth,
    measuredWidthPointer,
    measuredLengthPointer,
  );
  if (result) {
    measured
      ..x = measuredWidthPointer.value
      ..y = measuredLengthPointer.value;
  }
  ffi.calloc.free(measuredWidthPointer);
  ffi.calloc.free(measuredLengthPointer);
  return result;
}

///
/// Render UTF-8 text at fast quality to a new 8-bit surface.
///
/// This function will allocate a new 8-bit, palettized surface. The surface's
/// 0 pixel will be the colorkey, giving a transparent background. The 1 pixel
/// will be set to the text color.
///
/// This will not word-wrap the string; you'll get a surface with a single line
/// of text, as long as the string requires. You can use
/// TTF_RenderText_Solid_Wrapped() instead if you need to wrap the output to
/// multiple lines.
///
/// This will not wrap on newline characters.
///
/// You can render at other quality levels with TTF_RenderText_Shaded,
/// TTF_RenderText_Blended, and TTF_RenderText_LCD.
///
/// \param font the font to render with.
/// \param text text to render, in UTF-8 encoding.
/// \param length the length of the text, in bytes, or 0 for null terminated
/// text.
/// \param fg the foreground color for the text.
/// \returns a new 8-bit, palettized surface, or NULL if there was an error.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_RenderText_Blended
/// \sa TTF_RenderText_LCD
/// \sa TTF_RenderText_Shaded
/// \sa TTF_RenderText_Solid
/// \sa TTF_RenderText_Solid_Wrapped
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderText_Solid(TTF_Font *font, const char *text, size_t length, SDL_Color fg)
/// ```
/// {@category ttf}
Pointer<SdlSurface> ttfxRenderTextSolid(
  Pointer<TtfFont> font,
  String? text,
  SdlxColor fg,
) {
  final fgPointer = fg.calloc();
  final surface = ttfRenderTextSolid(font, text, fgPointer.ref);
  ffi.calloc.free(fgPointer);
  return surface;
}

///
/// Render word-wrapped UTF-8 text at fast quality to a new 8-bit surface.
///
/// This function will allocate a new 8-bit, palettized surface. The surface's
/// 0 pixel will be the colorkey, giving a transparent background. The 1 pixel
/// will be set to the text color.
///
/// Text is wrapped to multiple lines on line endings and on word boundaries if
/// it extends beyond `wrapLength` in pixels.
///
/// If wrapLength is 0, this function will only wrap on newline characters.
///
/// You can render at other quality levels with TTF_RenderText_Shaded_Wrapped,
/// TTF_RenderText_Blended_Wrapped, and TTF_RenderText_LCD_Wrapped.
///
/// \param font the font to render with.
/// \param text text to render, in UTF-8 encoding.
/// \param length the length of the text, in bytes, or 0 for null terminated
/// text.
/// \param fg the foreground color for the text.
/// \param wrapLength the maximum width of the text surface or 0 to wrap on
/// newline characters.
/// \returns a new 8-bit, palettized surface, or NULL if there was an error.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_RenderText_Blended_Wrapped
/// \sa TTF_RenderText_LCD_Wrapped
/// \sa TTF_RenderText_Shaded_Wrapped
/// \sa TTF_RenderText_Solid
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderText_Solid_Wrapped(TTF_Font *font, const char *text, size_t length, SDL_Color fg, int wrapLength)
/// ```
/// {@category ttf}
Pointer<SdlSurface> ttfxRenderTextSolidWrapped(
  Pointer<TtfFont> font,
  String? text,
  SdlxColor fg,
  int wrapLength,
) {
  final fgPointer = fg.calloc();
  final surface = ttfRenderTextSolidWrapped(
    font,
    text,
    fgPointer.ref,
    wrapLength,
  );
  ffi.calloc.free(fgPointer);
  return surface;
}

///
/// Render a single 32-bit glyph at fast quality to a new 8-bit surface.
///
/// This function will allocate a new 8-bit, palettized surface. The surface's
/// 0 pixel will be the colorkey, giving a transparent background. The 1 pixel
/// will be set to the text color.
///
/// The glyph is rendered without any padding or centering in the X direction,
/// and aligned normally in the Y direction.
///
/// You can render at other quality levels with TTF_RenderGlyph_Shaded,
/// TTF_RenderGlyph_Blended, and TTF_RenderGlyph_LCD.
///
/// \param font the font to render with.
/// \param ch the character to render.
/// \param fg the foreground color for the text.
/// \returns a new 8-bit, palettized surface, or NULL if there was an error.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_RenderGlyph_Blended
/// \sa TTF_RenderGlyph_LCD
/// \sa TTF_RenderGlyph_Shaded
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderGlyph_Solid(TTF_Font *font, Uint32 ch, SDL_Color fg)
/// ```
/// {@category ttf}
Pointer<SdlSurface> ttfxRenderGlyphSolid(
  Pointer<TtfFont> font,
  int ch,
  SdlxColor fg,
) {
  final fgPointer = fg.calloc();
  final surface = ttfRenderGlyphSolid(font, ch, fgPointer.ref);
  ffi.calloc.free(fgPointer);
  return surface;
}

///
/// Render UTF-8 text at high quality to a new 8-bit surface.
///
/// This function will allocate a new 8-bit, palettized surface. The surface's
/// 0 pixel will be the specified background color, while other pixels have
/// varying degrees of the foreground color. This function returns the new
/// surface, or NULL if there was an error.
///
/// This will not word-wrap the string; you'll get a surface with a single line
/// of text, as long as the string requires. You can use
/// TTF_RenderText_Shaded_Wrapped() instead if you need to wrap the output to
/// multiple lines.
///
/// This will not wrap on newline characters.
///
/// You can render at other quality levels with TTF_RenderText_Solid,
/// TTF_RenderText_Blended, and TTF_RenderText_LCD.
///
/// \param font the font to render with.
/// \param text text to render, in UTF-8 encoding.
/// \param length the length of the text, in bytes, or 0 for null terminated
/// text.
/// \param fg the foreground color for the text.
/// \param bg the background color for the text.
/// \returns a new 8-bit, palettized surface, or NULL if there was an error.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_RenderText_Blended
/// \sa TTF_RenderText_LCD
/// \sa TTF_RenderText_Shaded_Wrapped
/// \sa TTF_RenderText_Solid
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderText_Shaded(TTF_Font *font, const char *text, size_t length, SDL_Color fg, SDL_Color bg)
/// ```
/// {@category ttf}
Pointer<SdlSurface> ttfxRenderTextShaded(
  Pointer<TtfFont> font,
  String? text,
  SdlxColor fg,
  SdlxColor bg,
) {
  final fgPointer = fg.calloc();
  final bgPointer = bg.calloc();
  final surface = ttfRenderTextShaded(font, text, fgPointer.ref, bgPointer.ref);
  ffi.calloc.free(fgPointer);
  ffi.calloc.free(bgPointer);
  return surface;
}

///
/// Render word-wrapped UTF-8 text at high quality to a new 8-bit surface.
///
/// This function will allocate a new 8-bit, palettized surface. The surface's
/// 0 pixel will be the specified background color, while other pixels have
/// varying degrees of the foreground color. This function returns the new
/// surface, or NULL if there was an error.
///
/// Text is wrapped to multiple lines on line endings and on word boundaries if
/// it extends beyond `wrap_width` in pixels.
///
/// If wrap_width is 0, this function will only wrap on newline characters.
///
/// You can render at other quality levels with TTF_RenderText_Solid_Wrapped,
/// TTF_RenderText_Blended_Wrapped, and TTF_RenderText_LCD_Wrapped.
///
/// \param font the font to render with.
/// \param text text to render, in UTF-8 encoding.
/// \param length the length of the text, in bytes, or 0 for null terminated
/// text.
/// \param fg the foreground color for the text.
/// \param bg the background color for the text.
/// \param wrap_width the maximum width of the text surface or 0 to wrap on
/// newline characters.
/// \returns a new 8-bit, palettized surface, or NULL if there was an error.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_RenderText_Blended_Wrapped
/// \sa TTF_RenderText_LCD_Wrapped
/// \sa TTF_RenderText_Shaded
/// \sa TTF_RenderText_Solid_Wrapped
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderText_Shaded_Wrapped(TTF_Font *font, const char *text, size_t length, SDL_Color fg, SDL_Color bg, int wrap_width)
/// ```
/// {@category ttf}
Pointer<SdlSurface> ttfxRenderTextShadedWrapped(
  Pointer<TtfFont> font,
  String? text,
  SdlxColor fg,
  SdlxColor bg,
  int wrapWidth,
) {
  final fgPointer = fg.calloc();
  final bgPointer = bg.calloc();
  final surface = ttfRenderTextShadedWrapped(
    font,
    text,
    fgPointer.ref,
    bgPointer.ref,
    wrapWidth,
  );
  ffi.calloc.free(fgPointer);
  ffi.calloc.free(bgPointer);
  return surface;
}

///
/// Render a single UNICODE codepoint at high quality to a new 8-bit surface.
///
/// This function will allocate a new 8-bit, palettized surface. The surface's
/// 0 pixel will be the specified background color, while other pixels have
/// varying degrees of the foreground color. This function returns the new
/// surface, or NULL if there was an error.
///
/// The glyph is rendered without any padding or centering in the X direction,
/// and aligned normally in the Y direction.
///
/// You can render at other quality levels with TTF_RenderGlyph_Solid,
/// TTF_RenderGlyph_Blended, and TTF_RenderGlyph_LCD.
///
/// \param font the font to render with.
/// \param ch the codepoint to render.
/// \param fg the foreground color for the text.
/// \param bg the background color for the text.
/// \returns a new 8-bit, palettized surface, or NULL if there was an error.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_RenderGlyph_Blended
/// \sa TTF_RenderGlyph_LCD
/// \sa TTF_RenderGlyph_Solid
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderGlyph_Shaded(TTF_Font *font, Uint32 ch, SDL_Color fg, SDL_Color bg)
/// ```
/// {@category ttf}
Pointer<SdlSurface> ttfxRenderGlyphShaded(
  Pointer<TtfFont> font,
  int ch,
  SdlxColor fg,
  SdlxColor bg,
) {
  final fgPointer = fg.calloc();
  final bgPointer = bg.calloc();
  final surface = ttfRenderGlyphShaded(font, ch, fgPointer.ref, bgPointer.ref);
  ffi.calloc.free(fgPointer);
  ffi.calloc.free(bgPointer);
  return surface;
}

///
/// Render UTF-8 text at high quality to a new ARGB surface.
///
/// This function will allocate a new 32-bit, ARGB surface, using alpha
/// blending to dither the font with the given color. This function returns the
/// new surface, or NULL if there was an error.
///
/// This will not word-wrap the string; you'll get a surface with a single line
/// of text, as long as the string requires. You can use
/// TTF_RenderText_Blended_Wrapped() instead if you need to wrap the output to
/// multiple lines.
///
/// This will not wrap on newline characters.
///
/// You can render at other quality levels with TTF_RenderText_Solid,
/// TTF_RenderText_Shaded, and TTF_RenderText_LCD.
///
/// \param font the font to render with.
/// \param text text to render, in UTF-8 encoding.
/// \param length the length of the text, in bytes, or 0 for null terminated
/// text.
/// \param fg the foreground color for the text.
/// \returns a new 32-bit, ARGB surface, or NULL if there was an error.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_RenderText_Blended_Wrapped
/// \sa TTF_RenderText_LCD
/// \sa TTF_RenderText_Shaded
/// \sa TTF_RenderText_Solid
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderText_Blended(TTF_Font *font, const char *text, size_t length, SDL_Color fg)
/// ```
/// {@category ttf}
Pointer<SdlSurface> ttfxRenderTextBlended(
  Pointer<TtfFont> font,
  String? text,
  SdlxColor fg,
) {
  final fgPointer = fg.calloc();
  final surface = ttfRenderTextBlended(font, text, fgPointer.ref);
  ffi.calloc.free(fgPointer);
  return surface;
}

///
/// Render word-wrapped UTF-8 text at high quality to a new ARGB surface.
///
/// This function will allocate a new 32-bit, ARGB surface, using alpha
/// blending to dither the font with the given color. This function returns the
/// new surface, or NULL if there was an error.
///
/// Text is wrapped to multiple lines on line endings and on word boundaries if
/// it extends beyond `wrap_width` in pixels.
///
/// If wrap_width is 0, this function will only wrap on newline characters.
///
/// You can render at other quality levels with TTF_RenderText_Solid_Wrapped,
/// TTF_RenderText_Shaded_Wrapped, and TTF_RenderText_LCD_Wrapped.
///
/// \param font the font to render with.
/// \param text text to render, in UTF-8 encoding.
/// \param length the length of the text, in bytes, or 0 for null terminated
/// text.
/// \param fg the foreground color for the text.
/// \param wrap_width the maximum width of the text surface or 0 to wrap on
/// newline characters.
/// \returns a new 32-bit, ARGB surface, or NULL if there was an error.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_RenderText_Blended
/// \sa TTF_RenderText_LCD_Wrapped
/// \sa TTF_RenderText_Shaded_Wrapped
/// \sa TTF_RenderText_Solid_Wrapped
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderText_Blended_Wrapped(TTF_Font *font, const char *text, size_t length, SDL_Color fg, int wrap_width)
/// ```
/// {@category ttf}
Pointer<SdlSurface> ttfxRenderTextBlendedWrapped(
  Pointer<TtfFont> font,
  String? text,
  SdlxColor fg,
  int wrapWidth,
) {
  final fgPointer = fg.calloc();
  final surface = ttfRenderTextBlendedWrapped(
    font,
    text,
    fgPointer.ref,
    wrapWidth,
  );
  ffi.calloc.free(fgPointer);
  return surface;
}

///
/// Render a single UNICODE codepoint at high quality to a new ARGB surface.
///
/// This function will allocate a new 32-bit, ARGB surface, using alpha
/// blending to dither the font with the given color. This function returns the
/// new surface, or NULL if there was an error.
///
/// The glyph is rendered without any padding or centering in the X direction,
/// and aligned normally in the Y direction.
///
/// You can render at other quality levels with TTF_RenderGlyph_Solid,
/// TTF_RenderGlyph_Shaded, and TTF_RenderGlyph_LCD.
///
/// \param font the font to render with.
/// \param ch the codepoint to render.
/// \param fg the foreground color for the text.
/// \returns a new 32-bit, ARGB surface, or NULL if there was an error.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_RenderGlyph_LCD
/// \sa TTF_RenderGlyph_Shaded
/// \sa TTF_RenderGlyph_Solid
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderGlyph_Blended(TTF_Font *font, Uint32 ch, SDL_Color fg)
/// ```
/// {@category ttf}
Pointer<SdlSurface> ttfxRenderGlyphBlended(
  Pointer<TtfFont> font,
  int ch,
  SdlxColor fg,
) {
  final fgPointer = fg.calloc();
  final surface = ttfRenderGlyphBlended(font, ch, fgPointer.ref);
  ffi.calloc.free(fgPointer);
  return surface;
}

///
/// Render UTF-8 text at LCD subpixel quality to a new ARGB surface.
///
/// This function will allocate a new 32-bit, ARGB surface, and render
/// alpha-blended text using FreeType's LCD subpixel rendering. This function
/// returns the new surface, or NULL if there was an error.
///
/// This will not word-wrap the string; you'll get a surface with a single line
/// of text, as long as the string requires. You can use
/// TTF_RenderText_LCD_Wrapped() instead if you need to wrap the output to
/// multiple lines.
///
/// This will not wrap on newline characters.
///
/// You can render at other quality levels with TTF_RenderText_Solid,
/// TTF_RenderText_Shaded, and TTF_RenderText_Blended.
///
/// \param font the font to render with.
/// \param text text to render, in UTF-8 encoding.
/// \param length the length of the text, in bytes, or 0 for null terminated
/// text.
/// \param fg the foreground color for the text.
/// \param bg the background color for the text.
/// \returns a new 32-bit, ARGB surface, or NULL if there was an error.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_RenderText_Blended
/// \sa TTF_RenderText_LCD_Wrapped
/// \sa TTF_RenderText_Shaded
/// \sa TTF_RenderText_Solid
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderText_LCD(TTF_Font *font, const char *text, size_t length, SDL_Color fg, SDL_Color bg)
/// ```
/// {@category ttf}
Pointer<SdlSurface> ttfxRenderTextLcd(
  Pointer<TtfFont> font,
  String? text,
  SdlxColor fg,
  SdlxColor bg,
) {
  final fgPointer = fg.calloc();
  final bgPointer = bg.calloc();
  final surface = ttfRenderTextLcd(font, text, fgPointer.ref, bgPointer.ref);
  ffi.calloc.free(fgPointer);
  ffi.calloc.free(bgPointer);
  return surface;
}

///
/// Render word-wrapped UTF-8 text at LCD subpixel quality to a new ARGB
/// surface.
///
/// This function will allocate a new 32-bit, ARGB surface, and render
/// alpha-blended text using FreeType's LCD subpixel rendering. This function
/// returns the new surface, or NULL if there was an error.
///
/// Text is wrapped to multiple lines on line endings and on word boundaries if
/// it extends beyond `wrap_width` in pixels.
///
/// If wrap_width is 0, this function will only wrap on newline characters.
///
/// You can render at other quality levels with TTF_RenderText_Solid_Wrapped,
/// TTF_RenderText_Shaded_Wrapped, and TTF_RenderText_Blended_Wrapped.
///
/// \param font the font to render with.
/// \param text text to render, in UTF-8 encoding.
/// \param length the length of the text, in bytes, or 0 for null terminated
/// text.
/// \param fg the foreground color for the text.
/// \param bg the background color for the text.
/// \param wrap_width the maximum width of the text surface or 0 to wrap on
/// newline characters.
/// \returns a new 32-bit, ARGB surface, or NULL if there was an error.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_RenderText_Blended_Wrapped
/// \sa TTF_RenderText_LCD
/// \sa TTF_RenderText_Shaded_Wrapped
/// \sa TTF_RenderText_Solid_Wrapped
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderText_LCD_Wrapped(TTF_Font *font, const char *text, size_t length, SDL_Color fg, SDL_Color bg, int wrap_width)
/// ```
/// {@category ttf}
Pointer<SdlSurface> ttfxRenderTextLcdWrapped(
  Pointer<TtfFont> font,
  String? text,
  SdlxColor fg,
  SdlxColor bg,
  int wrapWidth,
) {
  final fgPointer = fg.calloc();
  final bgPointer = bg.calloc();
  final surface = ttfRenderTextLcdWrapped(
    font,
    text,
    fgPointer.ref,
    bgPointer.ref,
    wrapWidth,
  );
  ffi.calloc.free(fgPointer);
  ffi.calloc.free(bgPointer);
  return surface;
}

///
/// Render a single UNICODE codepoint at LCD subpixel quality to a new ARGB
/// surface.
///
/// This function will allocate a new 32-bit, ARGB surface, and render
/// alpha-blended text using FreeType's LCD subpixel rendering. This function
/// returns the new surface, or NULL if there was an error.
///
/// The glyph is rendered without any padding or centering in the X direction,
/// and aligned normally in the Y direction.
///
/// You can render at other quality levels with TTF_RenderGlyph_Solid,
/// TTF_RenderGlyph_Shaded, and TTF_RenderGlyph_Blended.
///
/// \param font the font to render with.
/// \param ch the codepoint to render.
/// \param fg the foreground color for the text.
/// \param bg the background color for the text.
/// \returns a new 32-bit, ARGB surface, or NULL if there was an error.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_RenderGlyph_Blended
/// \sa TTF_RenderGlyph_Shaded
/// \sa TTF_RenderGlyph_Solid
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderGlyph_LCD(TTF_Font *font, Uint32 ch, SDL_Color fg, SDL_Color bg)
/// ```
/// {@category ttf}
Pointer<SdlSurface> ttfxRenderGlyphLcd(
  Pointer<TtfFont> font,
  int ch,
  SdlxColor fg,
  SdlxColor bg,
) {
  final fgPointer = fg.calloc();
  final bgPointer = bg.calloc();
  final surface = ttfRenderGlyphLcd(font, ch, fgPointer.ref, bgPointer.ref);
  ffi.calloc.free(fgPointer);
  ffi.calloc.free(bgPointer);
  return surface;
}
