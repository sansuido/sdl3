part of '../../../sdl.dart';

///
/// Get the user-and-app-specific path where files can be written.
///
/// Get the "pref dir". This is meant to be where users can write personal
/// files (preferences and save games, etc) that are specific to your
/// application. This directory is unique per user, per application.
///
/// This function will decide the appropriate location in the native
/// filesystem, create the directory if necessary, and return a string of the
/// absolute path to the directory in UTF-8 encoding.
///
/// On Windows, the string might look like:
///
/// `C:\\Users\\bob\\AppData\\Roaming\\My Company\\My Program Name\\`
///
/// On Linux, the string might look like:
///
/// `/home/bob/.local/share/My Program Name/`
///
/// On macOS, the string might look like:
///
/// `/Users/bob/Library/Application Support/My Program Name/`
///
/// You should assume the path returned by this function is the only safe place
/// to write files (and that SDL_GetBasePath(), while it might be writable, or
/// even the parent of the returned path, isn't where you should be writing
/// things).
///
/// Both the org and app strings may become part of a directory name, so please
/// follow these rules:
///
/// - Try to use the same org string (_including case-sensitivity_) for all
/// your applications that use this function.
/// - Always use a unique app string for each one, and make sure it never
/// changes for an app once you've decided on it.
/// - Unicode characters are legal, as long as they are UTF-8 encoded, but...
/// - ...only use letters, numbers, and spaces. Avoid punctuation like "Game
/// Name 2: Bad Guy's Revenge!" ... "Game Name 2" is sufficient.
///
/// Due to historical mistakes, `org` is allowed to be NULL or "". In such
/// cases, SDL will omit the org subdirectory, including on platforms where it
/// shouldn't, and including on platforms where this would make your app fail
/// certification for an app store. New apps should definitely specify a real
/// string for `org`.
///
/// The returned path is guaranteed to end with a path separator ('\\' on
/// Windows, '/' on most other platforms).
///
/// \param org the name of your organization.
/// \param app the name of your application.
/// \returns a UTF-8 string of the user directory in platform-dependent
/// notation. NULL if there's a problem (creating directory failed,
/// etc.). This should be freed with SDL_free() when it is no longer
/// needed.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetBasePath
///
/// ```c
/// extern SDL_DECLSPEC char * SDLCALL SDL_GetPrefPath(const char *org, const char *app)
/// ```
/// {@category filesystem}
String? sdlxGetPrefPath(String? org, String? app) {
  String? result;
  final resultPointer = sdlGetPrefPath(org, app);
  if (resultPointer != nullptr) {
    result = resultPointer.cast<Utf8>().toDartString();
    sdlFree(resultPointer.cast<Void>());
  }
  return result;
}

///
/// Enumerate a directory tree, filtered by pattern, and return a list.
///
/// Files are filtered out if they don't match the string in `pattern`, which
/// may contain wildcard characters `*` (match everything) and `?` (match one
/// character). If pattern is NULL, no filtering is done and all results are
/// returned. Subdirectories are permitted, and are specified with a path
/// separator of `/`. Wildcard characters `*` and `?` never match a path
/// separator.
///
/// `flags` may be set to SDL_GLOB_CASEINSENSITIVE to make the pattern matching
/// case-insensitive.
///
/// The returned array is always NULL-terminated, for your iterating
/// convenience, but if `count` is non-NULL, on return it will contain the
/// number of items in the array, not counting the NULL terminator.
///
/// \param path the path of the directory to enumerate.
/// \param pattern the pattern that files in the directory must match. Can be
/// NULL.
/// \param flags `SDL_GLOB_*` bitflags that affect this search.
/// \param count on return, will be set to the number of items in the returned
/// array. Can be NULL.
/// \returns an array of strings on success or NULL on failure; call
/// SDL_GetError() for more information. This is a single allocation
/// that should be freed with SDL_free() when it is no longer needed.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC char ** SDLCALL SDL_GlobDirectory(const char *path, const char *pattern, SDL_GlobFlags flags, int *count)
/// ```
/// {@category filesystem}
List<String> sdlxGlobDirectory(String path, {String? pattern, int flags = 0}) {
  final result = <String>[];
  final countPointer = ffi.calloc<Int32>();
  final stringsPointer = sdlGlobDirectory(path, pattern, flags, countPointer);
  if (stringsPointer != nullptr) {
    for (var i = 0; i < countPointer.value; i++) {
      result.add(stringsPointer[i].cast<Utf8>().toDartString());
    }
    sdlFree(stringsPointer.cast<Void>());
  }
  countPointer.callocFree();
  return result;
}
