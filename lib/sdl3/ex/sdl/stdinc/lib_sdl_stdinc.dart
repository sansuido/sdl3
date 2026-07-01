part of '../../../sdl.dart';

///
/// Get all variables in the environment.
///
/// \param env the environment to query.
/// \returns a NULL terminated array of pointers to environment variables in
/// the form "variable=value" or NULL on failure; call SDL_GetError()
/// for more information. This is a single allocation that should be
/// freed with SDL_free() when it is no longer needed.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetEnvironment
/// \sa SDL_CreateEnvironment
/// \sa SDL_GetEnvironmentVariable
/// \sa SDL_SetEnvironmentVariable
/// \sa SDL_UnsetEnvironmentVariable
///
/// ```c
/// extern SDL_DECLSPEC char ** SDLCALL SDL_GetEnvironmentVariables(SDL_Environment *env)
/// ```
/// {@category stdinc}
List<String> sdlxGetEnvironmentVariables(Pointer<SdlEnvironment> env) {
  final result = <String>[];
  final variablesPointer = sdlGetEnvironmentVariables(env);
  if (variablesPointer != nullptr) {
    var index = 0;
    while (variablesPointer[index] != nullptr) {
      result.add(variablesPointer[index].cast<Utf8>().toDartString());
      index++;
    }
    sdlFree(variablesPointer.cast<Void>());
  }
  return result;
}
