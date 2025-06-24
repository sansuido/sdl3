part of '../../sdl_dart.dart';

extension NativeTypePointerEx on Pointer<NativeType> {
  bool callocFree() {
    var result = false;
    if (this != nullptr) {
      ffi.calloc.free(this);
      result = true;
    }
    return result;
  }
}
