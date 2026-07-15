part of '../../sdl_dart.dart';

extension StringToWCharEx on String {
  Pointer<WChar> toNativeWChar({Allocator allocator = malloc}) {
    if (sizeOf<WChar>() == 2) {
      return toNativeUtf16(allocator: allocator).cast<WChar>();
    } else {
      return _toNativeWCharFromUtf32(allocator: allocator);
    }
  }

  Pointer<WChar> _toNativeWCharFromUtf32({required Allocator allocator}) {
    final codePoints = runes.toList();
    final pointer = allocator<Uint32>(codePoints.length + 1);
    for (var i = 0; i < codePoints.length; i++) {
      pointer[i] = codePoints[i];
    }
    pointer[codePoints.length] = 0;
    return pointer.cast<WChar>();
  }
}

extension WCharPointerEx on Pointer<WChar> {
  String toDartString() {
    if (address == 0) {
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
