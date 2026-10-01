part of '../sdl_events.dart';

class SdlxNotificationEvent extends SdlxEvent {
  SdlxNotificationEvent({
    super.type = SDL_EVENT_NOTIFICATION_ACTION_INVOKED,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    this.actionId = '',
  });
  int which;
  String actionId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.notification.type = type;
    pointer.ref.notification.reserved = reserved;
    pointer.ref.notification.timestamp = timestamp;
    pointer.ref.notification.which = which;
    if (actionId.isNotEmpty) {
      pointer.ref.notification.actionId = actionId.toNativeUtf8();
    }
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.notification.type;
    reserved = pointer.ref.notification.reserved;
    timestamp = pointer.ref.notification.timestamp;
    which = pointer.ref.notification.which;
    if (pointer.ref.notification.actionId != nullptr) {
      actionId = pointer.ref.notification.actionId.toDartString();
    }
  }

  static SdlxNotificationEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxNotificationEvent()..loadFromPointer(pointer);
}
