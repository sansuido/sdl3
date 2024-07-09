// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Get the number of video drivers compiled into SDL.
///
/// \returns a number >= 1 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetVideoDriver
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetNumVideoDrivers(void)
/// ```
int sdlGetNumVideoDrivers() {
  final sdlGetNumVideoDriversLookupFunction =
      libSdl3.lookupFunction<Int32 Function(), int Function()>(
          'SDL_GetNumVideoDrivers');
  return sdlGetNumVideoDriversLookupFunction();
}

///
/// Get the name of a built in video driver.
///
/// The video drivers are presented in the order in which they are normally
/// checked during initialization.
///
/// The names of drivers are all simple, low-ASCII identifiers, like "cocoa",
/// "x11" or "windows". These never have Unicode characters, and are not meant
/// to be proper names.
///
/// The returned string follows the SDL_GetStringRule.
///
/// \param index the index of a video driver.
/// \returns the name of the video driver with the given **index**.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetNumVideoDrivers
///
/// ```c
/// extern SDL_DECLSPEC const char *SDLCALL SDL_GetVideoDriver(int index)
/// ```
String? sdlGetVideoDriver(int index) {
  final sdlGetVideoDriverLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Int32 index),
      Pointer<Utf8> Function(int index)>('SDL_GetVideoDriver');
  final result = sdlGetVideoDriverLookupFunction(index);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get the name of the currently initialized video driver.
///
/// The names of drivers are all simple, low-ASCII identifiers, like "cocoa",
/// "x11" or "windows". These never have Unicode characters, and are not meant
/// to be proper names.
///
/// The returned string follows the SDL_GetStringRule.
///
/// \returns the name of the current video driver or NULL if no driver has been
/// initialized.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetNumVideoDrivers
/// \sa SDL_GetVideoDriver
///
/// ```c
/// extern SDL_DECLSPEC const char *SDLCALL SDL_GetCurrentVideoDriver(void)
/// ```
String? sdlGetCurrentVideoDriver() {
  final sdlGetCurrentVideoDriverLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(),
      Pointer<Utf8> Function()>('SDL_GetCurrentVideoDriver');
  final result = sdlGetCurrentVideoDriverLookupFunction();
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get the current system theme.
///
/// \returns the current system theme, light, dark, or unknown.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_SystemTheme SDLCALL SDL_GetSystemTheme(void)
/// ```
int sdlGetSystemTheme() {
  final sdlGetSystemThemeLookupFunction = libSdl3
      .lookupFunction<Int32 Function(), int Function()>('SDL_GetSystemTheme');
  return sdlGetSystemThemeLookupFunction();
}

///
/// Get a list of currently connected displays.
///
/// \param count a pointer filled in with the number of displays returned, may
/// be NULL.
/// \returns a 0 terminated array of display instance IDs which should be freed
/// with SDL_free(), or NULL on error; call SDL_GetError() for more
/// details.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_DisplayID *SDLCALL SDL_GetDisplays(int *count)
/// ```
Pointer<Uint32> sdlGetDisplays(Pointer<Int32> count) {
  final sdlGetDisplaysLookupFunction = libSdl3.lookupFunction<
      Pointer<Uint32> Function(Pointer<Int32> count),
      Pointer<Uint32> Function(Pointer<Int32> count)>('SDL_GetDisplays');
  return sdlGetDisplaysLookupFunction(count);
}

///
/// Return the primary display.
///
/// \returns the instance ID of the primary display on success or 0 on failure;
/// call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetDisplays
///
/// ```c
/// extern SDL_DECLSPEC SDL_DisplayID SDLCALL SDL_GetPrimaryDisplay(void)
/// ```
int sdlGetPrimaryDisplay() {
  final sdlGetPrimaryDisplayLookupFunction =
      libSdl3.lookupFunction<Uint32 Function(), int Function()>(
          'SDL_GetPrimaryDisplay');
  return sdlGetPrimaryDisplayLookupFunction();
}

///
/// Get the properties associated with a display.
///
/// The following read-only properties are provided by SDL:
///
/// - `SDL_PROP_DISPLAY_HDR_ENABLED_BOOLEAN`: true if the display has HDR
/// headroom above the SDR white point. This is for informational and
/// diagnostic purposes only, as not all platforms provide this information
/// at the display level.
///
/// On KMS/DRM:
///
/// - `SDL_PROP_DISPLAY_KMSDRM_ORIENTATION_NUMBER`: the "panel orientation"
/// property for the display in degrees of clockwise rotation. Note that this
/// is provided only as a hint, and the application is responsible for any
/// coordinate transformations needed to conform to the requested display
/// orientation.
///
/// \param displayID the instance ID of the display to query.
/// \returns a valid property ID on success or 0 on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetProperty
/// \sa SDL_SetProperty
///
/// ```c
/// extern SDL_DECLSPEC SDL_PropertiesID SDLCALL SDL_GetDisplayProperties(SDL_DisplayID displayID)
/// ```
int sdlGetDisplayProperties(int displayId) {
  final sdlGetDisplayPropertiesLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Uint32 displayId),
      int Function(int displayId)>('SDL_GetDisplayProperties');
  return sdlGetDisplayPropertiesLookupFunction(displayId);
}

///
/// Get the name of a display in UTF-8 encoding.
///
/// The returned string follows the SDL_GetStringRule.
///
/// \param displayID the instance ID of the display to query.
/// \returns the name of a display or NULL on failure; call SDL_GetError() for
/// more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetDisplays
///
/// ```c
/// extern SDL_DECLSPEC const char *SDLCALL SDL_GetDisplayName(SDL_DisplayID displayID)
/// ```
String? sdlGetDisplayName(int displayId) {
  final sdlGetDisplayNameLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Uint32 displayId),
      Pointer<Utf8> Function(int displayId)>('SDL_GetDisplayName');
  final result = sdlGetDisplayNameLookupFunction(displayId);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get the desktop area represented by a display.
///
/// The primary display is always located at (0,0).
///
/// \param displayID the instance ID of the display to query.
/// \param rect the SDL_Rect structure filled in with the display bounds.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetDisplayUsableBounds
/// \sa SDL_GetDisplays
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetDisplayBounds(SDL_DisplayID displayID, SDL_Rect *rect)
/// ```
int sdlGetDisplayBounds(int displayId, Pointer<SdlRect> rect) {
  final sdlGetDisplayBoundsLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 displayId, Pointer<SdlRect> rect),
      int Function(
          int displayId, Pointer<SdlRect> rect)>('SDL_GetDisplayBounds');
  return sdlGetDisplayBoundsLookupFunction(displayId, rect);
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
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetDisplayBounds
/// \sa SDL_GetDisplays
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetDisplayUsableBounds(SDL_DisplayID displayID, SDL_Rect *rect)
/// ```
int sdlGetDisplayUsableBounds(int displayId, Pointer<SdlRect> rect) {
  final sdlGetDisplayUsableBoundsLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 displayId, Pointer<SdlRect> rect),
      int Function(
          int displayId, Pointer<SdlRect> rect)>('SDL_GetDisplayUsableBounds');
  return sdlGetDisplayUsableBoundsLookupFunction(displayId, rect);
}

///
/// Get the orientation of a display when it is unrotated.
///
/// \param displayID the instance ID of the display to query.
/// \returns the SDL_DisplayOrientation enum value of the display, or
/// `SDL_ORIENTATION_UNKNOWN` if it isn't available.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetDisplays
///
/// ```c
/// extern SDL_DECLSPEC SDL_DisplayOrientation SDLCALL SDL_GetNaturalDisplayOrientation(SDL_DisplayID displayID)
/// ```
int sdlGetNaturalDisplayOrientation(int displayId) {
  final sdlGetNaturalDisplayOrientationLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 displayId),
      int Function(int displayId)>('SDL_GetNaturalDisplayOrientation');
  return sdlGetNaturalDisplayOrientationLookupFunction(displayId);
}

///
/// Get the orientation of a display.
///
/// \param displayID the instance ID of the display to query.
/// \returns the SDL_DisplayOrientation enum value of the display, or
/// `SDL_ORIENTATION_UNKNOWN` if it isn't available.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetDisplays
///
/// ```c
/// extern SDL_DECLSPEC SDL_DisplayOrientation SDLCALL SDL_GetCurrentDisplayOrientation(SDL_DisplayID displayID)
/// ```
int sdlGetCurrentDisplayOrientation(int displayId) {
  final sdlGetCurrentDisplayOrientationLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 displayId),
      int Function(int displayId)>('SDL_GetCurrentDisplayOrientation');
  return sdlGetCurrentDisplayOrientationLookupFunction(displayId);
}

///
/// Get the content scale of a display.
///
/// The content scale is the expected scale for content based on the DPI
/// settings of the display. For example, a 4K display might have a 2.0 (200%)
/// display scale, which means that the user expects UI elements to be twice as
/// big on this display, to aid in readability.
///
/// \param displayID the instance ID of the display to query.
/// \returns the content scale of the display, or 0.0f on error; call
/// SDL_GetError() for more details.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetDisplays
///
/// ```c
/// extern SDL_DECLSPEC float SDLCALL SDL_GetDisplayContentScale(SDL_DisplayID displayID)
/// ```
double sdlGetDisplayContentScale(int displayId) {
  final sdlGetDisplayContentScaleLookupFunction = libSdl3.lookupFunction<
      Float Function(Uint32 displayId),
      double Function(int displayId)>('SDL_GetDisplayContentScale');
  return sdlGetDisplayContentScaleLookupFunction(displayId);
}

///
/// Get a list of fullscreen display modes available on a display.
///
/// The display modes are sorted in this priority:
///
/// - w -> largest to smallest
/// - h -> largest to smallest
/// - bits per pixel -> more colors to fewer colors
/// - packed pixel layout -> largest to smallest
/// - refresh rate -> highest to lowest
/// - pixel density -> lowest to highest
///
/// \param displayID the instance ID of the display to query.
/// \param count a pointer filled in with the number of display modes returned.
/// \returns a NULL terminated array of display mode pointers which should be
/// freed with SDL_free(), or NULL on error; call SDL_GetError() for
/// more details.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetDisplays
///
/// ```c
/// extern SDL_DECLSPEC const SDL_DisplayMode **SDLCALL SDL_GetFullscreenDisplayModes(SDL_DisplayID displayID, int *count)
/// ```
Pointer<Pointer<SdlDisplayMode>> sdlGetFullscreenDisplayModes(
    int displayId, Pointer<Int32> count) {
  final sdlGetFullscreenDisplayModesLookupFunction = libSdl3.lookupFunction<
      Pointer<Pointer<SdlDisplayMode>> Function(
          Uint32 displayId, Pointer<Int32> count),
      Pointer<Pointer<SdlDisplayMode>> Function(int displayId,
          Pointer<Int32> count)>('SDL_GetFullscreenDisplayModes');
  return sdlGetFullscreenDisplayModesLookupFunction(displayId, count);
}

///
/// Get the closest match to the requested display mode.
///
/// The available display modes are scanned and `closest` is filled in with the
/// closest mode matching the requested mode and returned. The mode format and
/// refresh rate default to the desktop mode if they are set to 0. The modes
/// are scanned with size being first priority, format being second priority,
/// and finally checking the refresh rate. If all the available modes are too
/// small, then NULL is returned.
///
/// \param displayID the instance ID of the display to query.
/// \param w the width in pixels of the desired display mode.
/// \param h the height in pixels of the desired display mode.
/// \param refresh_rate the refresh rate of the desired display mode, or 0.0f
/// for the desktop refresh rate.
/// \param include_high_density_modes boolean to include high density modes in
/// the search.
/// \returns a pointer to the closest display mode equal to or larger than the
/// desired mode, or NULL on error; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetDisplays
/// \sa SDL_GetFullscreenDisplayModes
///
/// ```c
/// extern SDL_DECLSPEC const SDL_DisplayMode *SDLCALL SDL_GetClosestFullscreenDisplayMode(SDL_DisplayID displayID, int w, int h, float refresh_rate, SDL_bool include_high_density_modes)
/// ```
Pointer<SdlDisplayMode> sdlGetClosestFullscreenDisplayMode(int displayId, int w,
    int h, double refreshRate, bool includeHighDensityModes) {
  final sdlGetClosestFullscreenDisplayModeLookupFunction =
      libSdl3
          .lookupFunction<
                  Pointer<SdlDisplayMode> Function(Uint32 displayId, Int32 w,
                      Int32 h, Float refreshRate, Int32 includeHighDensityModes),
                  Pointer<SdlDisplayMode> Function(int displayId, int w, int h,
                      double refreshRate, int includeHighDensityModes)>(
              'SDL_GetClosestFullscreenDisplayMode');
  return sdlGetClosestFullscreenDisplayModeLookupFunction(
      displayId, w, h, refreshRate, includeHighDensityModes ? 1 : 0);
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
/// \returns a pointer to the desktop display mode or NULL on error; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetCurrentDisplayMode
/// \sa SDL_GetDisplays
///
/// ```c
/// extern SDL_DECLSPEC const SDL_DisplayMode *SDLCALL SDL_GetDesktopDisplayMode(SDL_DisplayID displayID)
/// ```
Pointer<SdlDisplayMode> sdlGetDesktopDisplayMode(int displayId) {
  final sdlGetDesktopDisplayModeLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlDisplayMode> Function(Uint32 displayId),
      Pointer<SdlDisplayMode> Function(
          int displayId)>('SDL_GetDesktopDisplayMode');
  return sdlGetDesktopDisplayModeLookupFunction(displayId);
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
/// \returns a pointer to the desktop display mode or NULL on error; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetDesktopDisplayMode
/// \sa SDL_GetDisplays
///
/// ```c
/// extern SDL_DECLSPEC const SDL_DisplayMode *SDLCALL SDL_GetCurrentDisplayMode(SDL_DisplayID displayID)
/// ```
Pointer<SdlDisplayMode> sdlGetCurrentDisplayMode(int displayId) {
  final sdlGetCurrentDisplayModeLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlDisplayMode> Function(Uint32 displayId),
      Pointer<SdlDisplayMode> Function(
          int displayId)>('SDL_GetCurrentDisplayMode');
  return sdlGetCurrentDisplayModeLookupFunction(displayId);
}

///
/// Get the display containing a point.
///
/// \param point the point to query.
/// \returns the instance ID of the display containing the point or 0 on
/// failure; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetDisplayBounds
/// \sa SDL_GetDisplays
///
/// ```c
/// extern SDL_DECLSPEC SDL_DisplayID SDLCALL SDL_GetDisplayForPoint(const SDL_Point *point)
/// ```
int sdlGetDisplayForPoint(Pointer<SdlPoint> point) {
  final sdlGetDisplayForPointLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<SdlPoint> point),
      int Function(Pointer<SdlPoint> point)>('SDL_GetDisplayForPoint');
  return sdlGetDisplayForPointLookupFunction(point);
}

///
/// Get the display primarily containing a rect.
///
/// \param rect the rect to query.
/// \returns the instance ID of the display entirely containing the rect or
/// closest to the center of the rect on success or 0 on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetDisplayBounds
/// \sa SDL_GetDisplays
///
/// ```c
/// extern SDL_DECLSPEC SDL_DisplayID SDLCALL SDL_GetDisplayForRect(const SDL_Rect *rect)
/// ```
int sdlGetDisplayForRect(Pointer<SdlRect> rect) {
  final sdlGetDisplayForRectLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<SdlRect> rect),
      int Function(Pointer<SdlRect> rect)>('SDL_GetDisplayForRect');
  return sdlGetDisplayForRectLookupFunction(rect);
}

///
/// Get the display associated with a window.
///
/// \param window the window to query.
/// \returns the instance ID of the display containing the center of the window
/// on success or 0 on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetDisplayBounds
/// \sa SDL_GetDisplays
///
/// ```c
/// extern SDL_DECLSPEC SDL_DisplayID SDLCALL SDL_GetDisplayForWindow(SDL_Window *window)
/// ```
int sdlGetDisplayForWindow(Pointer<SdlWindow> window) {
  final sdlGetDisplayForWindowLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<SdlWindow> window),
      int Function(Pointer<SdlWindow> window)>('SDL_GetDisplayForWindow');
  return sdlGetDisplayForWindowLookupFunction(window);
}

///
/// Get the pixel density of a window.
///
/// This is a ratio of pixel size to window size. For example, if the window is
/// 1920x1080 and it has a high density back buffer of 3840x2160 pixels, it
/// would have a pixel density of 2.0.
///
/// \param window the window to query.
/// \returns the pixel density or 0.0f on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetWindowDisplayScale
///
/// ```c
/// extern SDL_DECLSPEC float SDLCALL SDL_GetWindowPixelDensity(SDL_Window *window)
/// ```
double sdlGetWindowPixelDensity(Pointer<SdlWindow> window) {
  final sdlGetWindowPixelDensityLookupFunction = libSdl3.lookupFunction<
      Float Function(Pointer<SdlWindow> window),
      double Function(Pointer<SdlWindow> window)>('SDL_GetWindowPixelDensity');
  return sdlGetWindowPixelDensityLookupFunction(window);
}

///
/// Get the content display scale relative to a window's pixel size.
///
/// This is a combination of the window pixel density and the display content
/// scale, and is the expected scale for displaying content in this window. For
/// example, if a 3840x2160 window had a display scale of 2.0, the user expects
/// the content to take twice as many pixels and be the same physical size as
/// if it were being displayed in a 1920x1080 window with a display scale of
/// 1.0.
///
/// Conceptually this value corresponds to the scale display setting, and is
/// updated when that setting is changed, or the window moves to a display with
/// a different scale setting.
///
/// \param window the window to query.
/// \returns the display scale, or 0.0f on failure; call SDL_GetError() for
/// more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC float SDLCALL SDL_GetWindowDisplayScale(SDL_Window *window)
/// ```
double sdlGetWindowDisplayScale(Pointer<SdlWindow> window) {
  final sdlGetWindowDisplayScaleLookupFunction = libSdl3.lookupFunction<
      Float Function(Pointer<SdlWindow> window),
      double Function(Pointer<SdlWindow> window)>('SDL_GetWindowDisplayScale');
  return sdlGetWindowDisplayScaleLookupFunction(window);
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
/// SDL_EVENT_WINDOOW_PIXEL_SIZE_CHANGED event will be emitted with the new
/// mode dimensions.
///
/// \param window the window to affect.
/// \param mode a pointer to the display mode to use, which can be NULL for
/// borderless fullscreen desktop mode, or one of the fullscreen
/// modes returned by SDL_GetFullscreenDisplayModes() to set an
/// exclusive fullscreen mode.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetWindowFullscreenMode
/// \sa SDL_SetWindowFullscreen
/// \sa SDL_SyncWindow
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_SetWindowFullscreenMode(SDL_Window *window, const SDL_DisplayMode *mode)
/// ```
int sdlSetWindowFullscreenMode(
    Pointer<SdlWindow> window, Pointer<SdlDisplayMode> mode) {
  final sdlSetWindowFullscreenModeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window, Pointer<SdlDisplayMode> mode),
      int Function(Pointer<SdlWindow> window,
          Pointer<SdlDisplayMode> mode)>('SDL_SetWindowFullscreenMode');
  return sdlSetWindowFullscreenModeLookupFunction(window, mode);
}

///
/// Query the display mode to use when a window is visible at fullscreen.
///
/// \param window the window to query.
/// \returns a pointer to the exclusive fullscreen mode to use or NULL for
/// borderless fullscreen desktop mode.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetWindowFullscreenMode
/// \sa SDL_SetWindowFullscreen
///
/// ```c
/// extern SDL_DECLSPEC const SDL_DisplayMode *SDLCALL SDL_GetWindowFullscreenMode(SDL_Window *window)
/// ```
Pointer<SdlDisplayMode> sdlGetWindowFullscreenMode(Pointer<SdlWindow> window) {
  final sdlGetWindowFullscreenModeLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlDisplayMode> Function(Pointer<SdlWindow> window),
      Pointer<SdlDisplayMode> Function(
          Pointer<SdlWindow> window)>('SDL_GetWindowFullscreenMode');
  return sdlGetWindowFullscreenModeLookupFunction(window);
}

///
/// Get the raw ICC profile data for the screen the window is currently on.
///
/// Data returned should be freed with SDL_free.
///
/// \param window the window to query.
/// \param size the size of the ICC profile.
/// \returns the raw ICC profile data on success or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void *SDLCALL SDL_GetWindowICCProfile(SDL_Window *window, size_t *size)
/// ```
Pointer<NativeType> sdlGetWindowIccProfile(
    Pointer<SdlWindow> window, Pointer<Uint32> size) {
  final sdlGetWindowIccProfileLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(
          Pointer<SdlWindow> window, Pointer<Uint32> size),
      Pointer<NativeType> Function(Pointer<SdlWindow> window,
          Pointer<Uint32> size)>('SDL_GetWindowICCProfile');
  return sdlGetWindowIccProfileLookupFunction(window, size);
}

///
/// Get the pixel format associated with the window.
///
/// \param window the window to query.
/// \returns the pixel format of the window on success or
/// SDL_PIXELFORMAT_UNKNOWN on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC Uint32 SDLCALL SDL_GetWindowPixelFormat(SDL_Window *window)
/// ```
int sdlGetWindowPixelFormat(Pointer<SdlWindow> window) {
  final sdlGetWindowPixelFormatLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<SdlWindow> window),
      int Function(Pointer<SdlWindow> window)>('SDL_GetWindowPixelFormat');
  return sdlGetWindowPixelFormatLookupFunction(window);
}

///
/// Get a list of valid windows.
///
/// \param count a pointer filled in with the number of windows returned, may
/// be NULL.
/// \returns a 0 terminated array of window pointers which should be freed with
/// SDL_free(), or NULL on error; call SDL_GetError() for more
/// details.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_Window **SDLCALL SDL_GetWindows(int *count)
/// ```
Pointer<Pointer<SdlWindow>> sdlGetWindows(Pointer<Int32> count) {
  final sdlGetWindowsLookupFunction = libSdl3.lookupFunction<
      Pointer<Pointer<SdlWindow>> Function(Pointer<Int32> count),
      Pointer<Pointer<SdlWindow>> Function(
          Pointer<Int32> count)>('SDL_GetWindows');
  return sdlGetWindowsLookupFunction(count);
}

///
/// Create a window with the specified dimensions and flags.
///
/// `flags` may be any of the following OR'd together:
///
/// - `SDL_WINDOW_FULLSCREEN`: fullscreen window at desktop resolution
/// - `SDL_WINDOW_OPENGL`: window usable with an OpenGL context
/// - `SDL_WINDOW_VULKAN`: window usable with a Vulkan instance
/// - `SDL_WINDOW_METAL`: window usable with a Metal instance
/// - `SDL_WINDOW_HIDDEN`: window is not visible
/// - `SDL_WINDOW_BORDERLESS`: no window decoration
/// - `SDL_WINDOW_RESIZABLE`: window can be resized
/// - `SDL_WINDOW_MINIMIZED`: window is minimized
/// - `SDL_WINDOW_MAXIMIZED`: window is maximized
/// - `SDL_WINDOW_MOUSE_GRABBED`: window has grabbed mouse focus
///
/// The SDL_Window is implicitly shown if SDL_WINDOW_HIDDEN is not set.
///
/// On Apple's macOS, you **must** set the NSHighResolutionCapable Info.plist
/// property to YES, otherwise you will not receive a High-DPI OpenGL canvas.
///
/// The window pixel size may differ from its window coordinate size if the
/// window is on a high pixel density display. Use SDL_GetWindowSize() to query
/// the client area's size in window coordinates, and
/// SDL_GetWindowSizeInPixels() or SDL_GetRenderOutputSize() to query the
/// drawable size in pixels. Note that the drawable size can vary after the
/// window is created and should be queried again if you get an
/// SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED event.
///
/// If the window is created with any of the SDL_WINDOW_OPENGL or
/// SDL_WINDOW_VULKAN flags, then the corresponding LoadLibrary function
/// (SDL_GL_LoadLibrary or SDL_Vulkan_LoadLibrary) is called and the
/// corresponding UnloadLibrary function is called by SDL_DestroyWindow().
///
/// If SDL_WINDOW_VULKAN is specified and there isn't a working Vulkan driver,
/// SDL_CreateWindow() will fail because SDL_Vulkan_LoadLibrary() will fail.
///
/// If SDL_WINDOW_METAL is specified on an OS that does not support Metal,
/// SDL_CreateWindow() will fail.
///
/// If you intend to use this window with an SDL_Renderer, you should use
/// SDL_CreateWindowAndRenderer() instead of this function, to avoid window
/// flicker.
///
/// On non-Apple devices, SDL requires you to either not link to the Vulkan
/// loader or link to a dynamic library version. This limitation may be removed
/// in a future version of SDL.
///
/// \param title the title of the window, in UTF-8 encoding.
/// \param w the width of the window.
/// \param h the height of the window.
/// \param flags 0, or one or more SDL_WindowFlags OR'd together.
/// \returns the window that was created or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_CreatePopupWindow
/// \sa SDL_CreateWindowWithProperties
/// \sa SDL_DestroyWindow
///
/// ```c
/// extern SDL_DECLSPEC SDL_Window *SDLCALL SDL_CreateWindow(const char *title, int w, int h, SDL_WindowFlags flags)
/// ```
Pointer<SdlWindow> sdlCreateWindow(String? title, int w, int h, int flags) {
  final sdlCreateWindowLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlWindow> Function(
          Pointer<Utf8> title, Int32 w, Int32 h, Uint64 flags),
      Pointer<SdlWindow> Function(
          Pointer<Utf8> title, int w, int h, int flags)>('SDL_CreateWindow');
  final titlePointer = title != null ? title.toNativeUtf8() : nullptr;
  final result = sdlCreateWindowLookupFunction(titlePointer, w, h, flags);
  calloc.free(titlePointer);
  return result;
}

///
/// Create a child popup window of the specified parent window.
///
/// 'flags' **must** contain exactly one of the following: -
/// 'SDL_WINDOW_TOOLTIP': The popup window is a tooltip and will not pass any
/// input events. - 'SDL_WINDOW_POPUP_MENU': The popup window is a popup menu.
/// The topmost popup menu will implicitly gain the keyboard focus.
///
/// The following flags are not relevant to popup window creation and will be
/// ignored:
///
/// - 'SDL_WINDOW_MINIMIZED'
/// - 'SDL_WINDOW_MAXIMIZED'
/// - 'SDL_WINDOW_FULLSCREEN'
/// - 'SDL_WINDOW_BORDERLESS'
///
/// The parent parameter **must** be non-null and a valid window. The parent of
/// a popup window can be either a regular, toplevel window, or another popup
/// window.
///
/// Popup windows cannot be minimized, maximized, made fullscreen, raised,
/// flash, be made a modal window, be the parent of a modal window, or grab the
/// mouse and/or keyboard. Attempts to do so will fail.
///
/// Popup windows implicitly do not have a border/decorations and do not appear
/// on the taskbar/dock or in lists of windows such as alt-tab menus.
///
/// If a parent window is hidden, any child popup windows will be recursively
/// hidden as well. Child popup windows not explicitly hidden will be restored
/// when the parent is shown.
///
/// If the parent window is destroyed, any child popup windows will be
/// recursively destroyed as well.
///
/// \param parent the parent of the window, must not be NULL.
/// \param offset_x the x position of the popup window relative to the origin
/// of the parent.
/// \param offset_y the y position of the popup window relative to the origin
/// of the parent window.
/// \param w the width of the window.
/// \param h the height of the window.
/// \param flags SDL_WINDOW_TOOLTIP or SDL_WINDOW_POPUP_MENU, and zero or more
/// additional SDL_WindowFlags OR'd together.
/// \returns the window that was created or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_CreateWindow
/// \sa SDL_CreateWindowWithProperties
/// \sa SDL_DestroyWindow
/// \sa SDL_GetWindowParent
///
/// ```c
/// extern SDL_DECLSPEC SDL_Window *SDLCALL SDL_CreatePopupWindow(SDL_Window *parent, int offset_x, int offset_y, int w, int h, SDL_WindowFlags flags)
/// ```
Pointer<SdlWindow> sdlCreatePopupWindow(Pointer<SdlWindow> parent, int offsetX,
    int offsetY, int w, int h, int flags) {
  final sdlCreatePopupWindowLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlWindow> Function(Pointer<SdlWindow> parent, Int32 offsetX,
          Int32 offsetY, Int32 w, Int32 h, Uint64 flags),
      Pointer<SdlWindow> Function(Pointer<SdlWindow> parent, int offsetX,
          int offsetY, int w, int h, int flags)>('SDL_CreatePopupWindow');
  return sdlCreatePopupWindowLookupFunction(
      parent, offsetX, offsetY, w, h, flags);
}

///
/// Create a window with the specified properties.
///
/// These are the supported properties:
///
/// - `SDL_PROP_WINDOW_CREATE_ALWAYS_ON_TOP_BOOLEAN`: true if the window should
/// be always on top
/// - `SDL_PROP_WINDOW_CREATE_BORDERLESS_BOOLEAN`: true if the window has no
/// window decoration
/// - `SDL_PROP_WINDOW_CREATE_EXTERNAL_GRAPHICS_CONTEXT_BOOLEAN`: true if the
/// window will be used with an externally managed graphics context.
/// - `SDL_PROP_WINDOW_CREATE_FOCUSABLE_BOOLEAN`: true if the window should
/// accept keyboard input (defaults true)
/// - `SDL_PROP_WINDOW_CREATE_FULLSCREEN_BOOLEAN`: true if the window should
/// start in fullscreen mode at desktop resolution
/// - `SDL_PROP_WINDOW_CREATE_HEIGHT_NUMBER`: the height of the window
/// - `SDL_PROP_WINDOW_CREATE_HIDDEN_BOOLEAN`: true if the window should start
/// hidden
/// - `SDL_PROP_WINDOW_CREATE_HIGH_PIXEL_DENSITY_BOOLEAN`: true if the window
/// uses a high pixel density buffer if possible
/// - `SDL_PROP_WINDOW_CREATE_MAXIMIZED_BOOLEAN`: true if the window should
/// start maximized
/// - `SDL_PROP_WINDOW_CREATE_MENU_BOOLEAN`: true if the window is a popup menu
/// - `SDL_PROP_WINDOW_CREATE_METAL_BOOLEAN`: true if the window will be used
/// with Metal rendering
/// - `SDL_PROP_WINDOW_CREATE_MINIMIZED_BOOLEAN`: true if the window should
/// start minimized
/// - `SDL_PROP_WINDOW_CREATE_MODAL_BOOLEAN`: true if the window is modal to
/// its parent
/// - `SDL_PROP_WINDOW_CREATE_MOUSE_GRABBED_BOOLEAN`: true if the window starts
/// with grabbed mouse focus
/// - `SDL_PROP_WINDOW_CREATE_OPENGL_BOOLEAN`: true if the window will be used
/// with OpenGL rendering
/// - `SDL_PROP_WINDOW_CREATE_PARENT_POINTER`: an SDL_Window that will be the
/// parent of this window, required for windows with the "toolip", "menu",
/// and "modal" properties
/// - `SDL_PROP_WINDOW_CREATE_RESIZABLE_BOOLEAN`: true if the window should be
/// resizable
/// - `SDL_PROP_WINDOW_CREATE_TITLE_STRING`: the title of the window, in UTF-8
/// encoding
/// - `SDL_PROP_WINDOW_CREATE_TRANSPARENT_BOOLEAN`: true if the window show
/// transparent in the areas with alpha of 0
/// - `SDL_PROP_WINDOW_CREATE_TOOLTIP_BOOLEAN`: true if the window is a tooltip
/// - `SDL_PROP_WINDOW_CREATE_UTILITY_BOOLEAN`: true if the window is a utility
/// window, not showing in the task bar and window list
/// - `SDL_PROP_WINDOW_CREATE_VULKAN_BOOLEAN`: true if the window will be used
/// with Vulkan rendering
/// - `SDL_PROP_WINDOW_CREATE_WIDTH_NUMBER`: the width of the window
/// - `SDL_PROP_WINDOW_CREATE_X_NUMBER`: the x position of the window, or
/// `SDL_WINDOWPOS_CENTERED`, defaults to `SDL_WINDOWPOS_UNDEFINED`. This is
/// relative to the parent for windows with the "parent" property set.
/// - `SDL_PROP_WINDOW_CREATE_Y_NUMBER`: the y position of the window, or
/// `SDL_WINDOWPOS_CENTERED`, defaults to `SDL_WINDOWPOS_UNDEFINED`. This is
/// relative to the parent for windows with the "parent" property set.
///
/// These are additional supported properties on macOS:
///
/// - `SDL_PROP_WINDOW_CREATE_COCOA_WINDOW_POINTER`: the
/// `(__unsafe_unretained)` NSWindow associated with the window, if you want
/// to wrap an existing window.
/// - `SDL_PROP_WINDOW_CREATE_COCOA_VIEW_POINTER`: the `(__unsafe_unretained)`
/// NSView associated with the window, defaults to `[window contentView]`
///
/// These are additional supported properties on Wayland:
///
/// - `SDL_PROP_WINDOW_CREATE_WAYLAND_SURFACE_ROLE_CUSTOM_BOOLEAN` - true if
/// the application wants to use the Wayland surface for a custom role and
/// does not want it attached to an XDG toplevel window. See
/// [README/wayland](README/wayland) for more information on using custom
/// surfaces.
/// - `SDL_PROP_WINDOW_CREATE_WAYLAND_CREATE_EGL_WINDOW_BOOLEAN` - true if the
/// application wants an associated `wl_egl_window` object to be created,
/// even if the window does not have the OpenGL property or flag set.
/// - `SDL_PROP_WINDOW_CREATE_WAYLAND_WL_SURFACE_POINTER` - the wl_surface
/// associated with the window, if you want to wrap an existing window. See
/// [README/wayland](README/wayland) for more information.
///
/// These are additional supported properties on Windows:
///
/// - `SDL_PROP_WINDOW_CREATE_WIN32_HWND_POINTER`: the HWND associated with the
/// window, if you want to wrap an existing window.
/// - `SDL_PROP_WINDOW_CREATE_WIN32_PIXEL_FORMAT_HWND_POINTER`: optional,
/// another window to share pixel format with, useful for OpenGL windows
///
/// These are additional supported properties with X11:
///
/// - `SDL_PROP_WINDOW_CREATE_X11_WINDOW_NUMBER`: the X11 Window associated
/// with the window, if you want to wrap an existing window.
///
/// The window is implicitly shown if the "hidden" property is not set.
///
/// Windows with the "tooltip" and "menu" properties are popup windows and have
/// the behaviors and guidelines outlined in SDL_CreatePopupWindow().
///
/// If this window is being created to be used with an SDL_Renderer, you should
/// not add a graphics API specific property
/// (`SDL_PROP_WINDOW_CREATE_OPENGL_BOOLEAN`, etc), as SDL will handle that
/// internally when it chooses a renderer. However, SDL might need to recreate
/// your window at that point, which may cause the window to appear briefly,
/// and then flicker as it is recreated. The correct approach to this is to
/// create the window with the `SDL_PROP_WINDOW_CREATE_HIDDEN_BOOLEAN` property
/// set to true, then create the renderer, then show the window with
/// SDL_ShowWindow().
///
/// \param props the properties to use.
/// \returns the window that was created or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_CreateProperties
/// \sa SDL_CreateWindow
/// \sa SDL_DestroyWindow
///
/// ```c
/// extern SDL_DECLSPEC SDL_Window *SDLCALL SDL_CreateWindowWithProperties(SDL_PropertiesID props)
/// ```
Pointer<SdlWindow> sdlCreateWindowWithProperties(int props) {
  final sdlCreateWindowWithPropertiesLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlWindow> Function(Uint32 props),
      Pointer<SdlWindow> Function(int props)>('SDL_CreateWindowWithProperties');
  return sdlCreateWindowWithPropertiesLookupFunction(props);
}

///
/// Get the numeric ID of a window.
///
/// The numeric ID is what SDL_WindowEvent references, and is necessary to map
/// these events to specific SDL_Window objects.
///
/// \param window the window to query.
/// \returns the ID of the window on success or 0 on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetWindowFromID
///
/// ```c
/// extern SDL_DECLSPEC SDL_WindowID SDLCALL SDL_GetWindowID(SDL_Window *window)
/// ```
int sdlGetWindowId(Pointer<SdlWindow> window) {
  final sdlGetWindowIdLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<SdlWindow> window),
      int Function(Pointer<SdlWindow> window)>('SDL_GetWindowID');
  return sdlGetWindowIdLookupFunction(window);
}

///
/// Get a window from a stored ID.
///
/// The numeric ID is what SDL_WindowEvent references, and is necessary to map
/// these events to specific SDL_Window objects.
///
/// \param id the ID of the window.
/// \returns the window associated with `id` or NULL if it doesn't exist; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetWindowID
///
/// ```c
/// extern SDL_DECLSPEC SDL_Window *SDLCALL SDL_GetWindowFromID(SDL_WindowID id)
/// ```
Pointer<SdlWindow> sdlGetWindowFromId(int id) {
  final sdlGetWindowFromIdLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlWindow> Function(Uint32 id),
      Pointer<SdlWindow> Function(int id)>('SDL_GetWindowFromID');
  return sdlGetWindowFromIdLookupFunction(id);
}

///
/// Get parent of a window.
///
/// \param window the window to query.
/// \returns the parent of the window on success or NULL if the window has no
/// parent.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_CreatePopupWindow
///
/// ```c
/// extern SDL_DECLSPEC SDL_Window *SDLCALL SDL_GetWindowParent(SDL_Window *window)
/// ```
Pointer<SdlWindow> sdlGetWindowParent(Pointer<SdlWindow> window) {
  final sdlGetWindowParentLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlWindow> Function(Pointer<SdlWindow> window),
      Pointer<SdlWindow> Function(
          Pointer<SdlWindow> window)>('SDL_GetWindowParent');
  return sdlGetWindowParentLookupFunction(window);
}

///
/// Get the properties associated with a window.
///
/// The following read-only properties are provided by SDL:
///
/// - `SDL_PROP_WINDOW_SHAPE_POINTER`: the surface associated with a shaped
/// window
/// - `SDL_PROP_WINDOW_HDR_ENABLED_BOOLEAN`: true if the window has HDR
/// headroom above the SDR white point. This property can change dynamically
/// when SDL_EVENT_WINDOW_HDR_STATE_CHANGED is sent.
/// - `SDL_PROP_WINDOW_SDR_WHITE_LEVEL_FLOAT`: the value of SDR white in the
/// SDL_COLORSPACE_SRGB_LINEAR colorspace. On Windows this corresponds to the
/// SDR white level in scRGB colorspace, and on Apple platforms this is
/// always 1.0 for EDR content. This property can change dynamically when
/// SDL_EVENT_WINDOW_HDR_STATE_CHANGED is sent.
/// - `SDL_PROP_WINDOW_HDR_HEADROOM_FLOAT`: the additional high dynamic range
/// that can be displayed, in terms of the SDR white point. When HDR is not
/// enabled, this will be 1.0. This property can change dynamically when
/// SDL_EVENT_WINDOW_HDR_STATE_CHANGED is sent.
///
/// On Android:
///
/// - `SDL_PROP_WINDOW_ANDROID_WINDOW_POINTER`: the ANativeWindow associated
/// with the window
/// - `SDL_PROP_WINDOW_ANDROID_SURFACE_POINTER`: the EGLSurface associated with
/// the window
///
/// On iOS:
///
/// - `SDL_PROP_WINDOW_UIKIT_WINDOW_POINTER`: the `(__unsafe_unretained)`
/// UIWindow associated with the window
/// - `SDL_PROP_WINDOW_UIKIT_METAL_VIEW_TAG_NUMBER`: the NSInteger tag
/// assocated with metal views on the window
/// - `SDL_PROP_WINDOW_UIKIT_OPENGL_FRAMEBUFFER_NUMBER`: the OpenGL view's
/// framebuffer object. It must be bound when rendering to the screen using
/// OpenGL.
/// - `SDL_PROP_WINDOW_UIKIT_OPENGL_RENDERBUFFER_NUMBER`: the OpenGL view's
/// renderbuffer object. It must be bound when SDL_GL_SwapWindow is called.
/// - `SDL_PROP_WINDOW_UIKIT_OPENGL_RESOLVE_FRAMEBUFFER_NUMBER`: the OpenGL
/// view's resolve framebuffer, when MSAA is used.
///
/// On KMS/DRM:
///
/// - `SDL_PROP_WINDOW_KMSDRM_DEVICE_INDEX_NUMBER`: the device index associated
/// with the window (e.g. the X in /dev/dri/cardX)
/// - `SDL_PROP_WINDOW_KMSDRM_DRM_FD_NUMBER`: the DRM FD associated with the
/// window
/// - `SDL_PROP_WINDOW_KMSDRM_GBM_DEVICE_POINTER`: the GBM device associated
/// with the window
///
/// On macOS:
///
/// - `SDL_PROP_WINDOW_COCOA_WINDOW_POINTER`: the `(__unsafe_unretained)`
/// NSWindow associated with the window
/// - `SDL_PROP_WINDOW_COCOA_METAL_VIEW_TAG_NUMBER`: the NSInteger tag
/// assocated with metal views on the window
///
/// On Vivante:
///
/// - `SDL_PROP_WINDOW_VIVANTE_DISPLAY_POINTER`: the EGLNativeDisplayType
/// associated with the window
/// - `SDL_PROP_WINDOW_VIVANTE_WINDOW_POINTER`: the EGLNativeWindowType
/// associated with the window
/// - `SDL_PROP_WINDOW_VIVANTE_SURFACE_POINTER`: the EGLSurface associated with
/// the window
///
/// On UWP:
///
/// - `SDL_PROP_WINDOW_WINRT_WINDOW_POINTER`: the IInspectable CoreWindow
/// associated with the window
///
/// On Windows:
///
/// - `SDL_PROP_WINDOW_WIN32_HWND_POINTER`: the HWND associated with the window
/// - `SDL_PROP_WINDOW_WIN32_HDC_POINTER`: the HDC associated with the window
/// - `SDL_PROP_WINDOW_WIN32_INSTANCE_POINTER`: the HINSTANCE associated with
/// the window
///
/// On Wayland:
///
/// Note: The `xdg_*` window objects do not internally persist across window
/// show/hide calls. They will be null if the window is hidden and must be
/// queried each time it is shown.
///
/// - `SDL_PROP_WINDOW_WAYLAND_DISPLAY_POINTER`: the wl_display associated with
/// the window
/// - `SDL_PROP_WINDOW_WAYLAND_SURFACE_POINTER`: the wl_surface associated with
/// the window
/// - `SDL_PROP_WINDOW_WAYLAND_EGL_WINDOW_POINTER`: the wl_egl_window
/// associated with the window
/// - `SDL_PROP_WINDOW_WAYLAND_XDG_SURFACE_POINTER`: the xdg_surface associated
/// with the window
/// - `SDL_PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_POINTER`: the xdg_toplevel role
/// associated with the window
/// - 'SDL_PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_EXPORT_HANDLE_STRING': the export
/// handle associated with the window
/// - `SDL_PROP_WINDOW_WAYLAND_XDG_POPUP_POINTER`: the xdg_popup role
/// associated with the window
/// - `SDL_PROP_WINDOW_WAYLAND_XDG_POSITIONER_POINTER`: the xdg_positioner
/// associated with the window, in popup mode
///
/// On X11:
///
/// - `SDL_PROP_WINDOW_X11_DISPLAY_POINTER`: the X11 Display associated with
/// the window
/// - `SDL_PROP_WINDOW_X11_SCREEN_NUMBER`: the screen number associated with
/// the window
/// - `SDL_PROP_WINDOW_X11_WINDOW_NUMBER`: the X11 Window associated with the
/// window
///
/// \param window the window to query.
/// \returns a valid property ID on success or 0 on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetProperty
/// \sa SDL_GetNumberProperty
///
/// ```c
/// extern SDL_DECLSPEC SDL_PropertiesID SDLCALL SDL_GetWindowProperties(SDL_Window *window)
/// ```
int sdlGetWindowProperties(Pointer<SdlWindow> window) {
  final sdlGetWindowPropertiesLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<SdlWindow> window),
      int Function(Pointer<SdlWindow> window)>('SDL_GetWindowProperties');
  return sdlGetWindowPropertiesLookupFunction(window);
}

///
/// Get the window flags.
///
/// \param window the window to query.
/// \returns a mask of the SDL_WindowFlags associated with `window`.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_CreateWindow
/// \sa SDL_HideWindow
/// \sa SDL_MaximizeWindow
/// \sa SDL_MinimizeWindow
/// \sa SDL_SetWindowFullscreen
/// \sa SDL_SetWindowMouseGrab
/// \sa SDL_ShowWindow
///
/// ```c
/// extern SDL_DECLSPEC SDL_WindowFlags SDLCALL SDL_GetWindowFlags(SDL_Window *window)
/// ```
int sdlGetWindowFlags(Pointer<SdlWindow> window) {
  final sdlGetWindowFlagsLookupFunction = libSdl3.lookupFunction<
      Uint64 Function(Pointer<SdlWindow> window),
      int Function(Pointer<SdlWindow> window)>('SDL_GetWindowFlags');
  return sdlGetWindowFlagsLookupFunction(window);
}

///
/// Set the title of a window.
///
/// This string is expected to be in UTF-8 encoding.
///
/// \param window the window to change.
/// \param title the desired window title in UTF-8 format.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetWindowTitle
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_SetWindowTitle(SDL_Window *window, const char *title)
/// ```
int sdlSetWindowTitle(Pointer<SdlWindow> window, String? title) {
  final sdlSetWindowTitleLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window, Pointer<Utf8> title),
      int Function(Pointer<SdlWindow> window,
          Pointer<Utf8> title)>('SDL_SetWindowTitle');
  final titlePointer = title != null ? title.toNativeUtf8() : nullptr;
  final result = sdlSetWindowTitleLookupFunction(window, titlePointer);
  calloc.free(titlePointer);
  return result;
}

///
/// Get the title of a window.
///
/// The returned string follows the SDL_GetStringRule.
///
/// \param window the window to query.
/// \returns the title of the window in UTF-8 format or "" if there is no
/// title.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetWindowTitle
///
/// ```c
/// extern SDL_DECLSPEC const char *SDLCALL SDL_GetWindowTitle(SDL_Window *window)
/// ```
String? sdlGetWindowTitle(Pointer<SdlWindow> window) {
  final sdlGetWindowTitleLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Pointer<SdlWindow> window),
      Pointer<Utf8> Function(Pointer<SdlWindow> window)>('SDL_GetWindowTitle');
  final result = sdlGetWindowTitleLookupFunction(window);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Set the icon for a window.
///
/// \param window the window to change.
/// \param icon an SDL_Surface structure containing the icon for the window.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_SetWindowIcon(SDL_Window *window, SDL_Surface *icon)
/// ```
int sdlSetWindowIcon(Pointer<SdlWindow> window, Pointer<SdlSurface> icon) {
  final sdlSetWindowIconLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window, Pointer<SdlSurface> icon),
      int Function(Pointer<SdlWindow> window,
          Pointer<SdlSurface> icon)>('SDL_SetWindowIcon');
  return sdlSetWindowIconLookupFunction(window, icon);
}

///
/// Request that the window's position be set.
///
/// If, at the time of this request, the window is in a fixed-size state such
/// as maximized, this request may be deferred until the window returns to a
/// resizable state.
///
/// This can be used to reposition fullscreen-desktop windows onto a different
/// display, however, exclusive fullscreen windows are locked to a specific
/// display and can only be repositioned programmatically via
/// SDL_SetWindowFullscreenMode().
///
/// On some windowing systems this request is asynchronous and the new
/// coordinates may not have have been applied immediately upon the return of
/// this function. If an immediate change is required, call SDL_SyncWindow() to
/// block until the changes have taken effect.
///
/// When the window position changes, an SDL_EVENT_WINDOW_MOVED event will be
/// emitted with the window's new coordinates. Note that the new coordinates
/// may not match the exact coordinates requested, as some windowing systems
/// can restrict the position of the window in certain scenarios (e.g.
/// constraining the position so the window is always within desktop bounds).
/// Additionally, as this is just a request, it can be denied by the windowing
/// system.
///
/// \param window the window to reposition.
/// \param x the x coordinate of the window, or `SDL_WINDOWPOS_CENTERED` or
/// `SDL_WINDOWPOS_UNDEFINED`.
/// \param y the y coordinate of the window, or `SDL_WINDOWPOS_CENTERED` or
/// `SDL_WINDOWPOS_UNDEFINED`.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetWindowPosition
/// \sa SDL_SyncWindow
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_SetWindowPosition(SDL_Window *window, int x, int y)
/// ```
int sdlSetWindowPosition(Pointer<SdlWindow> window, int x, int y) {
  final sdlSetWindowPositionLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window, Int32 x, Int32 y),
      int Function(
          Pointer<SdlWindow> window, int x, int y)>('SDL_SetWindowPosition');
  return sdlSetWindowPositionLookupFunction(window, x, y);
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
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetWindowPosition
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetWindowPosition(SDL_Window *window, int *x, int *y)
/// ```
int sdlGetWindowPosition(
    Pointer<SdlWindow> window, Pointer<Int32> x, Pointer<Int32> y) {
  final sdlGetWindowPositionLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<SdlWindow> window, Pointer<Int32> x, Pointer<Int32> y),
      int Function(Pointer<SdlWindow> window, Pointer<Int32> x,
          Pointer<Int32> y)>('SDL_GetWindowPosition');
  return sdlGetWindowPositionLookupFunction(window, x, y);
}

///
/// Request that the size of a window's client area be set.
///
/// If, at the time of this request, the window in a fixed-size state, such as
/// maximized or fullscreen, the request will be deferred until the window
/// exits this state and becomes resizable again.
///
/// To change the fullscreen mode of a window, use
/// SDL_SetWindowFullscreenMode()
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
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetWindowSize
/// \sa SDL_SetWindowFullscreenMode
/// \sa SDL_SyncWindow
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_SetWindowSize(SDL_Window *window, int w, int h)
/// ```
int sdlSetWindowSize(Pointer<SdlWindow> window, int w, int h) {
  final sdlSetWindowSizeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window, Int32 w, Int32 h),
      int Function(
          Pointer<SdlWindow> window, int w, int h)>('SDL_SetWindowSize');
  return sdlSetWindowSizeLookupFunction(window, w, h);
}

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
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetRenderOutputSize
/// \sa SDL_GetWindowSizeInPixels
/// \sa SDL_SetWindowSize
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetWindowSize(SDL_Window *window, int *w, int *h)
/// ```
int sdlGetWindowSize(
    Pointer<SdlWindow> window, Pointer<Int32> w, Pointer<Int32> h) {
  final sdlGetWindowSizeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<SdlWindow> window, Pointer<Int32> w, Pointer<Int32> h),
      int Function(Pointer<SdlWindow> window, Pointer<Int32> w,
          Pointer<Int32> h)>('SDL_GetWindowSize');
  return sdlGetWindowSizeLookupFunction(window, w, h);
}

///
/// Request that the aspect ratio of a window's client area be set.
///
/// The aspect ratio is the ratio of width divided by height, e.g. 2560x1600
/// would be 1.6. Larger aspect ratios are wider and smaller aspect ratios are
/// narrower.
///
/// If, at the time of this request, the window in a fixed-size state, such as
/// maximized or fullscreen, the request will be deferred until the window
/// exits this state and becomes resizable again.
///
/// On some windowing systems, this request is asynchronous and the new window
/// aspect ratio may not have have been applied immediately upon the return of
/// this function. If an immediate change is required, call SDL_SyncWindow() to
/// block until the changes have taken effect.
///
/// When the window size changes, an SDL_EVENT_WINDOW_RESIZED event will be
/// emitted with the new window dimensions. Note that the new dimensions may
/// not match the exact aspect ratio requested, as some windowing systems can
/// restrict the window size in certain scenarios (e.g. constraining the size
/// of the content area to remain within the usable desktop bounds).
/// Additionally, as this is just a request, it can be denied by the windowing
/// system.
///
/// \param window the window to change.
/// \param min_aspect the minimum aspect ratio of the window, or 0.0f for no
/// limit.
/// \param max_aspect the maximum aspect ratio of the window, or 0.0f for no
/// limit.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetWindowAspectRatio
/// \sa SDL_SyncWindow
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_SetWindowAspectRatio(SDL_Window *window, float min_aspect, float max_aspect)
/// ```
int sdlSetWindowAspectRatio(
    Pointer<SdlWindow> window, double minAspect, double maxAspect) {
  final sdlSetWindowAspectRatioLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<SdlWindow> window, Float minAspect, Float maxAspect),
      int Function(Pointer<SdlWindow> window, double minAspect,
          double maxAspect)>('SDL_SetWindowAspectRatio');
  return sdlSetWindowAspectRatioLookupFunction(window, minAspect, maxAspect);
}

///
/// Get the size of a window's client area.
///
/// \param window the window to query the width and height from.
/// \param min_aspect a pointer filled in with the minimum aspect ratio of the
/// window, may be NULL.
/// \param max_aspect a pointer filled in with the maximum aspect ratio of the
/// window, may be NULL.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetWindowAspectRatio
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetWindowAspectRatio(SDL_Window *window, float *min_aspect, float *max_aspect)
/// ```
int sdlGetWindowAspectRatio(Pointer<SdlWindow> window, Pointer<Float> minAspect,
    Pointer<Float> maxAspect) {
  final sdlGetWindowAspectRatioLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window, Pointer<Float> minAspect,
          Pointer<Float> maxAspect),
      int Function(Pointer<SdlWindow> window, Pointer<Float> minAspect,
          Pointer<Float> maxAspect)>('SDL_GetWindowAspectRatio');
  return sdlGetWindowAspectRatioLookupFunction(window, minAspect, maxAspect);
}

///
/// Get the size of a window's borders (decorations) around the client area.
///
/// Note: If this function fails (returns -1), the size values will be
/// initialized to 0, 0, 0, 0 (if a non-NULL pointer is provided), as if the
/// window in question was borderless.
///
/// Note: This function may fail on systems where the window has not yet been
/// decorated by the display server (for example, immediately after calling
/// SDL_CreateWindow). It is recommended that you wait at least until the
/// window has been presented and composited, so that the window system has a
/// chance to decorate the window and provide the border dimensions to SDL.
///
/// This function also returns -1 if getting the information is not supported.
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
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetWindowSize
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetWindowBordersSize(SDL_Window *window, int *top, int *left, int *bottom, int *right)
/// ```
int sdlGetWindowBordersSize(Pointer<SdlWindow> window, Pointer<Int32> top,
    Pointer<Int32> left, Pointer<Int32> bottom, Pointer<Int32> right) {
  final sdlGetWindowBordersSizeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window, Pointer<Int32> top,
          Pointer<Int32> left, Pointer<Int32> bottom, Pointer<Int32> right),
      int Function(
          Pointer<SdlWindow> window,
          Pointer<Int32> top,
          Pointer<Int32> left,
          Pointer<Int32> bottom,
          Pointer<Int32> right)>('SDL_GetWindowBordersSize');
  return sdlGetWindowBordersSizeLookupFunction(
      window, top, left, bottom, right);
}

///
/// Get the size of a window's client area, in pixels.
///
/// \param window the window from which the drawable size should be queried.
/// \param w a pointer to variable for storing the width in pixels, may be
/// NULL.
/// \param h a pointer to variable for storing the height in pixels, may be
/// NULL.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_CreateWindow
/// \sa SDL_GetWindowSize
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetWindowSizeInPixels(SDL_Window *window, int *w, int *h)
/// ```
int sdlGetWindowSizeInPixels(
    Pointer<SdlWindow> window, Pointer<Int32> w, Pointer<Int32> h) {
  final sdlGetWindowSizeInPixelsLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<SdlWindow> window, Pointer<Int32> w, Pointer<Int32> h),
      int Function(Pointer<SdlWindow> window, Pointer<Int32> w,
          Pointer<Int32> h)>('SDL_GetWindowSizeInPixels');
  return sdlGetWindowSizeInPixelsLookupFunction(window, w, h);
}

///
/// Set the minimum size of a window's client area.
///
/// \param window the window to change.
/// \param min_w the minimum width of the window, or 0 for no limit.
/// \param min_h the minimum height of the window, or 0 for no limit.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetWindowMinimumSize
/// \sa SDL_SetWindowMaximumSize
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_SetWindowMinimumSize(SDL_Window *window, int min_w, int min_h)
/// ```
int sdlSetWindowMinimumSize(Pointer<SdlWindow> window, int minW, int minH) {
  final sdlSetWindowMinimumSizeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window, Int32 minW, Int32 minH),
      int Function(Pointer<SdlWindow> window, int minW,
          int minH)>('SDL_SetWindowMinimumSize');
  return sdlSetWindowMinimumSizeLookupFunction(window, minW, minH);
}

///
/// Get the minimum size of a window's client area.
///
/// \param window the window to query.
/// \param w a pointer filled in with the minimum width of the window, may be
/// NULL.
/// \param h a pointer filled in with the minimum height of the window, may be
/// NULL.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetWindowMaximumSize
/// \sa SDL_SetWindowMinimumSize
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetWindowMinimumSize(SDL_Window *window, int *w, int *h)
/// ```
int sdlGetWindowMinimumSize(
    Pointer<SdlWindow> window, Pointer<Int32> w, Pointer<Int32> h) {
  final sdlGetWindowMinimumSizeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<SdlWindow> window, Pointer<Int32> w, Pointer<Int32> h),
      int Function(Pointer<SdlWindow> window, Pointer<Int32> w,
          Pointer<Int32> h)>('SDL_GetWindowMinimumSize');
  return sdlGetWindowMinimumSizeLookupFunction(window, w, h);
}

///
/// Set the maximum size of a window's client area.
///
/// \param window the window to change.
/// \param max_w the maximum width of the window, or 0 for no limit.
/// \param max_h the maximum height of the window, or 0 for no limit.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetWindowMaximumSize
/// \sa SDL_SetWindowMinimumSize
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_SetWindowMaximumSize(SDL_Window *window, int max_w, int max_h)
/// ```
int sdlSetWindowMaximumSize(Pointer<SdlWindow> window, int maxW, int maxH) {
  final sdlSetWindowMaximumSizeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window, Int32 maxW, Int32 maxH),
      int Function(Pointer<SdlWindow> window, int maxW,
          int maxH)>('SDL_SetWindowMaximumSize');
  return sdlSetWindowMaximumSizeLookupFunction(window, maxW, maxH);
}

///
/// Get the maximum size of a window's client area.
///
/// \param window the window to query.
/// \param w a pointer filled in with the maximum width of the window, may be
/// NULL.
/// \param h a pointer filled in with the maximum height of the window, may be
/// NULL.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetWindowMinimumSize
/// \sa SDL_SetWindowMaximumSize
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetWindowMaximumSize(SDL_Window *window, int *w, int *h)
/// ```
int sdlGetWindowMaximumSize(
    Pointer<SdlWindow> window, Pointer<Int32> w, Pointer<Int32> h) {
  final sdlGetWindowMaximumSizeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<SdlWindow> window, Pointer<Int32> w, Pointer<Int32> h),
      int Function(Pointer<SdlWindow> window, Pointer<Int32> w,
          Pointer<Int32> h)>('SDL_GetWindowMaximumSize');
  return sdlGetWindowMaximumSizeLookupFunction(window, w, h);
}

///
/// Set the border state of a window.
///
/// This will add or remove the window's `SDL_WINDOW_BORDERLESS` flag and add
/// or remove the border from the actual window. This is a no-op if the
/// window's border already matches the requested state.
///
/// You can't change the border state of a fullscreen window.
///
/// \param window the window of which to change the border state.
/// \param bordered SDL_FALSE to remove border, SDL_TRUE to add border.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetWindowFlags
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_SetWindowBordered(SDL_Window *window, SDL_bool bordered)
/// ```
int sdlSetWindowBordered(Pointer<SdlWindow> window, bool bordered) {
  final sdlSetWindowBorderedLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window, Int32 bordered),
      int Function(
          Pointer<SdlWindow> window, int bordered)>('SDL_SetWindowBordered');
  return sdlSetWindowBorderedLookupFunction(window, bordered ? 1 : 0);
}

///
/// Set the user-resizable state of a window.
///
/// This will add or remove the window's `SDL_WINDOW_RESIZABLE` flag and
/// allow/disallow user resizing of the window. This is a no-op if the window's
/// resizable state already matches the requested state.
///
/// You can't change the resizable state of a fullscreen window.
///
/// \param window the window of which to change the resizable state.
/// \param resizable SDL_TRUE to allow resizing, SDL_FALSE to disallow.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetWindowFlags
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_SetWindowResizable(SDL_Window *window, SDL_bool resizable)
/// ```
int sdlSetWindowResizable(Pointer<SdlWindow> window, bool resizable) {
  final sdlSetWindowResizableLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window, Int32 resizable),
      int Function(
          Pointer<SdlWindow> window, int resizable)>('SDL_SetWindowResizable');
  return sdlSetWindowResizableLookupFunction(window, resizable ? 1 : 0);
}

///
/// Set the window to always be above the others.
///
/// This will add or remove the window's `SDL_WINDOW_ALWAYS_ON_TOP` flag. This
/// will bring the window to the front and keep the window above the rest.
///
/// \param window the window of which to change the always on top state.
/// \param on_top SDL_TRUE to set the window always on top, SDL_FALSE to
/// disable.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetWindowFlags
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_SetWindowAlwaysOnTop(SDL_Window *window, SDL_bool on_top)
/// ```
int sdlSetWindowAlwaysOnTop(Pointer<SdlWindow> window, bool onTop) {
  final sdlSetWindowAlwaysOnTopLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window, Int32 onTop),
      int Function(
          Pointer<SdlWindow> window, int onTop)>('SDL_SetWindowAlwaysOnTop');
  return sdlSetWindowAlwaysOnTopLookupFunction(window, onTop ? 1 : 0);
}

///
/// Show a window.
///
/// \param window the window to show.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_HideWindow
/// \sa SDL_RaiseWindow
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_ShowWindow(SDL_Window *window)
/// ```
int sdlShowWindow(Pointer<SdlWindow> window) {
  final sdlShowWindowLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window),
      int Function(Pointer<SdlWindow> window)>('SDL_ShowWindow');
  return sdlShowWindowLookupFunction(window);
}

///
/// Hide a window.
///
/// \param window the window to hide.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_ShowWindow
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_HideWindow(SDL_Window *window)
/// ```
int sdlHideWindow(Pointer<SdlWindow> window) {
  final sdlHideWindowLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window),
      int Function(Pointer<SdlWindow> window)>('SDL_HideWindow');
  return sdlHideWindowLookupFunction(window);
}

///
/// Request that a window be raised above other windows and gain the input
/// focus.
///
/// The result of this request is subject to desktop window manager policy,
/// particularly if raising the requested window would result in stealing focus
/// from another application. If the window is successfully raised and gains
/// input focus, an SDL_EVENT_WINDOW_FOCUS_GAINED event will be emitted, and
/// the window will have the SDL_WINDOW_INPUT_FOCUS flag set.
///
/// \param window the window to raise.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_RaiseWindow(SDL_Window *window)
/// ```
int sdlRaiseWindow(Pointer<SdlWindow> window) {
  final sdlRaiseWindowLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window),
      int Function(Pointer<SdlWindow> window)>('SDL_RaiseWindow');
  return sdlRaiseWindowLookupFunction(window);
}

///
/// Request that the window be made as large as possible.
///
/// Non-resizable windows can't be maximized. The window must have the
/// SDL_WINDOW_RESIZABLE flag set, or this will have no effect.
///
/// On some windowing systems this request is asynchronous and the new window
/// state may not have have been applied immediately upon the return of this
/// function. If an immediate change is required, call SDL_SyncWindow() to
/// block until the changes have taken effect.
///
/// When the window state changes, an SDL_EVENT_WINDOW_MAXIMIZED event will be
/// emitted. Note that, as this is just a request, the windowing system can
/// deny the state change.
///
/// When maximizing a window, whether the constraints set via
/// SDL_SetWindowMaximumSize() are honored depends on the policy of the window
/// manager. Win32 and macOS enforce the constraints when maximizing, while X11
/// and Wayland window managers may vary.
///
/// \param window the window to maximize.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_MinimizeWindow
/// \sa SDL_RestoreWindow
/// \sa SDL_SyncWindow
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_MaximizeWindow(SDL_Window *window)
/// ```
int sdlMaximizeWindow(Pointer<SdlWindow> window) {
  final sdlMaximizeWindowLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window),
      int Function(Pointer<SdlWindow> window)>('SDL_MaximizeWindow');
  return sdlMaximizeWindowLookupFunction(window);
}

///
/// Request that the window be minimized to an iconic representation.
///
/// On some windowing systems this request is asynchronous and the new window
/// state may not have have been applied immediately upon the return of this
/// function. If an immediate change is required, call SDL_SyncWindow() to
/// block until the changes have taken effect.
///
/// When the window state changes, an SDL_EVENT_WINDOW_MINIMIZED event will be
/// emitted. Note that, as this is just a request, the windowing system can
/// deny the state change.
///
/// \param window the window to minimize.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_MaximizeWindow
/// \sa SDL_RestoreWindow
/// \sa SDL_SyncWindow
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_MinimizeWindow(SDL_Window *window)
/// ```
int sdlMinimizeWindow(Pointer<SdlWindow> window) {
  final sdlMinimizeWindowLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window),
      int Function(Pointer<SdlWindow> window)>('SDL_MinimizeWindow');
  return sdlMinimizeWindowLookupFunction(window);
}

///
/// Request that the size and position of a minimized or maximized window be
/// restored.
///
/// On some windowing systems this request is asynchronous and the new window
/// state may not have have been applied immediately upon the return of this
/// function. If an immediate change is required, call SDL_SyncWindow() to
/// block until the changes have taken effect.
///
/// When the window state changes, an SDL_EVENT_WINDOW_RESTORED event will be
/// emitted. Note that, as this is just a request, the windowing system can
/// deny the state change.
///
/// \param window the window to restore.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_MaximizeWindow
/// \sa SDL_MinimizeWindow
/// \sa SDL_SyncWindow
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_RestoreWindow(SDL_Window *window)
/// ```
int sdlRestoreWindow(Pointer<SdlWindow> window) {
  final sdlRestoreWindowLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window),
      int Function(Pointer<SdlWindow> window)>('SDL_RestoreWindow');
  return sdlRestoreWindowLookupFunction(window);
}

///
/// Request that the window's fullscreen state be changed.
///
/// By default a window in fullscreen state uses borderless fullscreen desktop
/// mode, but a specific exclusive display mode can be set using
/// SDL_SetWindowFullscreenMode().
///
/// On some windowing systems this request is asynchronous and the new
/// fullscreen state may not have have been applied immediately upon the return
/// of this function. If an immediate change is required, call SDL_SyncWindow()
/// to block until the changes have taken effect.
///
/// When the window state changes, an SDL_EVENT_WINDOW_ENTER_FULLSCREEN or
/// SDL_EVENT_WINDOW_LEAVE_FULLSCREEN event will be emitted. Note that, as this
/// is just a request, it can be denied by the windowing system.
///
/// \param window the window to change.
/// \param fullscreen SDL_TRUE for fullscreen mode, SDL_FALSE for windowed
/// mode.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetWindowFullscreenMode
/// \sa SDL_SetWindowFullscreenMode
/// \sa SDL_SyncWindow
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_SetWindowFullscreen(SDL_Window *window, SDL_bool fullscreen)
/// ```
int sdlSetWindowFullscreen(Pointer<SdlWindow> window, bool fullscreen) {
  final sdlSetWindowFullscreenLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window, Int32 fullscreen),
      int Function(Pointer<SdlWindow> window,
          int fullscreen)>('SDL_SetWindowFullscreen');
  return sdlSetWindowFullscreenLookupFunction(window, fullscreen ? 1 : 0);
}

///
/// Block until any pending window state is finalized.
///
/// On asynchronous windowing systems, this acts as a synchronization barrier
/// for pending window state. It will attempt to wait until any pending window
/// state has been applied and is guaranteed to return within finite time. Note
/// that for how long it can potentially block depends on the underlying window
/// system, as window state changes may involve somewhat lengthy animations
/// that must complete before the window is in its final requested state.
///
/// On windowing systems where changes are immediate, this does nothing.
///
/// \param window the window for which to wait for the pending state to be
/// applied.
/// \returns 0 on success, a positive value if the operation timed out before
/// the window was in the requested state, or a negative error code on
/// failure; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetWindowSize
/// \sa SDL_SetWindowPosition
/// \sa SDL_SetWindowFullscreen
/// \sa SDL_MinimizeWindow
/// \sa SDL_MaximizeWindow
/// \sa SDL_RestoreWindow
/// \sa SDL_HINT_VIDEO_SYNC_WINDOW_OPERATIONS
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_SyncWindow(SDL_Window *window)
/// ```
int sdlSyncWindow(Pointer<SdlWindow> window) {
  final sdlSyncWindowLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window),
      int Function(Pointer<SdlWindow> window)>('SDL_SyncWindow');
  return sdlSyncWindowLookupFunction(window);
}

///
/// Return whether the window has a surface associated with it.
///
/// \param window the window to query.
/// \returns SDL_TRUE if there is a surface associated with the window, or
/// SDL_FALSE otherwise.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetWindowSurface
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_WindowHasSurface(SDL_Window *window)
/// ```
bool sdlWindowHasSurface(Pointer<SdlWindow> window) {
  final sdlWindowHasSurfaceLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window),
      int Function(Pointer<SdlWindow> window)>('SDL_WindowHasSurface');
  return sdlWindowHasSurfaceLookupFunction(window) == 1;
}

///
/// Get the SDL surface associated with the window.
///
/// A new surface will be created with the optimal format for the window, if
/// necessary. This surface will be freed when the window is destroyed. Do not
/// free this surface.
///
/// This surface will be invalidated if the window is resized. After resizing a
/// window this function must be called again to return a valid surface.
///
/// You may not combine this with 3D or the rendering API on this window.
///
/// This function is affected by `SDL_HINT_FRAMEBUFFER_ACCELERATION`.
///
/// \param window the window to query.
/// \returns the surface associated with the window, or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_DestroyWindowSurface
/// \sa SDL_WindowHasSurface
/// \sa SDL_UpdateWindowSurface
/// \sa SDL_UpdateWindowSurfaceRects
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface *SDLCALL SDL_GetWindowSurface(SDL_Window *window)
/// ```
Pointer<SdlSurface> sdlGetWindowSurface(Pointer<SdlWindow> window) {
  final sdlGetWindowSurfaceLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlSurface> Function(Pointer<SdlWindow> window),
      Pointer<SdlSurface> Function(
          Pointer<SdlWindow> window)>('SDL_GetWindowSurface');
  return sdlGetWindowSurfaceLookupFunction(window);
}

///
/// Toggle VSync for the window surface.
///
/// When a window surface is created, vsync defaults to
/// SDL_WINDOW_SURFACE_VSYNC_DISABLED.
///
/// The `vsync` parameter can be 1 to synchronize present with every vertical
/// refresh, 2 to synchronize present with every second vertical refresh, etc.,
/// SDL_WINDOW_SURFACE_VSYNC_ADAPTIVE for late swap tearing (adaptive vsync),
/// or SDL_WINDOW_SURFACE_VSYNC_DISABLED to disable. Not every value is
/// supported by every driver, so you should check the return value to see
/// whether the requested setting is supported.
///
/// \param window the window.
/// \param vsync the vertical refresh sync interval.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetWindowSurfaceVSync
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_SetWindowSurfaceVSync(SDL_Window *window, int vsync)
/// ```
int sdlSetWindowSurfaceVSync(Pointer<SdlWindow> window, int vsync) {
  final sdlSetWindowSurfaceVSyncLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window, Int32 vsync),
      int Function(
          Pointer<SdlWindow> window, int vsync)>('SDL_SetWindowSurfaceVSync');
  return sdlSetWindowSurfaceVSyncLookupFunction(window, vsync);
}

///
/// Get VSync for the window surface.
///
/// \param window the window to query.
/// \param vsync an int filled with the current vertical refresh sync interval.
/// See SDL_SetWindowSurfaceVSync() for the meaning of the value.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetWindowSurfaceVSync
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetWindowSurfaceVSync(SDL_Window *window, int *vsync)
/// ```
int sdlGetWindowSurfaceVSync(Pointer<SdlWindow> window, Pointer<Int32> vsync) {
  final sdlGetWindowSurfaceVSyncLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window, Pointer<Int32> vsync),
      int Function(Pointer<SdlWindow> window,
          Pointer<Int32> vsync)>('SDL_GetWindowSurfaceVSync');
  return sdlGetWindowSurfaceVSyncLookupFunction(window, vsync);
}

///
/// Copy the window surface to the screen.
///
/// This is the function you use to reflect any changes to the surface on the
/// screen.
///
/// This function is equivalent to the SDL 1.2 API SDL_Flip().
///
/// \param window the window to update.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetWindowSurface
/// \sa SDL_UpdateWindowSurfaceRects
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_UpdateWindowSurface(SDL_Window *window)
/// ```
int sdlUpdateWindowSurface(Pointer<SdlWindow> window) {
  final sdlUpdateWindowSurfaceLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window),
      int Function(Pointer<SdlWindow> window)>('SDL_UpdateWindowSurface');
  return sdlUpdateWindowSurfaceLookupFunction(window);
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
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetWindowSurface
/// \sa SDL_UpdateWindowSurface
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_UpdateWindowSurfaceRects(SDL_Window *window, const SDL_Rect *rects, int numrects)
/// ```
int sdlUpdateWindowSurfaceRects(
    Pointer<SdlWindow> window, Pointer<SdlRect> rects, int numrects) {
  final sdlUpdateWindowSurfaceRectsLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<SdlWindow> window, Pointer<SdlRect> rects, Int32 numrects),
      int Function(Pointer<SdlWindow> window, Pointer<SdlRect> rects,
          int numrects)>('SDL_UpdateWindowSurfaceRects');
  return sdlUpdateWindowSurfaceRectsLookupFunction(window, rects, numrects);
}

///
/// Destroy the surface associated with the window.
///
/// \param window the window to update.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetWindowSurface
/// \sa SDL_WindowHasSurface
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_DestroyWindowSurface(SDL_Window *window)
/// ```
int sdlDestroyWindowSurface(Pointer<SdlWindow> window) {
  final sdlDestroyWindowSurfaceLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window),
      int Function(Pointer<SdlWindow> window)>('SDL_DestroyWindowSurface');
  return sdlDestroyWindowSurfaceLookupFunction(window);
}

///
/// Set a window's keyboard grab mode.
///
/// Keyboard grab enables capture of system keyboard shortcuts like Alt+Tab or
/// the Meta/Super key. Note that not all system keyboard shortcuts can be
/// captured by applications (one example is Ctrl+Alt+Del on Windows).
///
/// This is primarily intended for specialized applications such as VNC clients
/// or VM frontends. Normal games should not use keyboard grab.
///
/// When keyboard grab is enabled, SDL will continue to handle Alt+Tab when the
/// window is full-screen to ensure the user is not trapped in your
/// application. If you have a custom keyboard shortcut to exit fullscreen
/// mode, you may suppress this behavior with
/// `SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED`.
///
/// If the caller enables a grab while another window is currently grabbed, the
/// other window loses its grab in favor of the caller's window.
///
/// \param window the window for which the keyboard grab mode should be set.
/// \param grabbed this is SDL_TRUE to grab keyboard, and SDL_FALSE to release.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetWindowKeyboardGrab
/// \sa SDL_SetWindowMouseGrab
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_SetWindowKeyboardGrab(SDL_Window *window, SDL_bool grabbed)
/// ```
int sdlSetWindowKeyboardGrab(Pointer<SdlWindow> window, bool grabbed) {
  final sdlSetWindowKeyboardGrabLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window, Int32 grabbed),
      int Function(
          Pointer<SdlWindow> window, int grabbed)>('SDL_SetWindowKeyboardGrab');
  return sdlSetWindowKeyboardGrabLookupFunction(window, grabbed ? 1 : 0);
}

///
/// Set a window's mouse grab mode.
///
/// Mouse grab confines the mouse cursor to the window.
///
/// \param window the window for which the mouse grab mode should be set.
/// \param grabbed this is SDL_TRUE to grab mouse, and SDL_FALSE to release.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetWindowMouseGrab
/// \sa SDL_SetWindowKeyboardGrab
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_SetWindowMouseGrab(SDL_Window *window, SDL_bool grabbed)
/// ```
int sdlSetWindowMouseGrab(Pointer<SdlWindow> window, bool grabbed) {
  final sdlSetWindowMouseGrabLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window, Int32 grabbed),
      int Function(
          Pointer<SdlWindow> window, int grabbed)>('SDL_SetWindowMouseGrab');
  return sdlSetWindowMouseGrabLookupFunction(window, grabbed ? 1 : 0);
}

///
/// Get a window's keyboard grab mode.
///
/// \param window the window to query.
/// \returns SDL_TRUE if keyboard is grabbed, and SDL_FALSE otherwise.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetWindowKeyboardGrab
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_GetWindowKeyboardGrab(SDL_Window *window)
/// ```
bool sdlGetWindowKeyboardGrab(Pointer<SdlWindow> window) {
  final sdlGetWindowKeyboardGrabLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window),
      int Function(Pointer<SdlWindow> window)>('SDL_GetWindowKeyboardGrab');
  return sdlGetWindowKeyboardGrabLookupFunction(window) == 1;
}

///
/// Get a window's mouse grab mode.
///
/// \param window the window to query.
/// \returns SDL_TRUE if mouse is grabbed, and SDL_FALSE otherwise.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetWindowKeyboardGrab
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_GetWindowMouseGrab(SDL_Window *window)
/// ```
bool sdlGetWindowMouseGrab(Pointer<SdlWindow> window) {
  final sdlGetWindowMouseGrabLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window),
      int Function(Pointer<SdlWindow> window)>('SDL_GetWindowMouseGrab');
  return sdlGetWindowMouseGrabLookupFunction(window) == 1;
}

///
/// Get the window that currently has an input grab enabled.
///
/// \returns the window if input is grabbed or NULL otherwise.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetWindowMouseGrab
/// \sa SDL_SetWindowKeyboardGrab
///
/// ```c
/// extern SDL_DECLSPEC SDL_Window *SDLCALL SDL_GetGrabbedWindow(void)
/// ```
Pointer<SdlWindow> sdlGetGrabbedWindow() {
  final sdlGetGrabbedWindowLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlWindow> Function(),
      Pointer<SdlWindow> Function()>('SDL_GetGrabbedWindow');
  return sdlGetGrabbedWindowLookupFunction();
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
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetWindowMouseRect
/// \sa SDL_SetWindowMouseGrab
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_SetWindowMouseRect(SDL_Window *window, const SDL_Rect *rect)
/// ```
int sdlSetWindowMouseRect(Pointer<SdlWindow> window, Pointer<SdlRect> rect) {
  final sdlSetWindowMouseRectLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window, Pointer<SdlRect> rect),
      int Function(Pointer<SdlWindow> window,
          Pointer<SdlRect> rect)>('SDL_SetWindowMouseRect');
  return sdlSetWindowMouseRectLookupFunction(window, rect);
}

///
/// Get the mouse confinement rectangle of a window.
///
/// \param window the window to query.
/// \returns a pointer to the mouse confinement rectangle of a window, or NULL
/// if there isn't one.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetWindowMouseRect
///
/// ```c
/// extern SDL_DECLSPEC const SDL_Rect *SDLCALL SDL_GetWindowMouseRect(SDL_Window *window)
/// ```
Pointer<SdlRect> sdlGetWindowMouseRect(Pointer<SdlWindow> window) {
  final sdlGetWindowMouseRectLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlRect> Function(Pointer<SdlWindow> window),
      Pointer<SdlRect> Function(
          Pointer<SdlWindow> window)>('SDL_GetWindowMouseRect');
  return sdlGetWindowMouseRectLookupFunction(window);
}

///
/// Set the opacity for a window.
///
/// The parameter `opacity` will be clamped internally between 0.0f
/// (transparent) and 1.0f (opaque).
///
/// This function also returns -1 if setting the opacity isn't supported.
///
/// \param window the window which will be made transparent or opaque.
/// \param opacity the opacity value (0.0f - transparent, 1.0f - opaque).
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetWindowOpacity
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_SetWindowOpacity(SDL_Window *window, float opacity)
/// ```
int sdlSetWindowOpacity(Pointer<SdlWindow> window, double opacity) {
  final sdlSetWindowOpacityLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window, Float opacity),
      int Function(
          Pointer<SdlWindow> window, double opacity)>('SDL_SetWindowOpacity');
  return sdlSetWindowOpacityLookupFunction(window, opacity);
}

///
/// Get the opacity of a window.
///
/// If transparency isn't supported on this platform, opacity will be reported
/// as 1.0f without error.
///
/// The parameter `opacity` is ignored if it is NULL.
///
/// This function also returns -1 if an invalid window was provided.
///
/// \param window the window to get the current opacity value from.
/// \param out_opacity the float filled in (0.0f - transparent, 1.0f - opaque).
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetWindowOpacity
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetWindowOpacity(SDL_Window *window, float *out_opacity)
/// ```
int sdlGetWindowOpacity(Pointer<SdlWindow> window, Pointer<Float> outOpacity) {
  final sdlGetWindowOpacityLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window, Pointer<Float> outOpacity),
      int Function(Pointer<SdlWindow> window,
          Pointer<Float> outOpacity)>('SDL_GetWindowOpacity');
  return sdlGetWindowOpacityLookupFunction(window, outOpacity);
}

///
/// Set the window as a modal to a parent window.
///
/// If the window is already modal to an existing window, it will be reparented
/// to the new owner. Setting the parent window to null unparents the modal
/// window and removes modal status.
///
/// Setting a window as modal to a parent that is a descendent of the modal
/// window results in undefined behavior.
///
/// \param modal_window the window that should be set modal.
/// \param parent_window the parent window for the modal window.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_SetWindowModalFor(SDL_Window *modal_window, SDL_Window *parent_window)
/// ```
int sdlSetWindowModalFor(
    Pointer<SdlWindow> modalWindow, Pointer<SdlWindow> parentWindow) {
  final sdlSetWindowModalForLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<SdlWindow> modalWindow, Pointer<SdlWindow> parentWindow),
      int Function(Pointer<SdlWindow> modalWindow,
          Pointer<SdlWindow> parentWindow)>('SDL_SetWindowModalFor');
  return sdlSetWindowModalForLookupFunction(modalWindow, parentWindow);
}

///
/// Set whether the window may have input focus.
///
/// \param window the window to set focusable state.
/// \param focusable SDL_TRUE to allow input focus, SDL_FALSE to not allow
/// input focus.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_SetWindowFocusable(SDL_Window *window, SDL_bool focusable)
/// ```
int sdlSetWindowFocusable(Pointer<SdlWindow> window, bool focusable) {
  final sdlSetWindowFocusableLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window, Int32 focusable),
      int Function(
          Pointer<SdlWindow> window, int focusable)>('SDL_SetWindowFocusable');
  return sdlSetWindowFocusableLookupFunction(window, focusable ? 1 : 0);
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
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_ShowWindowSystemMenu(SDL_Window *window, int x, int y)
/// ```
int sdlShowWindowSystemMenu(Pointer<SdlWindow> window, int x, int y) {
  final sdlShowWindowSystemMenuLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window, Int32 x, Int32 y),
      int Function(
          Pointer<SdlWindow> window, int x, int y)>('SDL_ShowWindowSystemMenu');
  return sdlShowWindowSystemMenuLookupFunction(window, x, y);
}

///
/// Provide a callback that decides if a window region has special properties.
///
/// Normally windows are dragged and resized by decorations provided by the
/// system window manager (a title bar, borders, etc), but for some apps, it
/// makes sense to drag them from somewhere else inside the window itself; for
/// example, one might have a borderless window that wants to be draggable from
/// any part, or simulate its own title bar, etc.
///
/// This function lets the app provide a callback that designates pieces of a
/// given window as special. This callback is run during event processing if we
/// need to tell the OS to treat a region of the window specially; the use of
/// this callback is known as "hit testing."
///
/// Mouse input may not be delivered to your application if it is within a
/// special area; the OS will often apply that input to moving the window or
/// resizing the window and not deliver it to the application.
///
/// Specifying NULL for a callback disables hit-testing. Hit-testing is
/// disabled by default.
///
/// Platforms that don't support this functionality will return -1
/// unconditionally, even if you're attempting to disable hit-testing.
///
/// Your callback may fire at any time, and its firing does not indicate any
/// specific behavior (for example, on Windows, this certainly might fire when
/// the OS is deciding whether to drag your window, but it fires for lots of
/// other reasons, too, some unrelated to anything you probably care about _and
/// when the mouse isn't actually at the location it is testing_). Since this
/// can fire at any time, you should try to keep your callback efficient,
/// devoid of allocations, etc.
///
/// \param window the window to set hit-testing on.
/// \param callback the function to call when doing a hit-test.
/// \param callback_data an app-defined void pointer passed to **callback**.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_SetWindowHitTest(SDL_Window *window, SDL_HitTest callback, void *callback_data)
/// ```
int sdlSetWindowHitTest(
    Pointer<SdlWindow> window,
    Pointer<NativeFunction<SdlHitTest>> callback,
    Pointer<NativeType> callbackData) {
  final sdlSetWindowHitTestLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<SdlWindow> window,
          Pointer<NativeFunction<SdlHitTest>> callback,
          Pointer<NativeType> callbackData),
      int Function(
          Pointer<SdlWindow> window,
          Pointer<NativeFunction<SdlHitTest>> callback,
          Pointer<NativeType> callbackData)>('SDL_SetWindowHitTest');
  return sdlSetWindowHitTestLookupFunction(window, callback, callbackData);
}

///
/// Set the shape of a transparent window.
///
/// This sets the alpha channel of a transparent window and any fully
/// transparent areas are also transparent to mouse clicks. If you are using
/// something besides the SDL render API, then you are responsible for setting
/// the alpha channel of the window yourself.
///
/// The shape is copied inside this function, so you can free it afterwards. If
/// your shape surface changes, you should call SDL_SetWindowShape() again to
/// update the window.
///
/// The window must have been created with the SDL_WINDOW_TRANSPARENT flag.
///
/// \param window the window.
/// \param shape the surface representing the shape of the window, or NULL to
/// remove any current shape.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_SetWindowShape(SDL_Window *window, SDL_Surface *shape)
/// ```
int sdlSetWindowShape(Pointer<SdlWindow> window, Pointer<SdlSurface> shape) {
  final sdlSetWindowShapeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window, Pointer<SdlSurface> shape),
      int Function(Pointer<SdlWindow> window,
          Pointer<SdlSurface> shape)>('SDL_SetWindowShape');
  return sdlSetWindowShapeLookupFunction(window, shape);
}

///
/// Request a window to demand attention from the user.
///
/// \param window the window to be flashed.
/// \param operation the operation to perform.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_FlashWindow(SDL_Window *window, SDL_FlashOperation operation)
/// ```
int sdlFlashWindow(Pointer<SdlWindow> window, int operation) {
  final sdlFlashWindowLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window, Int32 operation),
      int Function(
          Pointer<SdlWindow> window, int operation)>('SDL_FlashWindow');
  return sdlFlashWindowLookupFunction(window, operation);
}

///
/// Destroy a window.
///
/// Any popups or modal windows owned by the window will be recursively
/// destroyed as well.
///
/// \param window the window to destroy.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_CreatePopupWindow
/// \sa SDL_CreateWindow
/// \sa SDL_CreateWindowWithProperties
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_DestroyWindow(SDL_Window *window)
/// ```
void sdlDestroyWindow(Pointer<SdlWindow> window) {
  final sdlDestroyWindowLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlWindow> window),
      void Function(Pointer<SdlWindow> window)>('SDL_DestroyWindow');
  return sdlDestroyWindowLookupFunction(window);
}

///
/// Check whether the screensaver is currently enabled.
///
/// The screensaver is disabled by default.
///
/// The default can also be changed using `SDL_HINT_VIDEO_ALLOW_SCREENSAVER`.
///
/// \returns SDL_TRUE if the screensaver is enabled, SDL_FALSE if it is
/// disabled.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_DisableScreenSaver
/// \sa SDL_EnableScreenSaver
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_ScreenSaverEnabled(void)
/// ```
bool sdlScreenSaverEnabled() {
  final sdlScreenSaverEnabledLookupFunction =
      libSdl3.lookupFunction<Int32 Function(), int Function()>(
          'SDL_ScreenSaverEnabled');
  return sdlScreenSaverEnabledLookupFunction() == 1;
}

///
/// Allow the screen to be blanked by a screen saver.
///
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_DisableScreenSaver
/// \sa SDL_ScreenSaverEnabled
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_EnableScreenSaver(void)
/// ```
int sdlEnableScreenSaver() {
  final sdlEnableScreenSaverLookupFunction =
      libSdl3.lookupFunction<Int32 Function(), int Function()>(
          'SDL_EnableScreenSaver');
  return sdlEnableScreenSaverLookupFunction();
}

///
/// Prevent the screen from being blanked by a screen saver.
///
/// If you disable the screensaver, it is automatically re-enabled when SDL
/// quits.
///
/// The screensaver is disabled by default, but this may by changed by
/// SDL_HINT_VIDEO_ALLOW_SCREENSAVER.
///
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_EnableScreenSaver
/// \sa SDL_ScreenSaverEnabled
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_DisableScreenSaver(void)
/// ```
int sdlDisableScreenSaver() {
  final sdlDisableScreenSaverLookupFunction =
      libSdl3.lookupFunction<Int32 Function(), int Function()>(
          'SDL_DisableScreenSaver');
  return sdlDisableScreenSaverLookupFunction();
}

///
/// Dynamically load an OpenGL library.
///
/// This should be done after initializing the video driver, but before
/// creating any OpenGL windows. If no OpenGL library is loaded, the default
/// library will be loaded upon creation of the first OpenGL window.
///
/// If you do this, you need to retrieve all of the GL functions used in your
/// program from the dynamic library using SDL_GL_GetProcAddress().
///
/// \param path the platform dependent OpenGL library name, or NULL to open the
/// default OpenGL library.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GL_GetProcAddress
/// \sa SDL_GL_UnloadLibrary
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GL_LoadLibrary(const char *path)
/// ```
int sdlGlLoadLibrary(String? path) {
  final sdlGlLoadLibraryLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Utf8> path),
      int Function(Pointer<Utf8> path)>('SDL_GL_LoadLibrary');
  final pathPointer = path != null ? path.toNativeUtf8() : nullptr;
  final result = sdlGlLoadLibraryLookupFunction(pathPointer);
  calloc.free(pathPointer);
  return result;
}

///
/// Get an OpenGL function by name.
///
/// If the GL library is loaded at runtime with SDL_GL_LoadLibrary(), then all
/// GL functions must be retrieved this way. Usually this is used to retrieve
/// function pointers to OpenGL extensions.
///
/// There are some quirks to looking up OpenGL functions that require some
/// extra care from the application. If you code carefully, you can handle
/// these quirks without any platform-specific code, though:
///
/// - On Windows, function pointers are specific to the current GL context;
/// this means you need to have created a GL context and made it current
/// before calling SDL_GL_GetProcAddress(). If you recreate your context or
/// create a second context, you should assume that any existing function
/// pointers aren't valid to use with it. This is (currently) a
/// Windows-specific limitation, and in practice lots of drivers don't suffer
/// this limitation, but it is still the way the wgl API is documented to
/// work and you should expect crashes if you don't respect it. Store a copy
/// of the function pointers that comes and goes with context lifespan.
/// - On X11, function pointers returned by this function are valid for any
/// context, and can even be looked up before a context is created at all.
/// This means that, for at least some common OpenGL implementations, if you
/// look up a function that doesn't exist, you'll get a non-NULL result that
/// is _NOT_ safe to call. You must always make sure the function is actually
/// available for a given GL context before calling it, by checking for the
/// existence of the appropriate extension with SDL_GL_ExtensionSupported(),
/// or verifying that the version of OpenGL you're using offers the function
/// as core functionality.
/// - Some OpenGL drivers, on all platforms, *will* return NULL if a function
/// isn't supported, but you can't count on this behavior. Check for
/// extensions you use, and if you get a NULL anyway, act as if that
/// extension wasn't available. This is probably a bug in the driver, but you
/// can code defensively for this scenario anyhow.
/// - Just because you're on Linux/Unix, don't assume you'll be using X11.
/// Next-gen display servers are waiting to replace it, and may or may not
/// make the same promises about function pointers.
/// - OpenGL function pointers must be declared `APIENTRY` as in the example
/// code. This will ensure the proper calling convention is followed on
/// platforms where this matters (Win32) thereby avoiding stack corruption.
///
/// \param proc the name of an OpenGL function.
/// \returns a pointer to the named OpenGL function. The returned pointer
/// should be cast to the appropriate function signature.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GL_ExtensionSupported
/// \sa SDL_GL_LoadLibrary
/// \sa SDL_GL_UnloadLibrary
///
/// ```c
/// extern SDL_DECLSPEC SDL_FunctionPointer SDLCALL SDL_GL_GetProcAddress(const char *proc)
/// ```
Pointer<NativeType> sdlGlGetProcAddress(String? proc) {
  final sdlGlGetProcAddressLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(Pointer<Utf8> proc),
      Pointer<NativeType> Function(
          Pointer<Utf8> proc)>('SDL_GL_GetProcAddress');
  final procPointer = proc != null ? proc.toNativeUtf8() : nullptr;
  final result = sdlGlGetProcAddressLookupFunction(procPointer);
  calloc.free(procPointer);
  return result;
}

///
/// Get an EGL library function by name.
///
/// If an EGL library is loaded, this function allows applications to get entry
/// points for EGL functions. This is useful to provide to an EGL API and
/// extension loader.
///
/// \param proc the name of an EGL function.
/// \returns a pointer to the named EGL function. The returned pointer should
/// be cast to the appropriate function signature.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GL_GetCurrentEGLDisplay
///
/// ```c
/// extern SDL_DECLSPEC SDL_FunctionPointer SDLCALL SDL_EGL_GetProcAddress(const char *proc)
/// ```
Pointer<NativeType> sdlEglGetProcAddress(String? proc) {
  final sdlEglGetProcAddressLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(Pointer<Utf8> proc),
      Pointer<NativeType> Function(
          Pointer<Utf8> proc)>('SDL_EGL_GetProcAddress');
  final procPointer = proc != null ? proc.toNativeUtf8() : nullptr;
  final result = sdlEglGetProcAddressLookupFunction(procPointer);
  calloc.free(procPointer);
  return result;
}

///
/// Unload the OpenGL library previously loaded by SDL_GL_LoadLibrary().
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GL_LoadLibrary
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_GL_UnloadLibrary(void)
/// ```
void sdlGlUnloadLibrary() {
  final sdlGlUnloadLibraryLookupFunction = libSdl3
      .lookupFunction<Void Function(), void Function()>('SDL_GL_UnloadLibrary');
  return sdlGlUnloadLibraryLookupFunction();
}

///
/// Check if an OpenGL extension is supported for the current context.
///
/// This function operates on the current GL context; you must have created a
/// context and it must be current before calling this function. Do not assume
/// that all contexts you create will have the same set of extensions
/// available, or that recreating an existing context will offer the same
/// extensions again.
///
/// While it's probably not a massive overhead, this function is not an O(1)
/// operation. Check the extensions you care about after creating the GL
/// context and save that information somewhere instead of calling the function
/// every time you need to know.
///
/// \param extension the name of the extension to check.
/// \returns SDL_TRUE if the extension is supported, SDL_FALSE otherwise.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_GL_ExtensionSupported(const char *extension)
/// ```
bool sdlGlExtensionSupported(String? extension) {
  final sdlGlExtensionSupportedLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Utf8> extension),
      int Function(Pointer<Utf8> extension)>('SDL_GL_ExtensionSupported');
  final extensionPointer =
      extension != null ? extension.toNativeUtf8() : nullptr;
  final result = sdlGlExtensionSupportedLookupFunction(extensionPointer) == 1;
  calloc.free(extensionPointer);
  return result;
}

///
/// Reset all previously set OpenGL context attributes to their default values.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GL_GetAttribute
/// \sa SDL_GL_SetAttribute
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_GL_ResetAttributes(void)
/// ```
void sdlGlResetAttributes() {
  final sdlGlResetAttributesLookupFunction =
      libSdl3.lookupFunction<Void Function(), void Function()>(
          'SDL_GL_ResetAttributes');
  return sdlGlResetAttributesLookupFunction();
}

///
/// Set an OpenGL window attribute before window creation.
///
/// This function sets the OpenGL attribute `attr` to `value`. The requested
/// attributes should be set before creating an OpenGL window. You should use
/// SDL_GL_GetAttribute() to check the values after creating the OpenGL
/// context, since the values obtained can differ from the requested ones.
///
/// \param attr an SDL_GLattr enum value specifying the OpenGL attribute to
/// set.
/// \param value the desired value for the attribute.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GL_GetAttribute
/// \sa SDL_GL_ResetAttributes
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GL_SetAttribute(SDL_GLattr attr, int value)
/// ```
int sdlGlSetAttribute(int attr, int value) {
  final sdlGlSetAttributeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Int32 attr, Int32 value),
      int Function(int attr, int value)>('SDL_GL_SetAttribute');
  return sdlGlSetAttributeLookupFunction(attr, value);
}

///
/// Get the actual value for an attribute from the current context.
///
/// \param attr an SDL_GLattr enum value specifying the OpenGL attribute to
/// get.
/// \param value a pointer filled in with the current value of `attr`.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GL_ResetAttributes
/// \sa SDL_GL_SetAttribute
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GL_GetAttribute(SDL_GLattr attr, int *value)
/// ```
int sdlGlGetAttribute(int attr, Pointer<Int32> value) {
  final sdlGlGetAttributeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Int32 attr, Pointer<Int32> value),
      int Function(int attr, Pointer<Int32> value)>('SDL_GL_GetAttribute');
  return sdlGlGetAttributeLookupFunction(attr, value);
}

///
/// Create an OpenGL context for an OpenGL window, and make it current.
///
/// Windows users new to OpenGL should note that, for historical reasons, GL
/// functions added after OpenGL version 1.1 are not available by default.
/// Those functions must be loaded at run-time, either with an OpenGL
/// extension-handling library or with SDL_GL_GetProcAddress() and its related
/// functions.
///
/// SDL_GLContext is opaque to the application.
///
/// \param window the window to associate with the context.
/// \returns the OpenGL context associated with `window` or NULL on error; call
/// SDL_GetError() for more details.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GL_DeleteContext
/// \sa SDL_GL_MakeCurrent
///
/// ```c
/// extern SDL_DECLSPEC SDL_GLContext SDLCALL SDL_GL_CreateContext(SDL_Window *window)
/// ```
Pointer<SdlGlContext> sdlGlCreateContext(Pointer<SdlWindow> window) {
  final sdlGlCreateContextLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlGlContext> Function(Pointer<SdlWindow> window),
      Pointer<SdlGlContext> Function(
          Pointer<SdlWindow> window)>('SDL_GL_CreateContext');
  return sdlGlCreateContextLookupFunction(window);
}

///
/// Set up an OpenGL context for rendering into an OpenGL window.
///
/// The context must have been created with a compatible window.
///
/// \param window the window to associate with the context.
/// \param context the OpenGL context to associate with the window.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GL_CreateContext
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GL_MakeCurrent(SDL_Window *window, SDL_GLContext context)
/// ```
int sdlGlMakeCurrent(Pointer<SdlWindow> window, Pointer<SdlGlContext> context) {
  final sdlGlMakeCurrentLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window, Pointer<SdlGlContext> context),
      int Function(Pointer<SdlWindow> window,
          Pointer<SdlGlContext> context)>('SDL_GL_MakeCurrent');
  return sdlGlMakeCurrentLookupFunction(window, context);
}

///
/// Get the currently active OpenGL window.
///
/// \returns the currently active OpenGL window on success or NULL on failure;
/// call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_Window *SDLCALL SDL_GL_GetCurrentWindow(void)
/// ```
Pointer<SdlWindow> sdlGlGetCurrentWindow() {
  final sdlGlGetCurrentWindowLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlWindow> Function(),
      Pointer<SdlWindow> Function()>('SDL_GL_GetCurrentWindow');
  return sdlGlGetCurrentWindowLookupFunction();
}

///
/// Get the currently active OpenGL context.
///
/// \returns the currently active OpenGL context or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GL_MakeCurrent
///
/// ```c
/// extern SDL_DECLSPEC SDL_GLContext SDLCALL SDL_GL_GetCurrentContext(void)
/// ```
Pointer<SdlGlContext> sdlGlGetCurrentContext() {
  final sdlGlGetCurrentContextLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlGlContext> Function(),
      Pointer<SdlGlContext> Function()>('SDL_GL_GetCurrentContext');
  return sdlGlGetCurrentContextLookupFunction();
}

///
/// Get the currently active EGL display.
///
/// \returns the currently active EGL display or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_EGLDisplay SDLCALL SDL_EGL_GetCurrentEGLDisplay(void)
/// ```
Pointer<NativeType> sdlEglGetCurrentEglDisplay() {
  final sdlEglGetCurrentEglDisplayLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(),
      Pointer<NativeType> Function()>('SDL_EGL_GetCurrentEGLDisplay');
  return sdlEglGetCurrentEglDisplayLookupFunction();
}

///
/// Get the currently active EGL config.
///
/// \returns the currently active EGL config or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_EGLConfig SDLCALL SDL_EGL_GetCurrentEGLConfig(void)
/// ```
Pointer<NativeType> sdlEglGetCurrentEglConfig() {
  final sdlEglGetCurrentEglConfigLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(),
      Pointer<NativeType> Function()>('SDL_EGL_GetCurrentEGLConfig');
  return sdlEglGetCurrentEglConfigLookupFunction();
}

///
/// Get the EGL surface associated with the window.
///
/// \param window the window to query.
/// \returns the EGLSurface pointer associated with the window, or NULL on
/// failure.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_EGLSurface SDLCALL SDL_EGL_GetWindowEGLSurface(SDL_Window *window)
/// ```
Pointer<NativeType> sdlEglGetWindowEglSurface(Pointer<SdlWindow> window) {
  final sdlEglGetWindowEglSurfaceLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(Pointer<SdlWindow> window),
      Pointer<NativeType> Function(
          Pointer<SdlWindow> window)>('SDL_EGL_GetWindowEGLSurface');
  return sdlEglGetWindowEglSurfaceLookupFunction(window);
}

///
/// Sets the callbacks for defining custom EGLAttrib arrays for EGL
/// initialization.
///
/// Each callback should return a pointer to an EGL attribute array terminated
/// with EGL_NONE. Callbacks may return NULL pointers to signal an error, which
/// will cause the SDL_CreateWindow process to fail gracefully.
///
/// The arrays returned by each callback will be appended to the existing
/// attribute arrays defined by SDL.
///
/// NOTE: These callback pointers will be reset after SDL_GL_ResetAttributes.
///
/// \param platformAttribCallback callback for attributes to pass to
/// eglGetPlatformDisplay.
/// \param surfaceAttribCallback callback for attributes to pass to
/// eglCreateSurface.
/// \param contextAttribCallback callback for attributes to pass to
/// eglCreateContext.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_EGL_SetEGLAttributeCallbacks(SDL_EGLAttribArrayCallback platformAttribCallback, SDL_EGLIntArrayCallback surfaceAttribCallback, SDL_EGLIntArrayCallback contextAttribCallback)
/// ```
void sdlEglSetEglAttributeCallbacks(
    Pointer<NativeFunction<SdlEglAttribArrayCallback>> platformAttribCallback,
    Pointer<NativeFunction<SdlEglIntArrayCallback>> surfaceAttribCallback,
    Pointer<NativeFunction<SdlEglIntArrayCallback>> contextAttribCallback) {
  final sdlEglSetEglAttributeCallbacksLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Pointer<NativeFunction<SdlEglAttribArrayCallback>>
              platformAttribCallback,
          Pointer<NativeFunction<SdlEglIntArrayCallback>> surfaceAttribCallback,
          Pointer<NativeFunction<SdlEglIntArrayCallback>>
              contextAttribCallback),
      void Function(
          Pointer<NativeFunction<SdlEglAttribArrayCallback>>
              platformAttribCallback,
          Pointer<NativeFunction<SdlEglIntArrayCallback>> surfaceAttribCallback,
          Pointer<NativeFunction<SdlEglIntArrayCallback>>
              contextAttribCallback)>('SDL_EGL_SetEGLAttributeCallbacks');
  return sdlEglSetEglAttributeCallbacksLookupFunction(
      platformAttribCallback, surfaceAttribCallback, contextAttribCallback);
}

///
/// Set the swap interval for the current OpenGL context.
///
/// Some systems allow specifying -1 for the interval, to enable adaptive
/// vsync. Adaptive vsync works the same as vsync, but if you've already missed
/// the vertical retrace for a given frame, it swaps buffers immediately, which
/// might be less jarring for the user during occasional framerate drops. If an
/// application requests adaptive vsync and the system does not support it,
/// this function will fail and return -1. In such a case, you should probably
/// retry the call with 1 for the interval.
///
/// Adaptive vsync is implemented for some glX drivers with
/// GLX_EXT_swap_control_tear, and for some Windows drivers with
/// WGL_EXT_swap_control_tear.
///
/// Read more on the Khronos wiki:
/// https://www.khronos.org/opengl/wiki/Swap_Interval#Adaptive_Vsync
///
/// \param interval 0 for immediate updates, 1 for updates synchronized with
/// the vertical retrace, -1 for adaptive vsync.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GL_GetSwapInterval
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GL_SetSwapInterval(int interval)
/// ```
int sdlGlSetSwapInterval(int interval) {
  final sdlGlSetSwapIntervalLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Int32 interval),
      int Function(int interval)>('SDL_GL_SetSwapInterval');
  return sdlGlSetSwapIntervalLookupFunction(interval);
}

///
/// Get the swap interval for the current OpenGL context.
///
/// If the system can't determine the swap interval, or there isn't a valid
/// current context, this function will set *interval to 0 as a safe default.
///
/// \param interval output interval value. 0 if there is no vertical retrace
/// synchronization, 1 if the buffer swap is synchronized with
/// the vertical retrace, and -1 if late swaps happen
/// immediately instead of waiting for the next retrace.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GL_SetSwapInterval
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GL_GetSwapInterval(int *interval)
/// ```
int sdlGlGetSwapInterval(Pointer<Int32> interval) {
  final sdlGlGetSwapIntervalLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Int32> interval),
      int Function(Pointer<Int32> interval)>('SDL_GL_GetSwapInterval');
  return sdlGlGetSwapIntervalLookupFunction(interval);
}

///
/// Update a window with OpenGL rendering.
///
/// This is used with double-buffered OpenGL contexts, which are the default.
///
/// On macOS, make sure you bind 0 to the draw framebuffer before swapping the
/// window, otherwise nothing will happen. If you aren't using
/// glBindFramebuffer(), this is the default and you won't have to do anything
/// extra.
///
/// \param window the window to change.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GL_SwapWindow(SDL_Window *window)
/// ```
int sdlGlSwapWindow(Pointer<SdlWindow> window) {
  final sdlGlSwapWindowLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window),
      int Function(Pointer<SdlWindow> window)>('SDL_GL_SwapWindow');
  return sdlGlSwapWindowLookupFunction(window);
}

///
/// Delete an OpenGL context.
///
/// \param context the OpenGL context to be deleted.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GL_CreateContext
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GL_DeleteContext(SDL_GLContext context)
/// ```
int sdlGlDeleteContext(Pointer<SdlGlContext> context) {
  final sdlGlDeleteContextLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlGlContext> context),
      int Function(Pointer<SdlGlContext> context)>('SDL_GL_DeleteContext');
  return sdlGlDeleteContextLookupFunction(context);
}
