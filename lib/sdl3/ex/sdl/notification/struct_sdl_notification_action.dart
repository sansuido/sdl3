part of '../../../sdl.dart';

class SdlxNotificationActionButton extends SdlxNotificationAction {
  SdlxNotificationActionButton({
    super.type = SDL_NOTIFICATION_ACTION_TYPE_BUTTON,
    this.actionId = '',
    this.actionLabel = '',
  });

  String actionId;
  String actionLabel;

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

class SdlxNotificationAction {
  SdlxNotificationAction({this.type = 0});

  int type;

  void toPointer(Pointer<SdlNotificationAction> pointer) {
    pointer.ref.type = type;
  }
}

extension SdlNotificationActionPointerCallocAllFreeExtension
    on Pointer<SdlNotificationAction> {
  void callocAllFree(int numActions) {
    for (var i = 0; i < numActions; i++) {
      final actionPointer = this + i;
      switch (actionPointer.ref.type) {
        case SDL_NOTIFICATION_ACTION_TYPE_BUTTON:
          if (actionPointer.ref.button.actionId != nullptr) {
            actionPointer.ref.button.actionId.callocFree();
          }
          if (actionPointer.ref.button.actionLabel != nullptr) {
            actionPointer.ref.button.actionLabel.callocFree();
          }
      }
    }
    callocFree();
  }
}
