import 'dart:ffi';
import 'dart:math' as math;
import 'package:ffi/ffi.dart';

import '../../generated/lib_sdl.dart';
import '../../generated/struct_sdl.dart';
import '../../generated/lib_sdl_render.dart';
import '../../generated/lib_sdl_video.dart';
import '../dart/rectangle.dart';
import 'sdl_rect.dart';

extension SdlWindowEx on SdlWindow {
  // lib_sdl_video.dart

  ///
  /// Create a window with the specified dimensions and flags.
  ///
  /// `flags` may be any of the following OR'd together:
  ///
  /// - `SDL_WINDOW_FULLSCREEN`: fullscreen window at desktop resolution
  /// - `SDL_WINDOW_OPENGL`: window usable with an OpenGL context
  /// - `SDL_WINDOW_OCCLUDED`: window partially or completely obscured by another
  /// window
  /// - `SDL_WINDOW_HIDDEN`: window is not visible
  /// - `SDL_WINDOW_BORDERLESS`: no window decoration
  /// - `SDL_WINDOW_RESIZABLE`: window can be resized
  /// - `SDL_WINDOW_MINIMIZED`: window is minimized
  /// - `SDL_WINDOW_MAXIMIZED`: window is maximized
  /// - `SDL_WINDOW_MOUSE_GRABBED`: window has grabbed mouse focus
  /// - `SDL_WINDOW_INPUT_FOCUS`: window has input focus
  /// - `SDL_WINDOW_MOUSE_FOCUS`: window has mouse focus
  /// - `SDL_WINDOW_EXTERNAL`: window not created by SDL
  /// - `SDL_WINDOW_MODAL`: window is modal
  /// - `SDL_WINDOW_HIGH_PIXEL_DENSITY`: window uses high pixel density back
  /// buffer if possible
  /// - `SDL_WINDOW_MOUSE_CAPTURE`: window has mouse captured (unrelated to
  /// MOUSE_GRABBED)
  /// - `SDL_WINDOW_ALWAYS_ON_TOP`: window should always be above others
  /// - `SDL_WINDOW_UTILITY`: window should be treated as a utility window, not
  /// showing in the task bar and window list
  /// - `SDL_WINDOW_TOOLTIP`: window should be treated as a tooltip and does not
  /// get mouse or keyboard focus, requires a parent window
  /// - `SDL_WINDOW_POPUP_MENU`: window should be treated as a popup menu,
  /// requires a parent window
  /// - `SDL_WINDOW_KEYBOARD_GRABBED`: window has grabbed keyboard input
  /// - `SDL_WINDOW_VULKAN`: window usable with a Vulkan instance
  /// - `SDL_WINDOW_METAL`: window usable with a Metal instance
  /// - `SDL_WINDOW_TRANSPARENT`: window with transparent buffer
  /// - `SDL_WINDOW_NOT_FOCUSABLE`: window should not be focusable
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
  /// extern SDL_DECLSPEC SDL_Window * SDLCALL SDL_CreateWindow(const char *title, int w, int h, SDL_WindowFlags flags)
  /// ```
  static Pointer<SdlWindow> create(
      {required String title, required int w, required int h, int flags = 0}) {
    return sdlCreateWindow(title, w, h, flags);
  }
}

extension SdlWindowPointerEx on Pointer<SdlWindow> {
  // lib_sdl_video.dart

  // sdlCreateWindowFrom

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
  int getId() {
    return sdlGetWindowId(this);
  }

  // sdlGetWindowFromId

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
  int getFlags() {
    return sdlGetWindowFlags(this);
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
  void setTitle(String title) {
    sdlSetWindowTitle(this, title);
  }

  ///
  /// Get the title of a window.
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
  /// extern SDL_DECLSPEC const char * SDLCALL SDL_GetWindowTitle(SDL_Window *window)
  /// ```
  String? getTitle() {
    return sdlGetWindowTitle(this);
  }

  ///
  /// Set the icon for a window.
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
  void setIcon(Pointer<SdlSurface> icon) {
    sdlSetWindowIcon(this, icon);
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
  void setPosition(int x, int y) {
    sdlSetWindowPosition(this, x, y);
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
  math.Point<double> getPosition() {
    var x = calloc<Int32>();
    var y = calloc<Int32>();
    sdlGetWindowPosition(this, x, y);
    var result = math.Point<double>(x.value.toDouble(), y.value.toDouble());
    calloc.free(x);
    calloc.free(y);
    return result;
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
  void setSize(int w, int h) {
    sdlSetWindowSize(this, w, h);
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
  math.Point<double> getSize() {
    var w = calloc<Int32>();
    var h = calloc<Int32>();
    sdlGetWindowSize(this, w, h);
    var result = math.Point<double>(w.value.toDouble(), h.value.toDouble());
    calloc.free(w);
    calloc.free(h);
    return result;
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
  math.Rectangle<double> getBordersSize() {
    var top = calloc<Int32>();
    var left = calloc<Int32>();
    var bottom = calloc<Int32>();
    var right = calloc<Int32>();
    sdlGetWindowBordersSize(this, top, left, bottom, right);
    var result = math.Rectangle<double>(top.value.toDouble(),
        left.value.toDouble(), bottom.value.toDouble(), right.value.toDouble());
    calloc.free(top);
    calloc.free(left);
    calloc.free(bottom);
    calloc.free(right);
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
  math.Point<double> getSizeInPixels() {
    var w = calloc<Int32>();
    var h = calloc<Int32>();
    sdlGetWindowSizeInPixels(this, w, h);
    var result = math.Point<double>(w.value.toDouble(), h.value.toDouble());
    calloc.free(w);
    calloc.free(h);
    return result;
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
  void setMinimumSize(int w, int h) {
    sdlSetWindowMinimumSize(this, w, h);
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
  math.Point<double> getMinimumSize() {
    var w = calloc<Int32>();
    var h = calloc<Int32>();
    sdlGetWindowMinimumSize(this, w, h);
    var result = math.Point<double>(w.value.toDouble(), h.value.toDouble());
    calloc.free(w);
    calloc.free(h);
    return result;
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
  void setMaximumSize(int w, int h) {
    sdlSetWindowMaximumSize(this, w, h);
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
  math.Point<double> getMaximumSize() {
    var w = calloc<Int32>();
    var h = calloc<Int32>();
    sdlGetWindowMaximumSize(this, w, h);
    var result = math.Point<double>(w.value.toDouble(), h.value.toDouble());
    calloc.free(w);
    calloc.free(h);
    return result;
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
  void setBordered(bool bordered) {
    sdlSetWindowBordered(this, bordered);
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
  void setResizable(bool resizable) {
    sdlSetWindowResizable(this, resizable);
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
  void setAlwaysOnTop(bool onTop) {
    sdlSetWindowAlwaysOnTop(this, onTop);
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
  void show() {
    sdlShowWindow(this);
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
  void hide() {
    sdlHideWindow(this);
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
  void raise() {
    sdlRaiseWindow(this);
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
  void maximize() {
    sdlMaximizeWindow(this);
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
  void minimize() {
    sdlMinimizeWindow(this);
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
  void restore() {
    sdlRestoreWindow(this);
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
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL SDL_GetWindowSurface(SDL_Window *window)
  /// ```
  Pointer<SdlSurface> getSurface() {
    return sdlGetWindowSurface(this);
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
  void updateSurface() {
    sdlUpdateWindowSurface(this);
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
  int updateSurfaceRects(List<math.Rectangle<double>> rects) {
    var rectsPointer = rects.callocInt();
    var result = sdlUpdateWindowSurfaceRects(this, rectsPointer, rects.length);
    calloc.free(rectsPointer);
    return result;
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
  void setKeyboardGrab(bool grabbed) {
    sdlSetWindowKeyboardGrab(this, grabbed);
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
  void setMouseGrab(bool grabbed) {
    sdlSetWindowMouseGrab(this, grabbed);
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
  bool getKeyboardGrab() {
    return sdlGetWindowKeyboardGrab(this);
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
  bool getMouseGrab() {
    return sdlGetWindowMouseGrab(this);
  }

  // sdlGetGrabbedWindow

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
  int setMouseRect(math.Rectangle<double> rect) {
    var rectPointer = rect.callocInt();
    var result = sdlSetWindowMouseRect(this, rectPointer);
    calloc.free(rectPointer);
    return result;
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
  /// extern SDL_DECLSPEC const SDL_Rect * SDLCALL SDL_GetWindowMouseRect(SDL_Window *window)
  /// ```
  math.Rectangle<double>? getMouseRect() {
    math.Rectangle<double>? result;
    var rectPointer = sdlGetWindowMouseRect(this);
    if (rectPointer != nullptr) {
      result = rectPointer.create();
    }
    return result;
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
  void setOpacity(double opacity) {
    sdlSetWindowOpacity(this, opacity);
  }

  ///
  /// Get the opacity of a window.
  ///
  /// If transparency isn't supported on this platform, opacity will be returned
  /// as 1.0f without error.
  ///
  /// \param window the window to get the current opacity value from.
  /// \returns the opacity, (0.0f - transparent, 1.0f - opaque), or a negative
  /// error code on failure; call SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_SetWindowOpacity
  ///
  /// ```c
  /// extern SDL_DECLSPEC float SDLCALL SDL_GetWindowOpacity(SDL_Window *window)
  /// ```
  double? getOpacity() {
    return sdlGetWindowOpacity(this);
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
  int setModalFor(Pointer<SdlWindow> parentWindow) {
    return sdlSetWindowModalFor(this, parentWindow);
  }

  // sdlSetWindowGammaRamp
  // sdlGetWindowGammaRamp

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
  int setHitTest(Pointer<NativeFunction<SdlHitTest>> callback,
      Pointer<NativeType> callbackData) {
    return sdlSetWindowHitTest(this, callback, callbackData);
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
  int flash(int operation) {
    return sdlFlashWindow(this, operation);
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
  bool destroy() {
    if (this != nullptr) {
      sdlDestroyWindow(this);
      return true;
    }
    return false;
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
  /// \returns the OpenGL context associated with `window` or NULL on failure;
  /// call SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GL_DestroyContext
  /// \sa SDL_GL_MakeCurrent
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_GLContext SDLCALL SDL_GL_CreateContext(SDL_Window *window)
  /// ```
  Pointer<SdlGlContext> glCreateContext() {
    return sdlGlCreateContext(this);
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
  int getDisplayFor() {
    return sdlGetDisplayForWindow(this);
  }

  // lib_sdl_renderer.dart

  ///
  /// Create a 2D rendering context for a window.
  ///
  /// If you want a specific renderer, you can specify its name here. A list of
  /// available renderers can be obtained by calling SDL_GetRenderDriver multiple
  /// times, with indices from 0 to SDL_GetNumRenderDrivers()-1. If you don't
  /// need a specific renderer, specify NULL and SDL will attempt to choose the
  /// best option for you, based on what is available on the user's system.
  ///
  /// By default the rendering size matches the window size in pixels, but you
  /// can call SDL_SetRenderLogicalPresentation() to change the content size and
  /// scaling options.
  ///
  /// \param window the window where rendering is displayed.
  /// \param name the name of the rendering driver to initialize, or NULL to
  /// initialize the first one supporting the requested flags.
  /// \returns a valid rendering context or NULL if there was an error; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_CreateRendererWithProperties
  /// \sa SDL_CreateSoftwareRenderer
  /// \sa SDL_DestroyRenderer
  /// \sa SDL_GetNumRenderDrivers
  /// \sa SDL_GetRenderDriver
  /// \sa SDL_GetRendererName
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Renderer * SDLCALL SDL_CreateRenderer(SDL_Window *window, const char *name)
  /// ```
  Pointer<SdlRenderer> createRenderer({String? name}) {
    return sdlCreateRenderer(this, name);
  }

  ///
  /// Get the renderer associated with a window.
  ///
  /// \param window the window to query.
  /// \returns the rendering context on success or NULL on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Renderer * SDLCALL SDL_GetRenderer(SDL_Window *window)
  /// ```
  Pointer<SdlRenderer> getRenderer() {
    return sdlGetRenderer(this);
  }
}
