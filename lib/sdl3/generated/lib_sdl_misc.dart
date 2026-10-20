// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
part of '../sdl_misc.dart';

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
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_OpenURL(const char *url)
/// ```
///
/// See also:
/// - [SDL_OpenURL - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_OpenURL)
///
/// {@category misc}
bool sdlOpenUrl(String? url) {
  final sdlOpenUrlLookupFunction = _libSdl
      .lookupFunction<
        Bool Function(Pointer<ffi.Utf8> url),
        bool Function(Pointer<ffi.Utf8> url)
      >('SDL_OpenURL');
  final urlPointer = url != null ? url.toNativeUtf8() : nullptr;
  final result = sdlOpenUrlLookupFunction(urlPointer);
  ffi.calloc.free(urlPointer);
  return result;
}

///
/// Encode a string for use in a URL.
///
/// This encodes a string according to RFC3986 section 2, using
/// "percent-encoding," which is the act of turning a single byte into a
/// three-character sequence. For example, a space character (ASCII 32, or
/// 0x20) is converted into the string "%20".
///
/// Only certain bytes are encoded. What RFC3986 calls "unreserved characters"
/// are not: low-ASCII alphanumeric chars, and four others: `=._~`.
///
/// While using UTF-8 is encouraged, this function does not care if the string
/// is well-formed UTF-8; it will treat the string as individual bytes to
/// encode, with some of those bytes being unreserved characters.
///
/// This function's primary use is encoding strings for use as parameters
/// appended to a URL passed to SDL_OpenURL(), however, this can _also_ be
/// useful on some systems for passing a filesystem path with a "file://"
/// prefix to that function to launch a file manager. In such cases, it would
/// be better if '/' and '\\' aren't encoded, so one can pass a null-terminated
/// list of characters to `no_encode_chars` to add to the list of characters
/// that aren't encoded:
///
/// ```c
/// char *encoded = SDL_EncodeURL(MyFilePath, "/\\");
/// ```
///
/// These characters will be added to the normal "unreserved characters" list
/// and not encoded. Passing NULL is valid and adds no characters to the list.
///
/// \param str the string to encode.
/// \param no_encode_chars a string of extra characters that are not to be
/// encoded.
/// \returns the encoded string or NULL on failure; call SDL_GetError() for
/// more information. This should be freed with SDL_free() when it is
/// no longer needed.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.6.0.
///
/// ```c
/// extern SDL_DECLSPEC char * SDLCALL SDL_EncodeURL(const char *str, const char *no_encode_chars)
/// ```
///
/// See also:
/// - [SDL_EncodeURL - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_EncodeURL)
///
/// {@category misc}
Pointer<Int8> sdlEncodeUrl(String? str, String? noEncodeChars) {
  final sdlEncodeUrlLookupFunction = _libSdl
      .lookupFunction<
        Pointer<Int8> Function(
          Pointer<ffi.Utf8> str,
          Pointer<ffi.Utf8> noEncodeChars,
        ),
        Pointer<Int8> Function(
          Pointer<ffi.Utf8> str,
          Pointer<ffi.Utf8> noEncodeChars,
        )
      >('SDL_EncodeURL');
  final strPointer = str != null ? str.toNativeUtf8() : nullptr;
  final noEncodeCharsPointer = noEncodeChars != null
      ? noEncodeChars.toNativeUtf8()
      : nullptr;
  final result = sdlEncodeUrlLookupFunction(strPointer, noEncodeCharsPointer);
  ffi.calloc
    ..free(strPointer)
    ..free(noEncodeCharsPointer);
  return result;
}
