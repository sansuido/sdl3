part of '../../../sdl.dart';

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
int sdlxShowNotification(
  String title,
  String? message,
  Pointer<SdlSurface> image, [
  List<SdlxNotificationAction>? actions,
]) {
  final numActions = actions != null ? actions.length : 0;
  Pointer<SdlNotificationAction> actionsPointer = nullptr;
  if (numActions > 0) {
    actionsPointer = ffi.calloc<SdlNotificationAction>(numActions);
    for (var i = 0; i < numActions; i++) {
      final actionPointer = actionsPointer + i;
      actions![i].toPointer(actionPointer);
    }
  }
  final result = sdlShowNotification(
    title,
    message,
    image,
    actionsPointer,
    numActions,
  );
  if (actionsPointer != nullptr) {
    actionsPointer.callocAllFree(numActions);
  }
  return result;
}
