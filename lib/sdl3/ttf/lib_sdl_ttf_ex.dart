// ignore_for_file: non_constant_identifier_names
part of '../sdl_ttf.dart';

final int SDL_TTF_COMPILEDVERSION = sdlVersionnum(
  SDL_TTF_MAJOR_VERSION,
  SDL_TTF_MINOR_VERSION,
  SDL_TTF_MICRO_VERSION,
);

bool sdlTtfVersionAtleast(int x, int y, int z) =>
    SDL_TTF_COMPILEDVERSION >= sdlVersionnum(x, y, z);

//Pointer<SdlSurface> ttfRenderText(
//    Pointer<TtfFont> font, String text, SdlColor fg, SdlColor bg) {
//  return ttfRenderTextShaded(font, text, fg, bg);
//}
//
//Pointer<SdlSurface> ttfRenderUtf8(
//    Pointer<TtfFont> font, String text, SdlColor fg, SdlColor bg) {
//  return ttfRenderUtf8Shaded(font, text, fg, bg);
//}
//
//Pointer<SdlSurface> ttfRenderUnicode(
//    Pointer<TtfFont> font, Pointer<Uint16> text, SdlColor fg, SdlColor bg) {
//  return ttfRenderUnicodeShaded(font, text, fg, bg);
//}

bool ttfSetError(String fmt) => sdlSetError(fmt);

String? ttfGetError() => sdlGetError();
