// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Return whether a mouse is currently connected.
///
/// \returns true if a mouse is connected, false otherwise.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetMice
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_HasMouse(void)
/// ```
bool sdlHasMouse() {
  final sdlHasMouseLookupFunction =
      libSdl3.lookupFunction<Uint8 Function(), int Function()>('SDL_HasMouse');
  return sdlHasMouseLookupFunction() == 1;
}

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
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetMouseNameForID
/// \sa SDL_HasMouse
///
/// ```c
/// extern SDL_DECLSPEC SDL_MouseID * SDLCALL SDL_GetMice(int *count)
/// ```
Pointer<Uint32> sdlGetMice(Pointer<Int32> count) {
  final sdlGetMiceLookupFunction = libSdl3.lookupFunction<
      Pointer<Uint32> Function(Pointer<Int32> count),
      Pointer<Uint32> Function(Pointer<Int32> count)>('SDL_GetMice');
  return sdlGetMiceLookupFunction(count);
}

///
/// Get the name of a mouse.
///
/// This function returns "" if the mouse doesn't have a name.
///
/// \param instance_id the mouse instance ID.
/// \returns the name of the selected mouse, or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetMice
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetMouseNameForID(SDL_MouseID instance_id)
/// ```
String? sdlGetMouseNameForId(int instanceId) {
  final sdlGetMouseNameForIdLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Uint32 instanceId),
      Pointer<Utf8> Function(int instanceId)>('SDL_GetMouseNameForID');
  final result = sdlGetMouseNameForIdLookupFunction(instanceId);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get the window which currently has mouse focus.
///
/// \returns the window with mouse focus.
///
/// \since This function is available since SDL 3.1.3.
///
/// ```c
/// extern SDL_DECLSPEC SDL_Window * SDLCALL SDL_GetMouseFocus(void)
/// ```
Pointer<SdlWindow> sdlGetMouseFocus() {
  final sdlGetMouseFocusLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlWindow> Function(),
      Pointer<SdlWindow> Function()>('SDL_GetMouseFocus');
  return sdlGetMouseFocusLookupFunction();
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
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGlobalMouseState
/// \sa SDL_GetRelativeMouseState
///
/// ```c
/// extern SDL_DECLSPEC SDL_MouseButtonFlags SDLCALL SDL_GetMouseState(float *x, float *y)
/// ```
int sdlGetMouseState(Pointer<Float> x, Pointer<Float> y) {
  final sdlGetMouseStateLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<Float> x, Pointer<Float> y),
      int Function(Pointer<Float> x, Pointer<Float> y)>('SDL_GetMouseState');
  return sdlGetMouseStateLookupFunction(x, y);
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
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_CaptureMouse
/// \sa SDL_GetMouseState
/// \sa SDL_GetGlobalMouseState
///
/// ```c
/// extern SDL_DECLSPEC SDL_MouseButtonFlags SDLCALL SDL_GetGlobalMouseState(float *x, float *y)
/// ```
int sdlGetGlobalMouseState(Pointer<Float> x, Pointer<Float> y) {
  final sdlGetGlobalMouseStateLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<Float> x, Pointer<Float> y),
      int Function(
          Pointer<Float> x, Pointer<Float> y)>('SDL_GetGlobalMouseState');
  return sdlGetGlobalMouseStateLookupFunction(x, y);
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
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetMouseState
/// \sa SDL_GetGlobalMouseState
///
/// ```c
/// extern SDL_DECLSPEC SDL_MouseButtonFlags SDLCALL SDL_GetRelativeMouseState(float *x, float *y)
/// ```
int sdlGetRelativeMouseState(Pointer<Float> x, Pointer<Float> y) {
  final sdlGetRelativeMouseStateLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<Float> x, Pointer<Float> y),
      int Function(
          Pointer<Float> x, Pointer<Float> y)>('SDL_GetRelativeMouseState');
  return sdlGetRelativeMouseStateLookupFunction(x, y);
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
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_WarpMouseGlobal
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_WarpMouseInWindow(SDL_Window * window, float x, float y)
/// ```
void sdlWarpMouseInWindow(Pointer<SdlWindow> window, double x, double y) {
  final sdlWarpMouseInWindowLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlWindow> window, Float x, Float y),
      void Function(Pointer<SdlWindow> window, double x,
          double y)>('SDL_WarpMouseInWindow');
  return sdlWarpMouseInWindowLookupFunction(window, x, y);
}

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
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_WarpMouseInWindow
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_WarpMouseGlobal(float x, float y)
/// ```
bool sdlWarpMouseGlobal(double x, double y) {
  final sdlWarpMouseGlobalLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Float x, Float y),
      int Function(double x, double y)>('SDL_WarpMouseGlobal');
  return sdlWarpMouseGlobalLookupFunction(x, y) == 1;
}

///
/// Set relative mouse mode for a window.
///
/// While the window has focus and relative mouse mode is enabled, the cursor
/// is hidden, the mouse position is constrained to the window, and SDL will
/// report continuous relative mouse motion even if the mouse is at the edge of
/// the window.
///
/// This function will flush any pending mouse motion for this window.
///
/// \param window the window to change.
/// \param enabled true to enable relative mode, false to disable.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetWindowRelativeMouseMode
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowRelativeMouseMode(SDL_Window *window, bool enabled)
/// ```
bool sdlSetWindowRelativeMouseMode(Pointer<SdlWindow> window, bool enabled) {
  final sdlSetWindowRelativeMouseModeLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlWindow> window, Uint8 enabled),
      int Function(Pointer<SdlWindow> window,
          int enabled)>('SDL_SetWindowRelativeMouseMode');
  return sdlSetWindowRelativeMouseModeLookupFunction(window, enabled ? 1 : 0) ==
      1;
}

///
/// Query whether relative mouse mode is enabled for a window.
///
/// \param window the window to query.
/// \returns true if relative mode is enabled for a window or false otherwise.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_SetWindowRelativeMouseMode
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetWindowRelativeMouseMode(SDL_Window *window)
/// ```
bool sdlGetWindowRelativeMouseMode(Pointer<SdlWindow> window) {
  final sdlGetWindowRelativeMouseModeLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlWindow> window),
      int Function(
          Pointer<SdlWindow> window)>('SDL_GetWindowRelativeMouseMode');
  return sdlGetWindowRelativeMouseModeLookupFunction(window) == 1;
}

///
/// Capture the mouse and to track input outside an SDL window.
///
/// Capturing enables your app to obtain mouse events globally, instead of just
/// within your window. Not all video targets support this function. When
/// capturing is enabled, the current window will get all mouse events, but
/// unlike relative mode, no change is made to the cursor and it is not
/// restrained to your window.
///
/// This function may also deny mouse input to other windows--both those in
/// your application and others on the system--so you should use this function
/// sparingly, and in small bursts. For example, you might want to track the
/// mouse while the user is dragging something, until the user releases a mouse
/// button. It is not recommended that you capture the mouse for long periods
/// of time, such as the entire time your app is running. For that, you should
/// probably use SDL_SetWindowRelativeMouseMode() or SDL_SetWindowMouseGrab(),
/// depending on your goals.
///
/// While captured, mouse events still report coordinates relative to the
/// current (foreground) window, but those coordinates may be outside the
/// bounds of the window (including negative values). Capturing is only allowed
/// for the foreground window. If the window loses focus while capturing, the
/// capture will be disabled automatically.
///
/// While capturing is enabled, the current window will have the
/// `SDL_WINDOW_MOUSE_CAPTURE` flag set.
///
/// Please note that SDL will attempt to "auto capture" the mouse while the
/// user is pressing a button; this is to try and make mouse behavior more
/// consistent between platforms, and deal with the common case of a user
/// dragging the mouse outside of the window. This means that if you are
/// calling SDL_CaptureMouse() only to deal with this situation, you do not
/// have to (although it is safe to do so). If this causes problems for your
/// app, you can disable auto capture by setting the
/// `SDL_HINT_MOUSE_AUTO_CAPTURE` hint to zero.
///
/// \param enabled true to enable capturing, false to disable.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGlobalMouseState
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_CaptureMouse(bool enabled)
/// ```
bool sdlCaptureMouse(bool enabled) {
  final sdlCaptureMouseLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Uint8 enabled),
      int Function(int enabled)>('SDL_CaptureMouse');
  return sdlCaptureMouseLookupFunction(enabled ? 1 : 0) == 1;
}

///
/// Create a cursor using the specified bitmap data and mask (in MSB format).
///
/// `mask` has to be in MSB (Most Significant Bit) format.
///
/// The cursor width (`w`) must be a multiple of 8 bits.
///
/// The cursor is created in black and white according to the following:
///
/// - data=0, mask=1: white
/// - data=1, mask=1: black
/// - data=0, mask=0: transparent
/// - data=1, mask=0: inverted color if possible, black if not.
///
/// Cursors created with this function must be freed with SDL_DestroyCursor().
///
/// If you want to have a color cursor, or create your cursor from an
/// SDL_Surface, you should use SDL_CreateColorCursor(). Alternately, you can
/// hide the cursor and draw your own as part of your game's rendering, but it
/// will be bound to the framerate.
///
/// Also, SDL_CreateSystemCursor() is available, which provides several
/// readily-available system cursors to pick from.
///
/// \param data the color value for each pixel of the cursor.
/// \param mask the mask value for each pixel of the cursor.
/// \param w the width of the cursor.
/// \param h the height of the cursor.
/// \param hot_x the x-axis offset from the left of the cursor image to the
/// mouse x position, in the range of 0 to `w` - 1.
/// \param hot_y the y-axis offset from the top of the cursor image to the
/// mouse y position, in the range of 0 to `h` - 1.
/// \returns a new cursor with the specified parameters on success or NULL on
/// failure; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_CreateColorCursor
/// \sa SDL_CreateSystemCursor
/// \sa SDL_DestroyCursor
/// \sa SDL_SetCursor
///
/// ```c
/// extern SDL_DECLSPEC SDL_Cursor * SDLCALL SDL_CreateCursor(const Uint8 * data, const Uint8 * mask, int w, int h, int hot_x, int hot_y)
/// ```
Pointer<SdlCursor> sdlCreateCursor(Pointer<Uint8> data, Pointer<Uint8> mask,
    int w, int h, int hotX, int hotY) {
  final sdlCreateCursorLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlCursor> Function(Pointer<Uint8> data, Pointer<Uint8> mask,
          Int32 w, Int32 h, Int32 hotX, Int32 hotY),
      Pointer<SdlCursor> Function(Pointer<Uint8> data, Pointer<Uint8> mask,
          int w, int h, int hotX, int hotY)>('SDL_CreateCursor');
  return sdlCreateCursorLookupFunction(data, mask, w, h, hotX, hotY);
}

///
/// Create a color cursor.
///
/// If this function is passed a surface with alternate representations, the
/// surface will be interpreted as the content to be used for 100% display
/// scale, and the alternate representations will be used for high DPI
/// situations. For example, if the original surface is 32x32, then on a 2x
/// macOS display or 200% display scale on Windows, a 64x64 version of the
/// image will be used, if available. If a matching version of the image isn't
/// available, the closest larger size image will be downscaled to the
/// appropriate size and be used instead, if available. Otherwise, the closest
/// smaller image will be upscaled and be used instead.
///
/// \param surface an SDL_Surface structure representing the cursor image.
/// \param hot_x the x position of the cursor hot spot.
/// \param hot_y the y position of the cursor hot spot.
/// \returns the new cursor on success or NULL on failure; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_CreateCursor
/// \sa SDL_CreateSystemCursor
/// \sa SDL_DestroyCursor
/// \sa SDL_SetCursor
///
/// ```c
/// extern SDL_DECLSPEC SDL_Cursor * SDLCALL SDL_CreateColorCursor(SDL_Surface *surface, int hot_x, int hot_y)
/// ```
Pointer<SdlCursor> sdlCreateColorCursor(
    Pointer<SdlSurface> surface, int hotX, int hotY) {
  final sdlCreateColorCursorLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlCursor> Function(
          Pointer<SdlSurface> surface, Int32 hotX, Int32 hotY),
      Pointer<SdlCursor> Function(Pointer<SdlSurface> surface, int hotX,
          int hotY)>('SDL_CreateColorCursor');
  return sdlCreateColorCursorLookupFunction(surface, hotX, hotY);
}

///
/// Create a system cursor.
///
/// \param id an SDL_SystemCursor enum value.
/// \returns a cursor on success or NULL on failure; call SDL_GetError() for
/// more information.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_DestroyCursor
///
/// ```c
/// extern SDL_DECLSPEC SDL_Cursor * SDLCALL SDL_CreateSystemCursor(SDL_SystemCursor id)
/// ```
Pointer<SdlCursor> sdlCreateSystemCursor(int id) {
  final sdlCreateSystemCursorLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlCursor> Function(Int32 id),
      Pointer<SdlCursor> Function(int id)>('SDL_CreateSystemCursor');
  return sdlCreateSystemCursorLookupFunction(id);
}

///
/// Set the active cursor.
///
/// This function sets the currently active cursor to the specified one. If the
/// cursor is currently visible, the change will be immediately represented on
/// the display. SDL_SetCursor(NULL) can be used to force cursor redraw, if
/// this is desired for any reason.
///
/// \param cursor a cursor to make active.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetCursor
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetCursor(SDL_Cursor *cursor)
/// ```
bool sdlSetCursor(Pointer<SdlCursor> cursor) {
  final sdlSetCursorLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlCursor> cursor),
      int Function(Pointer<SdlCursor> cursor)>('SDL_SetCursor');
  return sdlSetCursorLookupFunction(cursor) == 1;
}

///
/// Get the active cursor.
///
/// This function returns a pointer to the current cursor which is owned by the
/// library. It is not necessary to free the cursor with SDL_DestroyCursor().
///
/// \returns the active cursor or NULL if there is no mouse.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_SetCursor
///
/// ```c
/// extern SDL_DECLSPEC SDL_Cursor * SDLCALL SDL_GetCursor(void)
/// ```
Pointer<SdlCursor> sdlGetCursor() {
  final sdlGetCursorLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlCursor> Function(),
      Pointer<SdlCursor> Function()>('SDL_GetCursor');
  return sdlGetCursorLookupFunction();
}

///
/// Get the default cursor.
///
/// You do not have to call SDL_DestroyCursor() on the return value, but it is
/// safe to do so.
///
/// \returns the default cursor on success or NULL on failuree; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.1.3.
///
/// ```c
/// extern SDL_DECLSPEC SDL_Cursor * SDLCALL SDL_GetDefaultCursor(void)
/// ```
Pointer<SdlCursor> sdlGetDefaultCursor() {
  final sdlGetDefaultCursorLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlCursor> Function(),
      Pointer<SdlCursor> Function()>('SDL_GetDefaultCursor');
  return sdlGetDefaultCursorLookupFunction();
}

///
/// Free a previously-created cursor.
///
/// Use this function to free cursor resources created with SDL_CreateCursor(),
/// SDL_CreateColorCursor() or SDL_CreateSystemCursor().
///
/// \param cursor the cursor to free.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_CreateColorCursor
/// \sa SDL_CreateCursor
/// \sa SDL_CreateSystemCursor
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_DestroyCursor(SDL_Cursor *cursor)
/// ```
void sdlDestroyCursor(Pointer<SdlCursor> cursor) {
  final sdlDestroyCursorLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlCursor> cursor),
      void Function(Pointer<SdlCursor> cursor)>('SDL_DestroyCursor');
  return sdlDestroyCursorLookupFunction(cursor);
}

///
/// Show the cursor.
///
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_CursorVisible
/// \sa SDL_HideCursor
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ShowCursor(void)
/// ```
bool sdlShowCursor() {
  final sdlShowCursorLookupFunction = libSdl3
      .lookupFunction<Uint8 Function(), int Function()>('SDL_ShowCursor');
  return sdlShowCursorLookupFunction() == 1;
}

///
/// Hide the cursor.
///
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_CursorVisible
/// \sa SDL_ShowCursor
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_HideCursor(void)
/// ```
bool sdlHideCursor() {
  final sdlHideCursorLookupFunction = libSdl3
      .lookupFunction<Uint8 Function(), int Function()>('SDL_HideCursor');
  return sdlHideCursorLookupFunction() == 1;
}

///
/// Return whether the cursor is currently being shown.
///
/// \returns `true` if the cursor is being shown, or `false` if the cursor is
/// hidden.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_HideCursor
/// \sa SDL_ShowCursor
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_CursorVisible(void)
/// ```
bool sdlCursorVisible() {
  final sdlCursorVisibleLookupFunction = libSdl3
      .lookupFunction<Uint8 Function(), int Function()>('SDL_CursorVisible');
  return sdlCursorVisibleLookupFunction() == 1;
}
