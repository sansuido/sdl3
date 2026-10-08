part of '../sdl_touch.dart';

class SdlxFinger {
  const SdlxFinger({
    this.id = 0,
    this.x = 0.0,
    this.y = 0.0,
    this.pressure = 0.0,
  });

  factory SdlxFinger.fromPointer(Pointer<SdlFinger> pointer) => SdlxFinger(
    id: pointer.ref.id,
    x: pointer.ref.x,
    y: pointer.ref.y,
    pressure: pointer.ref.pressure,
  );

  final int id;
  final double x;
  final double y;
  final double pressure;

  Pointer<SdlFinger> calloc() {
    final pointer = ffi.calloc<SdlFinger>();
    pointer.ref.id = id;
    pointer.ref.x = x;
    pointer.ref.y = y;
    pointer.ref.pressure = pressure;
    return pointer;
  }
}
