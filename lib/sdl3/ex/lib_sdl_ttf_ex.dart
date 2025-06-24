// ignore_for_file: non_constant_identifier_names
part of '../sdl_ttf.dart';

/// ```c
/// const SDL_TTF_COMPILEDVERSION = \ SDL_VERSIONNUM(SDL_TTF_MAJOR_VERSION, SDL_TTF_MINOR_VERSION, SDL_TTF_PATCHLEVEL);
/// ```
final int SDL_TTF_COMPILEDVERSION = sdlVersionnum(
  SDL_TTF_MAJOR_VERSION,
  SDL_TTF_MINOR_VERSION,
  SDL_TTF_MICRO_VERSION,
);

/// ```c
/// const SDL_TTF_VERSION_ATLEAST = (X, Y, Z) \ (SDL_TTF_COMPILEDVERSION >= SDL_VERSIONNUM(X, Y, Z));
/// ```
bool sdlTtfVersionAtleast(int x, int y, int z) =>
    SDL_TTF_COMPILEDVERSION >= sdlVersionnum(x, y, z);

///// ```c
///// const TTF_RenderText = (font, text, fg, bg) \ TTF_RenderText_Shaded(font, text, fg, bg);
///// ```
//Pointer<SdlSurface> ttfRenderText(
//    Pointer<TtfFont> font, String text, SdlColor fg, SdlColor bg) {
//  return ttfRenderTextShaded(font, text, fg, bg);
//}
//
///// ```c
///// const TTF_RenderUTF8 = (font, text, fg, bg) \ TTF_RenderUTF8_Shaded(font, text, fg, bg);
/////
//Pointer<SdlSurface> ttfRenderUtf8(
//    Pointer<TtfFont> font, String text, SdlColor fg, SdlColor bg) {
//  return ttfRenderUtf8Shaded(font, text, fg, bg);
//}
//
///// ```c
///// const TTF_RenderUNICODE = (font, text, fg, bg) \ TTF_RenderUNICODE_Shaded(font, text, fg, bg);
///// ```
//Pointer<SdlSurface> ttfRenderUnicode(
//    Pointer<TtfFont> font, Pointer<Uint16> text, SdlColor fg, SdlColor bg) {
//  return ttfRenderUnicodeShaded(font, text, fg, bg);
//}

/// ```c
/// const TTF_SetError = SDL_SetError;
/// ```
bool ttfSetError(String fmt) => sdlSetError(fmt);

/// ```c
/// const TTF_GetError = SDL_GetError;
/// ```
String? ttfGetError() => sdlGetError();
