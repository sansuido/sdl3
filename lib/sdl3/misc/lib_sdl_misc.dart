part of '../sdl_misc.dart';

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
String? sdlxEncodeUrl(String str, [String? noEncodeChars]) {
  final result = sdlEncodeUrl(str, noEncodeChars);
  if (result == nullptr) {
    return null;
  }
  final text = result.cast<ffi.Utf8>().toDartString();
  sdlFree(result.cast<Void>());
  return text;
}
