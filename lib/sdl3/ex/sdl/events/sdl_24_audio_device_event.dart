part of '../../../sdl.dart';

class SdlxAudioDeviceEvent extends SdlxEvent {
  SdlxAudioDeviceEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    this.recording = false,
  });

  factory SdlxAudioDeviceEvent.added({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
    bool recording = false,
  }) => SdlxAudioDeviceEvent(
    type: SDL_EVENT_AUDIO_DEVICE_ADDED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
    recording: recording,
  );

  factory SdlxAudioDeviceEvent.removed({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
    bool recording = false,
  }) => SdlxAudioDeviceEvent(
    type: SDL_EVENT_AUDIO_DEVICE_REMOVED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
    recording: recording,
  );

  factory SdlxAudioDeviceEvent.formatChanged({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
    bool recording = false,
  }) => SdlxAudioDeviceEvent(
    type: SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
    recording: recording,
  );

  int which;
  bool recording;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.adevice.type = type;
    pointer.ref.adevice.reserved = reserved;
    pointer.ref.adevice.timestamp = timestamp;
    pointer.ref.adevice.which = which;
    pointer.ref.adevice.recording = recording;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.adevice.type;
    reserved = pointer.ref.adevice.reserved;
    timestamp = pointer.ref.adevice.timestamp;
    which = pointer.ref.adevice.which;
    recording = pointer.ref.adevice.recording;
  }

  static SdlxAudioDeviceEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxAudioDeviceEvent()..loadFromPointer(pointer);
}
