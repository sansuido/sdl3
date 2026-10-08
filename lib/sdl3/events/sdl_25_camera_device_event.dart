part of '../sdl_events.dart';

class SdlxCameraDeviceEvent extends SdlxEvent {
  const SdlxCameraDeviceEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
  });

  factory SdlxCameraDeviceEvent.fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxCameraDeviceEvent(
        type: pointer.ref.cdevice.type,
        reserved: pointer.ref.cdevice.reserved,
        timestamp: pointer.ref.cdevice.timestamp,
        which: pointer.ref.cdevice.which,
      );

  factory SdlxCameraDeviceEvent.added({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxCameraDeviceEvent(
    type: SDL_EVENT_CAMERA_DEVICE_ADDED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );

  factory SdlxCameraDeviceEvent.removed({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxCameraDeviceEvent(
    type: SDL_EVENT_CAMERA_DEVICE_REMOVED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );

  factory SdlxCameraDeviceEvent.approved({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxCameraDeviceEvent(
    type: SDL_EVENT_CAMERA_DEVICE_APPROVED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );

  factory SdlxCameraDeviceEvent.denied({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxCameraDeviceEvent(
    type: SDL_EVENT_CAMERA_DEVICE_DENIED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );

  final int which;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.cdevice.type = type;
    pointer.ref.cdevice.reserved = reserved;
    pointer.ref.cdevice.timestamp = timestamp;
    pointer.ref.cdevice.which = which;
    return pointer;
  }
}
