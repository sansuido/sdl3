part of '../../sdl_mixer.dart';

class MixxStereoGains {
  MixxStereoGains({this.left = 0, this.right = 0});
  double left;
  double right;

  void loadFromPointer(Pointer<MixStereoGains> pointer) {
    left = pointer.ref.left;
    right = pointer.ref.right;
  }

  Pointer<MixStereoGains> calloc() {
    final pointer = ffi.calloc<MixStereoGains>();
    pointer.ref.left = left;
    pointer.ref.right = right;
    return pointer;
  }
}
