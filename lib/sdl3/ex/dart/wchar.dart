part of '../../sdl_dart.dart';

extension WCharPointerEx on Pointer<WChar> {
  String toDartString() {
    if (this == nullptr) {
      return '';
    }
    if (sizeOf<WChar>() == 2) {
      return cast<Utf16>().toDartString();
    }
    return _toDartStringFromUtf32();
  }

  String _toDartStringFromUtf32() {
    final codeUnits = <int>[];
    final rawPointer = cast<Uint32>();
    var offset = 0;
    while (true) {
      final codePoint = rawPointer[offset];
      if (codePoint == 0) {
        break;
      }
      codeUnits.add(codePoint);
      offset++;
    }
    return String.fromCharCodes(codeUnits);
  }
}
