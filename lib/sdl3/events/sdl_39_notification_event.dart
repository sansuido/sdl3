part of '../sdl_events.dart';

class SdlxNotificationEvent extends SdlxEvent {
  const SdlxNotificationEvent({
    super.type = SDL_EVENT_NOTIFICATION_ACTION_INVOKED,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    this.actionId = '',
  });

  factory SdlxNotificationEvent.fromPointer(Pointer<SdlEvent> pointer) {
    final actionId = pointer.ref.notification.actionId != nullptr
        ? pointer.ref.notification.actionId.toDartString()
        : '';
    return SdlxNotificationEvent(
      type: pointer.ref.notification.type,
      reserved: pointer.ref.notification.reserved,
      timestamp: pointer.ref.notification.timestamp,
      which: pointer.ref.notification.which,
      actionId: actionId,
    );
  }

  final int which;
  final String actionId;

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
}
