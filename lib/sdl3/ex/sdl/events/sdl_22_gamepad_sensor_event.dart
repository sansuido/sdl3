part of '../../../sdl.dart';

class SdlxGamepadSensorEvent extends SdlxEvent {
  SdlxGamepadSensorEvent({
    super.type = SDL_EVENT_GAMEPAD_SENSOR_UPDATE,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    List<double>? data,
    this.sensor = 0,
  }) {
    this.data = data ?? [];
  }

  int which;
  late List<double> data;
  int sensor;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.gsensor.type = type;
    pointer.ref.gsensor.reserved = reserved;
    pointer.ref.gsensor.timestamp = timestamp;
    pointer.ref.gsensor.which = which;
    if (data.isNotEmpty) {
      pointer.ref.gsensor.data[0] = data[0];
    }
    if (data.length > 1) {
      pointer.ref.gsensor.data[1] = data[1];
    }
    if (data.length > 2) {
      pointer.ref.gsensor.data[2] = data[2];
    }
    pointer.ref.gsensor.sensor = sensor;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.gsensor.type;
    reserved = pointer.ref.gsensor.reserved;
    timestamp = pointer.ref.gsensor.timestamp;
    which = pointer.ref.gsensor.which;
    data
      ..add(pointer.ref.gsensor.data[0])
      ..add(pointer.ref.gsensor.data[1])
      ..add(pointer.ref.gsensor.data[2]);
    sensor = pointer.ref.gsensor.sensor;
  }

  static SdlxGamepadSensorEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxGamepadSensorEvent()..loadFromPointer(pointer);
}
