part of '../../sdl.dart';

extension SdlTrayMenuPointerEx on Pointer<SdlTrayMenu> {
  ///
  /// Insert a tray entry at a given position.
  ///
  /// If label is NULL, the entry will be a separator. Many functions won't work
  /// for an entry that is a separator.
  ///
  /// An entry does not need to be destroyed; it will be destroyed with the tray.
  ///
  /// \param menu the menu to append the entry to.
  /// \param pos the desired position for the new entry. Entries at or following
  /// this place will be moved. If pos is -1, the entry is appended.
  /// \param label the text to be displayed on the entry, in UTF-8 encoding, or
  /// NULL for a separator.
  /// \param flags a combination of flags, some of which are mandatory.
  /// \returns the newly created entry, or NULL if pos is out of bounds.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// tray.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_TrayEntryFlags
  /// \sa SDL_GetTrayEntries
  /// \sa SDL_RemoveTrayEntry
  /// \sa SDL_GetTrayEntryParent
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_TrayEntry * SDLCALL SDL_InsertTrayEntryAt(SDL_TrayMenu *menu, int pos, const char *label, SDL_TrayEntryFlags flags)
  /// ```
  /// {@category tray}
  Pointer<SdlTrayEntry> insertEntryAt(int pos, String? label, int flags) =>
      sdlInsertTrayEntryAt(this, pos, label, flags);

  ///
  /// Gets the entry for which the menu is a submenu, if the current menu is a
  /// submenu.
  ///
  /// Either this function or SDL_GetTrayMenuParentTray() will return non-NULL
  /// for any given menu.
  ///
  /// \param menu the menu for which to get the parent entry.
  /// \returns the parent entry, or NULL if this menu is not a submenu.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// tray.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_CreateTraySubmenu
  /// \sa SDL_GetTrayMenuParentTray
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_TrayEntry * SDLCALL SDL_GetTrayMenuParentEntry(SDL_TrayMenu *menu)
  /// ```
  /// {@category tray}
  Pointer<SdlTrayEntry> getParentEntry() => sdlGetTrayMenuParentEntry(this);

  ///
  /// Gets the tray for which this menu is the first-level menu, if the current
  /// menu isn't a submenu.
  ///
  /// Either this function or SDL_GetTrayMenuParentEntry() will return non-NULL
  /// for any given menu.
  ///
  /// \param menu the menu for which to get the parent enttrayry.
  /// \returns the parent tray, or NULL if this menu is a submenu.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// tray.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_CreateTrayMenu
  /// \sa SDL_GetTrayMenuParentEntry
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Tray * SDLCALL SDL_GetTrayMenuParentTray(SDL_TrayMenu *menu)
  /// ```
  /// {@category tray}
  Pointer<SdlTray> getParentTray() => sdlGetTrayMenuParentTray(this);
}
