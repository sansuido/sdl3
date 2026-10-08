part of '../sdl_events.dart';

class SdlxSensorEvent extends SdlxEvent {
  const SdlxSensorEvent({
    super.type = SDL_EVENT_SENSOR_UPDATE,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    this.data = const [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
    this.sensorTimestamp = 0,
  });

  factory SdlxSensorEvent.fromPointer(Pointer<SdlEvent> pointer) {
    final ref = pointer.ref.sensor;

    final sensorData = List<double>.unmodifiable(
      List<double>.generate(6, (i) => ref.data[i]),
    );

    return SdlxSensorEvent(
      type: ref.type,
      reserved: ref.reserved,
      timestamp: ref.timestamp,
      which: ref.which,
      data: sensorData,
      sensorTimestamp: ref.sensorTimestamp,
    );
  }

  final int which;
  final List<double> data;
  final int sensorTimestamp;

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
}
