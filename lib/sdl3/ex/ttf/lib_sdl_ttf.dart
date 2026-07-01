part of '../../sdl_ttf.dart';

///
/// Query the version of the FreeType library in use.
///
/// TTF_Init() should be called before calling this function.
///
/// \param major to be filled in with the major version number. Can be NULL.
/// \param minor to be filled in with the minor version number. Can be NULL.
/// \param patch to be filled in with the param version number. Can be NULL.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_Init
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL TTF_GetFreeTypeVersion(int *major, int *minor, int *patch)
/// ```
/// {@category ttf}
({int major, int minor, int patch}) ttfxGetFreeTypeVersion() {
  final majorPointer = ffi.calloc<Int32>();
  final minorPointer = ffi.calloc<Int32>();
  final patchPointer = ffi.calloc<Int32>();
  ttfGetFreeTypeVersion(majorPointer, minorPointer, patchPointer);
  final major = majorPointer.value;
  final minor = minorPointer.value;
  final patch = patchPointer.value;
  majorPointer.callocFree();
  minorPointer.callocFree();
  patchPointer.callocFree();
  return (major: major, minor: minor, patch: patch);
}

///
/// Query the version of the HarfBuzz library in use.
///
/// If HarfBuzz is not available, the version reported is 0.0.0.
///
/// \param major to be filled in with the major version number. Can be NULL.
/// \param minor to be filled in with the minor version number. Can be NULL.
/// \param patch to be filled in with the param version number. Can be NULL.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL TTF_GetHarfBuzzVersion(int *major, int *minor, int *patch)
/// ```
/// {@category ttf}
({int major, int minor, int patch}) ttfxGetHarfBuzzVersion() {
  final majorPointer = ffi.calloc<Int32>();
  final minorPointer = ffi.calloc<Int32>();
  final patchPointer = ffi.calloc<Int32>();
  ttfGetHarfBuzzVersion(majorPointer, minorPointer, patchPointer);
  final major = majorPointer.value;
  final minor = minorPointer.value;
  final patch = patchPointer.value;
  majorPointer.callocFree();
  minorPointer.callocFree();
  patchPointer.callocFree();
  return (major: major, minor: minor, patch: patch);
}

///
/// Get font target resolutions, in dots per inch.
///
/// \param font the font to query.
/// \param hdpi a pointer filled in with the target horizontal DPI.
/// \param vdpi a pointer filled in with the target vertical DPI.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_SetFontSizeDPI
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL TTF_GetFontDPI(TTF_Font *font, int *hdpi, int *vdpi)
/// ```
/// {@category ttf}
({int hdpi, int vdpi})? ttfxGetFontDpi(Pointer<TtfFont> font) {
  late int hdpi;
  late int vdpi;
  final hdpiPointer = ffi.calloc<Int32>();
  final vdpiPointer = ffi.calloc<Int32>();
  final result = ttfGetFontDpi(font, hdpiPointer, vdpiPointer);
  if (result) {
    hdpi = hdpiPointer.value;
    vdpi = vdpiPointer.value;
  }
  hdpiPointer.callocFree();
  vdpiPointer.callocFree();
  if (!result) {
    return null;
  }
  return (hdpi: hdpi, vdpi: vdpi);
}

///
/// Get the pixel image for a UNICODE codepoint.
///
/// \param font the font to query.
/// \param ch the codepoint to check.
/// \param image_type a pointer filled in with the glyph image type, may be
/// NULL.
/// \returns an SDL_Surface containing the glyph, or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_GetGlyphImage(TTF_Font *font, Uint32 ch, TTF_ImageType *image_type)
/// ```
/// {@category ttf}
({int imageType, Pointer<SdlSurface> surface})? ttfxGetGlyphImage(
  Pointer<TtfFont> font,
  int ch,
) {
  late int imageType;
  final imageTypePointer = ffi.calloc<Int32>();
  final surface = ttfGetGlyphImage(font, ch, imageTypePointer);
  if (surface != nullptr) {
    imageType = imageTypePointer.value;
  }
  imageTypePointer.callocFree();
  if (surface == nullptr) {
    return null;
  }
  return (surface: surface, imageType: imageType);
}

///
/// Get the pixel image for a character index.
///
/// This is useful for text engine implementations, which can call this with
/// the `glyph_index` in a TTF_CopyOperation
///
/// \param font the font to query.
/// \param glyph_index the index of the glyph to return.
/// \param image_type a pointer filled in with the glyph image type, may be
/// NULL.
/// \returns an SDL_Surface containing the glyph, or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_GetGlyphImageForIndex(TTF_Font *font, Uint32 glyph_index, TTF_ImageType *image_type)
/// ```
/// {@category ttf}
({int imageType, Pointer<SdlSurface> surface})? ttfxGetGlyphImageForIndex(
  Pointer<TtfFont> font,
  int glyphIndex,
) {
  late int imageType;
  final imageTypePointer = ffi.calloc<Int32>();
  final surface = ttfGetGlyphImageForIndex(font, glyphIndex, imageTypePointer);
  if (surface != nullptr) {
    imageType = imageTypePointer.value;
  }
  imageTypePointer.callocFree();
  if (surface == nullptr) {
    return null;
  }
  return (surface: surface, imageType: imageType);
}

///
/// Query the metrics (dimensions) of a font's glyph for a UNICODE codepoint.
///
/// To understand what these metrics mean, here is a useful link:
///
/// https://freetype.sourceforge.net/freetype2/docs/tutorial/step2.html
///
/// \param font the font to query.
/// \param ch the codepoint to check.
/// \param minx a pointer filled in with the minimum x coordinate of the glyph
/// from the left edge of its bounding box. This value may be
/// negative.
/// \param maxx a pointer filled in with the maximum x coordinate of the glyph
/// from the left edge of its bounding box.
/// \param miny a pointer filled in with the minimum y coordinate of the glyph
/// from the bottom edge of its bounding box. This value may be
/// negative.
/// \param maxy a pointer filled in with the maximum y coordinate of the glyph
/// from the bottom edge of its bounding box.
/// \param advance a pointer filled in with the distance to the next glyph from
/// the left edge of this glyph's bounding box.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL TTF_GetGlyphMetrics(TTF_Font *font, Uint32 ch, int *minx, int *maxx, int *miny, int *maxy, int *advance)
/// ```
/// {@category ttf}
({int advance, int maxx, int maxy, int minx, int miny})? ttfxGetGlyphMetrics(
  Pointer<TtfFont> font,
  int ch,
) {
  late int minx;
  late int maxx;
  late int miny;
  late int maxy;
  late int advance;
  final minxPointer = ffi.calloc<Int32>();
  final maxxPointer = ffi.calloc<Int32>();
  final minyPointer = ffi.calloc<Int32>();
  final maxyPointer = ffi.calloc<Int32>();
  final advancePointer = ffi.calloc<Int32>();
  final result = ttfGetGlyphMetrics(
    font,
    ch,
    minxPointer,
    maxxPointer,
    minyPointer,
    maxyPointer,
    advancePointer,
  );
  if (result) {
    minx = minxPointer.value;
    maxx = maxxPointer.value;
    miny = minyPointer.value;
    maxy = maxyPointer.value;
    advance = advancePointer.value;
  }
  minxPointer.callocFree();
  maxxPointer.callocFree();
  minyPointer.callocFree();
  maxyPointer.callocFree();
  advancePointer.callocFree();
  if (!result) {
    return null;
  }
  return (minx: minx, maxx: maxx, miny: miny, maxy: maxy, advance: advance);
}

///
/// Query the kerning size between the glyphs of two UNICODE codepoints.
///
/// \param font the font to query.
/// \param previous_ch the previous codepoint.
/// \param ch the current codepoint.
/// \param kerning a pointer filled in with the kerning size between the two
/// glyphs, in pixels, may be NULL.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL TTF_GetGlyphKerning(TTF_Font *font, Uint32 previous_ch, Uint32 ch, int *kerning)
/// ```
/// {@category ttf}
int? ttfxGetGlyphKerning(Pointer<TtfFont> font, int previousCh, int ch) {
  int? kerning;
  final kerningPointer = calloc<Int32>();
  final bl = ttfGetGlyphKerning(font, previousCh, ch, kerningPointer);
  if (bl) {
    kerning = kerningPointer.value;
  }
  kerningPointer.callocFree();
  return kerning;
}

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
({int w, int h})? ttfxGetStringSize(Pointer<TtfFont> font, String text) {
  late int w;
  late int h;
  final wPointer = ffi.calloc<Int32>();
  final hPointer = ffi.calloc<Int32>();
  final bl = ttfGetStringSize(font, text, wPointer, hPointer);
  if (bl) {
    w = wPointer.value;
    h = hPointer.value;
  }
  wPointer.callocFree();
  hPointer.callocFree();
  if (!bl) {
    return null;
  }
  return (w: w, h: h);
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
({int w, int h})? ttfxGetStringSizeWrapped(
  Pointer<TtfFont> font,
  String text,
  int wrapWidth,
) {
  late int w;
  late int h;
  final wPointer = ffi.calloc<Int32>();
  final hPointer = ffi.calloc<Int32>();
  final bl = ttfGetStringSizeWrapped(font, text, wrapWidth, wPointer, hPointer);
  if (bl) {
    w = wPointer.value;
    h = hPointer.value;
  }
  wPointer.callocFree();
  hPointer.callocFree();
  if (!bl) {
    return null;
  }
  return (w: w, h: h);
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
({int measuredWidth, int measuredLength})? ttfxMeasureString(
  Pointer<TtfFont> font,
  String text,
  int maxWidth,
) {
  late int measuredWidth;
  late int measuredLength;
  final measuredWidthPointer = ffi.calloc<Int32>();
  final measuredLengthPointer = ffi.calloc<Size>();
  final bl = ttfMeasureString(
    font,
    text,
    maxWidth,
    measuredWidthPointer,
    measuredLengthPointer,
  );
  if (bl) {
    measuredWidth = measuredWidthPointer.value;
    measuredLength = measuredLengthPointer.value;
  }
  measuredWidthPointer.callocFree();
  measuredLengthPointer.callocFree();
  if (!bl) {
    return null;
  }
  return (measuredWidth: measuredWidth, measuredLength: measuredLength);
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
bool ttfxSetTextColor(Pointer<TtfText> text, SdlxColor color) =>
    ttfSetTextColor(text, color.r, color.g, color.b, color.a);

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
bool ttfxSetTextColorFloat(Pointer<TtfText> text, SdlxFColor color) =>
    ttfSetTextColorFloat(text, color.r, color.g, color.b, color.a);

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
SdlxColor? ttfxGetTextColor(Pointer<TtfText> text) {
  SdlxColor? result;
  final rPointer = ffi.calloc<Uint8>();
  final gPointer = ffi.calloc<Uint8>();
  final bPointer = ffi.calloc<Uint8>();
  final aPointer = ffi.calloc<Uint8>();
  final bl = ttfGetTextColor(text, rPointer, gPointer, bPointer, aPointer);
  if (bl) {
    result = SdlxColor(
      rPointer.value,
      gPointer.value,
      bPointer.value,
      aPointer.value,
    );
  }
  rPointer.callocFree();
  gPointer.callocFree();
  bPointer.callocFree();
  aPointer.callocFree();
  return result;
}

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
SdlxFColor? ttfxGetTextColorFloat(Pointer<TtfText> text) {
  SdlxFColor? result;
  final rPointer = ffi.calloc<Float>();
  final gPointer = ffi.calloc<Float>();
  final bPointer = ffi.calloc<Float>();
  final aPointer = ffi.calloc<Float>();
  final bl = ttfGetTextColorFloat(text, rPointer, gPointer, bPointer, aPointer);
  if (bl) {
    result = SdlxFColor(
      rPointer.value,
      gPointer.value,
      bPointer.value,
      aPointer.value,
    );
  }
  rPointer.callocFree();
  gPointer.callocFree();
  bPointer.callocFree();
  aPointer.callocFree();
  return result;
}

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
bool ttfxSetTextPosition(Pointer<TtfText> text, SdlxPoint position) =>
    ttfSetTextPosition(text, position.x, position.y);

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
SdlxPoint? ttfxGetTextPosition(Pointer<TtfText> text) {
  SdlxPoint? result;
  final xPointer = ffi.calloc<Int32>();
  final yPointer = ffi.calloc<Int32>();
  final bl = ttfGetTextPosition(text, xPointer, yPointer);
  if (bl) {
    result = SdlxPoint(xPointer.value, yPointer.value);
  }
  xPointer.callocFree();
  yPointer.callocFree();
  return result;
}

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
int? ttfxGetTextWrapWidth(Pointer<TtfText> text) {
  int? result;
  final wrapWidthPointer = ffi.calloc<Int32>();
  final bl = ttfGetTextWrapWidth(text, wrapWidthPointer);
  if (bl) {
    result = wrapWidthPointer.value;
  }
  wrapWidthPointer.callocFree();
  return result;
}

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
SdlxPoint? ttfxGetTextSize(Pointer<TtfText> text) {
  SdlxPoint? result;
  final wPointer = ffi.calloc<Int32>();
  final hPointer = ffi.calloc<Int32>();
  final bl = ttfGetTextSize(text, wPointer, hPointer);
  if (bl) {
    result = SdlxPoint(wPointer.value, hPointer.value);
  }
  wPointer.callocFree();
  hPointer.callocFree();
  return result;
}

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
TtfxSubString? ttfxGetTextSubString(Pointer<TtfText> text, int offset) {
  TtfxSubString? result;
  final subStringPointer = ffi.calloc<TtfSubString>();
  final bl = ttfGetTextSubString(text, offset, subStringPointer);
  if (bl) {
    result = TtfxSubString()..loadFromPointer(subStringPointer);
  }
  subStringPointer.callocFree();
  return result;
}

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
TtfxSubString? ttfxGetTextSubStringForLine(Pointer<TtfText> text, int line) {
  TtfxSubString? result;
  final subStringPointer = ffi.calloc<TtfSubString>();
  final bl = ttfGetTextSubStringForLine(text, line, subStringPointer);
  if (bl) {
    result = TtfxSubString()..loadFromPointer(subStringPointer);
  }
  subStringPointer.callocFree();
  return result;
}

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
List<TtfxSubString> ttfxGetTextSubStringsForRange(
  Pointer<TtfText> text,
  int offset,
  int length,
) {
  final result = <TtfxSubString>[];
  final countPointer = ffi.calloc<Int32>();
  final subStringsPointer = ttfGetTextSubStringsForRange(
    text,
    offset,
    length,
    countPointer,
  );
  if (subStringsPointer != nullptr) {
    for (var i = 0; i < countPointer.value; i++) {
      result.add(TtfxSubString()..loadFromPointer(subStringsPointer[i]));
    }
    sdlFree(subStringsPointer.cast<Void>());
  }
  countPointer.callocFree();
  return result;
}

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
TtfxSubString? ttfxGetTextSubStringForPoint(
  Pointer<TtfText> text,
  int x,
  int y,
) {
  TtfxSubString? result;
  final subStringPointer = ffi.calloc<TtfSubString>();
  final bl = ttfGetTextSubStringForPoint(text, x, y, subStringPointer);
  if (bl) {
    result = TtfxSubString()..loadFromPointer(subStringPointer);
  }
  subStringPointer.callocFree();
  return result;
}

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
TtfxSubString? ttfxGetPreviousTextSubString(
  Pointer<TtfText> text,
  TtfxSubString subString,
) {
  TtfxSubString? result;
  final subStringPointer = subString.calloc();
  final resultPointer = ffi.calloc<TtfSubString>();
  final bl = ttfGetPreviousTextSubString(text, subStringPointer, resultPointer);
  if (bl) {
    result = TtfxSubString()..loadFromPointer(resultPointer);
  }
  subStringPointer.callocFree();
  resultPointer.callocFree();
  return result;
}

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
TtfxSubString? ttfxGetNextTextSubString(
  Pointer<TtfText> text,
  TtfxSubString subString,
) {
  TtfxSubString? result;
  final subStringPointer = subString.calloc();
  final resultPointer = ffi.calloc<TtfSubString>();
  final bl = ttfGetNextTextSubString(text, subStringPointer, resultPointer);
  if (bl) {
    result = TtfxSubString()..loadFromPointer(resultPointer);
  }
  subStringPointer.callocFree();
  resultPointer.callocFree();
  return result;
}
