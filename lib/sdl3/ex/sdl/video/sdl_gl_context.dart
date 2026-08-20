part of '../../../sdl.dart';

extension SdlGlContextPointerEx on Pointer<SdlGlContext> {
  ///
  /// Delete an OpenGL context.
  ///
  /// \param context the OpenGL context to be deleted.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GL_CreateContext
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GL_DestroyContext(SDL_GLContext context)
  /// ```
  ///
  /// See also:
  /// - [SDL_GL_DestroyContext - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GL_DestroyContext)
  ///
  /// {@category video}
  bool destroy() => sdlGlDestroyContext(this);
}
