// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
// ignore_for_file: avoid_positional_boolean_parameters
part of '../sdl_ttf.dart';

///
/// This function gets the version of the dynamically linked SDL_ttf library.
///
/// \returns SDL_ttf version.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL TTF_Version(void)
/// ```
int ttfVersion() {
  final ttfVersionLookupFunction = _libTtf
      .lookupFunction<Int32 Function(), int Function()>('TTF_Version');
  return ttfVersionLookupFunction();
}

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
void ttfGetFreeTypeVersion(
  Pointer<Int32> major,
  Pointer<Int32> minor,
  Pointer<Int32> patch,
) {
  final ttfGetFreeTypeVersionLookupFunction = _libTtf
      .lookupFunction<
        Void Function(
          Pointer<Int32> major,
          Pointer<Int32> minor,
          Pointer<Int32> patch,
        ),
        void Function(
          Pointer<Int32> major,
          Pointer<Int32> minor,
          Pointer<Int32> patch,
        )
      >('TTF_GetFreeTypeVersion');
  return ttfGetFreeTypeVersionLookupFunction(major, minor, patch);
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
void ttfGetHarfBuzzVersion(
  Pointer<Int32> major,
  Pointer<Int32> minor,
  Pointer<Int32> patch,
) {
  final ttfGetHarfBuzzVersionLookupFunction = _libTtf
      .lookupFunction<
        Void Function(
          Pointer<Int32> major,
          Pointer<Int32> minor,
          Pointer<Int32> patch,
        ),
        void Function(
          Pointer<Int32> major,
          Pointer<Int32> minor,
          Pointer<Int32> patch,
        )
      >('TTF_GetHarfBuzzVersion');
  return ttfGetHarfBuzzVersionLookupFunction(major, minor, patch);
}

///
/// Initialize SDL_ttf.
///
/// You must successfully call this function before it is safe to call any
/// other function in this library.
///
/// It is safe to call this more than once, and each successful TTF_Init() call
/// should be paired with a matching TTF_Quit() call.
///
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_Quit
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL TTF_Init(void)
/// ```
bool ttfInit() {
  final ttfInitLookupFunction = _libTtf
      .lookupFunction<Uint8 Function(), int Function()>('TTF_Init');
  return ttfInitLookupFunction() == 1;
}

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
/// \returns a valid TTF_Font, or NULL on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_CloseFont
///
/// ```c
/// extern SDL_DECLSPEC TTF_Font * SDLCALL TTF_OpenFont(const char *file, float ptsize)
/// ```
Pointer<TtfFont> ttfOpenFont(String? file, double ptsize) {
  final ttfOpenFontLookupFunction = _libTtf
      .lookupFunction<
        Pointer<TtfFont> Function(Pointer<Utf8> file, Float ptsize),
        Pointer<TtfFont> Function(Pointer<Utf8> file, double ptsize)
      >('TTF_OpenFont');
  final filePointer = file != null ? file.toNativeUtf8() : nullptr;
  final result = ttfOpenFontLookupFunction(filePointer, ptsize);
  calloc.free(filePointer);
  return result;
}

///
/// Create a font from an SDL_IOStream, using a specified point size.
///
/// Some .fon fonts will have several sizes embedded in the file, so the point
/// size becomes the index of choosing which size. If the value is too high,
/// the last indexed size will be the default.
///
/// If `closeio` is true, `src` will be automatically closed once the font is
/// closed. Otherwise you should keep `src` open until the font is closed.
///
/// When done with the returned TTF_Font, use TTF_CloseFont() to dispose of it.
///
/// \param src an SDL_IOStream to provide a font file's data.
/// \param closeio true to close `src` when the font is closed, false to leave
/// it open.
/// \param ptsize point size to use for the newly-opened font.
/// \returns a valid TTF_Font, or NULL on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_CloseFont
///
/// ```c
/// extern SDL_DECLSPEC TTF_Font * SDLCALL TTF_OpenFontIO(SDL_IOStream *src, bool closeio, float ptsize)
/// ```
Pointer<TtfFont> ttfOpenFontIo(
  Pointer<SdlIoStream> src,
  bool closeio,
  double ptsize,
) {
  final ttfOpenFontIoLookupFunction = _libTtf
      .lookupFunction<
        Pointer<TtfFont> Function(
          Pointer<SdlIoStream> src,
          Uint8 closeio,
          Float ptsize,
        ),
        Pointer<TtfFont> Function(
          Pointer<SdlIoStream> src,
          int closeio,
          double ptsize,
        )
      >('TTF_OpenFontIO');
  return ttfOpenFontIoLookupFunction(src, closeio ? 1 : 0, ptsize);
}

///
/// Create a font with the specified properties.
///
/// These are the supported properties:
///
/// - `TTF_PROP_FONT_CREATE_FILENAME_STRING`: the font file to open, if an
/// SDL_IOStream isn't being used. This is required if
/// `TTF_PROP_FONT_CREATE_IOSTREAM_POINTER` and
/// `TTF_PROP_FONT_CREATE_EXISTING_FONT_POINTER` aren't set.
/// - `TTF_PROP_FONT_CREATE_IOSTREAM_POINTER`: an SDL_IOStream containing the
/// font to be opened. This should not be closed until the font is closed.
/// This is required if `TTF_PROP_FONT_CREATE_FILENAME_STRING` and
/// `TTF_PROP_FONT_CREATE_EXISTING_FONT_POINTER` aren't set.
/// - `TTF_PROP_FONT_CREATE_IOSTREAM_OFFSET_NUMBER`: the offset in the iostream
/// for the beginning of the font, defaults to 0.
/// - `TTF_PROP_FONT_CREATE_IOSTREAM_AUTOCLOSE_BOOLEAN`: true if closing the
/// font should also close the associated SDL_IOStream.
/// - `TTF_PROP_FONT_CREATE_SIZE_FLOAT`: the point size of the font. Some .fon
/// fonts will have several sizes embedded in the file, so the point size
/// becomes the index of choosing which size. If the value is too high, the
/// last indexed size will be the default.
/// - `TTF_PROP_FONT_CREATE_FACE_NUMBER`: the face index of the font, if the
/// font contains multiple font faces.
/// - `TTF_PROP_FONT_CREATE_HORIZONTAL_DPI_NUMBER`: the horizontal DPI to use
/// for font rendering, defaults to
/// `TTF_PROP_FONT_CREATE_VERTICAL_DPI_NUMBER` if set, or 72 otherwise.
/// - `TTF_PROP_FONT_CREATE_VERTICAL_DPI_NUMBER`: the vertical DPI to use for
/// font rendering, defaults to `TTF_PROP_FONT_CREATE_HORIZONTAL_DPI_NUMBER`
/// if set, or 72 otherwise.
/// - `TTF_PROP_FONT_CREATE_EXISTING_FONT_POINTER`: an optional TTF_Font that,
/// if set, will be used as the font data source and the initial size and
/// style of the new font.
///
/// \param props the properties to use.
/// \returns a valid TTF_Font, or NULL on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_CloseFont
///
/// ```c
/// extern SDL_DECLSPEC TTF_Font * SDLCALL TTF_OpenFontWithProperties(SDL_PropertiesID props)
/// ```
Pointer<TtfFont> ttfOpenFontWithProperties(int props) {
  final ttfOpenFontWithPropertiesLookupFunction = _libTtf
      .lookupFunction<
        Pointer<TtfFont> Function(Uint32 props),
        Pointer<TtfFont> Function(int props)
      >('TTF_OpenFontWithProperties');
  return ttfOpenFontWithPropertiesLookupFunction(props);
}

///
/// Create a copy of an existing font.
///
/// The copy will be distinct from the original, but will share the font file
/// and have the same size and style as the original.
///
/// When done with the returned TTF_Font, use TTF_CloseFont() to dispose of it.
///
/// \param existing_font the font to copy.
/// \returns a valid TTF_Font, or NULL on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should be called on the thread that created the
/// original font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_CloseFont
///
/// ```c
/// extern SDL_DECLSPEC TTF_Font * SDLCALL TTF_CopyFont(TTF_Font *existing_font)
/// ```
Pointer<TtfFont> ttfCopyFont(Pointer<TtfFont> existingFont) {
  final ttfCopyFontLookupFunction = _libTtf
      .lookupFunction<
        Pointer<TtfFont> Function(Pointer<TtfFont> existingFont),
        Pointer<TtfFont> Function(Pointer<TtfFont> existingFont)
      >('TTF_CopyFont');
  return ttfCopyFontLookupFunction(existingFont);
}

///
/// Get the properties associated with a font.
///
/// The following read-write properties are provided by SDL:
///
/// - `TTF_PROP_FONT_OUTLINE_LINE_CAP_NUMBER`: The FT_Stroker_LineCap value
/// used when setting the font outline, defaults to
/// `FT_STROKER_LINECAP_ROUND`.
/// - `TTF_PROP_FONT_OUTLINE_LINE_JOIN_NUMBER`: The FT_Stroker_LineJoin value
/// used when setting the font outline, defaults to
/// `FT_STROKER_LINEJOIN_ROUND`.
/// - `TTF_PROP_FONT_OUTLINE_MITER_LIMIT_NUMBER`: The FT_Fixed miter limit used
/// when setting the font outline, defaults to 0.
///
/// \param font the font to query.
/// \returns a valid property ID on success or 0 on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_PropertiesID SDLCALL TTF_GetFontProperties(TTF_Font *font)
/// ```
int ttfGetFontProperties(Pointer<TtfFont> font) {
  final ttfGetFontPropertiesLookupFunction = _libTtf
      .lookupFunction<
        Uint32 Function(Pointer<TtfFont> font),
        int Function(Pointer<TtfFont> font)
      >('TTF_GetFontProperties');
  return ttfGetFontPropertiesLookupFunction(font);
}

///
/// Get the font generation.
///
/// The generation is incremented each time font properties change that require
/// rebuilding glyphs, such as style, size, etc.
///
/// \param font the font to query.
/// \returns the font generation or 0 on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC Uint32 SDLCALL TTF_GetFontGeneration(TTF_Font *font)
/// ```
int ttfGetFontGeneration(Pointer<TtfFont> font) {
  final ttfGetFontGenerationLookupFunction = _libTtf
      .lookupFunction<
        Uint32 Function(Pointer<TtfFont> font),
        int Function(Pointer<TtfFont> font)
      >('TTF_GetFontGeneration');
  return ttfGetFontGenerationLookupFunction(font);
}

///
/// Add a fallback font.
///
/// Add a font that will be used for glyphs that are not in the current font.
/// The fallback font should have the same size and style as the current font.
///
/// If there are multiple fallback fonts, they are used in the order added.
///
/// This updates any TTF_Text objects using this font.
///
/// \param font the font to modify.
/// \param fallback the font to add as a fallback.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should be called on the thread that created
/// both fonts.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_ClearFallbackFonts
/// \sa TTF_RemoveFallbackFont
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL TTF_AddFallbackFont(TTF_Font *font, TTF_Font *fallback)
/// ```
bool ttfAddFallbackFont(Pointer<TtfFont> font, Pointer<TtfFont> fallback) {
  final ttfAddFallbackFontLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(Pointer<TtfFont> font, Pointer<TtfFont> fallback),
        int Function(Pointer<TtfFont> font, Pointer<TtfFont> fallback)
      >('TTF_AddFallbackFont');
  return ttfAddFallbackFontLookupFunction(font, fallback) == 1;
}

///
/// Remove a fallback font.
///
/// This updates any TTF_Text objects using this font.
///
/// \param font the font to modify.
/// \param fallback the font to remove as a fallback.
///
/// \threadsafety This function should be called on the thread that created
/// both fonts.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_AddFallbackFont
/// \sa TTF_ClearFallbackFonts
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL TTF_RemoveFallbackFont(TTF_Font *font, TTF_Font *fallback)
/// ```
void ttfRemoveFallbackFont(Pointer<TtfFont> font, Pointer<TtfFont> fallback) {
  final ttfRemoveFallbackFontLookupFunction = _libTtf
      .lookupFunction<
        Void Function(Pointer<TtfFont> font, Pointer<TtfFont> fallback),
        void Function(Pointer<TtfFont> font, Pointer<TtfFont> fallback)
      >('TTF_RemoveFallbackFont');
  return ttfRemoveFallbackFontLookupFunction(font, fallback);
}

///
/// Remove all fallback fonts.
///
/// This updates any TTF_Text objects using this font.
///
/// \param font the font to modify.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_AddFallbackFont
/// \sa TTF_RemoveFallbackFont
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL TTF_ClearFallbackFonts(TTF_Font *font)
/// ```
void ttfClearFallbackFonts(Pointer<TtfFont> font) {
  final ttfClearFallbackFontsLookupFunction = _libTtf
      .lookupFunction<
        Void Function(Pointer<TtfFont> font),
        void Function(Pointer<TtfFont> font)
      >('TTF_ClearFallbackFonts');
  return ttfClearFallbackFontsLookupFunction(font);
}

///
/// Set a font's size dynamically.
///
/// This updates any TTF_Text objects using this font, and clears
/// already-generated glyphs, if any, from the cache.
///
/// \param font the font to resize.
/// \param ptsize the new point size.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_GetFontSize
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL TTF_SetFontSize(TTF_Font *font, float ptsize)
/// ```
bool ttfSetFontSize(Pointer<TtfFont> font, double ptsize) {
  final ttfSetFontSizeLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(Pointer<TtfFont> font, Float ptsize),
        int Function(Pointer<TtfFont> font, double ptsize)
      >('TTF_SetFontSize');
  return ttfSetFontSizeLookupFunction(font, ptsize) == 1;
}

///
/// Set font size dynamically with target resolutions, in dots per inch.
///
/// This updates any TTF_Text objects using this font, and clears
/// already-generated glyphs, if any, from the cache.
///
/// \param font the font to resize.
/// \param ptsize the new point size.
/// \param hdpi the target horizontal DPI.
/// \param vdpi the target vertical DPI.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_GetFontSize
/// \sa TTF_GetFontSizeDPI
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL TTF_SetFontSizeDPI(TTF_Font *font, float ptsize, int hdpi, int vdpi)
/// ```
bool ttfSetFontSizeDpi(
  Pointer<TtfFont> font,
  double ptsize,
  int hdpi,
  int vdpi,
) {
  final ttfSetFontSizeDpiLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(
          Pointer<TtfFont> font,
          Float ptsize,
          Int32 hdpi,
          Int32 vdpi,
        ),
        int Function(Pointer<TtfFont> font, double ptsize, int hdpi, int vdpi)
      >('TTF_SetFontSizeDPI');
  return ttfSetFontSizeDpiLookupFunction(font, ptsize, hdpi, vdpi) == 1;
}

///
/// Get the size of a font.
///
/// \param font the font to query.
/// \returns the size of the font, or 0.0f on failure; call SDL_GetError() for
/// more information.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_SetFontSize
/// \sa TTF_SetFontSizeDPI
///
/// ```c
/// extern SDL_DECLSPEC float SDLCALL TTF_GetFontSize(TTF_Font *font)
/// ```
double ttfGetFontSize(Pointer<TtfFont> font) {
  final ttfGetFontSizeLookupFunction = _libTtf
      .lookupFunction<
        Float Function(Pointer<TtfFont> font),
        double Function(Pointer<TtfFont> font)
      >('TTF_GetFontSize');
  return ttfGetFontSizeLookupFunction(font);
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
bool ttfGetFontDpi(
  Pointer<TtfFont> font,
  Pointer<Int32> hdpi,
  Pointer<Int32> vdpi,
) {
  final ttfGetFontDpiLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(
          Pointer<TtfFont> font,
          Pointer<Int32> hdpi,
          Pointer<Int32> vdpi,
        ),
        int Function(
          Pointer<TtfFont> font,
          Pointer<Int32> hdpi,
          Pointer<Int32> vdpi,
        )
      >('TTF_GetFontDPI');
  return ttfGetFontDpiLookupFunction(font, hdpi, vdpi) == 1;
}

///
/// Set a font's current style.
///
/// This updates any TTF_Text objects using this font, and clears
/// already-generated glyphs, if any, from the cache.
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
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_GetFontStyle
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL TTF_SetFontStyle(TTF_Font *font, TTF_FontStyleFlags style)
/// ```
void ttfSetFontStyle(Pointer<TtfFont> font, int style) {
  final ttfSetFontStyleLookupFunction = _libTtf
      .lookupFunction<
        Void Function(Pointer<TtfFont> font, Uint32 style),
        void Function(Pointer<TtfFont> font, int style)
      >('TTF_SetFontStyle');
  return ttfSetFontStyleLookupFunction(font, style);
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
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_SetFontStyle
///
/// ```c
/// extern SDL_DECLSPEC TTF_FontStyleFlags SDLCALL TTF_GetFontStyle(const TTF_Font *font)
/// ```
int ttfGetFontStyle(Pointer<TtfFont> font) {
  final ttfGetFontStyleLookupFunction = _libTtf
      .lookupFunction<
        Uint32 Function(Pointer<TtfFont> font),
        int Function(Pointer<TtfFont> font)
      >('TTF_GetFontStyle');
  return ttfGetFontStyleLookupFunction(font);
}

///
/// Set a font's current outline.
///
/// This uses the font properties `TTF_PROP_FONT_OUTLINE_LINE_CAP_NUMBER`,
/// `TTF_PROP_FONT_OUTLINE_LINE_JOIN_NUMBER`, and
/// `TTF_PROP_FONT_OUTLINE_MITER_LIMIT_NUMBER` when setting the font outline.
///
/// This updates any TTF_Text objects using this font, and clears
/// already-generated glyphs, if any, from the cache.
///
/// \param font the font to set a new outline on.
/// \param outline positive outline value, 0 to default.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_GetFontOutline
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL TTF_SetFontOutline(TTF_Font *font, int outline)
/// ```
bool ttfSetFontOutline(Pointer<TtfFont> font, int outline) {
  final ttfSetFontOutlineLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(Pointer<TtfFont> font, Int32 outline),
        int Function(Pointer<TtfFont> font, int outline)
      >('TTF_SetFontOutline');
  return ttfSetFontOutlineLookupFunction(font, outline) == 1;
}

///
/// Query a font's current outline.
///
/// \param font the font to query.
/// \returns the font's current outline value.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_SetFontOutline
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL TTF_GetFontOutline(const TTF_Font *font)
/// ```
int ttfGetFontOutline(Pointer<TtfFont> font) {
  final ttfGetFontOutlineLookupFunction = _libTtf
      .lookupFunction<
        Int32 Function(Pointer<TtfFont> font),
        int Function(Pointer<TtfFont> font)
      >('TTF_GetFontOutline');
  return ttfGetFontOutlineLookupFunction(font);
}

///
/// Set a font's current hinter setting.
///
/// This updates any TTF_Text objects using this font, and clears
/// already-generated glyphs, if any, from the cache.
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
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_GetFontHinting
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL TTF_SetFontHinting(TTF_Font *font, TTF_HintingFlags hinting)
/// ```
void ttfSetFontHinting(Pointer<TtfFont> font, int hinting) {
  final ttfSetFontHintingLookupFunction = _libTtf
      .lookupFunction<
        Void Function(Pointer<TtfFont> font, Int32 hinting),
        void Function(Pointer<TtfFont> font, int hinting)
      >('TTF_SetFontHinting');
  return ttfSetFontHintingLookupFunction(font, hinting);
}

///
/// Query the number of faces of a font.
///
/// \param font the font to query.
/// \returns the number of FreeType font faces.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL TTF_GetNumFontFaces(const TTF_Font *font)
/// ```
int ttfGetNumFontFaces(Pointer<TtfFont> font) {
  final ttfGetNumFontFacesLookupFunction = _libTtf
      .lookupFunction<
        Int32 Function(Pointer<TtfFont> font),
        int Function(Pointer<TtfFont> font)
      >('TTF_GetNumFontFaces');
  return ttfGetNumFontFacesLookupFunction(font);
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
/// \returns the font's current hinter value, or TTF_HINTING_INVALID if the
/// font is invalid.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_SetFontHinting
///
/// ```c
/// extern SDL_DECLSPEC TTF_HintingFlags SDLCALL TTF_GetFontHinting(const TTF_Font *font)
/// ```
int ttfGetFontHinting(Pointer<TtfFont> font) {
  final ttfGetFontHintingLookupFunction = _libTtf
      .lookupFunction<
        Int32 Function(Pointer<TtfFont> font),
        int Function(Pointer<TtfFont> font)
      >('TTF_GetFontHinting');
  return ttfGetFontHintingLookupFunction(font);
}

///
/// Enable Signed Distance Field rendering for a font.
///
/// SDF is a technique that helps fonts look sharp even when scaling and
/// rotating, and requires special shader support for display.
///
/// This works with Blended APIs, and generates the raw signed distance values
/// in the alpha channel of the resulting texture.
///
/// This updates any TTF_Text objects using this font, and clears
/// already-generated glyphs, if any, from the cache.
///
/// \param font the font to set SDF support on.
/// \param enabled true to enable SDF, false to disable.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_GetFontSDF
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL TTF_SetFontSDF(TTF_Font *font, bool enabled)
/// ```
bool ttfSetFontSdf(Pointer<TtfFont> font, bool enabled) {
  final ttfSetFontSdfLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(Pointer<TtfFont> font, Uint8 enabled),
        int Function(Pointer<TtfFont> font, int enabled)
      >('TTF_SetFontSDF');
  return ttfSetFontSdfLookupFunction(font, enabled ? 1 : 0) == 1;
}

///
/// Query whether Signed Distance Field rendering is enabled for a font.
///
/// \param font the font to query.
/// \returns true if enabled, false otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_SetFontSDF
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL TTF_GetFontSDF(const TTF_Font *font)
/// ```
bool ttfGetFontSdf(Pointer<TtfFont> font) {
  final ttfGetFontSdfLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(Pointer<TtfFont> font),
        int Function(Pointer<TtfFont> font)
      >('TTF_GetFontSDF');
  return ttfGetFontSdfLookupFunction(font) == 1;
}

///
/// Query a font's weight, in terms of the lightness/heaviness of the strokes.
///
/// \param font the font to query.
/// \returns the font's current weight.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.2.2.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL TTF_GetFontWeight(const TTF_Font *font)
/// ```
int ttfGetFontWeight(Pointer<TtfFont> font) {
  final ttfGetFontWeightLookupFunction = _libTtf
      .lookupFunction<
        Int32 Function(Pointer<TtfFont> font),
        int Function(Pointer<TtfFont> font)
      >('TTF_GetFontWeight');
  return ttfGetFontWeightLookupFunction(font);
}

///
/// Set a font's current wrap alignment option.
///
/// This updates any TTF_Text objects using this font.
///
/// \param font the font to set a new wrap alignment option on.
/// \param align the new wrap alignment option.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_GetFontWrapAlignment
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL TTF_SetFontWrapAlignment(TTF_Font *font, TTF_HorizontalAlignment align)
/// ```
void ttfSetFontWrapAlignment(Pointer<TtfFont> font, int align) {
  final ttfSetFontWrapAlignmentLookupFunction = _libTtf
      .lookupFunction<
        Void Function(Pointer<TtfFont> font, Int32 align),
        void Function(Pointer<TtfFont> font, int align)
      >('TTF_SetFontWrapAlignment');
  return ttfSetFontWrapAlignmentLookupFunction(font, align);
}

///
/// Query a font's current wrap alignment option.
///
/// \param font the font to query.
/// \returns the font's current wrap alignment option.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_SetFontWrapAlignment
///
/// ```c
/// extern SDL_DECLSPEC TTF_HorizontalAlignment SDLCALL TTF_GetFontWrapAlignment(const TTF_Font *font)
/// ```
int ttfGetFontWrapAlignment(Pointer<TtfFont> font) {
  final ttfGetFontWrapAlignmentLookupFunction = _libTtf
      .lookupFunction<
        Int32 Function(Pointer<TtfFont> font),
        int Function(Pointer<TtfFont> font)
      >('TTF_GetFontWrapAlignment');
  return ttfGetFontWrapAlignmentLookupFunction(font);
}

///
/// Query the total height of a font.
///
/// This is usually equal to point size.
///
/// \param font the font to query.
/// \returns the font's height.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL TTF_GetFontHeight(const TTF_Font *font)
/// ```
int ttfGetFontHeight(Pointer<TtfFont> font) {
  final ttfGetFontHeightLookupFunction = _libTtf
      .lookupFunction<
        Int32 Function(Pointer<TtfFont> font),
        int Function(Pointer<TtfFont> font)
      >('TTF_GetFontHeight');
  return ttfGetFontHeightLookupFunction(font);
}

///
/// Query the offset from the baseline to the top of a font.
///
/// This is a positive value, relative to the baseline.
///
/// \param font the font to query.
/// \returns the font's ascent.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL TTF_GetFontAscent(const TTF_Font *font)
/// ```
int ttfGetFontAscent(Pointer<TtfFont> font) {
  final ttfGetFontAscentLookupFunction = _libTtf
      .lookupFunction<
        Int32 Function(Pointer<TtfFont> font),
        int Function(Pointer<TtfFont> font)
      >('TTF_GetFontAscent');
  return ttfGetFontAscentLookupFunction(font);
}

///
/// Query the offset from the baseline to the bottom of a font.
///
/// This is a negative value, relative to the baseline.
///
/// \param font the font to query.
/// \returns the font's descent.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL TTF_GetFontDescent(const TTF_Font *font)
/// ```
int ttfGetFontDescent(Pointer<TtfFont> font) {
  final ttfGetFontDescentLookupFunction = _libTtf
      .lookupFunction<
        Int32 Function(Pointer<TtfFont> font),
        int Function(Pointer<TtfFont> font)
      >('TTF_GetFontDescent');
  return ttfGetFontDescentLookupFunction(font);
}

///
/// Set the spacing between lines of text for a font.
///
/// This updates any TTF_Text objects using this font.
///
/// \param font the font to modify.
/// \param lineskip the new line spacing for the font.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_GetFontLineSkip
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL TTF_SetFontLineSkip(TTF_Font *font, int lineskip)
/// ```
void ttfSetFontLineSkip(Pointer<TtfFont> font, int lineskip) {
  final ttfSetFontLineSkipLookupFunction = _libTtf
      .lookupFunction<
        Void Function(Pointer<TtfFont> font, Int32 lineskip),
        void Function(Pointer<TtfFont> font, int lineskip)
      >('TTF_SetFontLineSkip');
  return ttfSetFontLineSkipLookupFunction(font, lineskip);
}

///
/// Query the spacing between lines of text for a font.
///
/// \param font the font to query.
/// \returns the font's recommended spacing.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_SetFontLineSkip
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL TTF_GetFontLineSkip(const TTF_Font *font)
/// ```
int ttfGetFontLineSkip(Pointer<TtfFont> font) {
  final ttfGetFontLineSkipLookupFunction = _libTtf
      .lookupFunction<
        Int32 Function(Pointer<TtfFont> font),
        int Function(Pointer<TtfFont> font)
      >('TTF_GetFontLineSkip');
  return ttfGetFontLineSkipLookupFunction(font);
}

///
/// Set if kerning is enabled for a font.
///
/// Newly-opened fonts default to allowing kerning. This is generally a good
/// policy unless you have a strong reason to disable it, as it tends to
/// produce better rendering (with kerning disabled, some fonts might render
/// the word `kerning` as something that looks like `keming` for example).
///
/// This updates any TTF_Text objects using this font.
///
/// \param font the font to set kerning on.
/// \param enabled true to enable kerning, false to disable.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_GetFontKerning
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL TTF_SetFontKerning(TTF_Font *font, bool enabled)
/// ```
void ttfSetFontKerning(Pointer<TtfFont> font, bool enabled) {
  final ttfSetFontKerningLookupFunction = _libTtf
      .lookupFunction<
        Void Function(Pointer<TtfFont> font, Uint8 enabled),
        void Function(Pointer<TtfFont> font, int enabled)
      >('TTF_SetFontKerning');
  return ttfSetFontKerningLookupFunction(font, enabled ? 1 : 0);
}

///
/// Query whether or not kerning is enabled for a font.
///
/// \param font the font to query.
/// \returns true if kerning is enabled, false otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_SetFontKerning
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL TTF_GetFontKerning(const TTF_Font *font)
/// ```
bool ttfGetFontKerning(Pointer<TtfFont> font) {
  final ttfGetFontKerningLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(Pointer<TtfFont> font),
        int Function(Pointer<TtfFont> font)
      >('TTF_GetFontKerning');
  return ttfGetFontKerningLookupFunction(font) == 1;
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
/// \returns true if the font is fixed-width, false otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL TTF_FontIsFixedWidth(const TTF_Font *font)
/// ```
bool ttfFontIsFixedWidth(Pointer<TtfFont> font) {
  final ttfFontIsFixedWidthLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(Pointer<TtfFont> font),
        int Function(Pointer<TtfFont> font)
      >('TTF_FontIsFixedWidth');
  return ttfFontIsFixedWidthLookupFunction(font) == 1;
}

///
/// Query whether a font is scalable or not.
///
/// Scalability lets us distinguish between outline and bitmap fonts.
///
/// \param font the font to query.
/// \returns true if the font is scalable, false otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_SetFontSDF
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL TTF_FontIsScalable(const TTF_Font *font)
/// ```
bool ttfFontIsScalable(Pointer<TtfFont> font) {
  final ttfFontIsScalableLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(Pointer<TtfFont> font),
        int Function(Pointer<TtfFont> font)
      >('TTF_FontIsScalable');
  return ttfFontIsScalableLookupFunction(font) == 1;
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
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL TTF_GetFontFamilyName(const TTF_Font *font)
/// ```
String? ttfGetFontFamilyName(Pointer<TtfFont> font) {
  final ttfGetFontFamilyNameLookupFunction = _libTtf
      .lookupFunction<
        Pointer<Utf8> Function(Pointer<TtfFont> font),
        Pointer<Utf8> Function(Pointer<TtfFont> font)
      >('TTF_GetFontFamilyName');
  final result = ttfGetFontFamilyNameLookupFunction(font);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
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
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL TTF_GetFontStyleName(const TTF_Font *font)
/// ```
String? ttfGetFontStyleName(Pointer<TtfFont> font) {
  final ttfGetFontStyleNameLookupFunction = _libTtf
      .lookupFunction<
        Pointer<Utf8> Function(Pointer<TtfFont> font),
        Pointer<Utf8> Function(Pointer<TtfFont> font)
      >('TTF_GetFontStyleName');
  final result = ttfGetFontStyleNameLookupFunction(font);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Set the direction to be used for text shaping by a font.
///
/// This function only supports left-to-right text shaping if SDL_ttf was not
/// built with HarfBuzz support.
///
/// This updates any TTF_Text objects using this font.
///
/// \param font the font to modify.
/// \param direction the new direction for text to flow.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL TTF_SetFontDirection(TTF_Font *font, TTF_Direction direction)
/// ```
bool ttfSetFontDirection(Pointer<TtfFont> font, int direction) {
  final ttfSetFontDirectionLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(Pointer<TtfFont> font, Int32 direction),
        int Function(Pointer<TtfFont> font, int direction)
      >('TTF_SetFontDirection');
  return ttfSetFontDirectionLookupFunction(font, direction) == 1;
}

///
/// Get the direction to be used for text shaping by a font.
///
/// This defaults to TTF_DIRECTION_INVALID if it hasn't been set.
///
/// \param font the font to query.
/// \returns the direction to be used for text shaping.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC TTF_Direction SDLCALL TTF_GetFontDirection(TTF_Font *font)
/// ```
int ttfGetFontDirection(Pointer<TtfFont> font) {
  final ttfGetFontDirectionLookupFunction = _libTtf
      .lookupFunction<
        Int32 Function(Pointer<TtfFont> font),
        int Function(Pointer<TtfFont> font)
      >('TTF_GetFontDirection');
  return ttfGetFontDirectionLookupFunction(font);
}

///
/// Convert from a 4 character string to a 32-bit tag.
///
/// \param string the 4 character string to convert.
/// \returns the 32-bit representation of the string.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_TagToString
///
/// ```c
/// extern SDL_DECLSPEC Uint32 SDLCALL TTF_StringToTag(const char *string)
/// ```
int ttfStringToTag(String? string) {
  final ttfStringToTagLookupFunction = _libTtf
      .lookupFunction<
        Uint32 Function(Pointer<Utf8> string),
        int Function(Pointer<Utf8> string)
      >('TTF_StringToTag');
  final stringPointer = string != null ? string.toNativeUtf8() : nullptr;
  final result = ttfStringToTagLookupFunction(stringPointer);
  calloc.free(stringPointer);
  return result;
}

///
/// Convert from a 32-bit tag to a 4 character string.
///
/// \param tag the 32-bit tag to convert.
/// \param string a pointer filled in with the 4 character representation of
/// the tag.
/// \param size the size of the buffer pointed at by string, should be at least
/// 4.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_TagToString
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL TTF_TagToString(Uint32 tag, char *string, size_t size)
/// ```
void ttfTagToString(int tag, Pointer<Int8> string, int size) {
  final ttfTagToStringLookupFunction = _libTtf
      .lookupFunction<
        Void Function(Uint32 tag, Pointer<Int8> string, Uint32 size),
        void Function(int tag, Pointer<Int8> string, int size)
      >('TTF_TagToString');
  return ttfTagToStringLookupFunction(tag, string, size);
}

///
/// Set the script to be used for text shaping by a font.
///
/// This returns false if SDL_ttf isn't built with HarfBuzz support.
///
/// This updates any TTF_Text objects using this font.
///
/// \param font the font to modify.
/// \param script an
/// [ISO 15924 code](https://unicode.org/iso15924/iso15924-codes.html)
/// .
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_StringToTag
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL TTF_SetFontScript(TTF_Font *font, Uint32 script)
/// ```
bool ttfSetFontScript(Pointer<TtfFont> font, int script) {
  final ttfSetFontScriptLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(Pointer<TtfFont> font, Uint32 script),
        int Function(Pointer<TtfFont> font, int script)
      >('TTF_SetFontScript');
  return ttfSetFontScriptLookupFunction(font, script) == 1;
}

///
/// Get the script used for text shaping a font.
///
/// \param font the font to query.
/// \returns an
/// [ISO 15924 code](https://unicode.org/iso15924/iso15924-codes.html)
/// or 0 if a script hasn't been set.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_TagToString
///
/// ```c
/// extern SDL_DECLSPEC Uint32 SDLCALL TTF_GetFontScript(TTF_Font *font)
/// ```
int ttfGetFontScript(Pointer<TtfFont> font) {
  final ttfGetFontScriptLookupFunction = _libTtf
      .lookupFunction<
        Uint32 Function(Pointer<TtfFont> font),
        int Function(Pointer<TtfFont> font)
      >('TTF_GetFontScript');
  return ttfGetFontScriptLookupFunction(font);
}

///
/// Get the script used by a 32-bit codepoint.
///
/// \param ch the character code to check.
/// \returns an
/// [ISO 15924 code](https://unicode.org/iso15924/iso15924-codes.html)
/// on success, or 0 on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function is thread-safe.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_TagToString
///
/// ```c
/// extern SDL_DECLSPEC Uint32 SDLCALL TTF_GetGlyphScript(Uint32 ch)
/// ```
int ttfGetGlyphScript(int ch) {
  final ttfGetGlyphScriptLookupFunction = _libTtf
      .lookupFunction<Uint32 Function(Uint32 ch), int Function(int ch)>(
        'TTF_GetGlyphScript',
      );
  return ttfGetGlyphScriptLookupFunction(ch);
}

///
/// Set language to be used for text shaping by a font.
///
/// If SDL_ttf was not built with HarfBuzz support, this function returns
/// false.
///
/// This updates any TTF_Text objects using this font.
///
/// \param font the font to specify a language for.
/// \param language_bcp47 a null-terminated string containing the desired
/// language's BCP47 code. Or null to reset the value.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL TTF_SetFontLanguage(TTF_Font *font, const char *language_bcp47)
/// ```
bool ttfSetFontLanguage(Pointer<TtfFont> font, String? languageBcp47) {
  final ttfSetFontLanguageLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(Pointer<TtfFont> font, Pointer<Utf8> languageBcp47),
        int Function(Pointer<TtfFont> font, Pointer<Utf8> languageBcp47)
      >('TTF_SetFontLanguage');
  final languageBcp47Pointer = languageBcp47 != null
      ? languageBcp47.toNativeUtf8()
      : nullptr;
  final result =
      ttfSetFontLanguageLookupFunction(font, languageBcp47Pointer) == 1;
  calloc.free(languageBcp47Pointer);
  return result;
}

///
/// Check whether a glyph is provided by the font for a UNICODE codepoint.
///
/// \param font the font to query.
/// \param ch the codepoint to check.
/// \returns true if font provides a glyph for this character, false if not.
///
/// \threadsafety This function should be called on the thread that created the
/// font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL TTF_FontHasGlyph(TTF_Font *font, Uint32 ch)
/// ```
bool ttfFontHasGlyph(Pointer<TtfFont> font, int ch) {
  final ttfFontHasGlyphLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(Pointer<TtfFont> font, Uint32 ch),
        int Function(Pointer<TtfFont> font, int ch)
      >('TTF_FontHasGlyph');
  return ttfFontHasGlyphLookupFunction(font, ch) == 1;
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
Pointer<SdlSurface> ttfGetGlyphImage(
  Pointer<TtfFont> font,
  int ch,
  Pointer<Int32> imageType,
) {
  final ttfGetGlyphImageLookupFunction = _libTtf
      .lookupFunction<
        Pointer<SdlSurface> Function(
          Pointer<TtfFont> font,
          Uint32 ch,
          Pointer<Int32> imageType,
        ),
        Pointer<SdlSurface> Function(
          Pointer<TtfFont> font,
          int ch,
          Pointer<Int32> imageType,
        )
      >('TTF_GetGlyphImage');
  return ttfGetGlyphImageLookupFunction(font, ch, imageType);
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
Pointer<SdlSurface> ttfGetGlyphImageForIndex(
  Pointer<TtfFont> font,
  int glyphIndex,
  Pointer<Int32> imageType,
) {
  final ttfGetGlyphImageForIndexLookupFunction = _libTtf
      .lookupFunction<
        Pointer<SdlSurface> Function(
          Pointer<TtfFont> font,
          Uint32 glyphIndex,
          Pointer<Int32> imageType,
        ),
        Pointer<SdlSurface> Function(
          Pointer<TtfFont> font,
          int glyphIndex,
          Pointer<Int32> imageType,
        )
      >('TTF_GetGlyphImageForIndex');
  return ttfGetGlyphImageForIndexLookupFunction(font, glyphIndex, imageType);
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
bool ttfGetGlyphMetrics(
  Pointer<TtfFont> font,
  int ch,
  Pointer<Int32> minx,
  Pointer<Int32> maxx,
  Pointer<Int32> miny,
  Pointer<Int32> maxy,
  Pointer<Int32> advance,
) {
  final ttfGetGlyphMetricsLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(
          Pointer<TtfFont> font,
          Uint32 ch,
          Pointer<Int32> minx,
          Pointer<Int32> maxx,
          Pointer<Int32> miny,
          Pointer<Int32> maxy,
          Pointer<Int32> advance,
        ),
        int Function(
          Pointer<TtfFont> font,
          int ch,
          Pointer<Int32> minx,
          Pointer<Int32> maxx,
          Pointer<Int32> miny,
          Pointer<Int32> maxy,
          Pointer<Int32> advance,
        )
      >('TTF_GetGlyphMetrics');
  return ttfGetGlyphMetricsLookupFunction(
        font,
        ch,
        minx,
        maxx,
        miny,
        maxy,
        advance,
      ) ==
      1;
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
bool ttfGetGlyphKerning(
  Pointer<TtfFont> font,
  int previousCh,
  int ch,
  Pointer<Int32> kerning,
) {
  final ttfGetGlyphKerningLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(
          Pointer<TtfFont> font,
          Uint32 previousCh,
          Uint32 ch,
          Pointer<Int32> kerning,
        ),
        int Function(
          Pointer<TtfFont> font,
          int previousCh,
          int ch,
          Pointer<Int32> kerning,
        )
      >('TTF_GetGlyphKerning');
  return ttfGetGlyphKerningLookupFunction(font, previousCh, ch, kerning) == 1;
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
bool ttfGetStringSize(
  Pointer<TtfFont> font,
  String? text,
  int length,
  Pointer<Int32> w,
  Pointer<Int32> h,
) {
  final ttfGetStringSizeLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(
          Pointer<TtfFont> font,
          Pointer<Utf8> text,
          Uint32 length,
          Pointer<Int32> w,
          Pointer<Int32> h,
        ),
        int Function(
          Pointer<TtfFont> font,
          Pointer<Utf8> text,
          int length,
          Pointer<Int32> w,
          Pointer<Int32> h,
        )
      >('TTF_GetStringSize');
  final textPointer = text != null ? text.toNativeUtf8() : nullptr;
  final result =
      ttfGetStringSizeLookupFunction(font, textPointer, length, w, h) == 1;
  calloc.free(textPointer);
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
bool ttfGetStringSizeWrapped(
  Pointer<TtfFont> font,
  String? text,
  int length,
  int wrapWidth,
  Pointer<Int32> w,
  Pointer<Int32> h,
) {
  final ttfGetStringSizeWrappedLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(
          Pointer<TtfFont> font,
          Pointer<Utf8> text,
          Uint32 length,
          Int32 wrapWidth,
          Pointer<Int32> w,
          Pointer<Int32> h,
        ),
        int Function(
          Pointer<TtfFont> font,
          Pointer<Utf8> text,
          int length,
          int wrapWidth,
          Pointer<Int32> w,
          Pointer<Int32> h,
        )
      >('TTF_GetStringSizeWrapped');
  final textPointer = text != null ? text.toNativeUtf8() : nullptr;
  final result =
      ttfGetStringSizeWrappedLookupFunction(
        font,
        textPointer,
        length,
        wrapWidth,
        w,
        h,
      ) ==
      1;
  calloc.free(textPointer);
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
bool ttfMeasureString(
  Pointer<TtfFont> font,
  String? text,
  int length,
  int maxWidth,
  Pointer<Int32> measuredWidth,
  Pointer<Uint32> measuredLength,
) {
  final ttfMeasureStringLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(
          Pointer<TtfFont> font,
          Pointer<Utf8> text,
          Uint32 length,
          Int32 maxWidth,
          Pointer<Int32> measuredWidth,
          Pointer<Uint32> measuredLength,
        ),
        int Function(
          Pointer<TtfFont> font,
          Pointer<Utf8> text,
          int length,
          int maxWidth,
          Pointer<Int32> measuredWidth,
          Pointer<Uint32> measuredLength,
        )
      >('TTF_MeasureString');
  final textPointer = text != null ? text.toNativeUtf8() : nullptr;
  final result =
      ttfMeasureStringLookupFunction(
        font,
        textPointer,
        length,
        maxWidth,
        measuredWidth,
        measuredLength,
      ) ==
      1;
  calloc.free(textPointer);
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
Pointer<SdlSurface> ttfRenderTextSolid(
  Pointer<TtfFont> font,
  String? text,
  int length,
  SdlColor fg,
) {
  final ttfRenderTextSolidLookupFunction = _libTtf
      .lookupFunction<
        Pointer<SdlSurface> Function(
          Pointer<TtfFont> font,
          Pointer<Utf8> text,
          Uint32 length,
          SdlColor fg,
        ),
        Pointer<SdlSurface> Function(
          Pointer<TtfFont> font,
          Pointer<Utf8> text,
          int length,
          SdlColor fg,
        )
      >('TTF_RenderText_Solid');
  final textPointer = text != null ? text.toNativeUtf8() : nullptr;
  final result = ttfRenderTextSolidLookupFunction(
    font,
    textPointer,
    length,
    fg,
  );
  calloc.free(textPointer);
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
Pointer<SdlSurface> ttfRenderTextSolidWrapped(
  Pointer<TtfFont> font,
  String? text,
  int length,
  SdlColor fg,
  int wrapLength,
) {
  final ttfRenderTextSolidWrappedLookupFunction = _libTtf
      .lookupFunction<
        Pointer<SdlSurface> Function(
          Pointer<TtfFont> font,
          Pointer<Utf8> text,
          Uint32 length,
          SdlColor fg,
          Int32 wrapLength,
        ),
        Pointer<SdlSurface> Function(
          Pointer<TtfFont> font,
          Pointer<Utf8> text,
          int length,
          SdlColor fg,
          int wrapLength,
        )
      >('TTF_RenderText_Solid_Wrapped');
  final textPointer = text != null ? text.toNativeUtf8() : nullptr;
  final result = ttfRenderTextSolidWrappedLookupFunction(
    font,
    textPointer,
    length,
    fg,
    wrapLength,
  );
  calloc.free(textPointer);
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
Pointer<SdlSurface> ttfRenderGlyphSolid(
  Pointer<TtfFont> font,
  int ch,
  SdlColor fg,
) {
  final ttfRenderGlyphSolidLookupFunction = _libTtf
      .lookupFunction<
        Pointer<SdlSurface> Function(
          Pointer<TtfFont> font,
          Uint32 ch,
          SdlColor fg,
        ),
        Pointer<SdlSurface> Function(Pointer<TtfFont> font, int ch, SdlColor fg)
      >('TTF_RenderGlyph_Solid');
  return ttfRenderGlyphSolidLookupFunction(font, ch, fg);
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
Pointer<SdlSurface> ttfRenderTextShaded(
  Pointer<TtfFont> font,
  String? text,
  int length,
  SdlColor fg,
  SdlColor bg,
) {
  final ttfRenderTextShadedLookupFunction = _libTtf
      .lookupFunction<
        Pointer<SdlSurface> Function(
          Pointer<TtfFont> font,
          Pointer<Utf8> text,
          Uint32 length,
          SdlColor fg,
          SdlColor bg,
        ),
        Pointer<SdlSurface> Function(
          Pointer<TtfFont> font,
          Pointer<Utf8> text,
          int length,
          SdlColor fg,
          SdlColor bg,
        )
      >('TTF_RenderText_Shaded');
  final textPointer = text != null ? text.toNativeUtf8() : nullptr;
  final result = ttfRenderTextShadedLookupFunction(
    font,
    textPointer,
    length,
    fg,
    bg,
  );
  calloc.free(textPointer);
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
Pointer<SdlSurface> ttfRenderTextShadedWrapped(
  Pointer<TtfFont> font,
  String? text,
  int length,
  SdlColor fg,
  SdlColor bg,
  int wrapWidth,
) {
  final ttfRenderTextShadedWrappedLookupFunction = _libTtf
      .lookupFunction<
        Pointer<SdlSurface> Function(
          Pointer<TtfFont> font,
          Pointer<Utf8> text,
          Uint32 length,
          SdlColor fg,
          SdlColor bg,
          Int32 wrapWidth,
        ),
        Pointer<SdlSurface> Function(
          Pointer<TtfFont> font,
          Pointer<Utf8> text,
          int length,
          SdlColor fg,
          SdlColor bg,
          int wrapWidth,
        )
      >('TTF_RenderText_Shaded_Wrapped');
  final textPointer = text != null ? text.toNativeUtf8() : nullptr;
  final result = ttfRenderTextShadedWrappedLookupFunction(
    font,
    textPointer,
    length,
    fg,
    bg,
    wrapWidth,
  );
  calloc.free(textPointer);
  return result;
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
Pointer<SdlSurface> ttfRenderGlyphShaded(
  Pointer<TtfFont> font,
  int ch,
  SdlColor fg,
  SdlColor bg,
) {
  final ttfRenderGlyphShadedLookupFunction = _libTtf
      .lookupFunction<
        Pointer<SdlSurface> Function(
          Pointer<TtfFont> font,
          Uint32 ch,
          SdlColor fg,
          SdlColor bg,
        ),
        Pointer<SdlSurface> Function(
          Pointer<TtfFont> font,
          int ch,
          SdlColor fg,
          SdlColor bg,
        )
      >('TTF_RenderGlyph_Shaded');
  return ttfRenderGlyphShadedLookupFunction(font, ch, fg, bg);
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
Pointer<SdlSurface> ttfRenderTextBlended(
  Pointer<TtfFont> font,
  String? text,
  int length,
  SdlColor fg,
) {
  final ttfRenderTextBlendedLookupFunction = _libTtf
      .lookupFunction<
        Pointer<SdlSurface> Function(
          Pointer<TtfFont> font,
          Pointer<Utf8> text,
          Uint32 length,
          SdlColor fg,
        ),
        Pointer<SdlSurface> Function(
          Pointer<TtfFont> font,
          Pointer<Utf8> text,
          int length,
          SdlColor fg,
        )
      >('TTF_RenderText_Blended');
  final textPointer = text != null ? text.toNativeUtf8() : nullptr;
  final result = ttfRenderTextBlendedLookupFunction(
    font,
    textPointer,
    length,
    fg,
  );
  calloc.free(textPointer);
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
Pointer<SdlSurface> ttfRenderTextBlendedWrapped(
  Pointer<TtfFont> font,
  String? text,
  int length,
  SdlColor fg,
  int wrapWidth,
) {
  final ttfRenderTextBlendedWrappedLookupFunction = _libTtf
      .lookupFunction<
        Pointer<SdlSurface> Function(
          Pointer<TtfFont> font,
          Pointer<Utf8> text,
          Uint32 length,
          SdlColor fg,
          Int32 wrapWidth,
        ),
        Pointer<SdlSurface> Function(
          Pointer<TtfFont> font,
          Pointer<Utf8> text,
          int length,
          SdlColor fg,
          int wrapWidth,
        )
      >('TTF_RenderText_Blended_Wrapped');
  final textPointer = text != null ? text.toNativeUtf8() : nullptr;
  final result = ttfRenderTextBlendedWrappedLookupFunction(
    font,
    textPointer,
    length,
    fg,
    wrapWidth,
  );
  calloc.free(textPointer);
  return result;
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
Pointer<SdlSurface> ttfRenderGlyphBlended(
  Pointer<TtfFont> font,
  int ch,
  SdlColor fg,
) {
  final ttfRenderGlyphBlendedLookupFunction = _libTtf
      .lookupFunction<
        Pointer<SdlSurface> Function(
          Pointer<TtfFont> font,
          Uint32 ch,
          SdlColor fg,
        ),
        Pointer<SdlSurface> Function(Pointer<TtfFont> font, int ch, SdlColor fg)
      >('TTF_RenderGlyph_Blended');
  return ttfRenderGlyphBlendedLookupFunction(font, ch, fg);
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
Pointer<SdlSurface> ttfRenderTextLcd(
  Pointer<TtfFont> font,
  String? text,
  int length,
  SdlColor fg,
  SdlColor bg,
) {
  final ttfRenderTextLcdLookupFunction = _libTtf
      .lookupFunction<
        Pointer<SdlSurface> Function(
          Pointer<TtfFont> font,
          Pointer<Utf8> text,
          Uint32 length,
          SdlColor fg,
          SdlColor bg,
        ),
        Pointer<SdlSurface> Function(
          Pointer<TtfFont> font,
          Pointer<Utf8> text,
          int length,
          SdlColor fg,
          SdlColor bg,
        )
      >('TTF_RenderText_LCD');
  final textPointer = text != null ? text.toNativeUtf8() : nullptr;
  final result = ttfRenderTextLcdLookupFunction(
    font,
    textPointer,
    length,
    fg,
    bg,
  );
  calloc.free(textPointer);
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
Pointer<SdlSurface> ttfRenderTextLcdWrapped(
  Pointer<TtfFont> font,
  String? text,
  int length,
  SdlColor fg,
  SdlColor bg,
  int wrapWidth,
) {
  final ttfRenderTextLcdWrappedLookupFunction = _libTtf
      .lookupFunction<
        Pointer<SdlSurface> Function(
          Pointer<TtfFont> font,
          Pointer<Utf8> text,
          Uint32 length,
          SdlColor fg,
          SdlColor bg,
          Int32 wrapWidth,
        ),
        Pointer<SdlSurface> Function(
          Pointer<TtfFont> font,
          Pointer<Utf8> text,
          int length,
          SdlColor fg,
          SdlColor bg,
          int wrapWidth,
        )
      >('TTF_RenderText_LCD_Wrapped');
  final textPointer = text != null ? text.toNativeUtf8() : nullptr;
  final result = ttfRenderTextLcdWrappedLookupFunction(
    font,
    textPointer,
    length,
    fg,
    bg,
    wrapWidth,
  );
  calloc.free(textPointer);
  return result;
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
Pointer<SdlSurface> ttfRenderGlyphLcd(
  Pointer<TtfFont> font,
  int ch,
  SdlColor fg,
  SdlColor bg,
) {
  final ttfRenderGlyphLcdLookupFunction = _libTtf
      .lookupFunction<
        Pointer<SdlSurface> Function(
          Pointer<TtfFont> font,
          Uint32 ch,
          SdlColor fg,
          SdlColor bg,
        ),
        Pointer<SdlSurface> Function(
          Pointer<TtfFont> font,
          int ch,
          SdlColor fg,
          SdlColor bg,
        )
      >('TTF_RenderGlyph_LCD');
  return ttfRenderGlyphLcdLookupFunction(font, ch, fg, bg);
}

///
/// Create a text engine for drawing text on SDL surfaces.
///
/// \returns a TTF_TextEngine object or NULL on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_DestroySurfaceTextEngine
/// \sa TTF_DrawSurfaceText
///
/// ```c
/// extern SDL_DECLSPEC TTF_TextEngine * SDLCALL TTF_CreateSurfaceTextEngine(void)
/// ```
Pointer<TtfTextEngine> ttfCreateSurfaceTextEngine() {
  final ttfCreateSurfaceTextEngineLookupFunction = _libTtf
      .lookupFunction<
        Pointer<TtfTextEngine> Function(),
        Pointer<TtfTextEngine> Function()
      >('TTF_CreateSurfaceTextEngine');
  return ttfCreateSurfaceTextEngineLookupFunction();
}

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
bool ttfDrawSurfaceText(
  Pointer<TtfText> text,
  int x,
  int y,
  Pointer<SdlSurface> surface,
) {
  final ttfDrawSurfaceTextLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(
          Pointer<TtfText> text,
          Int32 x,
          Int32 y,
          Pointer<SdlSurface> surface,
        ),
        int Function(
          Pointer<TtfText> text,
          int x,
          int y,
          Pointer<SdlSurface> surface,
        )
      >('TTF_DrawSurfaceText');
  return ttfDrawSurfaceTextLookupFunction(text, x, y, surface) == 1;
}

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
void ttfDestroySurfaceTextEngine(Pointer<TtfTextEngine> engine) {
  final ttfDestroySurfaceTextEngineLookupFunction = _libTtf
      .lookupFunction<
        Void Function(Pointer<TtfTextEngine> engine),
        void Function(Pointer<TtfTextEngine> engine)
      >('TTF_DestroySurfaceTextEngine');
  return ttfDestroySurfaceTextEngineLookupFunction(engine);
}

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
Pointer<TtfTextEngine> ttfCreateRendererTextEngine(
  Pointer<SdlRenderer> renderer,
) {
  final ttfCreateRendererTextEngineLookupFunction = _libTtf
      .lookupFunction<
        Pointer<TtfTextEngine> Function(Pointer<SdlRenderer> renderer),
        Pointer<TtfTextEngine> Function(Pointer<SdlRenderer> renderer)
      >('TTF_CreateRendererTextEngine');
  return ttfCreateRendererTextEngineLookupFunction(renderer);
}

///
/// Create a text engine for drawing text on an SDL renderer, with the
/// specified properties.
///
/// These are the supported properties:
///
/// - `TTF_PROP_RENDERER_TEXT_ENGINE_RENDERER_POINTER`: the renderer to use for
/// creating textures and drawing text
/// - `TTF_PROP_RENDERER_TEXT_ENGINE_ATLAS_TEXTURE_SIZE_NUMBER`: the size of
/// the texture atlas
///
/// \param props the properties to use.
/// \returns a TTF_TextEngine object or NULL on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function should be called on the thread that created the
/// renderer.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_CreateRendererTextEngine
/// \sa TTF_DestroyRendererTextEngine
/// \sa TTF_DrawRendererText
///
/// ```c
/// extern SDL_DECLSPEC TTF_TextEngine * SDLCALL TTF_CreateRendererTextEngineWithProperties(SDL_PropertiesID props)
/// ```
Pointer<TtfTextEngine> ttfCreateRendererTextEngineWithProperties(int props) {
  final ttfCreateRendererTextEngineWithPropertiesLookupFunction = _libTtf
      .lookupFunction<
        Pointer<TtfTextEngine> Function(Uint32 props),
        Pointer<TtfTextEngine> Function(int props)
      >('TTF_CreateRendererTextEngineWithProperties');
  return ttfCreateRendererTextEngineWithPropertiesLookupFunction(props);
}

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
bool ttfDrawRendererText(Pointer<TtfText> text, double x, double y) {
  final ttfDrawRendererTextLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(Pointer<TtfText> text, Float x, Float y),
        int Function(Pointer<TtfText> text, double x, double y)
      >('TTF_DrawRendererText');
  return ttfDrawRendererTextLookupFunction(text, x, y) == 1;
}

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
void ttfDestroyRendererTextEngine(Pointer<TtfTextEngine> engine) {
  final ttfDestroyRendererTextEngineLookupFunction = _libTtf
      .lookupFunction<
        Void Function(Pointer<TtfTextEngine> engine),
        void Function(Pointer<TtfTextEngine> engine)
      >('TTF_DestroyRendererTextEngine');
  return ttfDestroyRendererTextEngineLookupFunction(engine);
}

///
/// Create a text engine for drawing text with the SDL GPU API.
///
/// \param device the SDL_GPUDevice to use for creating textures and drawing
/// text.
/// \returns a TTF_TextEngine object or NULL on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function should be called on the thread that created the
/// device.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_CreateGPUTextEngineWithProperties
/// \sa TTF_DestroyGPUTextEngine
/// \sa TTF_GetGPUTextDrawData
///
/// ```c
/// extern SDL_DECLSPEC TTF_TextEngine * SDLCALL TTF_CreateGPUTextEngine(SDL_GPUDevice *device)
/// ```
Pointer<TtfTextEngine> ttfCreateGpuTextEngine(Pointer<SdlGpuDevice> device) {
  final ttfCreateGpuTextEngineLookupFunction = _libTtf
      .lookupFunction<
        Pointer<TtfTextEngine> Function(Pointer<SdlGpuDevice> device),
        Pointer<TtfTextEngine> Function(Pointer<SdlGpuDevice> device)
      >('TTF_CreateGPUTextEngine');
  return ttfCreateGpuTextEngineLookupFunction(device);
}

///
/// Create a text engine for drawing text with the SDL GPU API, with the
/// specified properties.
///
/// These are the supported properties:
///
/// - `TTF_PROP_GPU_TEXT_ENGINE_DEVICE_POINTER`: the SDL_GPUDevice to use for
/// creating textures and drawing text.
/// - `TTF_PROP_GPU_TEXT_ENGINE_ATLAS_TEXTURE_SIZE_NUMBER`: the size of the
/// texture atlas
///
/// \param props the properties to use.
/// \returns a TTF_TextEngine object or NULL on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function should be called on the thread that created the
/// device.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_CreateGPUTextEngine
/// \sa TTF_DestroyGPUTextEngine
/// \sa TTF_GetGPUTextDrawData
///
/// ```c
/// extern SDL_DECLSPEC TTF_TextEngine * SDLCALL TTF_CreateGPUTextEngineWithProperties(SDL_PropertiesID props)
/// ```
Pointer<TtfTextEngine> ttfCreateGpuTextEngineWithProperties(int props) {
  final ttfCreateGpuTextEngineWithPropertiesLookupFunction = _libTtf
      .lookupFunction<
        Pointer<TtfTextEngine> Function(Uint32 props),
        Pointer<TtfTextEngine> Function(int props)
      >('TTF_CreateGPUTextEngineWithProperties');
  return ttfCreateGpuTextEngineWithPropertiesLookupFunction(props);
}

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
Pointer<TtfGpuAtlasDrawSequence> ttfGetGpuTextDrawData(Pointer<TtfText> text) {
  final ttfGetGpuTextDrawDataLookupFunction = _libTtf
      .lookupFunction<
        Pointer<TtfGpuAtlasDrawSequence> Function(Pointer<TtfText> text),
        Pointer<TtfGpuAtlasDrawSequence> Function(Pointer<TtfText> text)
      >('TTF_GetGPUTextDrawData');
  return ttfGetGpuTextDrawDataLookupFunction(text);
}

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
void ttfDestroyGpuTextEngine(Pointer<TtfTextEngine> engine) {
  final ttfDestroyGpuTextEngineLookupFunction = _libTtf
      .lookupFunction<
        Void Function(Pointer<TtfTextEngine> engine),
        void Function(Pointer<TtfTextEngine> engine)
      >('TTF_DestroyGPUTextEngine');
  return ttfDestroyGpuTextEngineLookupFunction(engine);
}

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
void ttfSetGpuTextEngineWinding(Pointer<TtfTextEngine> engine, int winding) {
  final ttfSetGpuTextEngineWindingLookupFunction = _libTtf
      .lookupFunction<
        Void Function(Pointer<TtfTextEngine> engine, Int32 winding),
        void Function(Pointer<TtfTextEngine> engine, int winding)
      >('TTF_SetGPUTextEngineWinding');
  return ttfSetGpuTextEngineWindingLookupFunction(engine, winding);
}

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
int ttfGetGpuTextEngineWinding(Pointer<TtfTextEngine> engine) {
  final ttfGetGpuTextEngineWindingLookupFunction = _libTtf
      .lookupFunction<
        Int32 Function(Pointer<TtfTextEngine> engine),
        int Function(Pointer<TtfTextEngine> engine)
      >('TTF_GetGPUTextEngineWinding');
  return ttfGetGpuTextEngineWindingLookupFunction(engine);
}

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
Pointer<TtfText> ttfCreateText(
  Pointer<TtfTextEngine> engine,
  Pointer<TtfFont> font,
  String? text,
  int length,
) {
  final ttfCreateTextLookupFunction = _libTtf
      .lookupFunction<
        Pointer<TtfText> Function(
          Pointer<TtfTextEngine> engine,
          Pointer<TtfFont> font,
          Pointer<Utf8> text,
          Uint32 length,
        ),
        Pointer<TtfText> Function(
          Pointer<TtfTextEngine> engine,
          Pointer<TtfFont> font,
          Pointer<Utf8> text,
          int length,
        )
      >('TTF_CreateText');
  final textPointer = text != null ? text.toNativeUtf8() : nullptr;
  final result = ttfCreateTextLookupFunction(engine, font, textPointer, length);
  calloc.free(textPointer);
  return result;
}

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
int ttfGetTextProperties(Pointer<TtfText> text) {
  final ttfGetTextPropertiesLookupFunction = _libTtf
      .lookupFunction<
        Uint32 Function(Pointer<TtfText> text),
        int Function(Pointer<TtfText> text)
      >('TTF_GetTextProperties');
  return ttfGetTextPropertiesLookupFunction(text);
}

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
bool ttfSetTextEngine(Pointer<TtfText> text, Pointer<TtfTextEngine> engine) {
  final ttfSetTextEngineLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(Pointer<TtfText> text, Pointer<TtfTextEngine> engine),
        int Function(Pointer<TtfText> text, Pointer<TtfTextEngine> engine)
      >('TTF_SetTextEngine');
  return ttfSetTextEngineLookupFunction(text, engine) == 1;
}

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
Pointer<TtfTextEngine> ttfGetTextEngine(Pointer<TtfText> text) {
  final ttfGetTextEngineLookupFunction = _libTtf
      .lookupFunction<
        Pointer<TtfTextEngine> Function(Pointer<TtfText> text),
        Pointer<TtfTextEngine> Function(Pointer<TtfText> text)
      >('TTF_GetTextEngine');
  return ttfGetTextEngineLookupFunction(text);
}

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
bool ttfSetTextFont(Pointer<TtfText> text, Pointer<TtfFont> font) {
  final ttfSetTextFontLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(Pointer<TtfText> text, Pointer<TtfFont> font),
        int Function(Pointer<TtfText> text, Pointer<TtfFont> font)
      >('TTF_SetTextFont');
  return ttfSetTextFontLookupFunction(text, font) == 1;
}

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
Pointer<TtfFont> ttfGetTextFont(Pointer<TtfText> text) {
  final ttfGetTextFontLookupFunction = _libTtf
      .lookupFunction<
        Pointer<TtfFont> Function(Pointer<TtfText> text),
        Pointer<TtfFont> Function(Pointer<TtfText> text)
      >('TTF_GetTextFont');
  return ttfGetTextFontLookupFunction(text);
}

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
bool ttfSetTextDirection(Pointer<TtfText> text, int direction) {
  final ttfSetTextDirectionLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(Pointer<TtfText> text, Int32 direction),
        int Function(Pointer<TtfText> text, int direction)
      >('TTF_SetTextDirection');
  return ttfSetTextDirectionLookupFunction(text, direction) == 1;
}

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
int ttfGetTextDirection(Pointer<TtfText> text) {
  final ttfGetTextDirectionLookupFunction = _libTtf
      .lookupFunction<
        Int32 Function(Pointer<TtfText> text),
        int Function(Pointer<TtfText> text)
      >('TTF_GetTextDirection');
  return ttfGetTextDirectionLookupFunction(text);
}

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
bool ttfSetTextScript(Pointer<TtfText> text, int script) {
  final ttfSetTextScriptLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(Pointer<TtfText> text, Uint32 script),
        int Function(Pointer<TtfText> text, int script)
      >('TTF_SetTextScript');
  return ttfSetTextScriptLookupFunction(text, script) == 1;
}

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
int ttfGetTextScript(Pointer<TtfText> text) {
  final ttfGetTextScriptLookupFunction = _libTtf
      .lookupFunction<
        Uint32 Function(Pointer<TtfText> text),
        int Function(Pointer<TtfText> text)
      >('TTF_GetTextScript');
  return ttfGetTextScriptLookupFunction(text);
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
bool ttfSetTextColor(Pointer<TtfText> text, int r, int g, int b, int a) {
  final ttfSetTextColorLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(
          Pointer<TtfText> text,
          Uint8 r,
          Uint8 g,
          Uint8 b,
          Uint8 a,
        ),
        int Function(Pointer<TtfText> text, int r, int g, int b, int a)
      >('TTF_SetTextColor');
  return ttfSetTextColorLookupFunction(text, r, g, b, a) == 1;
}

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
bool ttfSetTextColorFloat(
  Pointer<TtfText> text,
  double r,
  double g,
  double b,
  double a,
) {
  final ttfSetTextColorFloatLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(
          Pointer<TtfText> text,
          Float r,
          Float g,
          Float b,
          Float a,
        ),
        int Function(
          Pointer<TtfText> text,
          double r,
          double g,
          double b,
          double a,
        )
      >('TTF_SetTextColorFloat');
  return ttfSetTextColorFloatLookupFunction(text, r, g, b, a) == 1;
}

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
bool ttfGetTextColor(
  Pointer<TtfText> text,
  Pointer<Uint8> r,
  Pointer<Uint8> g,
  Pointer<Uint8> b,
  Pointer<Uint8> a,
) {
  final ttfGetTextColorLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(
          Pointer<TtfText> text,
          Pointer<Uint8> r,
          Pointer<Uint8> g,
          Pointer<Uint8> b,
          Pointer<Uint8> a,
        ),
        int Function(
          Pointer<TtfText> text,
          Pointer<Uint8> r,
          Pointer<Uint8> g,
          Pointer<Uint8> b,
          Pointer<Uint8> a,
        )
      >('TTF_GetTextColor');
  return ttfGetTextColorLookupFunction(text, r, g, b, a) == 1;
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
bool ttfGetTextColorFloat(
  Pointer<TtfText> text,
  Pointer<Float> r,
  Pointer<Float> g,
  Pointer<Float> b,
  Pointer<Float> a,
) {
  final ttfGetTextColorFloatLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(
          Pointer<TtfText> text,
          Pointer<Float> r,
          Pointer<Float> g,
          Pointer<Float> b,
          Pointer<Float> a,
        ),
        int Function(
          Pointer<TtfText> text,
          Pointer<Float> r,
          Pointer<Float> g,
          Pointer<Float> b,
          Pointer<Float> a,
        )
      >('TTF_GetTextColorFloat');
  return ttfGetTextColorFloatLookupFunction(text, r, g, b, a) == 1;
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
bool ttfSetTextPosition(Pointer<TtfText> text, int x, int y) {
  final ttfSetTextPositionLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(Pointer<TtfText> text, Int32 x, Int32 y),
        int Function(Pointer<TtfText> text, int x, int y)
      >('TTF_SetTextPosition');
  return ttfSetTextPositionLookupFunction(text, x, y) == 1;
}

///
/// Get the position of a text object.
///
/// \param text the TTF_Text to query.
/// \param x a pointer filled in with the x offset of the upper left corner of
/// this text in pixels, may be NULL.
/// \param y a pointer filled in with the y offset of the upper left corner of
/// this text in pixels, may be NULL.
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
bool ttfGetTextPosition(
  Pointer<TtfText> text,
  Pointer<Int32> x,
  Pointer<Int32> y,
) {
  final ttfGetTextPositionLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(
          Pointer<TtfText> text,
          Pointer<Int32> x,
          Pointer<Int32> y,
        ),
        int Function(Pointer<TtfText> text, Pointer<Int32> x, Pointer<Int32> y)
      >('TTF_GetTextPosition');
  return ttfGetTextPositionLookupFunction(text, x, y) == 1;
}

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
bool ttfSetTextWrapWidth(Pointer<TtfText> text, int wrapWidth) {
  final ttfSetTextWrapWidthLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(Pointer<TtfText> text, Int32 wrapWidth),
        int Function(Pointer<TtfText> text, int wrapWidth)
      >('TTF_SetTextWrapWidth');
  return ttfSetTextWrapWidthLookupFunction(text, wrapWidth) == 1;
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
bool ttfGetTextWrapWidth(Pointer<TtfText> text, Pointer<Int32> wrapWidth) {
  final ttfGetTextWrapWidthLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(Pointer<TtfText> text, Pointer<Int32> wrapWidth),
        int Function(Pointer<TtfText> text, Pointer<Int32> wrapWidth)
      >('TTF_GetTextWrapWidth');
  return ttfGetTextWrapWidthLookupFunction(text, wrapWidth) == 1;
}

///
/// Set whether whitespace should be visible when wrapping a text object.
///
/// If the whitespace is visible, it will take up space for purposes of
/// alignment and wrapping. This is good for editing, but looks better when
/// centered or aligned if whitespace around line wrapping is hidden. This
/// defaults false.
///
/// This function may cause the internal text representation to be rebuilt.
///
/// \param text the TTF_Text to modify.
/// \param visible true to show whitespace when wrapping text, false to hide
/// it.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should be called on the thread that created the
/// text.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_TextWrapWhitespaceVisible
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL TTF_SetTextWrapWhitespaceVisible(TTF_Text *text, bool visible)
/// ```
bool ttfSetTextWrapWhitespaceVisible(Pointer<TtfText> text, bool visible) {
  final ttfSetTextWrapWhitespaceVisibleLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(Pointer<TtfText> text, Uint8 visible),
        int Function(Pointer<TtfText> text, int visible)
      >('TTF_SetTextWrapWhitespaceVisible');
  return ttfSetTextWrapWhitespaceVisibleLookupFunction(text, visible ? 1 : 0) ==
      1;
}

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
bool ttfTextWrapWhitespaceVisible(Pointer<TtfText> text) {
  final ttfTextWrapWhitespaceVisibleLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(Pointer<TtfText> text),
        int Function(Pointer<TtfText> text)
      >('TTF_TextWrapWhitespaceVisible');
  return ttfTextWrapWhitespaceVisibleLookupFunction(text) == 1;
}

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
bool ttfSetTextString(Pointer<TtfText> text, String? string, int length) {
  final ttfSetTextStringLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(
          Pointer<TtfText> text,
          Pointer<Utf8> string,
          Uint32 length,
        ),
        int Function(Pointer<TtfText> text, Pointer<Utf8> string, int length)
      >('TTF_SetTextString');
  final stringPointer = string != null ? string.toNativeUtf8() : nullptr;
  final result =
      ttfSetTextStringLookupFunction(text, stringPointer, length) == 1;
  calloc.free(stringPointer);
  return result;
}

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
bool ttfInsertTextString(
  Pointer<TtfText> text,
  int offset,
  String? string,
  int length,
) {
  final ttfInsertTextStringLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(
          Pointer<TtfText> text,
          Int32 offset,
          Pointer<Utf8> string,
          Uint32 length,
        ),
        int Function(
          Pointer<TtfText> text,
          int offset,
          Pointer<Utf8> string,
          int length,
        )
      >('TTF_InsertTextString');
  final stringPointer = string != null ? string.toNativeUtf8() : nullptr;
  final result =
      ttfInsertTextStringLookupFunction(text, offset, stringPointer, length) ==
      1;
  calloc.free(stringPointer);
  return result;
}

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
bool ttfAppendTextString(Pointer<TtfText> text, String? string, int length) {
  final ttfAppendTextStringLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(
          Pointer<TtfText> text,
          Pointer<Utf8> string,
          Uint32 length,
        ),
        int Function(Pointer<TtfText> text, Pointer<Utf8> string, int length)
      >('TTF_AppendTextString');
  final stringPointer = string != null ? string.toNativeUtf8() : nullptr;
  final result =
      ttfAppendTextStringLookupFunction(text, stringPointer, length) == 1;
  calloc.free(stringPointer);
  return result;
}

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
bool ttfDeleteTextString(Pointer<TtfText> text, int offset, int length) {
  final ttfDeleteTextStringLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(Pointer<TtfText> text, Int32 offset, Int32 length),
        int Function(Pointer<TtfText> text, int offset, int length)
      >('TTF_DeleteTextString');
  return ttfDeleteTextStringLookupFunction(text, offset, length) == 1;
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
bool ttfGetTextSize(Pointer<TtfText> text, Pointer<Int32> w, Pointer<Int32> h) {
  final ttfGetTextSizeLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(
          Pointer<TtfText> text,
          Pointer<Int32> w,
          Pointer<Int32> h,
        ),
        int Function(Pointer<TtfText> text, Pointer<Int32> w, Pointer<Int32> h)
      >('TTF_GetTextSize');
  return ttfGetTextSizeLookupFunction(text, w, h) == 1;
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
bool ttfGetTextSubString(
  Pointer<TtfText> text,
  int offset,
  Pointer<TtfSubString> substring,
) {
  final ttfGetTextSubStringLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(
          Pointer<TtfText> text,
          Int32 offset,
          Pointer<TtfSubString> substring,
        ),
        int Function(
          Pointer<TtfText> text,
          int offset,
          Pointer<TtfSubString> substring,
        )
      >('TTF_GetTextSubString');
  return ttfGetTextSubStringLookupFunction(text, offset, substring) == 1;
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
bool ttfGetTextSubStringForLine(
  Pointer<TtfText> text,
  int line,
  Pointer<TtfSubString> substring,
) {
  final ttfGetTextSubStringForLineLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(
          Pointer<TtfText> text,
          Int32 line,
          Pointer<TtfSubString> substring,
        ),
        int Function(
          Pointer<TtfText> text,
          int line,
          Pointer<TtfSubString> substring,
        )
      >('TTF_GetTextSubStringForLine');
  return ttfGetTextSubStringForLineLookupFunction(text, line, substring) == 1;
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
Pointer<Pointer<TtfSubString>> ttfGetTextSubStringsForRange(
  Pointer<TtfText> text,
  int offset,
  int length,
  Pointer<Int32> count,
) {
  final ttfGetTextSubStringsForRangeLookupFunction = _libTtf
      .lookupFunction<
        Pointer<Pointer<TtfSubString>> Function(
          Pointer<TtfText> text,
          Int32 offset,
          Int32 length,
          Pointer<Int32> count,
        ),
        Pointer<Pointer<TtfSubString>> Function(
          Pointer<TtfText> text,
          int offset,
          int length,
          Pointer<Int32> count,
        )
      >('TTF_GetTextSubStringsForRange');
  return ttfGetTextSubStringsForRangeLookupFunction(
    text,
    offset,
    length,
    count,
  );
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
bool ttfGetTextSubStringForPoint(
  Pointer<TtfText> text,
  int x,
  int y,
  Pointer<TtfSubString> substring,
) {
  final ttfGetTextSubStringForPointLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(
          Pointer<TtfText> text,
          Int32 x,
          Int32 y,
          Pointer<TtfSubString> substring,
        ),
        int Function(
          Pointer<TtfText> text,
          int x,
          int y,
          Pointer<TtfSubString> substring,
        )
      >('TTF_GetTextSubStringForPoint');
  return ttfGetTextSubStringForPointLookupFunction(text, x, y, substring) == 1;
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
bool ttfGetPreviousTextSubString(
  Pointer<TtfText> text,
  Pointer<TtfSubString> substring,
  Pointer<TtfSubString> previous,
) {
  final ttfGetPreviousTextSubStringLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(
          Pointer<TtfText> text,
          Pointer<TtfSubString> substring,
          Pointer<TtfSubString> previous,
        ),
        int Function(
          Pointer<TtfText> text,
          Pointer<TtfSubString> substring,
          Pointer<TtfSubString> previous,
        )
      >('TTF_GetPreviousTextSubString');
  return ttfGetPreviousTextSubStringLookupFunction(text, substring, previous) ==
      1;
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
bool ttfGetNextTextSubString(
  Pointer<TtfText> text,
  Pointer<TtfSubString> substring,
  Pointer<TtfSubString> next,
) {
  final ttfGetNextTextSubStringLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(
          Pointer<TtfText> text,
          Pointer<TtfSubString> substring,
          Pointer<TtfSubString> next,
        ),
        int Function(
          Pointer<TtfText> text,
          Pointer<TtfSubString> substring,
          Pointer<TtfSubString> next,
        )
      >('TTF_GetNextTextSubString');
  return ttfGetNextTextSubStringLookupFunction(text, substring, next) == 1;
}

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
bool ttfUpdateText(Pointer<TtfText> text) {
  final ttfUpdateTextLookupFunction = _libTtf
      .lookupFunction<
        Uint8 Function(Pointer<TtfText> text),
        int Function(Pointer<TtfText> text)
      >('TTF_UpdateText');
  return ttfUpdateTextLookupFunction(text) == 1;
}

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
void ttfDestroyText(Pointer<TtfText> text) {
  final ttfDestroyTextLookupFunction = _libTtf
      .lookupFunction<
        Void Function(Pointer<TtfText> text),
        void Function(Pointer<TtfText> text)
      >('TTF_DestroyText');
  return ttfDestroyTextLookupFunction(text);
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
/// TTF_GetFontFamilyName() and TTF_GetFontStyleName(), are no longer valid
/// after this call, as well.
///
/// \param font the font to dispose of.
///
/// \threadsafety This function should not be called while any other thread is
/// using the font.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_OpenFont
/// \sa TTF_OpenFontIO
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL TTF_CloseFont(TTF_Font *font)
/// ```
void ttfCloseFont(Pointer<TtfFont> font) {
  final ttfCloseFontLookupFunction = _libTtf
      .lookupFunction<
        Void Function(Pointer<TtfFont> font),
        void Function(Pointer<TtfFont> font)
      >('TTF_CloseFont');
  return ttfCloseFontLookupFunction(font);
}

///
/// Deinitialize SDL_ttf.
///
/// You must call this when done with the library, to free internal resources.
/// It is safe to call this when the library isn't initialized, as it will just
/// return immediately.
///
/// Once you have as many quit calls as you have had successful calls to
/// TTF_Init, the library will actually deinitialize.
///
/// Please note that this does not automatically close any fonts that are still
/// open at the time of deinitialization, and it is possibly not safe to close
/// them afterwards, as parts of the library will no longer be initialized to
/// deal with it. A well-written program should call TTF_CloseFont() on any
/// open fonts before calling this function!
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL TTF_Quit(void)
/// ```
void ttfQuit() {
  final ttfQuitLookupFunction = _libTtf
      .lookupFunction<Void Function(), void Function()>('TTF_Quit');
  return ttfQuitLookupFunction();
}

///
/// Check if SDL_ttf is initialized.
///
/// This reports the number of times the library has been initialized by a call
/// to TTF_Init(), without a paired deinitialization request from TTF_Quit().
///
/// In short: if it's greater than zero, the library is currently initialized
/// and ready to work. If zero, it is not initialized.
///
/// Despite the return value being a signed integer, this function should not
/// return a negative number.
///
/// \returns the current number of initialization calls, that need to
/// eventually be paired with this many calls to TTF_Quit().
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_ttf 3.0.0.
///
/// \sa TTF_Init
/// \sa TTF_Quit
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL TTF_WasInit(void)
/// ```
int ttfWasInit() {
  final ttfWasInitLookupFunction = _libTtf
      .lookupFunction<Int32 Function(), int Function()>('TTF_WasInit');
  return ttfWasInitLookupFunction();
}
