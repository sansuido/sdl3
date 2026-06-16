// ignore_for_file: avoid_positional_boolean_parameters

part of '../../sdl.dart';

extension SdlTrayEntryPointerEx on Pointer<SdlTrayEntry> {
  ///
  /// Create a submenu for a system tray entry.
  ///
  /// This should be called at most once per tray entry.
  ///
  /// This function does the same thing as SDL_CreateTrayMenu, except that it
  /// takes a SDL_TrayEntry instead of a SDL_Tray.
  ///
  /// A menu does not need to be destroyed; it will be destroyed with the tray.
  ///
  /// \param entry the tray entry to bind the menu to.
  /// \returns the newly created menu.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// tray.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_InsertTrayEntryAt
  /// \sa SDL_GetTraySubmenu
  /// \sa SDL_GetTrayMenuParentEntry
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_TrayMenu * SDLCALL SDL_CreateTraySubmenu(SDL_TrayEntry *entry)
  /// ```
  /// {@category tray}
  Pointer<SdlTrayMenu> createSubmenu() => sdlCreateTraySubmenu(this);

  ///
  /// Gets a previously created tray entry submenu.
  ///
  /// You should have called SDL_CreateTraySubmenu() on the entry object. This
  /// function allows you to fetch it again later.
  ///
  /// This function does the same thing as SDL_GetTrayMenu(), except that it
  /// takes a SDL_TrayEntry instead of a SDL_Tray.
  ///
  /// A menu does not need to be destroyed; it will be destroyed with the tray.
  ///
  /// \param entry the tray entry to bind the menu to.
  /// \returns the newly created menu.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// tray.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_InsertTrayEntryAt
  /// \sa SDL_CreateTraySubmenu
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_TrayMenu * SDLCALL SDL_GetTraySubmenu(SDL_TrayEntry *entry)
  /// ```
  /// {@category tray}
  Pointer<SdlTrayMenu> getSubmenu() => sdlGetTraySubmenu(this);

  ///
  /// Removes a tray entry.
  ///
  /// \param entry The entry to be deleted.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// tray.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetTrayEntries
  /// \sa SDL_InsertTrayEntryAt
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_RemoveTrayEntry(SDL_TrayEntry *entry)
  /// ```
  /// {@category tray}
  void remove() => sdlRemoveTrayEntry(this);

  ///
  /// Sets the label of an entry.
  ///
  /// An entry cannot change between a separator and an ordinary entry; that is,
  /// it is not possible to set a non-NULL label on an entry that has a NULL
  /// label (separators), or to set a NULL label to an entry that has a non-NULL
  /// label. The function will silently fail if that happens.
  ///
  /// \param entry the entry to be updated.
  /// \param label the new label for the entry in UTF-8 encoding.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// tray.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetTrayEntries
  /// \sa SDL_InsertTrayEntryAt
  /// \sa SDL_GetTrayEntryLabel
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_SetTrayEntryLabel(SDL_TrayEntry *entry, const char *label)
  /// ```
  /// {@category tray}
  void setLabel(String? label) => sdlSetTrayEntryLabel(this, label);

  ///
  /// Gets the label of an entry.
  ///
  /// If the returned value is NULL, the entry is a separator.
  ///
  /// \param entry the entry to be read.
  /// \returns the label of the entry in UTF-8 encoding.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// tray.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetTrayEntries
  /// \sa SDL_InsertTrayEntryAt
  /// \sa SDL_SetTrayEntryLabel
  ///
  /// ```c
  /// extern SDL_DECLSPEC const char * SDLCALL SDL_GetTrayEntryLabel(SDL_TrayEntry *entry)
  /// ```
  /// {@category tray}
  String? getLabel() => sdlGetTrayEntryLabel(this);

  ///
  /// Sets whether or not an entry is checked.
  ///
  /// The entry must have been created with the SDL_TRAYENTRY_CHECKBOX flag.
  ///
  /// \param entry the entry to be updated.
  /// \param checked true if the entry should be checked; false otherwise.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// tray.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetTrayEntries
  /// \sa SDL_InsertTrayEntryAt
  /// \sa SDL_GetTrayEntryChecked
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_SetTrayEntryChecked(SDL_TrayEntry *entry, bool checked)
  /// ```
  /// {@category tray}
  void setChecked(bool checked) => sdlSetTrayEntryChecked(this, checked);

  ///
  /// Gets whether or not an entry is checked.
  ///
  /// The entry must have been created with the SDL_TRAYENTRY_CHECKBOX flag.
  ///
  /// \param entry the entry to be read.
  /// \returns true if the entry is checked; false otherwise.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// tray.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetTrayEntries
  /// \sa SDL_InsertTrayEntryAt
  /// \sa SDL_SetTrayEntryChecked
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetTrayEntryChecked(SDL_TrayEntry *entry)
  /// ```
  /// {@category tray}
  bool getChecked() => sdlGetTrayEntryChecked(this);

  ///
  /// Sets whether or not an entry is enabled.
  ///
  /// \param entry the entry to be updated.
  /// \param enabled true if the entry should be enabled; false otherwise.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// tray.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetTrayEntries
  /// \sa SDL_InsertTrayEntryAt
  /// \sa SDL_GetTrayEntryEnabled
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_SetTrayEntryEnabled(SDL_TrayEntry *entry, bool enabled)
  /// ```
  /// {@category tray}
  void setEnabled(bool enabled) => sdlSetTrayEntryEnabled(this, enabled);

  ///
  /// Gets whether or not an entry is enabled.
  ///
  /// \param entry the entry to be read.
  /// \returns true if the entry is enabled; false otherwise.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// tray.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetTrayEntries
  /// \sa SDL_InsertTrayEntryAt
  /// \sa SDL_SetTrayEntryEnabled
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetTrayEntryEnabled(SDL_TrayEntry *entry)
  /// ```
  /// {@category tray}
  bool getEnabled() => sdlGetTrayEntryEnabled(this);

  ///
  /// Sets a callback to be invoked when the entry is selected.
  ///
  /// \param entry the entry to be updated.
  /// \param callback a callback to be invoked when the entry is selected.
  /// \param userdata an optional pointer to pass extra data to the callback when
  /// it will be invoked.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// tray.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetTrayEntries
  /// \sa SDL_InsertTrayEntryAt
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_SetTrayEntryCallback(SDL_TrayEntry *entry, SDL_TrayCallback callback, void *userdata)
  /// ```
  /// {@category tray}
  void setCallback(
    Pointer<NativeFunction<SdlTrayCallback>> callback,
    Pointer<Void> userdata,
  ) => sdlSetTrayEntryCallback(this, callback, userdata);

  ///
  /// Simulate a click on a tray entry.
  ///
  /// \param entry The entry to activate.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// tray.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_ClickTrayEntry(SDL_TrayEntry *entry)
  /// ```
  /// {@category tray}
  void click() => sdlClickTrayEntry(this);

  ///
  /// Gets the menu containing a certain tray entry.
  ///
  /// \param entry the entry for which to get the parent menu.
  /// \returns the parent menu.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// tray.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_InsertTrayEntryAt
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_TrayMenu * SDLCALL SDL_GetTrayEntryParent(SDL_TrayEntry *entry)
  /// ```
  /// {@category tray}
  Pointer<SdlTrayMenu> getParent() => sdlGetTrayEntryParent(this);
}
