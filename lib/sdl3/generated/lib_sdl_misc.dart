// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
part of '../sdl.dart';

///
/// Open a URL/URI in the browser or other appropriate external application.
///
/// Open a URL in a separate, system-provided application. How this works will
/// vary wildly depending on the platform. This will likely launch what makes
/// sense to handle a specific URL's protocol (a web browser for `http://`,
/// etc), but it might also be able to launch file managers for directories and
/// other things.
///
/// What happens when you open a URL varies wildly as well: your game window
/// may lose focus (and may or may not lose focus if your game was fullscreen
/// or grabbing input at the time). On mobile devices, your app will likely
/// move to the background or your process might be paused. Any given platform
/// may or may not handle a given URL.
///
/// If this is unimplemented (or simply unavailable) for a platform, this will
/// fail with an error. A successful result does not mean the URL loaded, just
/// that we launched _something_ to handle it (or at least believe we did).
///
/// All this to say: this function can be useful, but you should definitely
/// test it on every platform you target.
///
/// \param url a valid URL/URI to open. Use `file:///full/path/to/file` for
/// local files, if supported.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_OpenURL(const char *url)
/// ```
bool sdlOpenUrl(String? url) {
  final sdlOpenUrlLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<Utf8> url),
        int Function(Pointer<Utf8> url)
      >('SDL_OpenURL');
  final urlPointer = url != null ? url.toNativeUtf8() : nullptr;
  final result = sdlOpenUrlLookupFunction(urlPointer) == 1;
  calloc.free(urlPointer);
  return result;
}
