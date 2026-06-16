// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
part of '../sdl.dart';

///
/// Requests permission from the system to display notifications.
///
/// A return value of `true` only means that the system supports notifications,
/// and that the request for permission was successfully issued. It does not
/// reflect any user settings to allow or deny notifications.
///
/// \returns True on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.6.0.
///
/// \sa SDL_ShowNotification
/// \sa SDL_ShowNotificationWithProperties
/// \sa SDL_NotificationAction
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_RequestNotificationPermission(void)
/// ```
/// {@category notification}
bool sdlRequestNotificationPermission() {
  final sdlRequestNotificationPermissionLookupFunction = _libSdl
      .lookupFunction<Bool Function(), bool Function()>(
        'SDL_RequestNotificationPermission',
      );
  return sdlRequestNotificationPermissionLookupFunction();
}

///
/// Show a system notification.
///
/// System notifications are small, asynchronous popup windows that notify the
/// user of some information. How they are displayed is system dependent.
///
/// These are the supported properties:
///
/// - `SDL_PROP_NOTIFICATION_TITLE_STRING`: the title of the notification, in
/// UTF-8 encoding. This property is required.
/// - `SDL_PROP_NOTIFICATION_ACTIONS_POINTER`: An array of pointers to
/// `SDL_NotificationAction` structs that will add actions to the
/// notification, usually in the form of buttons or menu items. Note that
/// systems may have a limit on the maximum number of actions that a
/// notification can have.
/// - `SDL_PROP_NOTIFICATIONS_ACTION_COUNT_NUMBER`: the number of actions in
/// the array of actions, if it exists.
/// - `SDL_PROP_NOTIFICATION_IMAGE_POINTER`: a pointer to an `SDL_Surface`
/// containing an image that will be attached to the notification. In most
/// cases, the image is displayed in the form of a large icon or thumbnail
/// alongside the message body. Notifications on Apple platforms can be
/// expanded to show a larger format image.
/// - `SDL_PROP_NOTIFICATION_MESSAGE_STRING`: the message body of the
/// notification, in UTF-8 encoding.
/// - `SDL_PROP_NOTIFICATION_PRIORITY_NUMBER`: an `SDL_NotificationPriority`
/// value representing the notification priority.
/// - `SDL_PROP_NOTIFICATION_REPLACES_NUMBER`: the `SDL_NotificationID` of a
/// previously shown notification that this notification should replace.
/// - `SDL_PROP_NOTIFICATION_SOUND_STRING`: sets a sound to play when the
/// notification is shown. This can have the value "default", to play the
/// system default notification sound, "silent", to play no sound, or contain
/// the path to a file with a custom sound. The paths and formats that can be
/// used for custom sounds are system-specific, and can have some
/// restrictions, depending on the platform:
/// - Apple platforms require that the sound file is contained within the app
/// bundle. Supported formats are: Linear PCM, MA4 (IMA/ADPCM), uLaw, or
/// aLaw, in an .aiff, .wav, or .caf file.
/// - Windows can only play custom notification sounds when the app is packaged
/// inside an MSIX installer. Playback from arbitrary file paths is not
/// supported. Supported formats are: .aac, .flac, .m4a, .mp3, .wav, and
/// .wma.
/// - Unix platforms can generally load sounds from any arbitrary path, as long
/// as the read permissions are correct. Supported formats are: ogg/opus,
/// ogg/vorbis, and wav/pcm. If this property is not set, the system default
/// sound will be used.
/// - `SDL_PROP_NOTIFICATION_TRANSIENT_BOOLEAN`: true if the notification
/// should not persist in the system notification center after initially
/// being shown.
///
/// Not all properties are supported by all platforms.
///
/// Notifications are available on: - Windows 10 or higher - macOS 10.14 or
/// higher - iOS 11 or higher - *nix platforms that support the
/// org.freedesktop.Notifications, or org.freedesktop.portal.Notification
/// interfaces
///
/// \param props the properties to be used when creating this notification.
/// \returns A non-zero SDL_NotificationID on success or 0 on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.6.0.
///
/// \sa SDL_ShowNotification
/// \sa SDL_NotificationAction
/// \sa SDL_NotificationPriority
/// \sa SDL_NotificationEvent
///
/// ```c
/// extern SDL_DECLSPEC SDL_NotificationID SDLCALL SDL_ShowNotificationWithProperties(SDL_PropertiesID props)
/// ```
/// {@category notification}
int sdlShowNotificationWithProperties(int props) {
  final sdlShowNotificationWithPropertiesLookupFunction = _libSdl
      .lookupFunction<Uint32 Function(Uint32 props), int Function(int props)>(
        'SDL_ShowNotificationWithProperties',
      );
  return sdlShowNotificationWithPropertiesLookupFunction(props);
}

///
/// Show a system notification with normal priority.
///
/// \param title UTF-8 title text, required.
/// \param message UTF-8 message text, may be NULL.
/// \param image The image associated with this notification, may be NULL.
/// \param actions An array of actions to attach to the notification, may be
/// NULL.
/// \param num_actions The number of actions in the actions array.
/// \returns A non-zero SDL_NotificationID on success or 0 on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.6.0.
///
/// \sa SDL_ShowNotificationWithProperties
/// \sa SDL_NotificationAction
/// \sa SDL_NotificationEvent
///
/// ```c
/// extern SDL_DECLSPEC SDL_NotificationID SDLCALL SDL_ShowNotification(const char *title, const char *message, SDL_Surface *image, SDL_NotificationAction *actions, int num_actions)
/// ```
/// {@category notification}
int sdlShowNotification(
  String? title,
  String? message,
  Pointer<SdlSurface> image,
  Pointer<SdlNotificationAction> actions,
  int numActions,
) {
  final sdlShowNotificationLookupFunction = _libSdl
      .lookupFunction<
        Uint32 Function(
          Pointer<Utf8> title,
          Pointer<Utf8> message,
          Pointer<SdlSurface> image,
          Pointer<SdlNotificationAction> actions,
          Int32 numActions,
        ),
        int Function(
          Pointer<Utf8> title,
          Pointer<Utf8> message,
          Pointer<SdlSurface> image,
          Pointer<SdlNotificationAction> actions,
          int numActions,
        )
      >('SDL_ShowNotification');
  final titlePointer = title != null ? title.toNativeUtf8() : nullptr;
  final messagePointer = message != null ? message.toNativeUtf8() : nullptr;
  final result = sdlShowNotificationLookupFunction(
    titlePointer,
    messagePointer,
    image,
    actions,
    numActions,
  );
  calloc
    ..free(titlePointer)
    ..free(messagePointer);
  return result;
}

///
/// Remove a notification.
///
/// \param notification the ID of the notification to remove.
/// \returns True on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.6.0.
///
/// \sa SDL_ShowNotificationWithProperties
/// \sa SDL_ShowNotification
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_RemoveNotification(SDL_NotificationID notification)
/// ```
/// {@category notification}
bool sdlRemoveNotification(int notification) {
  final sdlRemoveNotificationLookupFunction = _libSdl
      .lookupFunction<
        Bool Function(Uint32 notification),
        bool Function(int notification)
      >('SDL_RemoveNotification');
  return sdlRemoveNotificationLookupFunction(notification);
}
