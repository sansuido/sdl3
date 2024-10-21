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
  /// SDL_CreateWindow() will fail, because SDL_Vulkan_LoadLibrary() will fail.
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
  /// \sa SDL_CreateWindowAndRenderer
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
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetWindowTitle
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowTitle(SDL_Window *window, const char *title)
  /// ```
  bool setTitle(String title) {
    return sdlSetWindowTitle(this, title);
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
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowIcon(SDL_Window *window, SDL_Surface *icon)
  /// ```
  bool setIcon(Pointer<SdlSurface> icon) {
    return sdlSetWindowIcon(this, icon);
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
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetWindowPosition
  /// \sa SDL_SyncWindow
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowPosition(SDL_Window *window, int x, int y)
  /// ```
  bool setPosition(int x, int y) {
    return sdlSetWindowPosition(this, x, y);
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
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_SetWindowPosition
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetWindowPosition(SDL_Window *window, int *x, int *y)
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
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetWindowSize
  /// \sa SDL_SetWindowFullscreenMode
  /// \sa SDL_SyncWindow
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowSize(SDL_Window *window, int w, int h)
  /// ```
  bool setSize(int w, int h) {
    return sdlSetWindowSize(this, w, h);
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
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetRenderOutputSize
  /// \sa SDL_GetWindowSizeInPixels
  /// \sa SDL_SetWindowSize
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetWindowSize(SDL_Window *window, int *w, int *h)
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
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetWindowSize
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetWindowBordersSize(SDL_Window *window, int *top, int *left, int *bottom, int *right)
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
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_CreateWindow
  /// \sa SDL_GetWindowSize
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetWindowSizeInPixels(SDL_Window *window, int *w, int *h)
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
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetWindowMinimumSize
  /// \sa SDL_SetWindowMaximumSize
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowMinimumSize(SDL_Window *window, int min_w, int min_h)
  /// ```
  bool setMinimumSize(int w, int h) {
    return sdlSetWindowMinimumSize(this, w, h);
  }

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
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetWindowMaximumSize
  /// \sa SDL_SetWindowMinimumSize
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetWindowMinimumSize(SDL_Window *window, int *w, int *h)
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
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetWindowMaximumSize
  /// \sa SDL_SetWindowMinimumSize
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowMaximumSize(SDL_Window *window, int max_w, int max_h)
  /// ```
  bool setMaximumSize(int w, int h) {
    return sdlSetWindowMaximumSize(this, w, h);
  }

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
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetWindowMinimumSize
  /// \sa SDL_SetWindowMaximumSize
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetWindowMaximumSize(SDL_Window *window, int *w, int *h)
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
  /// \param bordered false to remove border, true to add border.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetWindowFlags
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowBordered(SDL_Window *window, bool bordered)
  /// ```
  bool setBordered(bool bordered) {
    return sdlSetWindowBordered(this, bordered);
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
  /// \param resizable true to allow resizing, false to disallow.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetWindowFlags
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowResizable(SDL_Window *window, bool resizable)
  /// ```
  bool setResizable(bool resizable) {
    return sdlSetWindowResizable(this, resizable);
  }

  ///
  /// Set the window to always be above the others.
  ///
  /// This will add or remove the window's `SDL_WINDOW_ALWAYS_ON_TOP` flag. This
  /// will bring the window to the front and keep the window above the rest.
  ///
  /// \param window the window of which to change the always on top state.
  /// \param on_top true to set the window always on top, false to disable.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetWindowFlags
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowAlwaysOnTop(SDL_Window *window, bool on_top)
  /// ```
  bool setAlwaysOnTop(bool onTop) {
    return sdlSetWindowAlwaysOnTop(this, onTop);
  }

  ///
  /// Show a window.
  ///
  /// \param window the window to show.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_HideWindow
  /// \sa SDL_RaiseWindow
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_ShowWindow(SDL_Window *window)
  /// ```
  bool show() {
    return sdlShowWindow(this);
  }

  ///
  /// Hide a window.
  ///
  /// \param window the window to hide.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_ShowWindow
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_HideWindow(SDL_Window *window)
  /// ```
  bool hide() {
    return sdlHideWindow(this);
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
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_RaiseWindow(SDL_Window *window)
  /// ```
  bool raise() {
    return sdlRaiseWindow(this);
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
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_MinimizeWindow
  /// \sa SDL_RestoreWindow
  /// \sa SDL_SyncWindow
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_MaximizeWindow(SDL_Window *window)
  /// ```
  bool maximize() {
    return sdlMaximizeWindow(this);
  }

  ///
  /// Request that the window be minimized to an iconic representation.
  ///
  /// On some windowing systems this request is asynchronous and the new window
  /// state may not have been applied immediately upon the return of this
  /// function. If an immediate change is required, call SDL_SyncWindow() to
  /// block until the changes have taken effect.
  ///
  /// When the window state changes, an SDL_EVENT_WINDOW_MINIMIZED event will be
  /// emitted. Note that, as this is just a request, the windowing system can
  /// deny the state change.
  ///
  /// \param window the window to minimize.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_MaximizeWindow
  /// \sa SDL_RestoreWindow
  /// \sa SDL_SyncWindow
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_MinimizeWindow(SDL_Window *window)
  /// ```
  bool minimize() {
    return sdlMinimizeWindow(this);
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
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_MaximizeWindow
  /// \sa SDL_MinimizeWindow
  /// \sa SDL_SyncWindow
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_RestoreWindow(SDL_Window *window)
  /// ```
  bool restore() {
    return sdlRestoreWindow(this);
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
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetWindowSurface
  /// \sa SDL_UpdateWindowSurfaceRects
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_UpdateWindowSurface(SDL_Window *window)
  /// ```
  bool updateSurface() {
    return sdlUpdateWindowSurface(this);
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
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetWindowSurface
  /// \sa SDL_UpdateWindowSurface
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_UpdateWindowSurfaceRects(SDL_Window *window, const SDL_Rect *rects, int numrects)
  /// ```
  bool updateSurfaceRects(List<math.Rectangle<double>> rects) {
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
  /// \param grabbed this is true to grab keyboard, and false to release.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetWindowKeyboardGrab
  /// \sa SDL_SetWindowMouseGrab
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowKeyboardGrab(SDL_Window *window, bool grabbed)
  /// ```
  bool setKeyboardGrab(bool grabbed) {
    return sdlSetWindowKeyboardGrab(this, grabbed);
  }

  ///
  /// Set a window's mouse grab mode.
  ///
  /// Mouse grab confines the mouse cursor to the window.
  ///
  /// \param window the window for which the mouse grab mode should be set.
  /// \param grabbed this is true to grab mouse, and false to release.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetWindowMouseGrab
  /// \sa SDL_SetWindowKeyboardGrab
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowMouseGrab(SDL_Window *window, bool grabbed)
  /// ```
  bool setMouseGrab(bool grabbed) {
    return sdlSetWindowMouseGrab(this, grabbed);
  }

  ///
  /// Get a window's keyboard grab mode.
  ///
  /// \param window the window to query.
  /// \returns true if keyboard is grabbed, and false otherwise.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_SetWindowKeyboardGrab
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetWindowKeyboardGrab(SDL_Window *window)
  /// ```
  bool getKeyboardGrab() {
    return sdlGetWindowKeyboardGrab(this);
  }

  ///
  /// Get a window's mouse grab mode.
  ///
  /// \param window the window to query.
  /// \returns true if mouse is grabbed, and false otherwise.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_SetWindowKeyboardGrab
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetWindowMouseGrab(SDL_Window *window)
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
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetWindowMouseRect
  /// \sa SDL_SetWindowMouseGrab
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowMouseRect(SDL_Window *window, const SDL_Rect *rect)
  /// ```
  bool setMouseRect(math.Rectangle<double> rect) {
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
  /// This function also returns false if setting the opacity isn't supported.
  ///
  /// \param window the window which will be made transparent or opaque.
  /// \param opacity the opacity value (0.0f - transparent, 1.0f - opaque).
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetWindowOpacity
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowOpacity(SDL_Window *window, float opacity)
  /// ```
  bool setOpacity(double opacity) {
    return sdlSetWindowOpacity(this, opacity);
  }

  ///
  /// Get the opacity of a window.
  ///
  /// If transparency isn't supported on this platform, opacity will be returned
  /// as 1.0f without error.
  ///
  /// \param window the window to get the current opacity value from.
  /// \returns the opacity, (0.0f - transparent, 1.0f - opaque), or -1.0f on
  /// failure; call SDL_GetError() for more information.
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
  /// Set the window as a child of a parent window.
  ///
  /// If the window is already the child of an existing window, it will be
  /// reparented to the new owner. Setting the parent window to NULL unparents
  /// the window and removes child window status.
  ///
  /// If a parent window is hidden or destroyed, the operation will be
  /// recursively applied to child windows. Child windows hidden with the parent
  /// that did not have their hidden status explicitly set will be restored when
  /// the parent is shown.
  ///
  /// Attempting to set the parent of a window that is currently in the modal
  /// state will fail. Use SDL_SetWindowModal() to cancel the modal status before
  /// attempting to change the parent.
  ///
  /// Popup windows cannot change parents and attempts to do so will fail.
  ///
  /// Setting a parent window that is currently the sibling or descendent of the
  /// child window results in undefined behavior.
  ///
  /// \param window the window that should become the child of a parent.
  /// \param parent the new parent window for the child window.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_SetWindowModal
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowParent(SDL_Window *window, SDL_Window *parent)
  /// ```
  bool setWindowParent(Pointer<SdlWindow> parent) {
    return sdlSetWindowParent(this, parent);
  }

  ///
  /// Toggle the state of the window as modal.
  ///
  /// To enable modal status on a window, the window must currently be the child
  /// window of a parent, or toggling modal status on will fail.
  ///
  /// \param window the window on which to set the modal state.
  /// \param modal true to toggle modal status on, false to toggle it off.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_SetWindowParent
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowModal(SDL_Window *window, bool modal)
  /// ```
  bool setWindowModal(bool modal) {
    return sdlSetWindowModal(this, modal);
  }

  ///
  /// Set whether the window may have input focus.
  ///
  /// \param window the window to set focusable state.
  /// \param focusable true to allow input focus, false to not allow input focus.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowFocusable(SDL_Window *window, bool focusable)
  /// ```
  bool setWindowFocasable(bool focusable) {
    return sdlSetWindowFocusable(this, focusable);
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
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_ShowWindowSystemMenu(SDL_Window *window, int x, int y)
  /// ```
  bool showWindowSystemMenu(int x, int y) {
    return sdlShowWindowSystemMenu(this, x, y);
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
  /// Platforms that don't support this functionality will return false
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
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowHitTest(SDL_Window *window, SDL_HitTest callback, void *callback_data)
  /// ```
  bool setHitTest(Pointer<NativeFunction<SdlHitTest>> callback,
      Pointer<NativeType> callbackData) {
    return sdlSetWindowHitTest(this, callback, callbackData);
  }

  ///
  /// Request a window to demand attention from the user.
  ///
  /// \param window the window to be flashed.
  /// \param operation the operation to perform.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_FlashWindow(SDL_Window *window, SDL_FlashOperation operation)
  /// ```
  bool flash(int operation) {
    return sdlFlashWindow(this, operation);
  }

  ///
  /// Destroy a window.
  ///
  /// Any child windows owned by the window will be recursively destroyed as
  /// well.
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
  /// \threadsafety You may only call this function from the main thread.
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
  /// \threadsafety It is safe to call this function from any thread.
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
