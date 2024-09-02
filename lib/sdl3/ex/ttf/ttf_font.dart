import 'dart:ffi';
import 'package:ffi/ffi.dart';
import '../../generated/struct_sdl.dart';
import '../../generated/struct_sdl_ttf.dart';
import '../../generated/lib_sdl_ttf.dart';
//import 'native_type.dart';
import '../sdl/sdl_color.dart';

extension TtfFontEx on TtfFont {
  // lib_sdl_ttf.dart

  ///
  /// Create a font from a file, using a specified point size.
  ///
  /// Some .fon fonts will have several sizes embedded in the file, so the point
  /// size becomes the index of choosing which size. If the value is too high,
  /// the last indexed size will be the default.
  ///
  /// When done with the returned TTF_Font, use TTF_CloseFont() to dispose of it.
  ///
  /// \param file path to font file.
  /// \param ptsize point size to use for the newly-opened font.
  /// \returns a valid TTF_Font, or NULL on error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_CloseFont
  ///
  /// ```c
  /// extern SDL_DECLSPEC TTF_Font * SDLCALL TTF_OpenFont(const char *file, int ptsize)
  /// ```
  static Pointer<TtfFont> open(String file, int ptsize) {
    return ttfOpenFont(file, ptsize);
  }

  ///
  /// Create a font from a file, using a specified face index.
  ///
  /// Some .fon fonts will have several sizes embedded in the file, so the point
  /// size becomes the index of choosing which size. If the value is too high,
  /// the last indexed size will be the default.
  ///
  /// Some fonts have multiple "faces" included. The index specifies which face
  /// to use from the font file. Font files with only one face should specify
  /// zero for the index.
  ///
  /// When done with the returned TTF_Font, use TTF_CloseFont() to dispose of it.
  ///
  /// \param file path to font file.
  /// \param ptsize point size to use for the newly-opened font.
  /// \param index index of the face in the font file.
  /// \returns a valid TTF_Font, or NULL on error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_CloseFont
  ///
  /// ```c
  /// extern SDL_DECLSPEC TTF_Font * SDLCALL TTF_OpenFontIndex(const char *file, int ptsize, long index)
  /// ```
  static Pointer<TtfFont> openIndex(String file, int ptsize, int index) {
    return ttfOpenFontIndex(file, ptsize, index);
  }

  ///
  /// Create a font from a file, using target resolutions (in DPI).
  ///
  /// DPI scaling only applies to scalable fonts (e.g. TrueType).
  ///
  /// Some .fon fonts will have several sizes embedded in the file, so the point
  /// size becomes the index of choosing which size. If the value is too high,
  /// the last indexed size will be the default.
  ///
  /// When done with the returned TTF_Font, use TTF_CloseFont() to dispose of it.
  ///
  /// \param file path to font file.
  /// \param ptsize point size to use for the newly-opened font.
  /// \param hdpi the target horizontal DPI.
  /// \param vdpi the target vertical DPI.
  /// \returns a valid TTF_Font, or NULL on error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_CloseFont
  ///
  /// ```c
  /// extern SDL_DECLSPEC TTF_Font * SDLCALL TTF_OpenFontDPI(const char *file, int ptsize, unsigned int hdpi, unsigned int vdpi)
  /// ```
  static Pointer<TtfFont> openDpi(String file, int ptsize, int hdpi, int vdpi) {
    return ttfOpenFontDpi(file, ptsize, hdpi, vdpi);
  }

  ///
  /// Create a font from a file, using target resolutions (in DPI).
  ///
  /// DPI scaling only applies to scalable fonts (e.g. TrueType).
  ///
  /// Some .fon fonts will have several sizes embedded in the file, so the point
  /// size becomes the index of choosing which size. If the value is too high,
  /// the last indexed size will be the default.
  ///
  /// Some fonts have multiple "faces" included. The index specifies which face
  /// to use from the font file. Font files with only one face should specify
  /// zero for the index.
  ///
  /// When done with the returned TTF_Font, use TTF_CloseFont() to dispose of it.
  ///
  /// \param file path to font file.
  /// \param ptsize point size to use for the newly-opened font.
  /// \param index index of the face in the font file.
  /// \param hdpi the target horizontal DPI.
  /// \param vdpi the target vertical DPI.
  /// \returns a valid TTF_Font, or NULL on error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_CloseFont
  ///
  /// ```c
  /// extern SDL_DECLSPEC TTF_Font * SDLCALL TTF_OpenFontIndexDPI(const char *file, int ptsize, long index, unsigned int hdpi, unsigned int vdpi)
  /// ```
  static Pointer<TtfFont> openIndexDpi(
      String file, int ptsize, int index, int hdpi, int vdpi) {
    return ttfOpenFontIndexDpi(file, ptsize, index, hdpi, vdpi);
  }
}

extension TtfFontPointerEx on Pointer<TtfFont> {
  // lib_sdl_ttf.dart

  // ttfLinkedVersion
  // ttfGetFreeTypeVersion
  // ttfGetHarfBuzzVersion
  // ttfByteSwappedUnicode
  // ttfInit

  ///
  /// Set a font's size dynamically.
  ///
  /// This clears already-generated glyphs, if any, from the cache.
  ///
  /// \param font the font to resize.
  /// \param ptsize the new point size.
  /// \returns SDL_TRUE on success or SDL_FALSE on failure; call SDL_GetError()
  /// for more information.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_bool SDLCALL TTF_SetFontSize(TTF_Font *font, int ptsize)
  /// ```
  bool setSize(int ptsize) {
    return ttfSetFontSize(this, ptsize);
  }

  ///
  /// Set font size dynamically with target resolutions (in DPI).
  ///
  /// This clears already-generated glyphs, if any, from the cache.
  ///
  /// \param font the font to resize.
  /// \param ptsize the new point size.
  /// \param hdpi the target horizontal DPI.
  /// \param vdpi the target vertical DPI.
  /// \returns SDL_TRUE on success or SDL_FALSE on failure; call SDL_GetError()
  /// for more information.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_bool SDLCALL TTF_SetFontSizeDPI(TTF_Font *font, int ptsize, unsigned int hdpi, unsigned int vdpi)
  /// ```
  bool setSizeDpi(int ptsize, int hdpi, int vdpi) {
    return ttfSetFontSizeDpi(this, ptsize, hdpi, vdpi);
  }

  ///
  /// Query a font's current style.
  ///
  /// The font styles are a set of bit flags, OR'd together:
  ///
  /// - `TTF_STYLE_NORMAL` (is zero)
  /// - `TTF_STYLE_BOLD`
  /// - `TTF_STYLE_ITALIC`
  /// - `TTF_STYLE_UNDERLINE`
  /// - `TTF_STYLE_STRIKETHROUGH`
  ///
  /// \param font the font to query.
  /// \returns the current font style, as a set of bit flags.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_SetFontStyle
  ///
  /// ```c
  /// extern SDL_DECLSPEC int SDLCALL TTF_GetFontStyle(const TTF_Font *font)
  /// ```
  int getStyle() {
    return ttfGetFontStyle(this);
  }

  ///
  /// Set a font's current style.
  ///
  /// Setting the style clears already-generated glyphs, if any, from the cache.
  ///
  /// The font styles are a set of bit flags, OR'd together:
  ///
  /// - `TTF_STYLE_NORMAL` (is zero)
  /// - `TTF_STYLE_BOLD`
  /// - `TTF_STYLE_ITALIC`
  /// - `TTF_STYLE_UNDERLINE`
  /// - `TTF_STYLE_STRIKETHROUGH`
  ///
  /// \param font the font to set a new style on.
  /// \param style the new style values to set, OR'd together.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_GetFontStyle
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL TTF_SetFontStyle(TTF_Font *font, int style)
  /// ```
  void setStyle(int style) {
    ttfSetFontStyle(this, style);
  }

  ///
  /// Query a font's current outline.
  ///
  /// \param font the font to query.
  /// \returns the font's current outline value.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_SetFontOutline
  ///
  /// ```c
  /// extern SDL_DECLSPEC int SDLCALL TTF_GetFontOutline(const TTF_Font *font)
  /// ```
  int getOutline() {
    return ttfGetFontOutline(this);
  }

  ///
  /// Set a font's current outline.
  ///
  /// \param font the font to set a new outline on.
  /// \param outline positive outline value, 0 to default.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_GetFontOutline
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL TTF_SetFontOutline(TTF_Font *font, int outline)
  /// ```
  void setOutline(int outline) {
    ttfSetFontOutline(this, outline);
  }

  ///
  /// Query a font's current FreeType hinter setting.
  ///
  /// The hinter setting is a single value:
  ///
  /// - `TTF_HINTING_NORMAL`
  /// - `TTF_HINTING_LIGHT`
  /// - `TTF_HINTING_MONO`
  /// - `TTF_HINTING_NONE`
  /// - `TTF_HINTING_LIGHT_SUBPIXEL` (available in SDL_ttf 3.0.0 and later)
  ///
  /// \param font the font to query.
  /// \returns the font's current hinter value.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_SetFontHinting
  ///
  /// ```c
  /// extern SDL_DECLSPEC int SDLCALL TTF_GetFontHinting(const TTF_Font *font)
  /// ```
  int getHinting() {
    return ttfGetFontHinting(this);
  }

  ///
  /// Set a font's current hinter setting.
  ///
  /// Setting it clears already-generated glyphs, if any, from the cache.
  ///
  /// The hinter setting is a single value:
  ///
  /// - `TTF_HINTING_NORMAL`
  /// - `TTF_HINTING_LIGHT`
  /// - `TTF_HINTING_MONO`
  /// - `TTF_HINTING_NONE`
  /// - `TTF_HINTING_LIGHT_SUBPIXEL` (available in SDL_ttf 3.0.0 and later)
  ///
  /// \param font the font to set a new hinter setting on.
  /// \param hinting the new hinter setting.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_GetFontHinting
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL TTF_SetFontHinting(TTF_Font *font, int hinting)
  /// ```
  void setHinting(int hinting) {
    ttfSetFontHinting(this, hinting);
  }

  ///
  /// Query a font's current wrap alignment option.
  ///
  /// The wrap alignment option can be one of the following:
  ///
  /// - `TTF_WRAPPED_ALIGN_LEFT`
  /// - `TTF_WRAPPED_ALIGN_CENTER`
  /// - `TTF_WRAPPED_ALIGN_RIGHT`
  ///
  /// \param font the font to query.
  /// \returns the font's current wrap alignment option.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_SetFontWrappedAlign
  ///
  /// ```c
  /// extern SDL_DECLSPEC int SDLCALL TTF_GetFontWrappedAlign(const TTF_Font *font)
  /// ```
  int getWrappedAlign() {
    return ttfGetFontWrappedAlign(this);
  }

  ///
  /// Set a font's current wrap alignment option.
  ///
  /// The wrap alignment option can be one of the following:
  ///
  /// - `TTF_WRAPPED_ALIGN_LEFT`
  /// - `TTF_WRAPPED_ALIGN_CENTER`
  /// - `TTF_WRAPPED_ALIGN_RIGHT`
  ///
  /// \param font the font to set a new wrap alignment option on.
  /// \param align the new wrap alignment option.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_GetFontWrappedAlign
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL TTF_SetFontWrappedAlign(TTF_Font *font, int align)
  /// ```
  void setWrappedAlign(int align) {
    ttfSetFontWrappedAlign(this, align);
  }

  ///
  /// Query the total height of a font.
  ///
  /// This is usually equal to point size.
  ///
  /// \param font the font to query.
  /// \returns the font's height.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC int SDLCALL TTF_FontHeight(const TTF_Font *font)
  /// ```
  int height() {
    return ttfFontHeight(this);
  }

  ///
  /// Query the offset from the baseline to the top of a font.
  ///
  /// This is a positive value, relative to the baseline.
  ///
  /// \param font the font to query.
  /// \returns the font's ascent.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC int SDLCALL TTF_FontAscent(const TTF_Font *font)
  /// ```
  int ascent() {
    return ttfFontAscent(this);
  }

  ///
  /// Query the offset from the baseline to the bottom of a font.
  ///
  /// This is a negative value, relative to the baseline.
  ///
  /// \param font the font to query.
  /// \returns the font's descent.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC int SDLCALL TTF_FontDescent(const TTF_Font *font)
  /// ```
  int descent() {
    return ttfFontDescent(this);
  }

  ///
  /// Query the recommended spacing between lines of text for a font.
  ///
  /// \param font the font to query.
  /// \returns the font's recommended spacing.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC int SDLCALL TTF_FontLineSkip(const TTF_Font *font)
  /// ```
  int lineSkip() {
    return ttfFontLineSkip(this);
  }

  ///
  /// Query whether or not kerning is enabled for a font.
  ///
  /// \param font the font to query.
  /// \returns SDL_TRUE if kerning is enabled, SDL_FALSE otherwise.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_bool SDLCALL TTF_GetFontKerning(const TTF_Font *font)
  /// ```
  bool getKerning() {
    return ttfGetFontKerning(this);
  }

  ///
  /// Set if kerning is enabled for a font.
  ///
  /// Newly-opened fonts default to allowing kerning. This is generally a good
  /// policy unless you have a strong reason to disable it, as it tends to
  /// produce better rendering (with kerning disabled, some fonts might render
  /// the word `kerning` as something that looks like `keming` for example).
  ///
  /// \param font the font to set kerning on.
  /// \param enabled SDL_TRUE to enable kerning, SDL_FALSE to disable.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL TTF_SetFontKerning(TTF_Font *font, SDL_bool enabled)
  /// ```
  void setKerning(bool allowed) {
    ttfSetFontKerning(this, allowed);
  }

  ///
  /// Query the number of faces of a font.
  ///
  /// \param font the font to query.
  /// \returns the number of FreeType font faces.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC long SDLCALL TTF_FontFaces(const TTF_Font *font)
  /// ```
  int faces() {
    return ttfFontFaces(this);
  }

  ///
  /// Query whether a font is fixed-width.
  ///
  /// A "fixed-width" font means all glyphs are the same width across; a
  /// lowercase 'i' will be the same size across as a capital 'W', for example.
  /// This is common for terminals and text editors, and other apps that treat
  /// text as a grid. Most other things (WYSIWYG word processors, web pages, etc)
  /// are more likely to not be fixed-width in most cases.
  ///
  /// \param font the font to query.
  /// \returns SDL_TRUE if fixed-width, SDL_FALSE if not.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_bool SDLCALL TTF_FontFaceIsFixedWidth(const TTF_Font *font)
  /// ```
  bool faceIsFixedWidth() {
    return ttfFontFaceIsFixedWidth(this);
  }

  ///
  /// Query a font's family name.
  ///
  /// This string is dictated by the contents of the font file.
  ///
  /// Note that the returned string is to internal storage, and should not be
  /// modified or free'd by the caller. The string becomes invalid, with the rest
  /// of the font, when `font` is handed to TTF_CloseFont().
  ///
  /// \param font the font to query.
  /// \returns the font's family name.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC const char * SDLCALL TTF_FontFaceFamilyName(const TTF_Font *font)
  /// ```
  String? faceFamilyName() {
    return ttfFontFaceFamilyName(this);
  }

  ///
  /// Query a font's style name.
  ///
  /// This string is dictated by the contents of the font file.
  ///
  /// Note that the returned string is to internal storage, and should not be
  /// modified or free'd by the caller. The string becomes invalid, with the rest
  /// of the font, when `font` is handed to TTF_CloseFont().
  ///
  /// \param font the font to query.
  /// \returns the font's style name.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC const char * SDLCALL TTF_FontFaceStyleName(const TTF_Font *font)
  /// ```
  String? faceStyleName() {
    return ttfFontFaceStyleName(this);
  }

  ///
  /// Check whether a glyph is provided by the font for a 16-bit codepoint.
  ///
  /// Note that this version of the function takes a 16-bit character code, which
  /// covers the Basic Multilingual Plane, but is insufficient to cover the
  /// entire set of possible Unicode values, including emoji glyphs. You should
  /// use TTF_GlyphIsProvided32() instead, which offers the same functionality
  /// but takes a 32-bit codepoint instead.
  ///
  /// The only reason to use this function is that it was available since the
  /// beginning of time, more or less.
  ///
  /// \param font the font to query.
  /// \param ch the character code to check.
  /// \returns SDL_TRUE if font provides a glyph for this character, SDL_FALSE if
  /// not.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_GlyphIsProvided32
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_bool SDLCALL TTF_GlyphIsProvided(TTF_Font *font, Uint16 ch)
  /// ```
  bool glyphIsProvided(int ch) {
    return ttfGlyphIsProvided(this, ch);
  }

  ///
  /// Check whether a glyph is provided by the font for a 32-bit codepoint.
  ///
  /// This is the same as TTF_GlyphIsProvided(), but takes a 32-bit character
  /// instead of 16-bit, and thus can query a larger range. If you are sure
  /// you'll have an SDL_ttf that's version 2.0.18 or newer, there's no reason
  /// not to use this function exclusively.
  ///
  /// \param font the font to query.
  /// \param ch the character code to check.
  /// \returns SDL_TRUE if font provides a glyph for this character, SDL_FALSE if
  /// not.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_bool SDLCALL TTF_GlyphIsProvided32(TTF_Font *font, Uint32 ch)
  /// ```
  bool glyphIsProvided32(int ch) {
    return ttfGlyphIsProvided32(this, ch);
  }

  ///
  /// Query the metrics (dimensions) of a font's 16-bit glyph.
  ///
  /// To understand what these metrics mean, here is a useful link:
  ///
  /// https://freetype.sourceforge.net/freetype2/docs/tutorial/step2.html
  ///
  /// Note that this version of the function takes a 16-bit character code, which
  /// covers the Basic Multilingual Plane, but is insufficient to cover the
  /// entire set of possible Unicode values, including emoji glyphs. You should
  /// use TTF_GlyphMetrics32() instead, which offers the same functionality but
  /// takes a 32-bit codepoint instead.
  ///
  /// The only reason to use this function is that it was available since the
  /// beginning of time, more or less.
  ///
  /// \param font the font to query.
  /// \param ch the character code to check.
  /// \returns SDL_TRUE on success or SDL_FALSE on failure; call SDL_GetError()
  /// for more information.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_GlyphMetrics32
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_bool SDLCALL TTF_GlyphMetrics(TTF_Font *font, Uint16 ch, int *minx, int *maxx, int *miny, int *maxy, int *advance)
  /// ```
  bool glyphMetrics(int ch, Pointer<Int32> minx, Pointer<Int32> maxx,
      Pointer<Int32> miny, Pointer<Int32> maxy, Pointer<Int32> advance) {
    return ttfGlyphMetrics(this, ch, minx, maxx, miny, maxy, advance);
  }

  ///
  /// Query the metrics (dimensions) of a font's 32-bit glyph.
  ///
  /// To understand what these metrics mean, here is a useful link:
  ///
  /// https://freetype.sourceforge.net/freetype2/docs/tutorial/step2.html
  ///
  /// This is the same as TTF_GlyphMetrics(), but takes a 32-bit character
  /// instead of 16-bit, and thus can query a larger range. If you are sure
  /// you'll have an SDL_ttf that's version 2.0.18 or newer, there's no reason
  /// not to use this function exclusively.
  ///
  /// \param font the font to query.
  /// \param ch the character code to check.
  /// \returns SDL_TRUE on success or SDL_FALSE on failure; call SDL_GetError()
  /// for more information.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_bool SDLCALL TTF_GlyphMetrics32(TTF_Font *font, Uint32 ch, int *minx, int *maxx, int *miny, int *maxy, int *advance)
  /// ```
  bool glyphMetrics32(int ch, Pointer<Int32> minx, Pointer<Int32> maxx,
      Pointer<Int32> miny, Pointer<Int32> maxy, Pointer<Int32> advance) {
    return ttfGlyphMetrics32(this, ch, minx, maxx, miny, maxy, advance);
  }

  ///
  /// Calculate the dimensions of a rendered string of Latin1 text.
  ///
  /// This will report the width and height, in pixels, of the space that the
  /// specified string will take to fully render.
  ///
  /// This does not need to render the string to do this calculation.
  ///
  /// You almost certainly want TTF_SizeUTF8() unless you're sure you have a
  /// 1-byte Latin1 encoding. US ASCII characters will work with either function,
  /// but most other Unicode characters packed into a `const char *` will need
  /// UTF-8.
  ///
  /// \param font the font to query.
  /// \param text text to calculate, in Latin1 encoding.
  /// \param w will be filled with width, in pixels, on return.
  /// \param h will be filled with height, in pixels, on return.
  /// \returns SDL_TRUE on success or SDL_FALSE on failure; call SDL_GetError()
  /// for more information.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_SizeUTF8
  /// \sa TTF_SizeUNICODE
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_bool SDLCALL TTF_SizeText(TTF_Font *font, const char *text, int *w, int *h)
  /// ```
  bool sizeText(String text, Pointer<Int32> w, Pointer<Int32> h) {
    return ttfSizeText(this, text, w, h);
  }

  ///
  /// Calculate the dimensions of a rendered string of UTF-8 text.
  ///
  /// This will report the width and height, in pixels, of the space that the
  /// specified string will take to fully render.
  ///
  /// This does not need to render the string to do this calculation.
  ///
  /// \param font the font to query.
  /// \param text text to calculate, in UTF-8 encoding.
  /// \param w will be filled with width, in pixels, on return.
  /// \param h will be filled with height, in pixels, on return.
  /// \returns SDL_TRUE on success or SDL_FALSE on failure; call SDL_GetError()
  /// for more information.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_SizeUNICODE
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_bool SDLCALL TTF_SizeUTF8(TTF_Font *font, const char *text, int *w, int *h)
  /// ```
  bool sizeUtf8(String text, Pointer<Int32> w, Pointer<Int32> h) {
    return ttfSizeUtf8(this, text, w, h);
  }

  ///
  /// Calculate the dimensions of a rendered string of UCS-2 text.
  ///
  /// This will report the width and height, in pixels, of the space that the
  /// specified string will take to fully render.
  ///
  /// This does not need to render the string to do this calculation.
  ///
  /// Please note that this function is named "Unicode" but currently expects
  /// UCS-2 encoding (16 bits per codepoint). This does not give you access to
  /// large Unicode values, such as emoji glyphs. These codepoints are accessible
  /// through the UTF-8 version of this function.
  ///
  /// \param font the font to query.
  /// \param text text to calculate, in UCS-2 encoding.
  /// \param w will be filled with width, in pixels, on return.
  /// \param h will be filled with height, in pixels, on return.
  /// \returns SDL_TRUE on success or SDL_FALSE on failure; call SDL_GetError()
  /// for more information.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_SizeUTF8
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_bool SDLCALL TTF_SizeUNICODE(TTF_Font *font, const Uint16 *text, int *w, int *h)
  /// ```
  bool sizeUnicode(Pointer<Uint16> text, Pointer<Int32> w, Pointer<Int32> h) {
    return ttfSizeUnicode(this, text, w, h);
  }

  ///
  /// Calculate how much of a Latin1 string will fit in a given width.
  ///
  /// This reports the number of characters that can be rendered before reaching
  /// `measure_width`.
  ///
  /// This does not need to render the string to do this calculation.
  ///
  /// You almost certainly want TTF_MeasureUTF8() unless you're sure you have a
  /// 1-byte Latin1 encoding. US ASCII characters will work with either function,
  /// but most other Unicode characters packed into a `const char *` will need
  /// UTF-8.
  ///
  /// \param font the font to query.
  /// \param text text to calculate, in Latin1 encoding.
  /// \param measure_width maximum width, in pixels, available for the string.
  /// \param extent on return, filled with latest calculated width.
  /// \param count on return, filled with number of characters that can be
  /// rendered.
  /// \returns SDL_TRUE on success or SDL_FALSE on failure; call SDL_GetError()
  /// for more information.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_MeasureText
  /// \sa TTF_MeasureUTF8
  /// \sa TTF_MeasureUNICODE
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_bool SDLCALL TTF_MeasureText(TTF_Font *font, const char *text, int measure_width, int *extent, int *count)
  /// ```
  bool measureText(String text, int measureWidth, Pointer<Int32> extent,
      Pointer<Int32> count) {
    return ttfMeasureText(this, text, measureWidth, extent, count);
  }

  ///
  /// Calculate how much of a UTF-8 string will fit in a given width.
  ///
  /// This reports the number of characters that can be rendered before reaching
  /// `measure_width`.
  ///
  /// This does not need to render the string to do this calculation.
  ///
  /// \param font the font to query.
  /// \param text text to calculate, in UTF-8 encoding.
  /// \param measure_width maximum width, in pixels, available for the string.
  /// \param extent on return, filled with latest calculated width.
  /// \param count on return, filled with number of characters that can be
  /// rendered.
  /// \returns SDL_TRUE on success or SDL_FALSE on failure; call SDL_GetError()
  /// for more information.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_MeasureText
  /// \sa TTF_MeasureUTF8
  /// \sa TTF_MeasureUNICODE
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_bool SDLCALL TTF_MeasureUTF8(TTF_Font *font, const char *text, int measure_width, int *extent, int *count)
  /// ```
  bool measureUtf8(String text, int measureWidth, Pointer<Int32> extent,
      Pointer<Int32> count) {
    return ttfMeasureUtf8(this, text, measureWidth, extent, count);
  }

  ///
  /// Calculate how much of a UCS-2 string will fit in a given width.
  ///
  /// This reports the number of characters that can be rendered before reaching
  /// `measure_width`.
  ///
  /// This does not need to render the string to do this calculation.
  ///
  /// Please note that this function is named "Unicode" but currently expects
  /// UCS-2 encoding (16 bits per codepoint). This does not give you access to
  /// large Unicode values, such as emoji glyphs. These codepoints are accessible
  /// through the UTF-8 version of this function.
  ///
  /// \param font the font to query.
  /// \param text text to calculate, in UCS-2 encoding.
  /// \param measure_width maximum width, in pixels, available for the string.
  /// \param extent on return, filled with latest calculated width.
  /// \param count on return, filled with number of characters that can be
  /// rendered.
  /// \returns SDL_TRUE on success or SDL_FALSE on failure; call SDL_GetError()
  /// for more information.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_MeasureText
  /// \sa TTF_MeasureUTF8
  /// \sa TTF_MeasureUNICODE
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_bool SDLCALL TTF_MeasureUNICODE(TTF_Font *font, const Uint16 *text, int measure_width, int *extent, int *count)
  /// ```
  bool measureUnicode(Pointer<Uint16> text, int measureWidth,
      Pointer<Int32> extent, Pointer<Int32> count) {
    return ttfMeasureUnicode(this, text, measureWidth, extent, count);
  }

  ///
  /// Render Latin1 text at fast quality to a new 8-bit surface.
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
  /// You almost certainly want TTF_RenderUTF8_Solid() unless you're sure you
  /// have a 1-byte Latin1 encoding. US ASCII characters will work with either
  /// function, but most other Unicode characters packed into a `const char *`
  /// will need UTF-8.
  ///
  /// You can render at other quality levels with TTF_RenderText_Shaded,
  /// TTF_RenderText_Blended, and TTF_RenderText_LCD.
  ///
  /// \param font the font to render with.
  /// \param text text to render, in Latin1 encoding.
  /// \param fg the foreground color for the text.
  /// \returns a new 8-bit, palettized surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderUTF8_Solid
  /// \sa TTF_RenderUNICODE_Solid
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderText_Solid(TTF_Font *font, const char *text, SDL_Color fg)
  /// ```
  Pointer<SdlSurface> renderTextSolid(String text, int fg) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var result = ttfRenderTextSolid(this, text, fgPointer.ref);
    calloc.free(fgPointer);
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
  /// TTF_RenderUTF8_Solid_Wrapped() instead if you need to wrap the output to
  /// multiple lines.
  ///
  /// This will not wrap on newline characters.
  ///
  /// You can render at other quality levels with TTF_RenderUTF8_Shaded,
  /// TTF_RenderUTF8_Blended, and TTF_RenderUTF8_LCD.
  ///
  /// \param font the font to render with.
  /// \param text text to render, in UTF-8 encoding.
  /// \param fg the foreground color for the text.
  /// \returns a new 8-bit, palettized surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderUTF8_Shaded
  /// \sa TTF_RenderUTF8_Blended
  /// \sa TTF_RenderUTF8_LCD
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderUTF8_Solid(TTF_Font *font, const char *text, SDL_Color fg)
  /// ```
  Pointer<SdlSurface> renderUtf8Solid(String text, int fg) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var result = ttfRenderUtf8Solid(this, text, fgPointer.ref);
    calloc.free(fgPointer);
    return result;
  }

  ///
  /// Render UCS-2 text at fast quality to a new 8-bit surface.
  ///
  /// This function will allocate a new 8-bit, palettized surface. The surface's
  /// 0 pixel will be the colorkey, giving a transparent background. The 1 pixel
  /// will be set to the text color.
  ///
  /// This will not word-wrap the string; you'll get a surface with a single line
  /// of text, as long as the string requires. You can use
  /// TTF_RenderUNICODE_Solid_Wrapped() instead if you need to wrap the output to
  /// multiple lines.
  ///
  /// This will not wrap on newline characters.
  ///
  /// Please note that this function is named "Unicode" but currently expects
  /// UCS-2 encoding (16 bits per codepoint). This does not give you access to
  /// large Unicode values, such as emoji glyphs. These codepoints are accessible
  /// through the UTF-8 version of this function.
  ///
  /// You can render at other quality levels with TTF_RenderUNICODE_Shaded,
  /// TTF_RenderUNICODE_Blended, and TTF_RenderUNICODE_LCD.
  ///
  /// \param font the font to render with.
  /// \param text text to render, in UCS-2 encoding.
  /// \param fg the foreground color for the text.
  /// \returns a new 8-bit, palettized surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderUTF8_Solid
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderUNICODE_Solid(TTF_Font *font, const Uint16 *text, SDL_Color fg)
  /// ```
  Pointer<SdlSurface> renderUnicodeSolid(Pointer<Uint16> text, int fg) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var result = ttfRenderUnicodeSolid(this, text, fgPointer.ref);
    calloc.free(fgPointer);
    return result;
  }

  ///
  /// Render word-wrapped Latin1 text at fast quality to a new 8-bit surface.
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
  /// You almost certainly want TTF_RenderUTF8_Solid_Wrapped() unless you're sure
  /// you have a 1-byte Latin1 encoding. US ASCII characters will work with
  /// either function, but most other Unicode characters packed into a `const
  /// char *` will need UTF-8.
  ///
  /// You can render at other quality levels with TTF_RenderText_Shaded_Wrapped,
  /// TTF_RenderText_Blended_Wrapped, and TTF_RenderText_LCD_Wrapped.
  ///
  /// \param font the font to render with.
  /// \param text text to render, in Latin1 encoding.
  /// \param fg the foreground color for the text.
  /// \returns a new 8-bit, palettized surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderUTF8_Solid_Wrapped
  /// \sa TTF_RenderUNICODE_Solid_Wrapped
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderText_Solid_Wrapped(TTF_Font *font, const char *text, SDL_Color fg, Uint32 wrapLength)
  /// ```
  Pointer<SdlSurface> renderTextSolidWrapped(
      String text, int fg, int wrapLength) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var result =
        ttfRenderTextSolidWrapped(this, text, fgPointer.ref, wrapLength);
    calloc.free(fgPointer);
    return result;
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
  /// You can render at other quality levels with TTF_RenderUTF8_Shaded_Wrapped,
  /// TTF_RenderUTF8_Blended_Wrapped, and TTF_RenderUTF8_LCD_Wrapped.
  ///
  /// \param font the font to render with.
  /// \param text text to render, in UTF-8 encoding.
  /// \param fg the foreground color for the text.
  /// \returns a new 8-bit, palettized surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderUTF8_Shaded_Wrapped
  /// \sa TTF_RenderUTF8_Blended_Wrapped
  /// \sa TTF_RenderUTF8_LCD_Wrapped
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderUTF8_Solid_Wrapped(TTF_Font *font, const char *text, SDL_Color fg, Uint32 wrapLength)
  /// ```
  Pointer<SdlSurface> renderUtf8SolidWrapped(
      String text, int fg, int wrapLength) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var result =
        ttfRenderUtf8SolidWrapped(this, text, fgPointer.ref, wrapLength);
    calloc.free(fgPointer);
    return result;
  }

  ///
  /// Render word-wrapped UCS-2 text at fast quality to a new 8-bit surface.
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
  /// Please note that this function is named "Unicode" but currently expects
  /// UCS-2 encoding (16 bits per codepoint). This does not give you access to
  /// large Unicode values, such as emoji glyphs. These codepoints are accessible
  /// through the UTF-8 version of this function.
  ///
  /// You can render at other quality levels with
  /// TTF_RenderUNICODE_Shaded_Wrapped, TTF_RenderUNICODE_Blended_Wrapped, and
  /// TTF_RenderUNICODE_LCD_Wrapped.
  ///
  /// \param font the font to render with.
  /// \param text text to render, in UCS-2 encoding.
  /// \param fg the foreground color for the text.
  /// \returns a new 8-bit, palettized surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderUTF8_Solid_Wrapped
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderUNICODE_Solid_Wrapped(TTF_Font *font, const Uint16 *text, SDL_Color fg, Uint32 wrapLength)
  /// ```
  Pointer<SdlSurface> renderUnicodeSolidWrapped(
      Pointer<Uint16> text, int fg, int wrapLength) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var result =
        ttfRenderUnicodeSolidWrapped(this, text, fgPointer.ref, wrapLength);
    calloc.free(fgPointer);
    return result;
  }

  ///
  /// Render a single 16-bit glyph at fast quality to a new 8-bit surface.
  ///
  /// This function will allocate a new 8-bit, palettized surface. The surface's
  /// 0 pixel will be the colorkey, giving a transparent background. The 1 pixel
  /// will be set to the text color.
  ///
  /// The glyph is rendered without any padding or centering in the X direction,
  /// and aligned normally in the Y direction.
  ///
  /// Note that this version of the function takes a 16-bit character code, which
  /// covers the Basic Multilingual Plane, but is insufficient to cover the
  /// entire set of possible Unicode values, including emoji glyphs. You should
  /// use TTF_RenderGlyph32_Solid() instead, which offers the same functionality
  /// but takes a 32-bit codepoint instead.
  ///
  /// The only reason to use this function is that it was available since the
  /// beginning of time, more or less.
  ///
  /// You can render at other quality levels with TTF_RenderGlyph_Shaded,
  /// TTF_RenderGlyph_Blended, and TTF_RenderGlyph_LCD.
  ///
  /// \param font the font to render with.
  /// \param ch the character to render.
  /// \param fg the foreground color for the text.
  /// \returns a new 8-bit, palettized surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderGlyph32_Solid
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderGlyph_Solid(TTF_Font *font, Uint16 ch, SDL_Color fg)
  /// ```
  Pointer<SdlSurface> renderGlyphSolid(int ch, int fg) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var result = ttfRenderGlyphSolid(this, ch, fgPointer.ref);
    calloc.free(fgPointer);
    return result;
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
  /// This is the same as TTF_RenderGlyph_Solid(), but takes a 32-bit character
  /// instead of 16-bit, and thus can render a larger range. If you are sure
  /// you'll have an SDL_ttf that's version 2.0.18 or newer, there's no reason
  /// not to use this function exclusively.
  ///
  /// You can render at other quality levels with TTF_RenderGlyph32_Shaded,
  /// TTF_RenderGlyph32_Blended, and TTF_RenderGlyph32_LCD.
  ///
  /// \param font the font to render with.
  /// \param ch the character to render.
  /// \param fg the foreground color for the text.
  /// \returns a new 8-bit, palettized surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderGlyph32_Shaded
  /// \sa TTF_RenderGlyph32_Blended
  /// \sa TTF_RenderGlyph32_LCD
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderGlyph32_Solid(TTF_Font *font, Uint32 ch, SDL_Color fg)
  /// ```
  Pointer<SdlSurface> renderGlyph32Solid(int ch, int fg) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var result = ttfRenderGlyph32Solid(this, ch, fgPointer.ref);
    calloc.free(fgPointer);
    return result;
  }

  ///
  /// Render Latin1 text at high quality to a new 8-bit surface.
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
  /// You almost certainly want TTF_RenderUTF8_Shaded() unless you're sure you
  /// have a 1-byte Latin1 encoding. US ASCII characters will work with either
  /// function, but most other Unicode characters packed into a `const char *`
  /// will need UTF-8.
  ///
  /// You can render at other quality levels with TTF_RenderText_Solid,
  /// TTF_RenderText_Blended, and TTF_RenderText_LCD.
  ///
  /// \param font the font to render with.
  /// \param text text to render, in Latin1 encoding.
  /// \param fg the foreground color for the text.
  /// \param bg the background color for the text.
  /// \returns a new 8-bit, palettized surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderUTF8_Shaded
  /// \sa TTF_RenderUNICODE_Shaded
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderText_Shaded(TTF_Font *font, const char *text, SDL_Color fg, SDL_Color bg)
  /// ```
  Pointer<SdlSurface> renderTextShaded(String text, int fg, int bg) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var bgPointer = calloc<SdlColor>()..fromU32(bg);
    var result = ttfRenderTextShaded(this, text, fgPointer.ref, bgPointer.ref);
    calloc.free(fgPointer);
    calloc.free(bgPointer);
    return result;
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
  /// TTF_RenderUTF8_Shaded_Wrapped() instead if you need to wrap the output to
  /// multiple lines.
  ///
  /// This will not wrap on newline characters.
  ///
  /// You can render at other quality levels with TTF_RenderUTF8_Solid,
  /// TTF_RenderUTF8_Blended, and TTF_RenderUTF8_LCD.
  ///
  /// \param font the font to render with.
  /// \param text text to render, in UTF-8 encoding.
  /// \param fg the foreground color for the text.
  /// \param bg the background color for the text.
  /// \returns a new 8-bit, palettized surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderUNICODE_Shaded
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderUTF8_Shaded(TTF_Font *font, const char *text, SDL_Color fg, SDL_Color bg)
  /// ```
  Pointer<SdlSurface> renderUtf8Shaded(String text, int fg, int bg) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var bgPointer = calloc<SdlColor>()..fromU32(bg);
    var result = ttfRenderUtf8Shaded(this, text, fgPointer.ref, bgPointer.ref);
    calloc.free(fgPointer);
    calloc.free(bgPointer);
    return result;
  }

  ///
  /// Render UCS-2 text at high quality to a new 8-bit surface.
  ///
  /// This function will allocate a new 8-bit, palettized surface. The surface's
  /// 0 pixel will be the specified background color, while other pixels have
  /// varying degrees of the foreground color. This function returns the new
  /// surface, or NULL if there was an error.
  ///
  /// This will not word-wrap the string; you'll get a surface with a single line
  /// of text, as long as the string requires. You can use
  /// TTF_RenderUNICODE_Shaded_Wrapped() instead if you need to wrap the output
  /// to multiple lines.
  ///
  /// This will not wrap on newline characters.
  ///
  /// Please note that this function is named "Unicode" but currently expects
  /// UCS-2 encoding (16 bits per codepoint). This does not give you access to
  /// large Unicode values, such as emoji glyphs. These codepoints are accessible
  /// through the UTF-8 version of this function.
  ///
  /// You can render at other quality levels with TTF_RenderUNICODE_Solid,
  /// TTF_RenderUNICODE_Blended, and TTF_RenderUNICODE_LCD.
  ///
  /// \param font the font to render with.
  /// \param text text to render, in UCS-2 encoding.
  /// \param fg the foreground color for the text.
  /// \returns a new 8-bit, palettized surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderUTF8_Shaded
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderUNICODE_Shaded(TTF_Font *font, const Uint16 *text, SDL_Color fg, SDL_Color bg)
  /// ```
  Pointer<SdlSurface> renderUnicodeShaded(
      Pointer<Uint16> text, int fg, int bg) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var bgPointer = calloc<SdlColor>()..fromU32(bg);
    var result =
        ttfRenderUnicodeShaded(this, text, fgPointer.ref, bgPointer.ref);
    calloc.free(fgPointer);
    calloc.free(bgPointer);
    return result;
  }

  ///
  /// Render word-wrapped Latin1 text at high quality to a new 8-bit surface.
  ///
  /// This function will allocate a new 8-bit, palettized surface. The surface's
  /// 0 pixel will be the specified background color, while other pixels have
  /// varying degrees of the foreground color. This function returns the new
  /// surface, or NULL if there was an error.
  ///
  /// Text is wrapped to multiple lines on line endings and on word boundaries if
  /// it extends beyond `wrapLength` in pixels.
  ///
  /// If wrapLength is 0, this function will only wrap on newline characters.
  ///
  /// You almost certainly want TTF_RenderUTF8_Shaded_Wrapped() unless you're
  /// sure you have a 1-byte Latin1 encoding. US ASCII characters will work with
  /// either function, but most other Unicode characters packed into a `const
  /// char *` will need UTF-8.
  ///
  /// You can render at other quality levels with TTF_RenderText_Solid_Wrapped,
  /// TTF_RenderText_Blended_Wrapped, and TTF_RenderText_LCD_Wrapped.
  ///
  /// \param font the font to render with.
  /// \param text text to render, in Latin1 encoding.
  /// \param fg the foreground color for the text.
  /// \param bg the background color for the text.
  /// \returns a new 8-bit, palettized surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderUTF8_Shaded_Wrapped
  /// \sa TTF_RenderUNICODE_Shaded_Wrapped
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderText_Shaded_Wrapped(TTF_Font *font, const char *text, SDL_Color fg, SDL_Color bg, Uint32 wrapLength)
  /// ```
  Pointer<SdlSurface> renderTextShadedWrapped(
      String text, int fg, int bg, int wrapLength) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var bgPointer = calloc<SdlColor>()..fromU32(bg);
    var result = ttfRenderTextShadedWrapped(
        this, text, fgPointer.ref, bgPointer.ref, wrapLength);
    calloc.free(fgPointer);
    calloc.free(bgPointer);
    return result;
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
  /// it extends beyond `wrapLength` in pixels.
  ///
  /// If wrapLength is 0, this function will only wrap on newline characters.
  ///
  /// You can render at other quality levels with TTF_RenderUTF8_Solid_Wrapped,
  /// TTF_RenderUTF8_Blended_Wrapped, and TTF_RenderUTF8_LCD_Wrapped.
  ///
  /// \param font the font to render with.
  /// \param text text to render, in UTF-8 encoding.
  /// \param fg the foreground color for the text.
  /// \returns a new 8-bit, palettized surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderUTF8_Solid_Wrapped
  /// \sa TTF_RenderUTF8_Blended_Wrapped
  /// \sa TTF_RenderUTF8_LCD_Wrapped
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderUTF8_Shaded_Wrapped(TTF_Font *font, const char *text, SDL_Color fg, SDL_Color bg, Uint32 wrapLength)
  /// ```
  Pointer<SdlSurface> renderUtf8ShadedWrapped(
      String text, int fg, int bg, int wrapLength) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var bgPointer = calloc<SdlColor>()..fromU32(bg);
    var result = ttfRenderUtf8ShadedWrapped(
        this, text, fgPointer.ref, bgPointer.ref, wrapLength);
    calloc.free(fgPointer);
    calloc.free(bgPointer);
    return result;
  }

  ///
  /// Render word-wrapped UCS-2 text at high quality to a new 8-bit surface.
  ///
  /// This function will allocate a new 8-bit, palettized surface. The surface's
  /// 0 pixel will be the specified background color, while other pixels have
  /// varying degrees of the foreground color. This function returns the new
  /// surface, or NULL if there was an error.
  ///
  /// Text is wrapped to multiple lines on line endings and on word boundaries if
  /// it extends beyond `wrapLength` in pixels.
  ///
  /// If wrapLength is 0, this function will only wrap on newline characters.
  ///
  /// Please note that this function is named "Unicode" but currently expects
  /// UCS-2 encoding (16 bits per codepoint). This does not give you access to
  /// large Unicode values, such as emoji glyphs. These codepoints are accessible
  /// through the UTF-8 version of this function.
  ///
  /// You can render at other quality levels with
  /// TTF_RenderUNICODE_Solid_Wrapped, TTF_RenderUNICODE_Blended_Wrapped, and
  /// TTF_RenderUNICODE_LCD_Wrapped.
  ///
  /// \param font the font to render with.
  /// \param text text to render, in UCS-2 encoding.
  /// \param fg the foreground color for the text.
  /// \returns a new 8-bit, palettized surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderUTF8_Shaded_Wrapped
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderUNICODE_Shaded_Wrapped(TTF_Font *font, const Uint16 *text, SDL_Color fg, SDL_Color bg, Uint32 wrapLength)
  /// ```
  Pointer<SdlSurface> renderUnicodeShadedWrapped(
      Pointer<Uint16> text, int fg, int bg, int wrapLength) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var bgPointer = calloc<SdlColor>()..fromU32(bg);
    var result = ttfRenderUnicodeShadedWrapped(
        this, text, fgPointer.ref, bgPointer.ref, wrapLength);
    calloc.free(fgPointer);
    calloc.free(bgPointer);
    return result;
  }

  ///
  /// Render a single 16-bit glyph at high quality to a new 8-bit surface.
  ///
  /// This function will allocate a new 8-bit, palettized surface. The surface's
  /// 0 pixel will be the specified background color, while other pixels have
  /// varying degrees of the foreground color. This function returns the new
  /// surface, or NULL if there was an error.
  ///
  /// The glyph is rendered without any padding or centering in the X direction,
  /// and aligned normally in the Y direction.
  ///
  /// Note that this version of the function takes a 16-bit character code, which
  /// covers the Basic Multilingual Plane, but is insufficient to cover the
  /// entire set of possible Unicode values, including emoji glyphs. You should
  /// use TTF_RenderGlyph32_Shaded() instead, which offers the same functionality
  /// but takes a 32-bit codepoint instead.
  ///
  /// The only reason to use this function is that it was available since the
  /// beginning of time, more or less.
  ///
  /// You can render at other quality levels with TTF_RenderGlyph_Solid,
  /// TTF_RenderGlyph_Blended, and TTF_RenderGlyph_LCD.
  ///
  /// \param font the font to render with.
  /// \param ch the character to render.
  /// \param fg the foreground color for the text.
  /// \param bg the background color for the text.
  /// \returns a new 8-bit, palettized surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderGlyph32_Shaded
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderGlyph_Shaded(TTF_Font *font, Uint16 ch, SDL_Color fg, SDL_Color bg)
  /// ```
  Pointer<SdlSurface> renderGlyphShaded(int ch, int fg, int bg) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var bgPointer = calloc<SdlColor>()..fromU32(bg);
    var result = ttfRenderGlyphShaded(this, ch, fgPointer.ref, bgPointer.ref);
    calloc.free(fgPointer);
    calloc.free(bgPointer);
    return result;
  }

  ///
  /// Render a single 32-bit glyph at high quality to a new 8-bit surface.
  ///
  /// This function will allocate a new 8-bit, palettized surface. The surface's
  /// 0 pixel will be the specified background color, while other pixels have
  /// varying degrees of the foreground color. This function returns the new
  /// surface, or NULL if there was an error.
  ///
  /// The glyph is rendered without any padding or centering in the X direction,
  /// and aligned normally in the Y direction.
  ///
  /// This is the same as TTF_RenderGlyph_Shaded(), but takes a 32-bit character
  /// instead of 16-bit, and thus can render a larger range. If you are sure
  /// you'll have an SDL_ttf that's version 2.0.18 or newer, there's no reason
  /// not to use this function exclusively.
  ///
  /// You can render at other quality levels with TTF_RenderGlyph32_Solid,
  /// TTF_RenderGlyph32_Blended, and TTF_RenderGlyph32_LCD.
  ///
  /// \param font the font to render with.
  /// \param ch the character to render.
  /// \param fg the foreground color for the text.
  /// \returns a new 8-bit, palettized surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderGlyph32_Solid
  /// \sa TTF_RenderGlyph32_Blended
  /// \sa TTF_RenderGlyph32_LCD
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderGlyph32_Shaded(TTF_Font *font, Uint32 ch, SDL_Color fg, SDL_Color bg)
  /// ```
  Pointer<SdlSurface> renderGlyph32Shaded(int ch, int fg, int bg) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var bgPointer = calloc<SdlColor>()..fromU32(bg);
    var result = ttfRenderGlyph32Shaded(this, ch, fgPointer.ref, bgPointer.ref);
    calloc.free(fgPointer);
    calloc.free(bgPointer);
    return result;
  }

  ///
  /// Render Latin1 text at high quality to a new ARGB surface.
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
  /// You almost certainly want TTF_RenderUTF8_Blended() unless you're sure you
  /// have a 1-byte Latin1 encoding. US ASCII characters will work with either
  /// function, but most other Unicode characters packed into a `const char *`
  /// will need UTF-8.
  ///
  /// You can render at other quality levels with TTF_RenderText_Solid,
  /// TTF_RenderText_Blended, and TTF_RenderText_LCD.
  ///
  /// \param font the font to render with.
  /// \param text text to render, in Latin1 encoding.
  /// \param fg the foreground color for the text.
  /// \returns a new 32-bit, ARGB surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderUTF8_Shaded
  /// \sa TTF_RenderUNICODE_Shaded
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderText_Blended(TTF_Font *font, const char *text, SDL_Color fg)
  /// ```
  Pointer<SdlSurface> renderTextBlended(String text, int fg) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var result = ttfRenderTextBlended(this, text, fgPointer.ref);
    calloc.free(fgPointer);
    return result;
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
  /// TTF_RenderUTF8_Blended_Wrapped() instead if you need to wrap the output to
  /// multiple lines.
  ///
  /// This will not wrap on newline characters.
  ///
  /// You can render at other quality levels with TTF_RenderUTF8_Solid,
  /// TTF_RenderUTF8_Shaded, and TTF_RenderUTF8_LCD.
  ///
  /// \param font the font to render with.
  /// \param text text to render, in UTF-8 encoding.
  /// \param fg the foreground color for the text.
  /// \returns a new 32-bit, ARGB surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderUNICODE_Blended
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderUTF8_Blended(TTF_Font *font, const char *text, SDL_Color fg)
  /// ```
  Pointer<SdlSurface> renderUtf8Blended(String text, int fg) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var result = ttfRenderUtf8Blended(this, text, fgPointer.ref);
    calloc.free(fgPointer);
    return result;
  }

  ///
  /// Render UCS-2 text at high quality to a new ARGB surface.
  ///
  /// This function will allocate a new 32-bit, ARGB surface, using alpha
  /// blending to dither the font with the given color. This function returns the
  /// new surface, or NULL if there was an error.
  ///
  /// This will not word-wrap the string; you'll get a surface with a single line
  /// of text, as long as the string requires. You can use
  /// TTF_RenderUNICODE_Blended_Wrapped() instead if you need to wrap the output
  /// to multiple lines.
  ///
  /// This will not wrap on newline characters.
  ///
  /// Please note that this function is named "Unicode" but currently expects
  /// UCS-2 encoding (16 bits per codepoint). This does not give you access to
  /// large Unicode values, such as emoji glyphs. These codepoints are accessible
  /// through the UTF-8 version of this function.
  ///
  /// You can render at other quality levels with TTF_RenderUNICODE_Solid,
  /// TTF_RenderUNICODE_Shaded, and TTF_RenderUNICODE_LCD.
  ///
  /// \param font the font to render with.
  /// \param text text to render, in UCS-2 encoding.
  /// \param fg the foreground color for the text.
  /// \returns a new 32-bit, ARGB surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderUTF8_Blended
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderUNICODE_Blended(TTF_Font *font, const Uint16 *text, SDL_Color fg)
  /// ```
  Pointer<SdlSurface> renderUnicodeBlended(Pointer<Uint16> text, int fg) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var result = ttfRenderUnicodeBlended(this, text, fgPointer.ref);
    calloc.free(fgPointer);
    return result;
  }

  ///
  /// Render word-wrapped Latin1 text at high quality to a new ARGB surface.
  ///
  /// This function will allocate a new 32-bit, ARGB surface, using alpha
  /// blending to dither the font with the given color. This function returns the
  /// new surface, or NULL if there was an error.
  ///
  /// Text is wrapped to multiple lines on line endings and on word boundaries if
  /// it extends beyond `wrapLength` in pixels.
  ///
  /// If wrapLength is 0, this function will only wrap on newline characters.
  ///
  /// You almost certainly want TTF_RenderUTF8_Blended_Wrapped() unless you're
  /// sure you have a 1-byte Latin1 encoding. US ASCII characters will work with
  /// either function, but most other Unicode characters packed into a `const
  /// char *` will need UTF-8.
  ///
  /// You can render at other quality levels with TTF_RenderText_Solid_Wrapped,
  /// TTF_RenderText_Shaded_Wrapped, and TTF_RenderText_LCD_Wrapped.
  ///
  /// \param font the font to render with.
  /// \param text text to render, in Latin1 encoding.
  /// \param fg the foreground color for the text.
  /// \returns a new 32-bit, ARGB surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderUTF8_Blended_Wrapped
  /// \sa TTF_RenderUNICODE_Blended_Wrapped
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderText_Blended_Wrapped(TTF_Font *font, const char *text, SDL_Color fg, Uint32 wrapLength)
  /// ```
  Pointer<SdlSurface> renderTextBlendedWrapped(
      String text, int fg, int wrapLength) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var result =
        ttfRenderTextBlendedWrapped(this, text, fgPointer.ref, wrapLength);
    calloc.free(fgPointer);
    return result;
  }

  ///
  /// Render word-wrapped UTF-8 text at high quality to a new ARGB surface.
  ///
  /// This function will allocate a new 32-bit, ARGB surface, using alpha
  /// blending to dither the font with the given color. This function returns the
  /// new surface, or NULL if there was an error.
  ///
  /// Text is wrapped to multiple lines on line endings and on word boundaries if
  /// it extends beyond `wrapLength` in pixels.
  ///
  /// If wrapLength is 0, this function will only wrap on newline characters.
  ///
  /// You can render at other quality levels with TTF_RenderUTF8_Solid_Wrapped,
  /// TTF_RenderUTF8_Shaded_Wrapped, and TTF_RenderUTF8_LCD_Wrapped.
  ///
  /// \param font the font to render with.
  /// \param text text to render, in UTF-8 encoding.
  /// \param fg the foreground color for the text.
  /// \returns a new 32-bit, ARGB surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderUTF8_Solid_Wrapped
  /// \sa TTF_RenderUTF8_Shaded_Wrapped
  /// \sa TTF_RenderUTF8_LCD_Wrapped
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderUTF8_Blended_Wrapped(TTF_Font *font, const char *text, SDL_Color fg, Uint32 wrapLength)
  /// ```
  Pointer<SdlSurface> renderUtf8BlendedWrapped(
      String text, int fg, int wrapLength) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var result =
        ttfRenderUtf8BlendedWrapped(this, text, fgPointer.ref, wrapLength);
    calloc.free(fgPointer);
    return result;
  }

  ///
  /// Render word-wrapped UCS-2 text at high quality to a new ARGB surface.
  ///
  /// This function will allocate a new 32-bit, ARGB surface, using alpha
  /// blending to dither the font with the given color. This function returns the
  /// new surface, or NULL if there was an error.
  ///
  /// Text is wrapped to multiple lines on line endings and on word boundaries if
  /// it extends beyond `wrapLength` in pixels.
  ///
  /// If wrapLength is 0, this function will only wrap on newline characters.
  ///
  /// Please note that this function is named "Unicode" but currently expects
  /// UCS-2 encoding (16 bits per codepoint). This does not give you access to
  /// large Unicode values, such as emoji glyphs. These codepoints are accessible
  /// through the UTF-8 version of this function.
  ///
  /// You can render at other quality levels with
  /// TTF_RenderUNICODE_Solid_Wrapped, TTF_RenderUNICODE_Shaded_Wrapped, and
  /// TTF_RenderUNICODE_LCD_Wrapped.
  ///
  /// \param font the font to render with.
  /// \param text text to render, in UCS-2 encoding.
  /// \param fg the foreground color for the text.
  /// \returns a new 32-bit, ARGB surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderUTF8_Blended_Wrapped
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderUNICODE_Blended_Wrapped(TTF_Font *font, const Uint16 *text, SDL_Color fg, Uint32 wrapLength)
  /// ```
  Pointer<SdlSurface> renderUnicodeBlendedWrapped(
      Pointer<Uint16> text, int fg, int wrapLength) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var result =
        ttfRenderUnicodeBlendedWrapped(this, text, fgPointer.ref, wrapLength);
    calloc.free(fgPointer);
    return result;
  }

  ///
  /// Render a single 16-bit glyph at high quality to a new ARGB surface.
  ///
  /// This function will allocate a new 32-bit, ARGB surface, using alpha
  /// blending to dither the font with the given color. This function returns the
  /// new surface, or NULL if there was an error.
  ///
  /// The glyph is rendered without any padding or centering in the X direction,
  /// and aligned normally in the Y direction.
  ///
  /// Note that this version of the function takes a 16-bit character code, which
  /// covers the Basic Multilingual Plane, but is insufficient to cover the
  /// entire set of possible Unicode values, including emoji glyphs. You should
  /// use TTF_RenderGlyph32_Blended() instead, which offers the same
  /// functionality but takes a 32-bit codepoint instead.
  ///
  /// The only reason to use this function is that it was available since the
  /// beginning of time, more or less.
  ///
  /// You can render at other quality levels with TTF_RenderGlyph_Solid,
  /// TTF_RenderGlyph_Shaded, and TTF_RenderGlyph_LCD.
  ///
  /// \param font the font to render with.
  /// \param ch the character to render.
  /// \param fg the foreground color for the text.
  /// \returns a new 32-bit, ARGB surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderGlyph32_Blended
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderGlyph_Blended(TTF_Font *font, Uint16 ch, SDL_Color fg)
  /// ```
  Pointer<SdlSurface> renderGlyphBlended(int ch, int fg) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var result = ttfRenderGlyphBlended(this, ch, fgPointer.ref);
    calloc.free(fgPointer);
    return result;
  }

  ///
  /// Render a single 32-bit glyph at high quality to a new ARGB surface.
  ///
  /// This function will allocate a new 32-bit, ARGB surface, using alpha
  /// blending to dither the font with the given color. This function returns the
  /// new surface, or NULL if there was an error.
  ///
  /// The glyph is rendered without any padding or centering in the X direction,
  /// and aligned normally in the Y direction.
  ///
  /// This is the same as TTF_RenderGlyph_Blended(), but takes a 32-bit character
  /// instead of 16-bit, and thus can render a larger range. If you are sure
  /// you'll have an SDL_ttf that's version 2.0.18 or newer, there's no reason
  /// not to use this function exclusively.
  ///
  /// You can render at other quality levels with TTF_RenderGlyph32_Solid,
  /// TTF_RenderGlyph32_Shaded, and TTF_RenderGlyph32_LCD.
  ///
  /// \param font the font to render with.
  /// \param ch the character to render.
  /// \param fg the foreground color for the text.
  /// \returns a new 32-bit, ARGB surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderGlyph32_Solid
  /// \sa TTF_RenderGlyph32_Shaded
  /// \sa TTF_RenderGlyph32_LCD
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderGlyph32_Blended(TTF_Font *font, Uint32 ch, SDL_Color fg)
  /// ```
  Pointer<SdlSurface> renderGlyph32Blended(int ch, int fg) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var result = ttfRenderGlyph32Blended(this, ch, fgPointer.ref);
    calloc.free(fgPointer);
    return result;
  }

  ///
  /// Render Latin1 text at LCD subpixel quality to a new ARGB surface.
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
  /// You almost certainly want TTF_RenderUTF8_LCD() unless you're sure you have
  /// a 1-byte Latin1 encoding. US ASCII characters will work with either
  /// function, but most other Unicode characters packed into a `const char *`
  /// will need UTF-8.
  ///
  /// You can render at other quality levels with TTF_RenderText_Solid,
  /// TTF_RenderText_Shaded, and TTF_RenderText_Blended.
  ///
  /// \param font the font to render with.
  /// \param text text to render, in Latin1 encoding.
  /// \param fg the foreground color for the text.
  /// \param bg the background color for the text.
  /// \returns a new 32-bit, ARGB surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderUTF8_LCD
  /// \sa TTF_RenderUNICODE_LCD
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderText_LCD(TTF_Font *font, const char *text, SDL_Color fg, SDL_Color bg)
  /// ```
  Pointer<SdlSurface> renderTextLcd(String text, int fg, int bg) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var bgPointer = calloc<SdlColor>()..fromU32(bg);
    var result = ttfRenderTextLcd(this, text, fgPointer.ref, bgPointer.ref);
    calloc.free(fgPointer);
    calloc.free(bgPointer);
    return result;
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
  /// TTF_RenderUTF8_LCD_Wrapped() instead if you need to wrap the output to
  /// multiple lines.
  ///
  /// This will not wrap on newline characters.
  ///
  /// You can render at other quality levels with TTF_RenderUTF8_Solid,
  /// TTF_RenderUTF8_Shaded, and TTF_RenderUTF8_Blended.
  ///
  /// \param font the font to render with.
  /// \param text text to render, in UTF-8 encoding.
  /// \param fg the foreground color for the text.
  /// \param bg the background color for the text.
  /// \returns a new 32-bit, ARGB surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderUNICODE_LCD
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderUTF8_LCD(TTF_Font *font, const char *text, SDL_Color fg, SDL_Color bg)
  /// ```
  Pointer<SdlSurface> renderUtf8Lcd(String text, int fg, int bg) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var bgPointer = calloc<SdlColor>()..fromU32(bg);
    var result = ttfRenderUtf8Lcd(this, text, fgPointer.ref, bgPointer.ref);
    calloc.free(fgPointer);
    calloc.free(bgPointer);
    return result;
  }

  ///
  /// Render UCS-2 text at LCD subpixel quality to a new ARGB surface.
  ///
  /// This function will allocate a new 32-bit, ARGB surface, and render
  /// alpha-blended text using FreeType's LCD subpixel rendering. This function
  /// returns the new surface, or NULL if there was an error.
  ///
  /// This will not word-wrap the string; you'll get a surface with a single line
  /// of text, as long as the string requires. You can use
  /// TTF_RenderUNICODE_LCD_Wrapped() instead if you need to wrap the output to
  /// multiple lines.
  ///
  /// This will not wrap on newline characters.
  ///
  /// Please note that this function is named "Unicode" but currently expects
  /// UCS-2 encoding (16 bits per codepoint). This does not give you access to
  /// large Unicode values, such as emoji glyphs. These codepoints are accessible
  /// through the UTF-8 version of this function.
  ///
  /// You can render at other quality levels with TTF_RenderUNICODE_Solid,
  /// TTF_RenderUNICODE_Shaded, and TTF_RenderUNICODE_Blended.
  ///
  /// \param font the font to render with.
  /// \param text text to render, in UCS-2 encoding.
  /// \param fg the foreground color for the text.
  /// \param bg the background color for the text.
  /// \returns a new 32-bit, ARGB surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderUTF8_LCD
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderUNICODE_LCD(TTF_Font *font, const Uint16 *text, SDL_Color fg, SDL_Color bg)
  /// ```
  Pointer<SdlSurface> renderUnicodeLcd(Pointer<Uint16> text, int fg, int bg) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var bgPointer = calloc<SdlColor>()..fromU32(bg);
    var result = ttfRenderUnicodeLcd(this, text, fgPointer.ref, bgPointer.ref);
    calloc.free(fgPointer);
    calloc.free(bgPointer);
    return result;
  }

  ///
  /// Render word-wrapped Latin1 text at LCD subpixel quality to a new ARGB
  /// surface.
  ///
  /// This function will allocate a new 32-bit, ARGB surface, and render
  /// alpha-blended text using FreeType's LCD subpixel rendering. This function
  /// returns the new surface, or NULL if there was an error.
  ///
  /// Text is wrapped to multiple lines on line endings and on word boundaries if
  /// it extends beyond `wrapLength` in pixels.
  ///
  /// If wrapLength is 0, this function will only wrap on newline characters.
  ///
  /// You almost certainly want TTF_RenderUTF8_LCD_Wrapped() unless you're sure
  /// you have a 1-byte Latin1 encoding. US ASCII characters will work with
  /// either function, but most other Unicode characters packed into a `const
  /// char *` will need UTF-8.
  ///
  /// You can render at other quality levels with TTF_RenderText_Solid_Wrapped,
  /// TTF_RenderText_Shaded_Wrapped, and TTF_RenderText_Blended_Wrapped.
  ///
  /// \param font the font to render with.
  /// \param text text to render, in Latin1 encoding.
  /// \param fg the foreground color for the text.
  /// \param bg the background color for the text.
  /// \returns a new 32-bit, ARGB surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderUTF8_LCD_Wrapped
  /// \sa TTF_RenderUNICODE_LCD_Wrapped
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderText_LCD_Wrapped(TTF_Font *font, const char *text, SDL_Color fg, SDL_Color bg, Uint32 wrapLength)
  /// ```
  Pointer<SdlSurface> renderTextLcdWrapped(
      String text, int fg, int bg, int wrapLength) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var bgPointer = calloc<SdlColor>()..fromU32(bg);
    var result = ttfRenderTextLcdWrapped(
        this, text, fgPointer.ref, bgPointer.ref, wrapLength);
    calloc.free(fgPointer);
    calloc.free(bgPointer);
    return result;
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
  /// it extends beyond `wrapLength` in pixels.
  ///
  /// If wrapLength is 0, this function will only wrap on newline characters.
  ///
  /// You can render at other quality levels with TTF_RenderUTF8_Solid_Wrapped,
  /// TTF_RenderUTF8_Shaded_Wrapped, and TTF_RenderUTF8_Blended_Wrapped.
  ///
  /// \param font the font to render with.
  /// \param text text to render, in UTF-8 encoding.
  /// \param fg the foreground color for the text.
  /// \param bg the background color for the text.
  /// \returns a new 32-bit, ARGB surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderUTF8_Solid_Wrapped
  /// \sa TTF_RenderUTF8_Shaded_Wrapped
  /// \sa TTF_RenderUTF8_Blended_Wrapped
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderUTF8_LCD_Wrapped(TTF_Font *font, const char *text, SDL_Color fg, SDL_Color bg, Uint32 wrapLength)
  /// ```
  Pointer<SdlSurface> renderUtf8LcdWrapped(
      String text, int fg, int bg, int wrapLength) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var bgPointer = calloc<SdlColor>()..fromU32(bg);
    var result = ttfRenderUtf8LcdWrapped(
        this, text, fgPointer.ref, bgPointer.ref, wrapLength);
    calloc.free(fgPointer);
    calloc.free(bgPointer);
    return result;
  }

  ///
  /// Render word-wrapped UCS-2 text at LCD subpixel quality to a new ARGB
  /// surface.
  ///
  /// This function will allocate a new 32-bit, ARGB surface, and render
  /// alpha-blended text using FreeType's LCD subpixel rendering. This function
  /// returns the new surface, or NULL if there was an error.
  ///
  /// Text is wrapped to multiple lines on line endings and on word boundaries if
  /// it extends beyond `wrapLength` in pixels.
  ///
  /// If wrapLength is 0, this function will only wrap on newline characters.
  ///
  /// Please note that this function is named "Unicode" but currently expects
  /// UCS-2 encoding (16 bits per codepoint). This does not give you access to
  /// large Unicode values, such as emoji glyphs. These codepoints are accessible
  /// through the UTF-8 version of this function.
  ///
  /// You can render at other quality levels with
  /// TTF_RenderUNICODE_Solid_Wrapped, TTF_RenderUNICODE_Shaded_Wrapped, and
  /// TTF_RenderUNICODE_Blended_Wrapped.
  ///
  /// \param font the font to render with.
  /// \param text text to render, in UCS-2 encoding.
  /// \param fg the foreground color for the text.
  /// \param bg the background color for the text.
  /// \returns a new 32-bit, ARGB surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderUTF8_LCD_Wrapped
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderUNICODE_LCD_Wrapped(TTF_Font *font, const Uint16 *text, SDL_Color fg, SDL_Color bg, Uint32 wrapLength)
  /// ```
  Pointer<SdlSurface> renderUnicodeLcdWrapped(
      Pointer<Uint16> text, int fg, int bg, int wrapLength) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var bgPointer = calloc<SdlColor>()..fromU32(bg);
    var result = ttfRenderUnicodeLcdWrapped(
        this, text, fgPointer.ref, bgPointer.ref, wrapLength);
    calloc.free(fgPointer);
    calloc.free(bgPointer);
    return result;
  }

  ///
  /// Render a single 16-bit glyph at LCD subpixel quality to a new ARGB surface.
  ///
  /// This function will allocate a new 32-bit, ARGB surface, and render
  /// alpha-blended text using FreeType's LCD subpixel rendering. This function
  /// returns the new surface, or NULL if there was an error.
  ///
  /// The glyph is rendered without any padding or centering in the X direction,
  /// and aligned normally in the Y direction.
  ///
  /// Note that this version of the function takes a 16-bit character code, which
  /// covers the Basic Multilingual Plane, but is insufficient to cover the
  /// entire set of possible Unicode values, including emoji glyphs. You should
  /// use TTF_RenderGlyph32_LCD() instead, which offers the same functionality
  /// but takes a 32-bit codepoint instead.
  ///
  /// This function only exists for consistency with the existing API at the time
  /// of its addition.
  ///
  /// You can render at other quality levels with TTF_RenderGlyph_Solid,
  /// TTF_RenderGlyph_Shaded, and TTF_RenderGlyph_Blended.
  ///
  /// \param font the font to render with.
  /// \param ch the character to render.
  /// \param fg the foreground color for the text.
  /// \param bg the background color for the text.
  /// \returns a new 32-bit, ARGB surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderGlyph32_LCD
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderGlyph_LCD(TTF_Font *font, Uint16 ch, SDL_Color fg, SDL_Color bg)
  /// ```
  Pointer<SdlSurface> renderGlyphLcd(int ch, int fg, int bg) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var bgPointer = calloc<SdlColor>()..fromU32(bg);
    var result = ttfRenderGlyphLcd(this, ch, fgPointer.ref, bgPointer.ref);
    calloc.free(fgPointer);
    calloc.free(bgPointer);
    return result;
  }

  ///
  /// Render a single 32-bit glyph at LCD subpixel quality to a new ARGB surface.
  ///
  /// This function will allocate a new 32-bit, ARGB surface, and render
  /// alpha-blended text using FreeType's LCD subpixel rendering. This function
  /// returns the new surface, or NULL if there was an error.
  ///
  /// The glyph is rendered without any padding or centering in the X direction,
  /// and aligned normally in the Y direction.
  ///
  /// This is the same as TTF_RenderGlyph_LCD(), but takes a 32-bit character
  /// instead of 16-bit, and thus can render a larger range. Between the two, you
  /// should always use this function.
  ///
  /// You can render at other quality levels with TTF_RenderGlyph32_Solid,
  /// TTF_RenderGlyph32_Shaded, and TTF_RenderGlyph32_Blended.
  ///
  /// \param font the font to render with.
  /// \param ch the character to render.
  /// \param fg the foreground color for the text.
  /// \param bg the background color for the text.
  /// \returns a new 32-bit, ARGB surface, or NULL if there was an error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_RenderGlyph32_Solid
  /// \sa TTF_RenderGlyph32_Shaded
  /// \sa TTF_RenderGlyph32_Blended
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL TTF_RenderGlyph32_LCD(TTF_Font *font, Uint32 ch, SDL_Color fg, SDL_Color bg)
  /// ```
  Pointer<SdlSurface> renderGlyph32Lcd(int ch, int fg, int bg) {
    var fgPointer = calloc<SdlColor>()..fromU32(fg);
    var bgPointer = calloc<SdlColor>()..fromU32(bg);
    var result = ttfRenderGlyph32Lcd(this, ch, fgPointer.ref, bgPointer.ref);
    calloc.free(fgPointer);
    calloc.free(bgPointer);
    return result;
  }

  ///
  /// Dispose of a previously-created font.
  ///
  /// Call this when done with a font. This function will free any resources
  /// associated with it. It is safe to call this function on NULL, for example
  /// on the result of a failed call to TTF_OpenFont().
  ///
  /// The font is not valid after being passed to this function. String pointers
  /// from functions that return information on this font, such as
  /// TTF_FontFaceFamilyName() and TTF_FontFaceStyleName(), are no longer valid
  /// after this call, as well.
  ///
  /// \param font the font to dispose of.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_OpenFont
  /// \sa TTF_OpenFontIndexDPIIO
  /// \sa TTF_OpenFontIO
  /// \sa TTF_OpenFontDPI
  /// \sa TTF_OpenFontDPIIO
  /// \sa TTF_OpenFontIndex
  /// \sa TTF_OpenFontIndexDPI
  /// \sa TTF_OpenFontIndexDPIIO
  /// \sa TTF_OpenFontIndexIO
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL TTF_CloseFont(TTF_Font *font)
  /// ```
  void close() {
    ttfCloseFont(this);
  }

  // ttfQuit
  // ttfWasInit

  ///
  /// Query the kerning size of two 16-bit glyphs.
  ///
  /// Note that this version of the function takes 16-bit character
  /// codes, which covers the Basic Multilingual Plane, but is insufficient
  /// to cover the entire set of possible Unicode values, including emoji
  /// glyphs. You should use TTF_GetFontKerningSizeGlyphs32() instead, which
  /// offers the same functionality but takes a 32-bit codepoints instead.
  ///
  /// The only reason to use this function is that it was available since
  /// the beginning of time, more or less.
  ///
  /// \param font the font to query.
  /// \param previous_ch the previous character's code, 16 bits.
  /// \param ch the current character's code, 16 bits.
  /// \returns The kerning size between the two specified characters, in pixels, or -1 on error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_GetFontKerningSizeGlyphs32
  ///
  /// ```c
  /// extern SDL_DECLSPEC int TTF_GetFontKerningSizeGlyphs(TTF_Font *font, Uint16 previous_ch, Uint16 ch)
  /// ```
  int getKerningSizeGlyphs(int previousCh, int ch) {
    return ttfGetFontKerningSizeGlyphs(this, previousCh, ch);
  }

  ///
  /// Query the kerning size of two 32-bit glyphs.
  ///
  /// This is the same as TTF_GetFontKerningSizeGlyphs(), but takes 32-bit
  /// characters instead of 16-bit, and thus can manage a larger range. If
  /// you are sure you'll have an SDL_ttf that's version 2.0.18 or newer,
  /// there's no reason not to use this function exclusively.
  ///
  /// \param font the font to query.
  /// \param previous_ch the previous character's code, 32 bits.
  /// \param ch the current character's code, 32 bits.
  /// \returns The kerning size between the two specified characters, in pixels, or -1 on error.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC int TTF_GetFontKerningSizeGlyphs32(TTF_Font *font, Uint32 previous_ch, Uint32 ch)
  /// ```
  int getKerningSizeGlyphs32(int previousCh, int ch) {
    return ttfGetFontKerningSizeGlyphs32(this, previousCh, ch);
  }

  ///
  /// Enable Signed Distance Field rendering for a font.
  ///
  /// This works with the Blended APIs. SDF is a technique that
  /// helps fonts look sharp even when scaling and rotating.
  ///
  /// This clears already-generated glyphs, if any, from the cache.
  ///
  /// \param font the font to set SDF support on.
  /// \param enabled SDL_TRUE to enable SDF, SDL_FALSE to disable.
  /// \returns SDL_TRUE on success or SDL_FALSE on failure; call SDL_GetError()
  /// for more information.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_GetFontSDF
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_bool TTF_SetFontSDF(TTF_Font *font, SDL_bool enabled)
  /// ```
  bool setSdf(bool onOff) {
    return ttfSetFontSdf(this, onOff);
  }

  ///
  /// Query whether Signed Distance Field rendering is enabled for a font.
  ///
  /// \param font the font to query
  ///
  /// \returns SDL_TRUE if enabled, SDL_FALSE otherwise.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// \sa TTF_SetFontSDF
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_bool TTF_GetFontSDF(const TTF_Font *font)
  /// ```
  bool getSdf() {
    return ttfGetFontSdf(this);
  }

  ///
  /// Set direction to be used for text shaping by a font.
  ///
  /// Possible direction values are:
  ///
  /// - `TTF_DIRECTION_LTR` (Left to Right)
  /// - `TTF_DIRECTION_RTL` (Right to Left)
  /// - `TTF_DIRECTION_TTB` (Top to Bottom)
  /// - `TTF_DIRECTION_BTT` (Bottom to Top)
  ///
  /// If SDL_ttf was not built with HarfBuzz support, this function returns -1.
  ///
  /// \param font the font to specify a direction for.
  /// \param direction the new direction for text to flow.
  /// \returns SDL_TRUE on success or SDL_FALSE on failure; call SDL_GetError()
  /// for more information.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_bool SDLCALL TTF_SetFontDirection(TTF_Font *font, TTF_Direction direction)
  /// ```
  bool setDirection(int direction) {
    return ttfSetFontDirection(this, direction);
  }

  ///
  /// Set script to be used for text shaping by a font.
  ///
  /// The supplied script value must be a null-terminated string of exactly four
  /// characters.
  ///
  /// If SDL_ttf was not built with HarfBuzz support, this function returns -1.
  ///
  /// \param font the font to specify a script name for.
  /// \param script null-terminated string of exactly 4 characters.
  /// \returns SDL_TRUE on success or SDL_FALSE on failure; call SDL_GetError()
  /// for more information.
  ///
  /// \since This function is available since SDL_ttf 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_bool SDLCALL TTF_SetFontScriptName(TTF_Font *font, const char *script)
  /// ```
  bool setScriptName(String script) {
    return ttfSetFontScriptName(this, script);
  }
}
