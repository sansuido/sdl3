part of '../../../sdl.dart';

extension SdlEnvironmentEx on SdlEnvironment {
  ///
  /// Get the process environment.
  ///
  /// This is initialized at application start and is not affected by setenv()
  /// and unsetenv() calls after that point. Use SDL_SetEnvironmentVariable() and
  /// SDL_UnsetEnvironmentVariable() if you want to modify this environment, or
  /// SDL_setenv_unsafe() or SDL_unsetenv_unsafe() if you want changes to persist
  /// in the C runtime environment after SDL_Quit().
  ///
  /// Note that on Windows, the variable names pulled in from the system at
  /// startup have their ASCII values uppercased, to match what most platforms
  /// expect even though the Windows system environment table is
  /// case-insensitive. Once those uppercased variable names are in an
  /// SDL_Environment, SDL treats them as case-sensitive.
  ///
  /// \returns a pointer to the environment for the process or NULL on failure;
  /// call SDL_GetError() for more information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetEnvironmentVariable
  /// \sa SDL_GetEnvironmentVariables
  /// \sa SDL_SetEnvironmentVariable
  /// \sa SDL_UnsetEnvironmentVariable
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Environment * SDLCALL SDL_GetEnvironment(void)
  /// ```
  ///
  /// See also:
  /// - [SDL_GetEnvironment - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetEnvironment)
  ///
  /// {@category stdinc}
  static Pointer<SdlEnvironment> get() => sdlGetEnvironment();

  ///
  /// Create a set of environment variables.
  ///
  /// Note that on Windows, the variable names pulled in from the system, if
  /// `populated` is true, have their ASCII values uppercased, to match what most
  /// platforms expect even though the Windows system environment table is
  /// case-insensitive. Once those uppercased variable names are in an
  /// SDL_Environment, SDL treats them as case-sensitive.
  ///
  /// \param populated true to initialize it from the C runtime environment,
  /// false to create an empty environment.
  /// \returns a pointer to the new environment or NULL on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \threadsafety If `populated` is false, it is safe to call this function
  /// from any thread, otherwise it is safe if no other threads are
  /// calling setenv() or unsetenv()
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetEnvironmentVariable
  /// \sa SDL_GetEnvironmentVariables
  /// \sa SDL_SetEnvironmentVariable
  /// \sa SDL_UnsetEnvironmentVariable
  /// \sa SDL_DestroyEnvironment
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Environment * SDLCALL SDL_CreateEnvironment(bool populated)
  /// ```
  ///
  /// See also:
  /// - [SDL_CreateEnvironment - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_CreateEnvironment)
  ///
  /// {@category stdinc}
  static Pointer<SdlEnvironment> create(bool populated) =>
      sdlCreateEnvironment(populated);
}

extension SdlEnvironmentPointerEx on Pointer<SdlEnvironment> {
  ///
  /// Get the value of a variable in the environment.
  ///
  /// \param env the environment to query.
  /// \param name the name of the variable to get.
  /// \returns a pointer to the value of the variable or NULL if it can't be
  /// found.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetEnvironment
  /// \sa SDL_CreateEnvironment
  /// \sa SDL_GetEnvironmentVariables
  /// \sa SDL_SetEnvironmentVariable
  /// \sa SDL_UnsetEnvironmentVariable
  ///
  /// ```c
  /// extern SDL_DECLSPEC const char * SDLCALL SDL_GetEnvironmentVariable(SDL_Environment *env, const char *name)
  /// ```
  ///
  /// See also:
  /// - [SDL_GetEnvironmentVariable - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetEnvironmentVariable)
  ///
  /// {@category stdinc}
  String? getVariable(String name) => sdlGetEnvironmentVariable(this, name);

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
  ///
  /// See also:
  /// - [SDL_GetEnvironmentVariables - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetEnvironmentVariables)
  ///
  /// {@category stdinc}
  List<String> getVariables() => sdlxGetEnvironmentVariables(this);

  ///
  /// Set the value of a variable in the environment.
  ///
  /// \param env the environment to modify.
  /// \param name the name of the variable to set.
  /// \param value the value of the variable to set.
  /// \param overwrite true to overwrite the variable if it exists, false to
  /// return success without setting the variable if it already
  /// exists.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetEnvironment
  /// \sa SDL_CreateEnvironment
  /// \sa SDL_GetEnvironmentVariable
  /// \sa SDL_GetEnvironmentVariables
  /// \sa SDL_UnsetEnvironmentVariable
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetEnvironmentVariable(SDL_Environment *env, const char *name, const char *value, bool overwrite)
  /// ```
  ///
  /// See also:
  /// - [SDL_SetEnvironmentVariable - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetEnvironmentVariable)
  ///
  /// {@category stdinc}
  bool setVariable(String name, String value, bool overwrite) =>
      sdlSetEnvironmentVariable(this, name, value, overwrite);

  ///
  /// Clear a variable from the environment.
  ///
  /// \param env the environment to modify.
  /// \param name the name of the variable to unset.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetEnvironment
  /// \sa SDL_CreateEnvironment
  /// \sa SDL_GetEnvironmentVariable
  /// \sa SDL_GetEnvironmentVariables
  /// \sa SDL_SetEnvironmentVariable
  /// \sa SDL_UnsetEnvironmentVariable
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_UnsetEnvironmentVariable(SDL_Environment *env, const char *name)
  /// ```
  ///
  /// See also:
  /// - [SDL_UnsetEnvironmentVariable - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_UnsetEnvironmentVariable)
  ///
  /// {@category stdinc}
  bool unsetVariable(String name) => sdlUnsetEnvironmentVariable(this, name);

  ///
  /// Destroy a set of environment variables.
  ///
  /// \param env the environment to destroy.
  ///
  /// \threadsafety It is safe to call this function from any thread, as long as
  /// the environment is no longer in use.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_CreateEnvironment
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_DestroyEnvironment(SDL_Environment *env)
  /// ```
  ///
  /// See also:
  /// - [SDL_DestroyEnvironment - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_DestroyEnvironment)
  ///
  /// {@category stdinc}
  void destroy() => sdlDestroyEnvironment(this);
}
