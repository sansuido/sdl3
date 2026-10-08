part of '../sdl_mixer.dart';

class MixxStereoGains {
  const MixxStereoGains({this.left = 0, this.right = 0});

  factory MixxStereoGains.fromPointer(Pointer<MixStereoGains> pointer) =>
      MixxStereoGains(left: pointer.ref.left, right: pointer.ref.right);
  final double left;
  final double right;

  Pointer<MixStereoGains> calloc() {
    final pointer = ffi.calloc<MixStereoGains>();
    pointer.ref.left = left;
    pointer.ref.right = right;
    return pointer;
  }
}
