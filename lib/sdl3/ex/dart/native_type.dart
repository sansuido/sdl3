import 'dart:ffi';
import 'package:ffi/ffi.dart' as ffi;

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
