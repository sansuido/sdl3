part of '../sdl_video.dart';

extension SdlWindowPointerFromSystemEx on Pointer<SdlWindow> {
  ///
  /// Use this function to set the animation callback on Apple iOS.
  ///
  /// The function prototype for `callback` is:
  ///
  /// ```c
  /// void callback(void *callbackParam);
  /// ```
  ///
  /// Where its parameter, `callbackParam`, is what was passed as `callbackParam`
  /// to SDL_SetiOSAnimationCallback().
  ///
  /// This function is only available on Apple iOS.
  ///
  /// For more information see:
  ///
  /// https://wiki.libsdl.org/SDL3/README-ios
  ///
  /// Note that if you use the "main callbacks" instead of a standard C `main`
  /// function, you don't have to use this API, as SDL will manage this for you.
  ///
  /// Details on main callbacks are here:
  ///
  /// https://wiki.libsdl.org/SDL3/README-main-functions
  ///
  /// \param window the window for which the animation callback should be set.
  /// \param interval the number of frames after which **callback** will be
  /// called.
  /// \param callback the function to call for every frame.
  /// \param callbackParam a pointer that is passed to `callback`.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_SetiOSEventPump
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetiOSAnimationCallback(SDL_Window *window, int interval, SDL_iOSAnimationCallback callback, void *callbackParam)
  /// ```
  ///
  /// See also:
  /// - [SDL_SetiOSAnimationCallback - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetiOSAnimationCallback)
  ///
  /// {@category system}
  bool setiOsAnimationCallback(
    int interval,
    Pointer<NativeFunction<SdlIOsAnimationCallback>> callback,
    Pointer<Void> callbackParam,
  ) => sdlSetiOsAnimationCallback(this, interval, callback, callbackParam);
}
