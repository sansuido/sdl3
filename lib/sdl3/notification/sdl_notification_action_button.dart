part of '../sdl_notification.dart';

class SdlxNotificationActionButton extends SdlxNotificationAction {
  const SdlxNotificationActionButton({
    super.type = SDL_NOTIFICATION_ACTION_TYPE_BUTTON,
    this.actionId = '',
    this.actionLabel = '',
  });

  final String actionId;
  final String actionLabel;

  @override
  void toPointer(Pointer<SdlNotificationAction> pointer) {
    pointer.ref.button.type = type;
    if (actionId.isNotEmpty) {
      pointer.ref.button.actionId = actionId.toNativeUtf8();
    }
    if (actionLabel.isNotEmpty) {
      pointer.ref.button.actionLabel = actionLabel.toNativeUtf8();
    }
  }
}
