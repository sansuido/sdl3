// ignore_for_file: avoid_positional_boolean_parameters

part of '../../../sdl.dart';

///
/// Get a list of currently connected displays.
///
/// \param count a pointer filled in with the number of displays returned, may
/// be NULL.
/// \returns a 0 terminated array of display instance IDs or NULL on failure;
/// call SDL_GetError() for more information. This should be freed
/// with SDL_free() when it is no longer needed.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_DisplayID * SDLCALL SDL_GetDisplays(int *count)
/// ```
/// {@category video}
List<int> sdlxGetDisplays() {
  final result = <int>[];
  final countPointer = calloc<Int32>();
  final displaysPointer = sdlGetDisplays(countPointer);
  if (displaysPointer != nullptr) {
    for (var i = 0; i < countPointer.value; i++) {
      result.add(displaysPointer[i]);
    }
    sdlFree(displaysPointer.cast<Void>());
  }
  countPointer.callocFree();
  return result;
}

///
/// Get the desktop area represented by a display.
///
/// The primary display is often located at (0,0), but may be placed at a
/// different location depending on monitor layout.
///
/// \param displayID the instance ID of the display to query.
/// \param rect the SDL_Rect structure filled in with the display bounds.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetDisplayUsableBounds
/// \sa SDL_GetDisplays
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetDisplayBounds(SDL_DisplayID displayID, SDL_Rect *rect)
/// ```
/// {@category video}
bool sdlxGetDisplayBounds(int displayId, SdlxRect rect) {
  final rectPointer = calloc<SdlRect>();
  final result = sdlGetDisplayBounds(displayId, rectPointer);
  if (result) {
    rect.loadFromPointer(rectPointer);
  }
  rectPointer.callocFree();
  return result;
}

///
/// Get the usable desktop area represented by a display, in screen
/// coordinates.
///
/// This is the same area as SDL_GetDisplayBounds() reports, but with portions
/// reserved by the system removed. For example, on Apple's macOS, this
/// subtracts the area occupied by the menu bar and dock.
///
/// Setting a window to be fullscreen generally bypasses these unusable areas,
/// so these are good guidelines for the maximum space available to a
/// non-fullscreen window.
///
/// \param displayID the instance ID of the display to query.
/// \param rect the SDL_Rect structure filled in with the display bounds.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetDisplayBounds
/// \sa SDL_GetDisplays
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetDisplayUsableBounds(SDL_DisplayID displayID, SDL_Rect *rect)
/// ```
/// {@category video}
bool sdlxGetDisplayUsableBounds(int displayId, SdlxRect rect) {
  final rectPointer = calloc<SdlRect>();
  final result = sdlGetDisplayUsableBounds(displayId, rectPointer);
  if (result) {
    rect.loadFromPointer(rectPointer);
  }
  rectPointer.callocFree();
  return result;
}

List<SdlxDisplayMode>? sdlxGetFullscreenDisplayModes(int displayId) {
  final countPointer = calloc<Int32>();
  final resultPointer = sdlGetFullscreenDisplayModes(displayId, countPointer);
  if (resultPointer == nullptr) {
    countPointer.callocFree();
    return null;
  }
  final count = countPointer.value;
  final result = <SdlxDisplayMode>[];
  for (var i = 0; i < count; i++) {
    final displayMode = SdlxDisplayMode()
      ..loadFromPointer((resultPointer + i).value);
    result.add(displayMode);
  }
  countPointer.callocFree();
  return result;
}

///
/// Get the closest match to the requested display mode.
///
/// The available display modes are scanned and `closest` is filled in with the
/// closest mode matching the requested mode and returned. The mode format and
/// refresh rate default to the desktop mode if they are set to 0. The modes
/// are scanned with size being first priority, format being second priority,
/// and finally checking the refresh rate. If all the available modes are too
/// small, then false is returned.
///
/// \param displayID the instance ID of the display to query.
/// \param w the width in pixels of the desired display mode.
/// \param h the height in pixels of the desired display mode.
/// \param refresh_rate the refresh rate of the desired display mode, or 0.0f
/// for the desktop refresh rate.
/// \param include_high_density_modes boolean to include high density modes in
/// the search.
/// \param closest a pointer filled in with the closest display mode equal to
/// or larger than the desired mode.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetDisplays
/// \sa SDL_GetFullscreenDisplayModes
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetClosestFullscreenDisplayMode(SDL_DisplayID displayID, int w, int h, float refresh_rate, bool include_high_density_modes, SDL_DisplayMode *closest)
/// ```
/// {@category video}
bool sdlxGetClosestFullscreenDisplayMode(
  int displayId,
  int w,
  int h,
  double refreshRate,
  bool includeHighDensityModes,
  SdlxDisplayMode closest,
) {
  final closestPointer = calloc<SdlDisplayMode>();
  final result = sdlGetClosestFullscreenDisplayMode(
    displayId,
    w,
    h,
    refreshRate,
    includeHighDensityModes,
    closestPointer,
  );
  if (result) {
    closest.loadFromPointer(closestPointer);
  }
  closestPointer.callocFree();
  return result;
}

///
/// Get information about the desktop's display mode.
///
/// There's a difference between this function and SDL_GetCurrentDisplayMode()
/// when SDL runs fullscreen and has changed the resolution. In that case this
/// function will return the previous native display mode, and not the current
/// display mode.
///
/// \param displayID the instance ID of the display to query.
/// \returns a pointer to the desktop display mode or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetCurrentDisplayMode
/// \sa SDL_GetDisplays
///
/// ```c
/// extern SDL_DECLSPEC const SDL_DisplayMode * SDLCALL SDL_GetDesktopDisplayMode(SDL_DisplayID displayID)
/// ```
/// {@category video}
SdlxDisplayMode? sdlxGetDesktopDisplayMode(int displayId) {
  final resultPointer = sdlGetDesktopDisplayMode(displayId);
  if (resultPointer == nullptr) {
    return null;
  }
  final result = SdlxDisplayMode()..loadFromPointer(resultPointer);
  return result;
}

///
/// Get information about the current display mode.
///
/// There's a difference between this function and SDL_GetDesktopDisplayMode()
/// when SDL runs fullscreen and has changed the resolution. In that case this
/// function will return the current display mode, and not the previous native
/// display mode.
///
/// \param displayID the instance ID of the display to query.
/// \returns a pointer to the desktop display mode or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetDesktopDisplayMode
/// \sa SDL_GetDisplays
///
/// ```c
/// extern SDL_DECLSPEC const SDL_DisplayMode * SDLCALL SDL_GetCurrentDisplayMode(SDL_DisplayID displayID)
/// ```
/// {@category video}
SdlxDisplayMode? sdlxGetCurrentDisplayMode(int displayId) {
  final resultPointer = sdlGetCurrentDisplayMode(displayId);
  if (resultPointer == nullptr) {
    return null;
  }
  final result = SdlxDisplayMode()..loadFromPointer(resultPointer);
  return result;
}

///
/// Get the display containing a point.
///
/// \param point the point to query.
/// \returns the instance ID of the display containing the point or 0 on
/// failure; call SDL_GetError() for more information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetDisplayBounds
/// \sa SDL_GetDisplays
///
/// ```c
/// extern SDL_DECLSPEC SDL_DisplayID SDLCALL SDL_GetDisplayForPoint(const SDL_Point *point)
/// ```
/// {@category video}
int sdlxGetDisplayForPoint(SdlxPoint point) {
  final pointPointer = calloc<SdlPoint>();
  pointPointer.ref
    ..x = point.x
    ..y = point.y;
  final result = sdlGetDisplayForPoint(pointPointer);
  pointPointer.callocFree();
  return result;
}

///
/// Get the display primarily containing a rect.
///
/// \param rect the rect to query.
/// \returns the instance ID of the display entirely containing the rect or
/// closest to the center of the rect on success or 0 on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetDisplayBounds
/// \sa SDL_GetDisplays
///
/// ```c
/// extern SDL_DECLSPEC SDL_DisplayID SDLCALL SDL_GetDisplayForRect(const SDL_Rect *rect)
/// ```
/// {@category video}
int sdlxGetDisplayForRect(SdlxRect rect) {
  final rectPointer = calloc<SdlRect>();
  rectPointer.ref
    ..x = rect.x
    ..y = rect.y
    ..w = rect.w
    ..h = rect.h;
  final result = sdlGetDisplayForRect(rectPointer);
  rectPointer.callocFree();
  return result;
}

///
/// Set the display mode to use when a window is visible and fullscreen.
///
/// This only affects the display mode used when the window is fullscreen. To
/// change the window size when the window is not fullscreen, use
/// SDL_SetWindowSize().
///
/// If the window is currently in the fullscreen state, this request is
/// asynchronous on some windowing systems and the new mode dimensions may not
/// be applied immediately upon the return of this function. If an immediate
/// change is required, call SDL_SyncWindow() to block until the changes have
/// taken effect.
///
/// When the new mode takes effect, an SDL_EVENT_WINDOW_RESIZED and/or an
/// SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED event will be emitted with the new mode
/// dimensions.
///
/// \param window the window to affect.
/// \param mode a pointer to the display mode to use, which can be NULL for
/// borderless fullscreen desktop mode, or one of the fullscreen
/// modes returned by SDL_GetFullscreenDisplayModes() to set an
/// exclusive fullscreen mode.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetWindowFullscreenMode
/// \sa SDL_SetWindowFullscreen
/// \sa SDL_SyncWindow
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowFullscreenMode(SDL_Window *window, const SDL_DisplayMode *mode)
/// ```
/// {@category video}
bool sdlxSetWindowFullscreenMode(
  Pointer<SdlWindow> window,
  SdlxDisplayMode mode,
) {
  final modePointer = mode.calloc();
  final result = sdlSetWindowFullscreenMode(window, modePointer);
  modePointer.callocFree();
  return result;
}

///
/// Query the display mode to use when a window is visible at fullscreen.
///
/// \param window the window to query.
/// \returns a pointer to the exclusive fullscreen mode to use or NULL for
/// borderless fullscreen desktop mode.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetWindowFullscreenMode
/// \sa SDL_SetWindowFullscreen
///
/// ```c
/// extern SDL_DECLSPEC const SDL_DisplayMode * SDLCALL SDL_GetWindowFullscreenMode(SDL_Window *window)
/// ```
/// {@category video}
SdlxDisplayMode? sdlxGetWindowFullscreenMode(Pointer<SdlWindow> window) {
  final resultPointer = sdlGetWindowFullscreenMode(window);
  if (resultPointer == nullptr) {
    return null;
  }
  final result = SdlxDisplayMode()..loadFromPointer(resultPointer);
  return result;
}

///
/// Get a list of valid windows.
///
/// \param count a pointer filled in with the number of windows returned, may
/// be NULL.
/// \returns a NULL terminated array of SDL_Window pointers or NULL on failure;
/// call SDL_GetError() for more information. This is a single
/// allocation that should be freed with SDL_free() when it is no
/// longer needed.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_Window ** SDLCALL SDL_GetWindows(int *count)
/// ```
/// {@category video}
List<Pointer<SdlWindow>>? sdlxGetWindows() {
  final countPointer = calloc<Int32>();
  final resultPointer = sdlGetWindows(countPointer);
  if (resultPointer == nullptr) {
    countPointer.callocFree();
    return null;
  }
  final count = countPointer.value;
  final result = <Pointer<SdlWindow>>[];
  for (var i = 0; i < count; i++) {
    result.add((resultPointer + i).value);
  }
  countPointer.callocFree();
  return result;
}

///
/// Get the position of a window.
///
/// This is the current position of the window as last reported by the
/// windowing system.
///
/// If you do not need the value for one of the positions a NULL may be passed
/// in the `x` or `y` parameter.
///
/// \param window the window to query.
/// \param x a pointer filled in with the x position of the window, may be
/// NULL.
/// \param y a pointer filled in with the y position of the window, may be
/// NULL.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetWindowPosition
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetWindowPosition(SDL_Window *window, int *x, int *y)
/// ```
/// {@category video}
bool sdlxGetWindowPosition(Pointer<SdlWindow> window, SdlxPoint position) {
  var result = false;
  final xPointer = calloc<Int32>();
  final yPointer = calloc<Int32>();
  result = sdlGetWindowPosition(window, xPointer, yPointer);
  position
    ..x = xPointer.value
    ..y = yPointer.value;
  xPointer.callocFree();
  yPointer.callocFree();
  return result;
}

///
/// Request that the size of a window's client area be set.
///
/// If the window is in a fullscreen or maximized state, this request has no
/// effect.
///
/// To change the exclusive fullscreen mode of a window, use
/// SDL_SetWindowFullscreenMode().
///
/// On some windowing systems, this request is asynchronous and the new window
/// size may not have have been applied immediately upon the return of this
/// function. If an immediate change is required, call SDL_SyncWindow() to
/// block until the changes have taken effect.
///
/// When the window size changes, an SDL_EVENT_WINDOW_RESIZED event will be
/// emitted with the new window dimensions. Note that the new dimensions may
/// not match the exact size requested, as some windowing systems can restrict
/// the window size in certain scenarios (e.g. constraining the size of the
/// content area to remain within the usable desktop bounds). Additionally, as
/// this is just a request, it can be denied by the windowing system.
///
/// \param window the window to change.
/// \param w the width of the window, must be > 0.
/// \param h the height of the window, must be > 0.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetWindowSize
/// \sa SDL_SetWindowFullscreenMode
/// \sa SDL_SyncWindow
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowSize(SDL_Window *window, int w, int h)
/// ```
/// {@category video}
bool sdlxSetWindowSize(Pointer<SdlWindow> window, SdlxPoint size) =>
    sdlSetWindowSize(window, size.x, size.y);

///
/// Get the size of a window's client area.
///
/// The window pixel size may differ from its window coordinate size if the
/// window is on a high pixel density display. Use SDL_GetWindowSizeInPixels()
/// or SDL_GetRenderOutputSize() to get the real client area size in pixels.
///
/// \param window the window to query the width and height from.
/// \param w a pointer filled in with the width of the window, may be NULL.
/// \param h a pointer filled in with the height of the window, may be NULL.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetRenderOutputSize
/// \sa SDL_GetWindowSizeInPixels
/// \sa SDL_SetWindowSize
/// \sa SDL_EVENT_WINDOW_RESIZED
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetWindowSize(SDL_Window *window, int *w, int *h)
/// ```
/// {@category video}
bool sdlxGetWindowSize(Pointer<SdlWindow> window, SdlxPoint size) {
  var result = false;
  final wPointer = calloc<Int32>();
  final hPointer = calloc<Int32>();
  result = sdlGetWindowSize(window, wPointer, hPointer);
  if (result) {
    size
      ..x = wPointer.value
      ..y = hPointer.value;
  }
  wPointer.callocFree();
  hPointer.callocFree();
  return result;
}

///
/// Get the safe area for this window.
///
/// Some devices have portions of the screen which are partially obscured or
/// not interactive, possibly due to on-screen controls, curved edges, camera
/// notches, TV overscan, etc. This function provides the area of the window
/// which is safe to have interactable content. You should continue rendering
/// into the rest of the window, but it should not contain visually important
/// or interactable content.
///
/// \param window the window to query.
/// \param rect a pointer filled in with the client area that is safe for
/// interactive content.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetWindowSafeArea(SDL_Window *window, SDL_Rect *rect)
/// ```
/// {@category video}
bool sdlxGetWindowSafeArea(Pointer<SdlWindow> window, SdlxRect rect) {
  final rectPointer = calloc<SdlRect>();
  final result = sdlGetWindowSafeArea(window, rectPointer);
  if (result) {
    rect.loadFromPointer(rectPointer);
  }
  rectPointer.callocFree();
  return result;
}

///
/// Get the size of a window's borders (decorations) around the client area.
///
/// Note: If this function fails (returns false), the size values will be
/// initialized to 0, 0, 0, 0 (if a non-NULL pointer is provided), as if the
/// window in question was borderless.
///
/// Note: This function may fail on systems where the window has not yet been
/// decorated by the display server (for example, immediately after calling
/// SDL_CreateWindow). It is recommended that you wait at least until the
/// window has been presented and composited, so that the window system has a
/// chance to decorate the window and provide the border dimensions to SDL.
///
/// This function also returns false if getting the information is not
/// supported.
///
/// \param window the window to query the size values of the border
/// (decorations) from.
/// \param top pointer to variable for storing the size of the top border; NULL
/// is permitted.
/// \param left pointer to variable for storing the size of the left border;
/// NULL is permitted.
/// \param bottom pointer to variable for storing the size of the bottom
/// border; NULL is permitted.
/// \param right pointer to variable for storing the size of the right border;
/// NULL is permitted.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetWindowSize
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetWindowBordersSize(SDL_Window *window, int *top, int *left, int *bottom, int *right)
/// ```
/// {@category video}
bool sdlxGetWindowBordersSize(Pointer<SdlWindow> window, SdlxRect borders) {
  var result = false;
  final topPointer = calloc<Int32>();
  final leftPointer = calloc<Int32>();
  final bottomPointer = calloc<Int32>();
  final rightPointer = calloc<Int32>();
  result = sdlGetWindowBordersSize(
    window,
    topPointer,
    leftPointer,
    bottomPointer,
    rightPointer,
  );
  if (result) {
    borders
      ..x = leftPointer.value
      ..y = topPointer.value
      ..w = rightPointer.value
      ..h = bottomPointer.value;
  }
  topPointer.callocFree();
  leftPointer.callocFree();
  bottomPointer.callocFree();
  rightPointer.callocFree();
  return result;
}

///
/// Get the size of a window's client area, in pixels.
///
/// \param window the window from which the drawable size should be queried.
/// \param w a pointer to variable for storing the width in pixels, may be
/// NULL.
/// \param h a pointer to variable for storing the height in pixels, may be
/// NULL.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CreateWindow
/// \sa SDL_GetWindowSize
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetWindowSizeInPixels(SDL_Window *window, int *w, int *h)
/// ```
/// {@category video}
bool sdlxGetWindowSizeInPixels(Pointer<SdlWindow> window, SdlxPoint size) {
  var result = false;
  final wPointer = calloc<Int32>();
  final hPointer = calloc<Int32>();
  result = sdlGetWindowSizeInPixels(window, wPointer, hPointer);
  if (result) {
    size
      ..x = wPointer.value
      ..y = hPointer.value;
  }
  wPointer.callocFree();
  hPointer.callocFree();
  return result;
}

///
/// Set the minimum size of a window's client area.
///
/// \param window the window to change.
/// \param min_w the minimum width of the window, or 0 for no limit.
/// \param min_h the minimum height of the window, or 0 for no limit.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetWindowMinimumSize
/// \sa SDL_SetWindowMaximumSize
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowMinimumSize(SDL_Window *window, int min_w, int min_h)
/// ```
/// {@category video}
bool sdlxSetWindowMinimumSize(Pointer<SdlWindow> window, SdlxPoint minSize) =>
    sdlSetWindowMinimumSize(window, minSize.x, minSize.y);

///
/// Get the minimum size of a window's client area.
///
/// \param window the window to query.
/// \param w a pointer filled in with the minimum width of the window, may be
/// NULL.
/// \param h a pointer filled in with the minimum height of the window, may be
/// NULL.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetWindowMaximumSize
/// \sa SDL_SetWindowMinimumSize
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetWindowMinimumSize(SDL_Window *window, int *w, int *h)
/// ```
/// {@category video}
bool sdlxGetWindowMinimumSize(Pointer<SdlWindow> window, SdlxPoint minSize) {
  var result = false;
  final wPointer = calloc<Int32>();
  final hPointer = calloc<Int32>();
  result = sdlGetWindowMinimumSize(window, wPointer, hPointer);
  if (result) {
    minSize
      ..x = wPointer.value
      ..y = hPointer.value;
  }
  wPointer.callocFree();
  hPointer.callocFree();
  return result;
}

///
/// Set the maximum size of a window's client area.
///
/// \param window the window to change.
/// \param max_w the maximum width of the window, or 0 for no limit.
/// \param max_h the maximum height of the window, or 0 for no limit.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetWindowMaximumSize
/// \sa SDL_SetWindowMinimumSize
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowMaximumSize(SDL_Window *window, int max_w, int max_h)
/// ```
/// {@category video}
bool sdlxSetWindowMaximumSize(Pointer<SdlWindow> window, SdlxPoint maxSize) =>
    sdlSetWindowMaximumSize(window, maxSize.x, maxSize.y);

///
/// Get the maximum size of a window's client area.
///
/// \param window the window to query.
/// \param w a pointer filled in with the maximum width of the window, may be
/// NULL.
/// \param h a pointer filled in with the maximum height of the window, may be
/// NULL.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetWindowMinimumSize
/// \sa SDL_SetWindowMaximumSize
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetWindowMaximumSize(SDL_Window *window, int *w, int *h)
/// ```
/// {@category video}
bool sdlxGetWindowMaximumSize(Pointer<SdlWindow> window, SdlxPoint maxSize) {
  var result = false;
  final wPointer = calloc<Int32>();
  final hPointer = calloc<Int32>();
  result = sdlGetWindowMaximumSize(window, wPointer, hPointer);
  if (result) {
    maxSize
      ..x = wPointer.value
      ..y = hPointer.value;
  }
  wPointer.callocFree();
  hPointer.callocFree();
  return result;
}

///
/// Get VSync for the window surface.
///
/// \param window the window to query.
/// \param vsync an int filled with the current vertical refresh sync interval.
/// See SDL_SetWindowSurfaceVSync() for the meaning of the value.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetWindowSurfaceVSync
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetWindowSurfaceVSync(SDL_Window *window, int *vsync)
/// ```
/// {@category video}
int? sdlxGetWindowSurfaceVSync(Pointer<SdlWindow> window) {
  final vsyncPointer = calloc<Int32>();
  final result = sdlGetWindowSurfaceVSync(window, vsyncPointer);
  if (!result) {
    vsyncPointer.callocFree();
    return null;
  }
  final vsync = vsyncPointer.value;
  vsyncPointer.callocFree();
  return vsync;
}

///
/// Copy areas of the window surface to the screen.
///
/// This is the function you use to reflect changes to portions of the surface
/// on the screen.
///
/// This function is equivalent to the SDL 1.2 API SDL_UpdateRects().
///
/// Note that this function will update _at least_ the rectangles specified,
/// but this is only intended as an optimization; in practice, this might
/// update more of the screen (or all of the screen!), depending on what method
/// SDL uses to send pixels to the system.
///
/// \param window the window to update.
/// \param rects an array of SDL_Rect structures representing areas of the
/// surface to copy, in pixels.
/// \param numrects the number of rectangles.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetWindowSurface
/// \sa SDL_UpdateWindowSurface
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_UpdateWindowSurfaceRects(SDL_Window *window, const SDL_Rect *rects, int numrects)
/// ```
/// {@category video}
bool sdlxUpdateWindowSurfaceRects(
  Pointer<SdlWindow> window,
  List<SdlxRect> rects,
) {
  final rectsPointer = rects.calloc();
  final result = sdlUpdateWindowSurfaceRects(
    window,
    rectsPointer,
    rects.length,
  );
  rectsPointer.callocFree();
  return result;
}

///
/// Confines the cursor to the specified area of a window.
///
/// Note that this does NOT grab the cursor, it only defines the area a cursor
/// is restricted to when the window has mouse focus.
///
/// \param window the window that will be associated with the barrier.
/// \param rect a rectangle area in window-relative coordinates. If NULL the
/// barrier for the specified window will be destroyed.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetWindowMouseRect
/// \sa SDL_GetWindowMouseGrab
/// \sa SDL_SetWindowMouseGrab
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowMouseRect(SDL_Window *window, const SDL_Rect *rect)
/// ```
/// {@category video}
bool sdlxSetWindowMouseRect(Pointer<SdlWindow> window, SdlxRect rect) {
  final rectPointer = rect.calloc();
  final result = sdlSetWindowMouseRect(window, rectPointer);
  rectPointer.callocFree();
  return result;
}

///
/// Get the mouse confinement rectangle of a window.
///
/// \param window the window to query.
/// \returns a pointer to the mouse confinement rectangle of a window, or NULL
/// if there isn't one.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetWindowMouseRect
/// \sa SDL_GetWindowMouseGrab
/// \sa SDL_SetWindowMouseGrab
///
/// ```c
/// extern SDL_DECLSPEC const SDL_Rect * SDLCALL SDL_GetWindowMouseRect(SDL_Window *window)
/// ```
/// {@category video}
SdlxRect? sdlxGetWindowMouseRect(Pointer<SdlWindow> window) {
  final resultPointer = sdlGetWindowMouseRect(window);
  if (resultPointer == nullptr) {
    return null;
  }
  final result = SdlxRect()..loadFromPointer(resultPointer);
  return result;
}

///
/// Display the system-level window menu.
///
/// This default window menu is provided by the system and on some platforms
/// provides functionality for setting or changing privileged state on the
/// window, such as moving it between workspaces or displays, or toggling the
/// always-on-top property.
///
/// On platforms or desktops where this is unsupported, this function does
/// nothing.
///
/// \param window the window for which the menu will be displayed.
/// \param x the x coordinate of the menu, relative to the origin (top-left) of
/// the client area.
/// \param y the y coordinate of the menu, relative to the origin (top-left) of
/// the client area.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ShowWindowSystemMenu(SDL_Window *window, int x, int y)
/// ```
/// {@category video}
bool sdlxShowWindowSystemMenu(Pointer<SdlWindow> window, SdlxPoint position) =>
    sdlShowWindowSystemMenu(window, position.x, position.y);

///
/// Get the actual value for an attribute from the current context.
///
/// \param attr an SDL_GLAttr enum value specifying the OpenGL attribute to
/// get.
/// \param value a pointer filled in with the current value of `attr`.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GL_ResetAttributes
/// \sa SDL_GL_SetAttribute
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GL_GetAttribute(SDL_GLAttr attr, int *value)
/// ```
/// {@category video}
int? sdlxGlGetAttribute(int attr) {
  final valuePointer = calloc<Int32>();
  final result = sdlGlGetAttribute(attr, valuePointer);
  if (!result) {
    valuePointer.callocFree();
    return null;
  }
  final value = valuePointer.value;
  valuePointer.callocFree();
  return value;
}
