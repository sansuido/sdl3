part of '../../sdl.dart';

extension SdlTrayEx on SdlTray {
  ///
  /// Create an icon to be placed in the operating system's tray, or equivalent.
  ///
  /// Many platforms advise not using a system tray unless persistence is a
  /// necessary feature. Avoid needlessly creating a tray icon, as the user may
  /// feel like it clutters their interface.
  ///
  /// Using tray icons require the video subsystem.
  ///
  /// \param icon a surface to be used as icon. May be NULL.
  /// \param tooltip a tooltip to be displayed when the mouse hovers the icon in
  /// UTF-8 encoding. Not supported on all platforms. May be NULL.
  /// \returns The newly created system tray icon.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_CreateTrayWithProperties
  /// \sa SDL_CreateTrayMenu
  /// \sa SDL_GetTrayMenu
  /// \sa SDL_DestroyTray
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Tray * SDLCALL SDL_CreateTray(SDL_Surface *icon, const char *tooltip)
  /// ```
  /// {@category tray}
  static Pointer<SdlTray> create(Pointer<SdlSurface> icon, String? tooltip) =>
      sdlCreateTray(icon, tooltip);

  ///
  /// Create an icon to be placed in the operating system's tray, or equivalent.
  ///
  /// Many platforms advise not using a system tray unless persistence is a
  /// necessary feature. Avoid needlessly creating a tray icon, as the user may
  /// feel like it clutters their interface.
  ///
  /// Using tray icons require the video subsystem.
  ///
  /// These are the supported properties:
  ///
  /// - `SDL_PROP_TRAY_CREATE_ICON_POINTER`: an SDL_Surface to be used as the
  /// tray icon. May be NULL.
  /// - `SDL_PROP_TRAY_CREATE_TOOLTIP_STRING`: a tooltip to be displayed when the
  /// mouse hovers the icon in UTF-8 encoding. Not supported on all platforms.
  /// May be NULL.
  /// - `SDL_PROP_TRAY_CREATE_USERDATA_POINTER`: an optional pointer to associate
  /// with the tray, which will be passed to click callbacks. May be NULL.
  /// - `SDL_PROP_TRAY_CREATE_LEFTCLICK_CALLBACK_POINTER`: an
  /// SDL_TrayClickCallback to be invoked when the tray icon is left-clicked.
  /// Not supported on all platforms. The callback should return true to show
  /// the default menu, or false to skip showing it. May be NULL.
  /// - `SDL_PROP_TRAY_CREATE_RIGHTCLICK_CALLBACK_POINTER`: an
  /// SDL_TrayClickCallback to be invoked when the tray icon is right-clicked.
  /// Not supported on all platforms. The callback should return true to show
  /// the default menu, or false to skip showing it. May be NULL.
  /// - `SDL_PROP_TRAY_CREATE_MIDDLECLICK_CALLBACK_POINTER`: an
  /// SDL_TrayClickCallback to be invoked when the tray icon is middle-clicked.
  /// Not supported on all platforms. May be NULL.
  ///
  /// \param props the properties to use.
  /// \returns The newly created system tray icon.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.6.0.
  ///
  /// \sa SDL_CreateTray
  /// \sa SDL_CreateTrayMenu
  /// \sa SDL_GetTrayMenu
  /// \sa SDL_DestroyTray
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Tray * SDLCALL SDL_CreateTrayWithProperties(SDL_PropertiesID props)
  /// ```
  /// {@category tray}
  static Pointer<SdlTray> createWithProperties(int props) =>
      sdlCreateTrayWithProperties(props);
}

extension SdlTrayPointerEx on Pointer<SdlTray> {
  ///
  /// Updates the system tray icon's icon.
  ///
  /// \param tray the tray icon to be updated.
  /// \param icon the new icon. May be NULL.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// tray.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_CreateTray
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_SetTrayIcon(SDL_Tray *tray, SDL_Surface *icon)
  /// ```
  /// {@category tray}
  void setIcon(Pointer<SdlSurface> icon) => sdlSetTrayIcon(this, icon);

  ///
  /// Updates the system tray icon's tooltip.
  ///
  /// \param tray the tray icon to be updated.
  /// \param tooltip the new tooltip in UTF-8 encoding. May be NULL.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// tray.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_CreateTray
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_SetTrayTooltip(SDL_Tray *tray, const char *tooltip)
  /// ```
  /// {@category tray}
  void setTooltip(String? tooltip) => sdlSetTrayTooltip(this, tooltip);

  ///
  /// Create a menu for a system tray.
  ///
  /// This should be called at most once per tray icon.
  ///
  /// This function does the same thing as SDL_CreateTraySubmenu(), except that
  /// it takes a SDL_Tray instead of a SDL_TrayEntry.
  ///
  /// A menu does not need to be destroyed; it will be destroyed with the tray.
  ///
  /// \param tray the tray to bind the menu to.
  /// \returns the newly created menu.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// tray.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_CreateTray
  /// \sa SDL_GetTrayMenu
  /// \sa SDL_GetTrayMenuParentTray
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_TrayMenu * SDLCALL SDL_CreateTrayMenu(SDL_Tray *tray)
  /// ```
  /// {@category tray}
  Pointer<SdlTrayMenu> createMenu() => sdlCreateTrayMenu(this);

  ///
  /// Gets a previously created tray menu.
  ///
  /// You should have called SDL_CreateTrayMenu() on the tray object. This
  /// function allows you to fetch it again later.
  ///
  /// This function does the same thing as SDL_GetTraySubmenu(), except that it
  /// takes a SDL_Tray instead of a SDL_TrayEntry.
  ///
  /// A menu does not need to be destroyed; it will be destroyed with the tray.
  ///
  /// \param tray the tray entry to bind the menu to.
  /// \returns the newly created menu.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// tray.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_CreateTray
  /// \sa SDL_CreateTrayMenu
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_TrayMenu * SDLCALL SDL_GetTrayMenu(SDL_Tray *tray)
  /// ```
  /// {@category tray}
  Pointer<SdlTrayMenu> getMenu() => sdlGetTrayMenu(this);

  ///
  /// Destroys a tray object.
  ///
  /// This also destroys all associated menus and entries.
  ///
  /// \param tray the tray icon to be destroyed.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// tray.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_CreateTray
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_DestroyTray(SDL_Tray *tray)
  /// ```
  /// {@category tray}
  void destroy() => sdlDestroyTray(this);
}
