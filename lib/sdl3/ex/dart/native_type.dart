part of '../../sdl_dart.dart';

extension NativeTypePointerEx on Pointer<NativeType> {
  bool sdlFree() {
    var result = false;
    if (this != nullptr) {
      sdl3.sdlFree(cast<Void>());
      result = true;
    }
    return result;
  }

  bool callocFree() {
    var result = false;
    if (this != nullptr) {
      ffi.calloc.free(this);
      result = true;
    }
    return result;
  }
}
