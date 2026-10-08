part of '../sdl_mixer.dart';

class MixxPoint3D {
  MixxPoint3D({this.x = 0, this.y = 0, this.z = 0});

  factory MixxPoint3D.fromPointer(Pointer<MixPoint3D> pointer) =>
      MixxPoint3D(x: pointer.ref.x, y: pointer.ref.y, z: pointer.ref.z);

  final double x;
  final double y;
  final double z;

  Pointer<MixPoint3D> calloc() {
    final pointer = ffi.calloc<MixPoint3D>();
    pointer.ref.x = x;
    pointer.ref.y = y;
    pointer.ref.z = z;
    return pointer;
  }
}
