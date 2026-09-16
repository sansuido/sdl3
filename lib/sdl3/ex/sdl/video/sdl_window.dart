part of '../../../sdl.dart';

extension SdlWindowEx on SdlWindow {
  // lib_sdl_video.dart

  ///
  /// Create a window with the specified dimensions and flags.
  ///
  /// The window size is a request and may be different than expected based on
  /// the desktop layout and window manager policies. Your application should be
  /// prepared to handle a window of any size.
  ///
  /// `flags` may be any of the following OR'd together:
  ///
  /// - `SDL_WINDOW_FULLSCREEN`: fullscreen window at desktop resolution
  /// - `SDL_WINDOW_OPENGL`: window usable with an OpenGL context
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
  /// The SDL_Window will be shown if SDL_WINDOW_HIDDEN is not set. If hidden at
  /// creation time, SDL_ShowWindow() can be used to show it later.
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
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_CreateWindowAndRenderer
  /// \sa SDL_CreatePopupWindow
  /// \sa SDL_CreateWindowWithProperties
  /// \sa SDL_DestroyWindow
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Window * SDLCALL SDL_CreateWindow(const char *title, int w, int h, SDL_WindowFlags flags)
  /// ```
  ///
  /// See also:
  /// - [SDL_CreateWindow - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_CreateWindow)
  ///
  /// {@category video}
  static Pointer<SdlWindow> create({
    required String title,
    required int w,
    required int h,
    int flags = 0,
  }) => sdlCreateWindow(title, w, h, flags);
}

extension SdlWindowPointerEx on Pointer<SdlWindow> {
  ///
  /// Get the display associated with a window.
  ///
  /// \param window the window to query.
  /// \returns the instance ID of the display containing the center of the window
  /// on success or 0 on failure; call SDL_GetError() for more
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
  /// extern SDL_DECLSPEC SDL_DisplayID SDLCALL SDL_GetDisplayForWindow(SDL_Window *window)
  /// ```
  ///
  /// See also:
  /// - [SDL_GetDisplayForWindow - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetDisplayForWindow)
  ///
  /// {@category video}
  int getDisplayFor() => sdlGetDisplayForWindow(this);

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
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetWindowDisplayScale
  ///
  /// ```c
  /// extern SDL_DECLSPEC float SDLCALL SDL_GetWindowPixelDensity(SDL_Window *window)
  /// ```
  ///
  /// See also:
  /// - [SDL_GetWindowPixelDensity - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetWindowPixelDensity)
  ///
  /// {@category video}
  double getPixelDensity() => sdlGetWindowPixelDensity(this);

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
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC float SDLCALL SDL_GetWindowDisplayScale(SDL_Window *window)
  /// ```
  ///
  /// See also:
  /// - [SDL_GetWindowDisplayScale - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetWindowDisplayScale)
  ///
  /// {@category video}
  double getDisplayScale() => sdlGetWindowDisplayScale(this);

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
  ///
  /// See also:
  /// - [SDL_SetWindowFullscreenMode - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetWindowFullscreenMode)
  ///
  /// {@category video}
  bool sdlSetWindowFullscreenMode(SdlxDisplayMode mode) =>
      sdlxSetWindowFullscreenMode(this, mode);

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
  ///
  /// See also:
  /// - [SDL_GetWindowFullscreenMode - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetWindowFullscreenMode)
  ///
  /// {@category video}
  SdlxDisplayMode? getFullscreenMode() => sdlxGetWindowFullscreenMode(this);

  ///
  /// Get the raw ICC profile data for the screen the window is currently on.
  ///
  /// \param window the window to query.
  /// \param size the size of the ICC profile.
  /// \returns the raw ICC profile data on success or NULL on failure; call
  /// SDL_GetError() for more information. This should be freed with
  /// SDL_free() when it is no longer needed.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void * SDLCALL SDL_GetWindowICCProfile(SDL_Window *window, size_t *size)
  /// ```
  ///
  /// See also:
  /// - [SDL_GetWindowICCProfile - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetWindowICCProfile)
  ///
  /// {@category video}
  ({Pointer<Void> profile, int size})? getIccProfile() =>
      sdlxGetWindowIccProfile(this);

  ///
  /// Get the pixel format associated with the window.
  ///
  /// \param window the window to query.
  /// \returns the pixel format of the window on success or
  /// SDL_PIXELFORMAT_UNKNOWN on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_PixelFormat SDLCALL SDL_GetWindowPixelFormat(SDL_Window *window)
  /// ```
  ///
  /// See also:
  /// - [SDL_GetWindowPixelFormat - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetWindowPixelFormat)
  ///
  /// {@category video}
  int getPixelFormat() => sdlGetWindowPixelFormat(this);

  ///
  /// Create a child popup window of the specified parent window.
  ///
  /// The window size is a request and may be different than expected based on
  /// the desktop layout and window manager policies. Your application should be
  /// prepared to handle a window of any size.
  ///
  /// The flags parameter **must** contain at least one of the following:
  ///
  /// - `SDL_WINDOW_TOOLTIP`: The popup window is a tooltip and will not pass any
  /// input events.
  /// - `SDL_WINDOW_POPUP_MENU`: The popup window is a popup menu. The topmost
  /// popup menu will implicitly gain the keyboard focus.
  ///
  /// The following flags are not relevant to popup window creation and will be
  /// ignored:
  ///
  /// - `SDL_WINDOW_MINIMIZED`
  /// - `SDL_WINDOW_MAXIMIZED`
  /// - `SDL_WINDOW_FULLSCREEN`
  /// - `SDL_WINDOW_BORDERLESS`
  ///
  /// The following flags are incompatible with popup window creation and will
  /// cause it to fail:
  ///
  /// - `SDL_WINDOW_UTILITY`
  /// - `SDL_WINDOW_MODAL`
  ///
  /// The parent parameter **must** be non-null and a valid window. The parent of
  /// a popup window can be either a regular, toplevel window, or another popup
  /// window.
  ///
  /// Popup windows cannot be minimized, maximized, made fullscreen, raised,
  /// flash, be made a modal window, be the parent of a toplevel window, or grab
  /// the mouse and/or keyboard. Attempts to do so will fail.
  ///
  /// Popup windows implicitly do not have a border/decorations and do not appear
  /// on the taskbar/dock or in lists of windows such as alt-tab menus.
  ///
  /// By default, popup window positions will automatically be constrained to
  /// keep the entire window within display bounds. This can be overridden with
  /// the `SDL_PROP_WINDOW_CREATE_CONSTRAIN_POPUP_BOOLEAN` property.
  ///
  /// By default, popup menus will automatically grab keyboard focus from the
  /// parent when shown. This behavior can be overridden by setting the
  /// `SDL_WINDOW_NOT_FOCUSABLE` flag, setting the
  /// `SDL_PROP_WINDOW_CREATE_FOCUSABLE_BOOLEAN` property to false, or toggling
  /// it after creation via the `SDL_SetWindowFocusable()` function.
  ///
  /// If a parent window is hidden or destroyed, any child popup windows will be
  /// recursively hidden or destroyed as well. Child popup windows not explicitly
  /// hidden will be restored when the parent is shown.
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
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_CreateWindow
  /// \sa SDL_CreateWindowWithProperties
  /// \sa SDL_DestroyWindow
  /// \sa SDL_GetWindowParent
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Window * SDLCALL SDL_CreatePopupWindow(SDL_Window *parent, int offset_x, int offset_y, int w, int h, SDL_WindowFlags flags)
  /// ```
  ///
  /// See also:
  /// - [SDL_CreatePopupWindow - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_CreatePopupWindow)
  ///
  /// {@category video}
  Pointer<SdlWindow> createPopupWindow(
    int offsetX,
    int offsetY,
    int w,
    int h,
    int flags,
  ) => sdlCreatePopupWindow(this, offsetX, offsetY, w, h, flags);

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
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetWindowFromID
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_WindowID SDLCALL SDL_GetWindowID(SDL_Window *window)
  /// ```
  ///
  /// See also:
  /// - [SDL_GetWindowID - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetWindowID)
  ///
  /// {@category video}
  int getId() => sdlGetWindowId(this);

  ///
  /// Get parent of a window.
  ///
  /// \param window the window to query.
  /// \returns the parent of the window on success or NULL if the window has no
  /// parent.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_CreatePopupWindow
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Window * SDLCALL SDL_GetWindowParent(SDL_Window *window)
  /// ```
  ///
  /// See also:
  /// - [SDL_GetWindowParent - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetWindowParent)
  ///
  /// {@category video}
  Pointer<SdlWindow> getParent() => sdlGetWindowParent(this);

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
  /// associated with metal views on the window
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
  /// associated with metal views on the window
  ///
  /// On OpenVR:
  ///
  /// - `SDL_PROP_WINDOW_OPENVR_OVERLAY_ID_NUMBER`: the OpenVR Overlay Handle ID
  /// for the associated overlay window.
  ///
  /// On QNX:
  ///
  /// - `SDL_PROP_WINDOW_QNX_WINDOW_POINTER`: the screen_window_t associated with
  /// the window.
  /// - `SDL_PROP_WINDOW_QNX_SURFACE_POINTER`: the EGLSurface associated with the
  /// window
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
  /// - `SDL_PROP_WINDOW_WAYLAND_VIEWPORT_POINTER`: the wp_viewport associated
  /// with the window
  /// - `SDL_PROP_WINDOW_WAYLAND_EGL_WINDOW_POINTER`: the wl_egl_window
  /// associated with the window
  /// - `SDL_PROP_WINDOW_WAYLAND_WINDOW_ID_STRING`: the window identification
  /// string, initially set with
  /// SDL_PROP_WINDOW_CREATE_WAYLAND_WINDOW_ID_STRING, and used as an
  /// identifier for session management. Setting this to null or an empty
  /// string ("") before hiding or destroying the window will cause any session
  /// information associated with the window to be removed
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
  /// On Emscripten:
  ///
  /// - `SDL_PROP_WINDOW_EMSCRIPTEN_CANVAS_ID_STRING`: the id the canvas element
  /// will have
  /// - `SDL_PROP_WINDOW_EMSCRIPTEN_KEYBOARD_ELEMENT_STRING`: the keyboard
  /// element that associates keyboard events to this window
  ///
  /// On visionOS:
  ///
  /// - `SDL_PROP_WINDOW_VISIONOS_SETTINGS_STRING`: the current settings of the
  /// window in JSON format, or NULL if the window has standard UIKit behavior.
  /// SDL_EVENT_WINDOW_SETTINGS_CHANGED is sent when this value changes.
  ///
  /// \param window the window to query.
  /// \returns a valid property ID on success or 0 on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_PropertiesID SDLCALL SDL_GetWindowProperties(SDL_Window *window)
  /// ```
  ///
  /// See also:
  /// - [SDL_GetWindowProperties - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetWindowProperties)
  ///
  /// {@category video}
  int getProperties() => sdlGetWindowProperties(this);

  ///
  /// Get the window flags.
  ///
  /// \param window the window to query.
  /// \returns a mask of the SDL_WindowFlags associated with `window`.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_CreateWindow
  /// \sa SDL_HideWindow
  /// \sa SDL_MaximizeWindow
  /// \sa SDL_MinimizeWindow
  /// \sa SDL_SetWindowFullscreen
  /// \sa SDL_SetWindowMouseGrab
  /// \sa SDL_SetWindowFillDocument
  /// \sa SDL_ShowWindow
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_WindowFlags SDLCALL SDL_GetWindowFlags(SDL_Window *window)
  /// ```
  ///
  /// See also:
  /// - [SDL_GetWindowFlags - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetWindowFlags)
  ///
  /// {@category video}
  int getFlags() => sdlGetWindowFlags(this);

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
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetWindowTitle
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowTitle(SDL_Window *window, const char *title)
  /// ```
  ///
  /// See also:
  /// - [SDL_SetWindowTitle - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetWindowTitle)
  ///
  /// {@category video}
  bool setTitle(String title) => sdlSetWindowTitle(this, title);

  ///
  /// Get the title of a window.
  ///
  /// \param window the window to query.
  /// \returns the title of the window in UTF-8 format or "" if there is no
  /// title.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_SetWindowTitle
  ///
  /// ```c
  /// extern SDL_DECLSPEC const char * SDLCALL SDL_GetWindowTitle(SDL_Window *window)
  /// ```
  ///
  /// See also:
  /// - [SDL_GetWindowTitle - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetWindowTitle)
  ///
  /// {@category video}
  String? getTitle() => sdlGetWindowTitle(this);

  ///
  /// Set the icon for a window.
  ///
  /// If this function is passed a surface with alternate representations added
  /// using SDL_AddSurfaceAlternateImage(), the surface will be interpreted as
  /// the content to be used for 100% display scale, and the alternate
  /// representations will be used for high DPI situations. For example, if the
  /// original surface is 32x32, then on a 2x macOS display or 200% display scale
  /// on Windows, a 64x64 version of the image will be used, if available. If a
  /// matching version of the image isn't available, the closest larger size
  /// image will be downscaled to the appropriate size and be used instead, if
  /// available. Otherwise, the closest smaller image will be upscaled and be
  /// used instead.
  ///
  /// \param window the window to change.
  /// \param icon an SDL_Surface structure containing the icon for the window.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_AddSurfaceAlternateImage
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowIcon(SDL_Window *window, SDL_Surface *icon)
  /// ```
  ///
  /// See also:
  /// - [SDL_SetWindowIcon - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetWindowIcon)
  ///
  /// {@category video}
  bool setIcon(Pointer<SdlSurface> icon) => sdlSetWindowIcon(this, icon);

  ///
  /// Request that the window's position be set.
  ///
  /// If the window is in an exclusive fullscreen or maximized state, this
  /// request has no effect.
  ///
  /// This can be used to reposition fullscreen-desktop windows onto a different
  /// display, however, as exclusive fullscreen windows are locked to a specific
  /// display, they can only be repositioned programmatically via
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
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetWindowPosition
  /// \sa SDL_SyncWindow
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowPosition(SDL_Window *window, int x, int y)
  /// ```
  ///
  /// See also:
  /// - [SDL_SetWindowPosition - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetWindowPosition)
  ///
  /// {@category video}
  bool setPosition(int x, int y) => sdlSetWindowPosition(this, x, y);

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
  ///
  /// See also:
  /// - [SDL_GetWindowPosition - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetWindowPosition)
  ///
  /// {@category video}
  ({int x, int y})? getPosition() => sdlxGetWindowPosition(this);

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
  ///
  /// See also:
  /// - [SDL_SetWindowSize - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetWindowSize)
  ///
  /// {@category video}
  bool setSize(int w, int h) => sdlSetWindowSize(this, w, h);

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
  ///
  /// See also:
  /// - [SDL_GetWindowSize - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetWindowSize)
  ///
  /// {@category video}
  ({int w, int h})? getSize() => sdlxGetWindowSize(this);

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
  ///
  /// See also:
  /// - [SDL_GetWindowSafeArea - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetWindowSafeArea)
  ///
  /// {@category video}
  SdlxRect? getSafeArea() => sdlxGetWindowSafeArea(this);

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
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetWindowAspectRatio
  /// \sa SDL_SyncWindow
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowAspectRatio(SDL_Window *window, float min_aspect, float max_aspect)
  /// ```
  ///
  /// See also:
  /// - [SDL_SetWindowAspectRatio - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetWindowAspectRatio)
  ///
  /// {@category video}
  bool setAspectRatio(double minAspect, double maxAspect) =>
      sdlSetWindowAspectRatio(this, minAspect, maxAspect);

  ///
  /// Get the aspect ratio of a window's client area.
  ///
  /// \param window the window to query the width and height from.
  /// \param min_aspect a pointer filled in with the minimum aspect ratio of the
  /// window, may be NULL.
  /// \param max_aspect a pointer filled in with the maximum aspect ratio of the
  /// window, may be NULL.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_SetWindowAspectRatio
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetWindowAspectRatio(SDL_Window *window, float *min_aspect, float *max_aspect)
  /// ```
  ///
  /// See also:
  /// - [SDL_GetWindowAspectRatio - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetWindowAspectRatio)
  ///
  /// {@category video}
  ({double minAspect, double maxAspect})? getAspectRatio() =>
      sdlxGetWindowAspectRatio(this);

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
  ///
  /// See also:
  /// - [SDL_GetWindowBordersSize - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetWindowBordersSize)
  ///
  /// {@category video}
  ({int top, int left, int bottom, int right})? getBordersSize() =>
      sdlxGetWindowBordersSize(this);

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
  ///
  /// See also:
  /// - [SDL_GetWindowSizeInPixels - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetWindowSizeInPixels)
  ///
  /// {@category video}
  ({int w, int h})? getSizeInPixels() => sdlxGetWindowSizeInPixels(this);

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
  ///
  /// See also:
  /// - [SDL_SetWindowMinimumSize - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetWindowMinimumSize)
  ///
  /// {@category video}
  bool setMinimumSize(int w, int h) => sdlSetWindowMinimumSize(this, w, h);

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
  ///
  /// See also:
  /// - [SDL_GetWindowMinimumSize - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetWindowMinimumSize)
  ///
  /// {@category video}
  ({int w, int h})? getMinimumSize() => sdlxGetWindowMinimumSize(this);

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
  ///
  /// See also:
  /// - [SDL_SetWindowMaximumSize - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetWindowMaximumSize)
  ///
  /// {@category video}
  bool setMaximumSize(int w, int h) => sdlSetWindowMaximumSize(this, w, h);

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
  ///
  /// See also:
  /// - [SDL_GetWindowMaximumSize - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetWindowMaximumSize)
  ///
  /// {@category video}
  ({int w, int h})? getMaximumSize() => sdlxGetWindowMaximumSize(this);

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
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetWindowFlags
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowBordered(SDL_Window *window, bool bordered)
  /// ```
  ///
  /// See also:
  /// - [SDL_SetWindowBordered - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetWindowBordered)
  ///
  /// {@category video}
  bool setBordered(bool bordered) => sdlSetWindowBordered(this, bordered);

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
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetWindowFlags
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowResizable(SDL_Window *window, bool resizable)
  /// ```
  ///
  /// See also:
  /// - [SDL_SetWindowResizable - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetWindowResizable)
  ///
  /// {@category video}
  bool setResizable(bool resizable) => sdlSetWindowResizable(this, resizable);

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
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetWindowFlags
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowAlwaysOnTop(SDL_Window *window, bool on_top)
  /// ```
  ///
  /// See also:
  /// - [SDL_SetWindowAlwaysOnTop - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetWindowAlwaysOnTop)
  ///
  /// {@category video}
  bool setAlwaysOnTop(bool onTop) => sdlSetWindowAlwaysOnTop(this, onTop);

  ///
  /// Set the window to fill the current document space (Emscripten only).
  ///
  /// This will add or remove the window's `SDL_WINDOW_FILL_DOCUMENT` flag.
  ///
  /// Currently this flag only applies to the Emscripten target.
  ///
  /// When enabled, the canvas element fills the entire document. Resize events
  /// will be generated as the browser window is resized, as that will adjust the
  /// canvas size as well. The canvas will cover anything else on the page,
  /// including any controls provided by Emscripten in its generated HTML file
  /// (in fact, any elements on the page that aren't the canvas will be moved
  /// into a hidden `div` element).
  ///
  /// Often times this is desirable for a browser-based game, but it means
  /// several things that we expect of an SDL window on other platforms might not
  /// work as expected, such as minimum window sizes and aspect ratios.
  ///
  /// \param window the window of which to change the fill-document state.
  /// \param fill true to set the window to fill the document, false to disable.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.4.0.
  ///
  /// \sa SDL_GetWindowFlags
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowFillDocument(SDL_Window *window, bool fill)
  /// ```
  ///
  /// See also:
  /// - [SDL_SetWindowFillDocument - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetWindowFillDocument)
  ///
  /// {@category video}
  bool setFillDocument(bool fill) => sdlSetWindowFillDocument(this, fill);

  ///
  /// Show a window.
  ///
  /// \param window the window to show.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_HideWindow
  /// \sa SDL_RaiseWindow
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_ShowWindow(SDL_Window *window)
  /// ```
  ///
  /// See also:
  /// - [SDL_ShowWindow - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_ShowWindow)
  ///
  /// {@category video}
  bool show() => sdlShowWindow(this);

  ///
  /// Hide a window.
  ///
  /// \param window the window to hide.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_ShowWindow
  /// \sa SDL_WINDOW_HIDDEN
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_HideWindow(SDL_Window *window)
  /// ```
  ///
  /// See also:
  /// - [SDL_HideWindow - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_HideWindow)
  ///
  /// {@category video}
  bool hide() => sdlHideWindow(this);

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
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_RaiseWindow(SDL_Window *window)
  /// ```
  ///
  /// See also:
  /// - [SDL_RaiseWindow - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_RaiseWindow)
  ///
  /// {@category video}
  bool raise() => sdlRaiseWindow(this);

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
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_MinimizeWindow
  /// \sa SDL_RestoreWindow
  /// \sa SDL_SyncWindow
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_MaximizeWindow(SDL_Window *window)
  /// ```
  ///
  /// See also:
  /// - [SDL_MaximizeWindow - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_MaximizeWindow)
  ///
  /// {@category video}
  bool maximize() => sdlMaximizeWindow(this);

  ///
  /// Request that the window be minimized to an iconic representation.
  ///
  /// If the window is in a fullscreen state, this request has no direct effect.
  /// It may alter the state the window is returned to when leaving fullscreen.
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
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_MaximizeWindow
  /// \sa SDL_RestoreWindow
  /// \sa SDL_SyncWindow
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_MinimizeWindow(SDL_Window *window)
  /// ```
  ///
  /// See also:
  /// - [SDL_MinimizeWindow - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_MinimizeWindow)
  ///
  /// {@category video}
  bool minimize() => sdlMinimizeWindow(this);

  ///
  /// Request that the size and position of a minimized or maximized window be
  /// restored.
  ///
  /// If the window is in a fullscreen state, this request has no direct effect.
  /// It may alter the state the window is returned to when leaving fullscreen.
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
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_MaximizeWindow
  /// \sa SDL_MinimizeWindow
  /// \sa SDL_SyncWindow
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_RestoreWindow(SDL_Window *window)
  /// ```
  ///
  /// See also:
  /// - [SDL_RestoreWindow - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_RestoreWindow)
  ///
  /// {@category video}
  bool restore() => sdlRestoreWindow(this);

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
  /// \param fullscreen true for fullscreen mode, false for windowed mode.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetWindowFullscreenMode
  /// \sa SDL_SetWindowFullscreenMode
  /// \sa SDL_SyncWindow
  /// \sa SDL_WINDOW_FULLSCREEN
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowFullscreen(SDL_Window *window, bool fullscreen)
  /// ```
  ///
  /// See also:
  /// - [SDL_SetWindowFullscreen - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetWindowFullscreen)
  ///
  /// {@category video}
  bool setFullscreen(bool fullscreen) =>
      sdlSetWindowFullscreen(this, fullscreen);

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
  /// \returns true on success or false if the operation timed out before the
  /// window was in the requested state.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
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
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SyncWindow(SDL_Window *window)
  /// ```
  ///
  /// See also:
  /// - [SDL_SyncWindow - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SyncWindow)
  ///
  /// {@category video}
  bool sync() => sdlSyncWindow(this);

  ///
  /// Return whether the window has a surface associated with it.
  ///
  /// \param window the window to query.
  /// \returns true if there is a surface associated with the window, or false
  /// otherwise.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetWindowSurface
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_WindowHasSurface(SDL_Window *window)
  /// ```
  ///
  /// See also:
  /// - [SDL_WindowHasSurface - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_WindowHasSurface)
  ///
  /// {@category video}
  bool hasSurface() => sdlWindowHasSurface(this);

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
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_DestroyWindowSurface
  /// \sa SDL_WindowHasSurface
  /// \sa SDL_UpdateWindowSurface
  /// \sa SDL_UpdateWindowSurfaceRects
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL SDL_GetWindowSurface(SDL_Window *window)
  /// ```
  ///
  /// See also:
  /// - [SDL_GetWindowSurface - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetWindowSurface)
  ///
  /// {@category video}
  Pointer<SdlSurface> getSurface() => sdlGetWindowSurface(this);

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
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetWindowSurfaceVSync
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowSurfaceVSync(SDL_Window *window, int vsync)
  /// ```
  ///
  /// See also:
  /// - [SDL_SetWindowSurfaceVSync - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetWindowSurfaceVSync)
  ///
  /// {@category video}
  bool setSurfaceVSync(int vsync) => sdlSetWindowSurfaceVSync(this, vsync);

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
  ///
  /// See also:
  /// - [SDL_GetWindowSurfaceVSync - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetWindowSurfaceVSync)
  ///
  /// {@category video}
  int? getSurfaceVSync() => sdlxGetWindowSurfaceVSync(this);

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
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetWindowSurface
  /// \sa SDL_UpdateWindowSurfaceRects
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_UpdateWindowSurface(SDL_Window *window)
  /// ```
  ///
  /// See also:
  /// - [SDL_UpdateWindowSurface - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_UpdateWindowSurface)
  ///
  /// {@category video}
  bool updateSurface() => sdlUpdateWindowSurface(this);

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
  ///
  /// See also:
  /// - [SDL_UpdateWindowSurfaceRects - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_UpdateWindowSurfaceRects)
  ///
  /// {@category video}
  bool updateSurfaceRects(List<SdlxRect> rects) =>
      sdlxUpdateWindowSurfaceRects(this, rects);

  ///
  /// Destroy the surface associated with the window.
  ///
  /// \param window the window to update.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetWindowSurface
  /// \sa SDL_WindowHasSurface
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_DestroyWindowSurface(SDL_Window *window)
  /// ```
  ///
  /// See also:
  /// - [SDL_DestroyWindowSurface - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_DestroyWindowSurface)
  ///
  /// {@category video}
  bool destroySurface() => sdlDestroyWindowSurface(this);

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
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetWindowKeyboardGrab
  /// \sa SDL_SetWindowMouseGrab
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowKeyboardGrab(SDL_Window *window, bool grabbed)
  /// ```
  ///
  /// See also:
  /// - [SDL_SetWindowKeyboardGrab - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetWindowKeyboardGrab)
  ///
  /// {@category video}
  bool setKeyboardGrab(bool grabbed) => sdlSetWindowKeyboardGrab(this, grabbed);

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
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetWindowMouseRect
  /// \sa SDL_SetWindowMouseRect
  /// \sa SDL_SetWindowKeyboardGrab
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowMouseGrab(SDL_Window *window, bool grabbed)
  /// ```
  ///
  /// See also:
  /// - [SDL_SetWindowMouseGrab - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetWindowMouseGrab)
  ///
  /// {@category video}
  bool setMouseGrab(bool grabbed) => sdlSetWindowMouseGrab(this, grabbed);

  ///
  /// Get a window's keyboard grab mode.
  ///
  /// \param window the window to query.
  /// \returns true if keyboard is grabbed, and false otherwise.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_SetWindowKeyboardGrab
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetWindowKeyboardGrab(SDL_Window *window)
  /// ```
  ///
  /// See also:
  /// - [SDL_GetWindowKeyboardGrab - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetWindowKeyboardGrab)
  ///
  /// {@category video}
  bool getKeyboardGrab() => sdlGetWindowKeyboardGrab(this);

  ///
  /// Get a window's mouse grab mode.
  ///
  /// \param window the window to query.
  /// \returns true if mouse is grabbed, and false otherwise.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetWindowMouseRect
  /// \sa SDL_SetWindowMouseRect
  /// \sa SDL_SetWindowMouseGrab
  /// \sa SDL_SetWindowKeyboardGrab
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetWindowMouseGrab(SDL_Window *window)
  /// ```
  ///
  /// See also:
  /// - [SDL_GetWindowMouseGrab - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetWindowMouseGrab)
  ///
  /// {@category video}
  bool getMouseGrab() => sdlGetWindowMouseGrab(this);

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
  ///
  /// See also:
  /// - [SDL_SetWindowMouseRect - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetWindowMouseRect)
  ///
  /// {@category video}
  bool setMouseRect(SdlxRect rect) => sdlxSetWindowMouseRect(this, rect);

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
  ///
  /// See also:
  /// - [SDL_GetWindowMouseRect - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetWindowMouseRect)
  ///
  /// {@category video}
  SdlxRect? getMouseRect() => sdlxGetWindowMouseRect(this);

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
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetWindowOpacity
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowOpacity(SDL_Window *window, float opacity)
  /// ```
  ///
  /// See also:
  /// - [SDL_SetWindowOpacity - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetWindowOpacity)
  ///
  /// {@category video}
  bool setOpacity(double opacity) => sdlSetWindowOpacity(this, opacity);

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
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_SetWindowOpacity
  ///
  /// ```c
  /// extern SDL_DECLSPEC float SDLCALL SDL_GetWindowOpacity(SDL_Window *window)
  /// ```
  ///
  /// See also:
  /// - [SDL_GetWindowOpacity - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetWindowOpacity)
  ///
  /// {@category video}
  double getOpacity() => sdlGetWindowOpacity(this);

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
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_SetWindowModal
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowParent(SDL_Window *window, SDL_Window *parent)
  /// ```
  ///
  /// See also:
  /// - [SDL_SetWindowParent - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetWindowParent)
  ///
  /// {@category video}
  bool setParent(Pointer<SdlWindow> parent) => sdlSetWindowParent(this, parent);

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
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_SetWindowParent
  /// \sa SDL_WINDOW_MODAL
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowModal(SDL_Window *window, bool modal)
  /// ```
  ///
  /// See also:
  /// - [SDL_SetWindowModal - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetWindowModal)
  ///
  /// {@category video}
  bool setModal(bool modal) => sdlSetWindowModal(this, modal);

  ///
  /// Set whether the window may have input focus.
  ///
  /// \param window the window to set focusable state.
  /// \param focusable true to allow input focus, false to not allow input focus.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowFocusable(SDL_Window *window, bool focusable)
  /// ```
  ///
  /// See also:
  /// - [SDL_SetWindowFocusable - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetWindowFocusable)
  ///
  /// {@category video}
  bool setFocasable(bool focusable) => sdlSetWindowFocusable(this, focusable);

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
  ///
  /// See also:
  /// - [SDL_ShowWindowSystemMenu - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_ShowWindowSystemMenu)
  ///
  /// {@category video}
  bool showSystemMenu(int x, int y) => sdlShowWindowSystemMenu(this, x, y);

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
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowHitTest(SDL_Window *window, SDL_HitTest callback, void *callback_data)
  /// ```
  ///
  /// See also:
  /// - [SDL_SetWindowHitTest - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetWindowHitTest)
  ///
  /// {@category video}
  bool setHitTest(
    Pointer<NativeFunction<SdlHitTest>> callback,
    Pointer<Void> callbackData,
  ) => sdlSetWindowHitTest(this, callback, callbackData);

  ///
  /// Set the shape of a transparent window.
  ///
  /// This sets the alpha channel of a transparent window and any fully
  /// transparent areas are also transparent to mouse clicks. If you are using
  /// something besides the SDL render API, then you are responsible for drawing
  /// the alpha channel of the window to match the shape alpha channel to get
  /// consistent cross-platform results.
  ///
  /// The shape is copied inside this function, so you can free it afterwards. If
  /// your shape surface changes, you should call SDL_SetWindowShape() again to
  /// update the window. This is an expensive operation, so should be done
  /// sparingly.
  ///
  /// The window must have been created with the SDL_WINDOW_TRANSPARENT flag.
  ///
  /// \param window the window.
  /// \param shape the surface representing the shape of the window, or NULL to
  /// remove any current shape.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowShape(SDL_Window *window, SDL_Surface *shape)
  /// ```
  ///
  /// See also:
  /// - [SDL_SetWindowShape - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetWindowShape)
  ///
  /// {@category video}
  bool setShape(Pointer<SdlSurface> shape) => sdlSetWindowShape(this, shape);

  ///
  /// Request a window to demand attention from the user.
  ///
  /// \param window the window to be flashed.
  /// \param operation the operation to perform.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_FlashWindow(SDL_Window *window, SDL_FlashOperation operation)
  /// ```
  ///
  /// See also:
  /// - [SDL_FlashWindow - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_FlashWindow)
  ///
  /// {@category video}
  bool flash(int operation) => sdlFlashWindow(this, operation);

  ///
  /// Sets the state of the progress bar for the given windowâs taskbar icon.
  ///
  /// \param window the window whose progress state is to be modified.
  /// \param state the progress state. `SDL_PROGRESS_STATE_NONE` stops displaying
  /// the progress bar.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.4.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowProgressState(SDL_Window *window, SDL_ProgressState state)
  /// ```
  ///
  /// See also:
  /// - [SDL_SetWindowProgressState - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetWindowProgressState)
  ///
  /// {@category video}
  bool setProgressState(int state) => sdlSetWindowProgressState(this, state);

  ///
  /// Get the state of the progress bar for the given windowâs taskbar icon.
  ///
  /// \param window the window to get the current progress state from.
  /// \returns the progress state, or `SDL_PROGRESS_STATE_INVALID` on failure;
  /// call SDL_GetError() for more information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.4.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_ProgressState SDLCALL SDL_GetWindowProgressState(SDL_Window *window)
  /// ```
  ///
  /// See also:
  /// - [SDL_GetWindowProgressState - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetWindowProgressState)
  ///
  /// {@category video}
  int getProgressState() => sdlGetWindowProgressState(this);

  ///
  /// Sets the value of the progress bar for the given windowâs taskbar icon.
  ///
  /// \param window the window whose progress value is to be modified.
  /// \param value the progress value in the range of [0.0f - 1.0f]. If the value
  /// is outside the valid range, it gets clamped.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.4.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetWindowProgressValue(SDL_Window *window, float value)
  /// ```
  ///
  /// See also:
  /// - [SDL_SetWindowProgressValue - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetWindowProgressValue)
  ///
  /// {@category video}
  bool setProgressValue(double value) => sdlSetWindowProgressValue(this, value);

  ///
  /// Get the value of the progress bar for the given windowâs taskbar icon.
  ///
  /// \param window the window to get the current progress value from.
  /// \returns the progress value in the range of [0.0f - 1.0f], or -1.0f on
  /// failure; call SDL_GetError() for more information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.4.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC float SDLCALL SDL_GetWindowProgressValue(SDL_Window *window)
  /// ```
  ///
  /// See also:
  /// - [SDL_GetWindowProgressValue - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetWindowProgressValue)
  ///
  /// {@category video}
  double getProgressValue() => sdlGetWindowProgressValue(this);

  ///
  /// Destroy a window.
  ///
  /// Any child windows owned by the window will be recursively destroyed as
  /// well.
  ///
  /// Note that on some platforms, the visible window may not actually be removed
  /// from the screen until the SDL event loop is pumped again, even though the
  /// SDL_Window is no longer valid after this call.
  ///
  /// \param window the window to destroy.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_CreatePopupWindow
  /// \sa SDL_CreateWindow
  /// \sa SDL_CreateWindowWithProperties
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_DestroyWindow(SDL_Window *window)
  /// ```
  ///
  /// See also:
  /// - [SDL_DestroyWindow - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_DestroyWindow)
  ///
  /// {@category video}
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
  /// The OpenGL context will be created with the current states set through
  /// SDL_GL_SetAttribute().
  ///
  /// The SDL_Window specified must have been created with the SDL_WINDOW_OPENGL
  /// flag, or context creation will fail.
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
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GL_DestroyContext
  /// \sa SDL_GL_MakeCurrent
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_GLContext SDLCALL SDL_GL_CreateContext(SDL_Window *window)
  /// ```
  ///
  /// See also:
  /// - [SDL_GL_CreateContext - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GL_CreateContext)
  ///
  /// {@category video}
  Pointer<SdlGlContext> glCreateContext() => sdlGlCreateContext(this);

  ///
  /// Set up an OpenGL context for rendering into an OpenGL window.
  ///
  /// The context must have been created with a compatible window.
  ///
  /// \param window the window to associate with the context.
  /// \param context the OpenGL context to associate with the window.
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
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GL_MakeCurrent(SDL_Window *window, SDL_GLContext context)
  /// ```
  ///
  /// See also:
  /// - [SDL_GL_MakeCurrent - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GL_MakeCurrent)
  ///
  /// {@category video}
  bool glMakeCurrent(Pointer<SdlGlContext> context) =>
      sdlGlMakeCurrent(this, context);

  ///
  /// Get the EGL surface associated with the window.
  ///
  /// \param window the window to query.
  /// \returns the EGLSurface pointer associated with the window, or NULL on
  /// failure.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_EGLSurface SDLCALL SDL_EGL_GetWindowSurface(SDL_Window *window)
  /// ```
  ///
  /// See also:
  /// - [SDL_EGL_GetWindowSurface - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_EGL_GetWindowSurface)
  ///
  /// {@category video}
  SdlEglSurface eglGetSurface() => sdlEglGetWindowSurface(this);

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
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GL_SwapWindow(SDL_Window *window)
  /// ```
  ///
  /// See also:
  /// - [SDL_GL_SwapWindow - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GL_SwapWindow)
  ///
  /// {@category video}
  bool glSwap() => sdlGlSwapWindow(this);
}
