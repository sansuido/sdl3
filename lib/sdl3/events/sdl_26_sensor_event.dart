part of '../sdl_events.dart';

class SdlxSensorEvent extends SdlxEvent {
  SdlxSensorEvent({
    super.type = SDL_EVENT_SENSOR_UPDATE,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    List<double>? data,
    this.sensorTimestamp = 0,
  }) {
    this.data = data ?? [];
  }

  int which;
  late List<double> data;
  int sensorTimestamp;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.sensor.type = type;
    pointer.ref.sensor.reserved = reserved;
    pointer.ref.sensor.timestamp = timestamp;
    pointer.ref.sensor.which = which;
    if (data.isNotEmpty) {
      pointer.ref.sensor.data[0] = data[0];
    }
    if (data.length > 1) {
      pointer.ref.sensor.data[1] = data[1];
    }
    if (data.length > 2) {
      pointer.ref.sensor.data[2] = data[2];
    }
    if (data.length > 3) {
      pointer.ref.sensor.data[3] = data[3];
    }
    if (data.length > 4) {
      pointer.ref.sensor.data[4] = data[4];
    }
    if (data.length > 5) {
      pointer.ref.sensor.data[5] = data[5];
    }
    pointer.ref.sensor.sensorTimestamp = sensorTimestamp;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.sensor.type;
    reserved = pointer.ref.sensor.reserved;
    timestamp = pointer.ref.sensor.timestamp;
    which = pointer.ref.sensor.which;
    data
      ..add(pointer.ref.sensor.data[0])
      ..add(pointer.ref.sensor.data[1])
      ..add(pointer.ref.sensor.data[2])
      ..add(pointer.ref.sensor.data[3])
      ..add(pointer.ref.sensor.data[4])
      ..add(pointer.ref.sensor.data[5]);
    sensorTimestamp = pointer.ref.sensor.sensorTimestamp;
  }

  static SdlxSensorEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxSensorEvent()..loadFromPointer(pointer);
}
