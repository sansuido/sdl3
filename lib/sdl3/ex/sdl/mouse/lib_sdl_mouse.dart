part of '../../../sdl.dart';

///
/// Get a list of currently connected mice.
///
/// Note that this will include any device or virtual driver that includes
/// mouse functionality, including some game controllers, KVM switches, etc.
/// You should wait for input from a device before you consider it actively in
/// use.
///
/// \param count a pointer filled in with the number of mice returned, may be
/// NULL.
/// \returns a 0 terminated array of mouse instance IDs or NULL on failure;
/// call SDL_GetError() for more information. This should be freed
/// with SDL_free() when it is no longer needed.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetMouseNameForID
/// \sa SDL_HasMouse
///
/// ```c
/// extern SDL_DECLSPEC SDL_MouseID * SDLCALL SDL_GetMice(int *count)
/// ```
/// {@category mouse}
List<int> sdlxGetMice() {
  final result = <int>[];
  final countPointer = ffi.calloc<Int32>();
  final micePointer = sdlGetMice(countPointer);
  if (micePointer != nullptr) {
    for (var i = 0; i < countPointer.value; i++) {
      result.add(micePointer[i]);
    }
    sdlFree(micePointer.cast<Void>());
  }
  countPointer.callocFree();
  return result;
}

///
/// Query SDL's cache for the synchronous mouse button state and the
/// window-relative SDL-cursor position.
///
/// This function returns the cached synchronous state as SDL understands it
/// from the last pump of the event queue.
///
/// To query the platform for immediate asynchronous state, use
/// SDL_GetGlobalMouseState.
///
/// Passing non-NULL pointers to `x` or `y` will write the destination with
/// respective x or y coordinates relative to the focused window.
///
/// In Relative Mode, the SDL-cursor's position usually contradicts the
/// platform-cursor's position as manually calculated from
/// SDL_GetGlobalMouseState() and SDL_GetWindowPosition.
///
/// \param x a pointer to receive the SDL-cursor's x-position from the focused
/// window's top left corner, can be NULL if unused.
/// \param y a pointer to receive the SDL-cursor's y-position from the focused
/// window's top left corner, can be NULL if unused.
/// \returns a 32-bit bitmask of the button state that can be bitwise-compared
/// against the SDL_BUTTON_MASK(X) macro.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetGlobalMouseState
/// \sa SDL_GetRelativeMouseState
///
/// ```c
/// extern SDL_DECLSPEC SDL_MouseButtonFlags SDLCALL SDL_GetMouseState(float *x, float *y)
/// ```
/// {@category mouse}
int sdlxGetMouseState(SdlxFPoint position) {
  final xPointer = ffi.calloc<Float>();
  final yPointer = ffi.calloc<Float>();
  final result = sdlGetMouseState(xPointer, yPointer);
  position
    ..x = xPointer.value
    ..y = yPointer.value;
  xPointer.callocFree();
  yPointer.callocFree();
  return result;
}

///
/// Query the platform for the asynchronous mouse button state and the
/// desktop-relative platform-cursor position.
///
/// This function immediately queries the platform for the most recent
/// asynchronous state, more costly than retrieving SDL's cached state in
/// SDL_GetMouseState().
///
/// Passing non-NULL pointers to `x` or `y` will write the destination with
/// respective x or y coordinates relative to the desktop.
///
/// In Relative Mode, the platform-cursor's position usually contradicts the
/// SDL-cursor's position as manually calculated from SDL_GetMouseState() and
/// SDL_GetWindowPosition.
///
/// This function can be useful if you need to track the mouse outside of a
/// specific window and SDL_CaptureMouse() doesn't fit your needs. For example,
/// it could be useful if you need to track the mouse while dragging a window,
/// where coordinates relative to a window might not be in sync at all times.
///
/// \param x a pointer to receive the platform-cursor's x-position from the
/// desktop's top left corner, can be NULL if unused.
/// \param y a pointer to receive the platform-cursor's y-position from the
/// desktop's top left corner, can be NULL if unused.
/// \returns a 32-bit bitmask of the button state that can be bitwise-compared
/// against the SDL_BUTTON_MASK(X) macro.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CaptureMouse
/// \sa SDL_GetMouseState
/// \sa SDL_GetGlobalMouseState
///
/// ```c
/// extern SDL_DECLSPEC SDL_MouseButtonFlags SDLCALL SDL_GetGlobalMouseState(float *x, float *y)
/// ```
/// {@category mouse}
int sdlxGetGlobalMouseState(SdlxFPoint position) {
  final xPointer = ffi.calloc<Float>();
  final yPointer = ffi.calloc<Float>();
  final result = sdlGetGlobalMouseState(xPointer, yPointer);
  position
    ..x = xPointer.value
    ..y = yPointer.value;
  xPointer.callocFree();
  yPointer.callocFree();
  return result;
}

///
/// Query SDL's cache for the synchronous mouse button state and accumulated
/// mouse delta since last call.
///
/// This function returns the cached synchronous state as SDL understands it
/// from the last pump of the event queue.
///
/// To query the platform for immediate asynchronous state, use
/// SDL_GetGlobalMouseState.
///
/// Passing non-NULL pointers to `x` or `y` will write the destination with
/// respective x or y deltas accumulated since the last call to this function
/// (or since event initialization).
///
/// This function is useful for reducing overhead by processing relative mouse
/// inputs in one go per-frame instead of individually per-event, at the
/// expense of losing the order between events within the frame (e.g. quickly
/// pressing and releasing a button within the same frame).
///
/// \param x a pointer to receive the x mouse delta accumulated since last
/// call, can be NULL if unused.
/// \param y a pointer to receive the y mouse delta accumulated since last
/// call, can be NULL if unused.
/// \returns a 32-bit bitmask of the button state that can be bitwise-compared
/// against the SDL_BUTTON_MASK(X) macro.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetMouseState
/// \sa SDL_GetGlobalMouseState
///
/// ```c
/// extern SDL_DECLSPEC SDL_MouseButtonFlags SDLCALL SDL_GetRelativeMouseState(float *x, float *y)
/// ```
/// {@category mouse}
int sdlxGetRelativeMouseState(SdlxFPoint position) {
  final xPointer = ffi.calloc<Float>();
  final yPointer = ffi.calloc<Float>();
  final result = sdlGetRelativeMouseState(xPointer, yPointer);
  position
    ..x = xPointer.value
    ..y = yPointer.value;
  xPointer.callocFree();
  yPointer.callocFree();
  return result;
}

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
/// {@category mouse}
void sdlxWarpMouseInWindow(Pointer<SdlWindow> window, SdlxFPoint position) =>
    sdlWarpMouseInWindow(window, position.x, position.y);

///
/// Move the mouse to the given position in global screen space.
///
/// This function generates a mouse motion event.
///
/// A failure of this function usually means that it is unsupported by a
/// platform.
///
/// Note that this function will appear to succeed, but not actually move the
/// mouse when used over Microsoft Remote Desktop.
///
/// \param x the x coordinate.
/// \param y the y coordinate.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_WarpMouseInWindow
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_WarpMouseGlobal(float x, float y)
/// ```
/// {@category mouse}
bool sdlxWarpMouseGlobal(SdlxFPoint position) =>
    sdlWarpMouseGlobal(position.x, position.y);

///
/// Create a color cursor.
///
/// If this function is passed a surface with alternate representations added
/// with SDL_AddSurfaceAlternateImage(), the surface will be interpreted as the
/// content to be used for 100% display scale, and the alternate
/// representations will be used for high DPI situations if
/// SDL_HINT_MOUSE_DPI_SCALE_CURSORS is enabled. For example, if the original
/// surface is 32x32, then on a 2x macOS display or 200% display scale on
/// Windows, a 64x64 version of the image will be used, if available. If a
/// matching version of the image isn't available, the closest larger size
/// image will be downscaled to the appropriate size and be used instead, if
/// available. Otherwise, the closest smaller image will be upscaled and be
/// used instead.
///
/// \param surface an SDL_Surface structure representing the cursor image.
/// \param hot_x the x position of the cursor hot spot.
/// \param hot_y the y position of the cursor hot spot.
/// \returns the new cursor on success or NULL on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_AddSurfaceAlternateImage
/// \sa SDL_CreateAnimatedCursor
/// \sa SDL_CreateCursor
/// \sa SDL_CreateSystemCursor
/// \sa SDL_DestroyCursor
/// \sa SDL_SetCursor
///
/// ```c
/// extern SDL_DECLSPEC SDL_Cursor * SDLCALL SDL_CreateColorCursor(SDL_Surface *surface, int hot_x, int hot_y)
/// ```
/// {@category mouse}
Pointer<SdlCursor> sdlxCreateColorCursor(
  Pointer<SdlSurface> surface,
  SdlxPoint hot,
) => sdlCreateColorCursor(surface, hot.x, hot.y);

///
/// Create an animated color cursor.
///
/// Animated cursors are composed of a sequential array of frames, specified as
/// surfaces and durations in an array of SDL_CursorFrameInfo structs. The hot
/// spot coordinates are universal to all frames, and all frames must have the
/// same dimensions.
///
/// Frame durations are specified in milliseconds. A duration of 0 implies an
/// infinite frame time, and the animation will stop on that frame. To create a
/// one-shot animation, set the duration of the last frame in the sequence to
/// 0.
///
/// If this function is passed surfaces with alternate representations added
/// with SDL_AddSurfaceAlternateImage(), the surfaces will be interpreted as
/// the content to be used for 100% display scale, and the alternate
/// representations will be used for high DPI situations. For example, if the
/// original surfaces are 32x32, then on a 2x macOS display or 200% display
/// scale on Windows, a 64x64 version of the image will be used, if available.
/// If a matching version of the image isn't available, the closest larger size
/// image will be downscaled to the appropriate size and be used instead, if
/// available. Otherwise, the closest smaller image will be upscaled and be
/// used instead.
///
/// If the underlying platform does not support animated cursors, this function
/// will fall back to creating a static color cursor using the first frame in
/// the sequence.
///
/// \param frames an array of cursor images composing the animation.
/// \param frame_count the number of frames in the sequence.
/// \param hot_x the x position of the cursor hot spot.
/// \param hot_y the y position of the cursor hot spot.
/// \returns the new cursor on success or NULL on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.4.0.
///
/// \sa SDL_AddSurfaceAlternateImage
/// \sa SDL_CreateCursor
/// \sa SDL_CreateColorCursor
/// \sa SDL_CreateSystemCursor
/// \sa SDL_DestroyCursor
/// \sa SDL_SetCursor
///
/// ```c
/// extern SDL_DECLSPEC SDL_Cursor *SDLCALL SDL_CreateAnimatedCursor(SDL_CursorFrameInfo *frames, int frame_count, int hot_x, int hot_y)
/// ```
/// {@category mouse}
Pointer<SdlCursor> sdlxCreateAnimatedCursor(
  List<SdlxCursorFrameInfo> frames,
  SdlxPoint hot,
) {
  final framesPointer = frames.calloc();
  final result = sdlCreateAnimatedCursor(
    framesPointer,
    frames.length,
    hot.x,
    hot.y,
  );
  framesPointer.callocFree();
  return result;
}
