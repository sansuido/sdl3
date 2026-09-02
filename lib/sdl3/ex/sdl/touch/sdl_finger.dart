part of '../../../sdl.dart';

class SdlxFinger {
  SdlxFinger({this.id = 0, this.x = 0.0, this.y = 0.0, this.pressure = 0.0});

  int id;
  double x;
  double y;
  double pressure;

  Pointer<SdlFinger> calloc() {
    final pointer = ffi.calloc<SdlFinger>();
    pointer.ref.id = id;
    pointer.ref.x = x;
    pointer.ref.y = y;
    pointer.ref.pressure = pressure;
    return pointer;
  }

  void loadFromPointer(Pointer<SdlFinger> pointer) {
    id = pointer.ref.id;
    x = pointer.ref.x;
    y = pointer.ref.y;
    pressure = pointer.ref.pressure;
  }

  static SdlxFinger fromPointer(Pointer<SdlFinger> pointer) =>
      SdlxFinger()..loadFromPointer(pointer);
}
