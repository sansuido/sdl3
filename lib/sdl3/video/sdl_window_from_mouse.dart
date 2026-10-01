part of '../sdl_video.dart';

extension SdlWindowPointerFromMouseEx on Pointer<SdlWindow> {
  ///
  /// Move the mouse cursor to the given position within the window.
  ///
  /// This function generates a mouse motion event if relative mode is not
  /// enabled. If relative mode is enabled, you can force mouse events for the
  /// warp by setting the SDL_HINT_MOUSE_RELATIVE_WARP_MOTION hint.
  ///
  /// Note that this function will appear to succeed, but not actually move the
  /// mouse when used over Microsoft Remote Desktop.
  ///
  /// \param window the window to move the mouse into, or NULL for the current
  /// mouse focus.
  /// \param x the x coordinate within the window.
  /// \param y the y coordinate within the window.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_WarpMouseGlobal
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_WarpMouseInWindow(SDL_Window *window, float x, float y)
  /// ```
  ///
  /// See also:
  /// - [SDL_WarpMouseInWindow - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_WarpMouseInWindow)
  ///
  /// {@category mouse}
  void warpMouseIn(double x, double y) => sdlWarpMouseInWindow(this, x, y);

  ///
  /// Set relative mouse mode for a window.
  ///
  /// While the window has focus and relative mouse mode is enabled, the cursor
  /// is hidden, the mouse position is constrained to the window, and SDL will
  /// report continuous relative mouse motion even if the mouse is at the edge of
  /// the window.
  ///
  /// If you'd like to keep the mouse position fixed while in relative mode you
  /// can use SDL_SetWindowMouseRect(). If you'd like the cursor to be at a
  /// specific location when relative mode ends, you should use
  /// SDL_WarpMouseInWindow() before disabling relative mode.
  ///
  /// This function will flush any pending mouse motion for this window.
  ///
  /// \param window the window to change.
  /// \param enabled true to enable relative mode, false to disable.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetWindowRelativeMouseMode
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowRelativeMouseMode(SDL_Window *window, bool enabled)
  /// ```
  ///
  /// See also:
  /// - [SDL_SetWindowRelativeMouseMode - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetWindowRelativeMouseMode)
  ///
  /// {@category mouse}
  bool setRelativeMouseMode(bool enabled) =>
      sdlSetWindowRelativeMouseMode(this, enabled);

  ///
  /// Query whether relative mouse mode is enabled for a window.
  ///
  /// \param window the window to query.
  /// \returns true if relative mode is enabled for a window or false otherwise.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_SetWindowRelativeMouseMode
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetWindowRelativeMouseMode(SDL_Window *window)
  /// ```
  ///
  /// See also:
  /// - [SDL_GetWindowRelativeMouseMode - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetWindowRelativeMouseMode)
  ///
  /// {@category mouse}
  bool getRelativeMouseMode() => sdlGetWindowRelativeMouseMode(this);
}
