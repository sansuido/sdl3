// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
// ignore_for_file: avoid_positional_boolean_parameters
part of '../sdl.dart';

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
/// \sa SDL_CreateTrayMenu
/// \sa SDL_GetTrayMenu
/// \sa SDL_DestroyTray
///
/// ```c
/// extern SDL_DECLSPEC SDL_Tray * SDLCALL SDL_CreateTray(SDL_Surface *icon, const char *tooltip)
/// ```
/// {@category tray}
Pointer<SdlTray> sdlCreateTray(Pointer<SdlSurface> icon, String? tooltip) {
  final sdlCreateTrayLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlTray> Function(
          Pointer<SdlSurface> icon,
          Pointer<Utf8> tooltip,
        ),
        Pointer<SdlTray> Function(
          Pointer<SdlSurface> icon,
          Pointer<Utf8> tooltip,
        )
      >('SDL_CreateTray');
  final tooltipPointer = tooltip != null ? tooltip.toNativeUtf8() : nullptr;
  final result = sdlCreateTrayLookupFunction(icon, tooltipPointer);
  calloc.free(tooltipPointer);
  return result;
}

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
void sdlSetTrayIcon(Pointer<SdlTray> tray, Pointer<SdlSurface> icon) {
  final sdlSetTrayIconLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<SdlTray> tray, Pointer<SdlSurface> icon),
        void Function(Pointer<SdlTray> tray, Pointer<SdlSurface> icon)
      >('SDL_SetTrayIcon');
  return sdlSetTrayIconLookupFunction(tray, icon);
}

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
void sdlSetTrayTooltip(Pointer<SdlTray> tray, String? tooltip) {
  final sdlSetTrayTooltipLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<SdlTray> tray, Pointer<Utf8> tooltip),
        void Function(Pointer<SdlTray> tray, Pointer<Utf8> tooltip)
      >('SDL_SetTrayTooltip');
  final tooltipPointer = tooltip != null ? tooltip.toNativeUtf8() : nullptr;
  final result = sdlSetTrayTooltipLookupFunction(tray, tooltipPointer);
  calloc.free(tooltipPointer);
  return result;
}

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
Pointer<SdlTrayMenu> sdlCreateTrayMenu(Pointer<SdlTray> tray) {
  final sdlCreateTrayMenuLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlTrayMenu> Function(Pointer<SdlTray> tray),
        Pointer<SdlTrayMenu> Function(Pointer<SdlTray> tray)
      >('SDL_CreateTrayMenu');
  return sdlCreateTrayMenuLookupFunction(tray);
}

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
Pointer<SdlTrayMenu> sdlCreateTraySubmenu(Pointer<SdlTrayEntry> entry) {
  final sdlCreateTraySubmenuLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlTrayMenu> Function(Pointer<SdlTrayEntry> entry),
        Pointer<SdlTrayMenu> Function(Pointer<SdlTrayEntry> entry)
      >('SDL_CreateTraySubmenu');
  return sdlCreateTraySubmenuLookupFunction(entry);
}

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
Pointer<SdlTrayMenu> sdlGetTrayMenu(Pointer<SdlTray> tray) {
  final sdlGetTrayMenuLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlTrayMenu> Function(Pointer<SdlTray> tray),
        Pointer<SdlTrayMenu> Function(Pointer<SdlTray> tray)
      >('SDL_GetTrayMenu');
  return sdlGetTrayMenuLookupFunction(tray);
}

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
Pointer<SdlTrayMenu> sdlGetTraySubmenu(Pointer<SdlTrayEntry> entry) {
  final sdlGetTraySubmenuLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlTrayMenu> Function(Pointer<SdlTrayEntry> entry),
        Pointer<SdlTrayMenu> Function(Pointer<SdlTrayEntry> entry)
      >('SDL_GetTraySubmenu');
  return sdlGetTraySubmenuLookupFunction(entry);
}

///
/// Returns a list of entries in the menu, in order.
///
/// \param menu The menu to get entries from.
/// \param count An optional pointer to obtain the number of entries in the
/// menu.
/// \returns a NULL-terminated list of entries within the given menu. The
/// pointer becomes invalid when any function that inserts or deletes
/// entries in the menu is called.
///
/// \threadsafety This function should be called on the thread that created the
/// tray.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_RemoveTrayEntry
/// \sa SDL_InsertTrayEntryAt
///
/// ```c
/// extern SDL_DECLSPEC const SDL_TrayEntry ** SDLCALL SDL_GetTrayEntries(SDL_TrayMenu *menu, int *count)
/// ```
/// {@category tray}
Pointer<Pointer<SdlTrayEntry>> sdlGetTrayEntries(
  Pointer<SdlTrayMenu> menu,
  Pointer<Int32> count,
) {
  final sdlGetTrayEntriesLookupFunction = _libSdl
      .lookupFunction<
        Pointer<Pointer<SdlTrayEntry>> Function(
          Pointer<SdlTrayMenu> menu,
          Pointer<Int32> count,
        ),
        Pointer<Pointer<SdlTrayEntry>> Function(
          Pointer<SdlTrayMenu> menu,
          Pointer<Int32> count,
        )
      >('SDL_GetTrayEntries');
  return sdlGetTrayEntriesLookupFunction(menu, count);
}

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
void sdlRemoveTrayEntry(Pointer<SdlTrayEntry> entry) {
  final sdlRemoveTrayEntryLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<SdlTrayEntry> entry),
        void Function(Pointer<SdlTrayEntry> entry)
      >('SDL_RemoveTrayEntry');
  return sdlRemoveTrayEntryLookupFunction(entry);
}

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
Pointer<SdlTrayEntry> sdlInsertTrayEntryAt(
  Pointer<SdlTrayMenu> menu,
  int pos,
  String? label,
  int flags,
) {
  final sdlInsertTrayEntryAtLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlTrayEntry> Function(
          Pointer<SdlTrayMenu> menu,
          Int32 pos,
          Pointer<Utf8> label,
          Uint32 flags,
        ),
        Pointer<SdlTrayEntry> Function(
          Pointer<SdlTrayMenu> menu,
          int pos,
          Pointer<Utf8> label,
          int flags,
        )
      >('SDL_InsertTrayEntryAt');
  final labelPointer = label != null ? label.toNativeUtf8() : nullptr;
  final result = sdlInsertTrayEntryAtLookupFunction(
    menu,
    pos,
    labelPointer,
    flags,
  );
  calloc.free(labelPointer);
  return result;
}

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
void sdlSetTrayEntryLabel(Pointer<SdlTrayEntry> entry, String? label) {
  final sdlSetTrayEntryLabelLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<SdlTrayEntry> entry, Pointer<Utf8> label),
        void Function(Pointer<SdlTrayEntry> entry, Pointer<Utf8> label)
      >('SDL_SetTrayEntryLabel');
  final labelPointer = label != null ? label.toNativeUtf8() : nullptr;
  final result = sdlSetTrayEntryLabelLookupFunction(entry, labelPointer);
  calloc.free(labelPointer);
  return result;
}

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
String? sdlGetTrayEntryLabel(Pointer<SdlTrayEntry> entry) {
  final sdlGetTrayEntryLabelLookupFunction = _libSdl
      .lookupFunction<
        Pointer<Utf8> Function(Pointer<SdlTrayEntry> entry),
        Pointer<Utf8> Function(Pointer<SdlTrayEntry> entry)
      >('SDL_GetTrayEntryLabel');
  final result = sdlGetTrayEntryLabelLookupFunction(entry);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

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
void sdlSetTrayEntryChecked(Pointer<SdlTrayEntry> entry, bool checked) {
  final sdlSetTrayEntryCheckedLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<SdlTrayEntry> entry, Uint8 checked),
        void Function(Pointer<SdlTrayEntry> entry, int checked)
      >('SDL_SetTrayEntryChecked');
  return sdlSetTrayEntryCheckedLookupFunction(entry, checked ? 1 : 0);
}

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
bool sdlGetTrayEntryChecked(Pointer<SdlTrayEntry> entry) {
  final sdlGetTrayEntryCheckedLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlTrayEntry> entry),
        int Function(Pointer<SdlTrayEntry> entry)
      >('SDL_GetTrayEntryChecked');
  return sdlGetTrayEntryCheckedLookupFunction(entry) == 1;
}

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
void sdlSetTrayEntryEnabled(Pointer<SdlTrayEntry> entry, bool enabled) {
  final sdlSetTrayEntryEnabledLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<SdlTrayEntry> entry, Uint8 enabled),
        void Function(Pointer<SdlTrayEntry> entry, int enabled)
      >('SDL_SetTrayEntryEnabled');
  return sdlSetTrayEntryEnabledLookupFunction(entry, enabled ? 1 : 0);
}

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
bool sdlGetTrayEntryEnabled(Pointer<SdlTrayEntry> entry) {
  final sdlGetTrayEntryEnabledLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlTrayEntry> entry),
        int Function(Pointer<SdlTrayEntry> entry)
      >('SDL_GetTrayEntryEnabled');
  return sdlGetTrayEntryEnabledLookupFunction(entry) == 1;
}

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
void sdlSetTrayEntryCallback(
  Pointer<SdlTrayEntry> entry,
  Pointer<NativeFunction<SdlTrayCallback>> callback,
  Pointer<NativeType> userdata,
) {
  final sdlSetTrayEntryCallbackLookupFunction = _libSdl
      .lookupFunction<
        Void Function(
          Pointer<SdlTrayEntry> entry,
          Pointer<NativeFunction<SdlTrayCallback>> callback,
          Pointer<NativeType> userdata,
        ),
        void Function(
          Pointer<SdlTrayEntry> entry,
          Pointer<NativeFunction<SdlTrayCallback>> callback,
          Pointer<NativeType> userdata,
        )
      >('SDL_SetTrayEntryCallback');
  return sdlSetTrayEntryCallbackLookupFunction(entry, callback, userdata);
}

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
void sdlClickTrayEntry(Pointer<SdlTrayEntry> entry) {
  final sdlClickTrayEntryLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<SdlTrayEntry> entry),
        void Function(Pointer<SdlTrayEntry> entry)
      >('SDL_ClickTrayEntry');
  return sdlClickTrayEntryLookupFunction(entry);
}

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
void sdlDestroyTray(Pointer<SdlTray> tray) {
  final sdlDestroyTrayLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<SdlTray> tray),
        void Function(Pointer<SdlTray> tray)
      >('SDL_DestroyTray');
  return sdlDestroyTrayLookupFunction(tray);
}

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
Pointer<SdlTrayMenu> sdlGetTrayEntryParent(Pointer<SdlTrayEntry> entry) {
  final sdlGetTrayEntryParentLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlTrayMenu> Function(Pointer<SdlTrayEntry> entry),
        Pointer<SdlTrayMenu> Function(Pointer<SdlTrayEntry> entry)
      >('SDL_GetTrayEntryParent');
  return sdlGetTrayEntryParentLookupFunction(entry);
}

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
Pointer<SdlTrayEntry> sdlGetTrayMenuParentEntry(Pointer<SdlTrayMenu> menu) {
  final sdlGetTrayMenuParentEntryLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlTrayEntry> Function(Pointer<SdlTrayMenu> menu),
        Pointer<SdlTrayEntry> Function(Pointer<SdlTrayMenu> menu)
      >('SDL_GetTrayMenuParentEntry');
  return sdlGetTrayMenuParentEntryLookupFunction(menu);
}

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
Pointer<SdlTray> sdlGetTrayMenuParentTray(Pointer<SdlTrayMenu> menu) {
  final sdlGetTrayMenuParentTrayLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlTray> Function(Pointer<SdlTrayMenu> menu),
        Pointer<SdlTray> Function(Pointer<SdlTrayMenu> menu)
      >('SDL_GetTrayMenuParentTray');
  return sdlGetTrayMenuParentTrayLookupFunction(menu);
}

///
/// Update the trays.
///
/// This is called automatically by the event loop and is only needed if you're
/// using trays but aren't handling SDL events.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_UpdateTrays(void)
/// ```
/// {@category tray}
void sdlUpdateTrays() {
  final sdlUpdateTraysLookupFunction = _libSdl
      .lookupFunction<Void Function(), void Function()>('SDL_UpdateTrays');
  return sdlUpdateTraysLookupFunction();
}
