part of '../sdl_events.dart';

class SdlxGamepadSensorEvent extends SdlxEvent {
  const SdlxGamepadSensorEvent({
    super.type = SDL_EVENT_GAMEPAD_SENSOR_UPDATE,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    this.data = const [0.0, 0.0, 0.0],
    this.sensor = 0,
  });

  factory SdlxGamepadSensorEvent.fromPointer(Pointer<SdlEvent> pointer) {
    final ref = pointer.ref.gsensor;

    final sensorData = List<double>.unmodifiable([
      ref.data[0],
      ref.data[1],
      ref.data[2],
    ]);

    return SdlxGamepadSensorEvent(
      type: ref.type,
      reserved: ref.reserved,
      timestamp: ref.timestamp,
      which: ref.which,
      data: sensorData,
      sensor: ref.sensor,
    );
  }

  final int which;
  final List<double> data;
  final int sensor;

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
}
