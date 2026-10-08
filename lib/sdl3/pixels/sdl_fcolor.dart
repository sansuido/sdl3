part of '../sdl_pixels.dart';

class SdlxFColor {
  const SdlxFColor(this.r, this.g, this.b, [this.a = 1.0]);

  factory SdlxFColor.fromStringCode(String code) {
    final hex = code.startsWith('#') ? code.substring(1) : code;

    var rInt = 0;
    var gInt = 0;
    var bInt = 0;
    var aInt = 255;

    if (hex.length == 3 || hex.length == 4) {
      rInt = int.parse(hex[0] * 2, radix: 16);
      gInt = int.parse(hex[1] * 2, radix: 16);
      bInt = int.parse(hex[2] * 2, radix: 16);
      if (hex.length == 4) {
        aInt = int.parse(hex[3] * 2, radix: 16);
      }
    } else if (hex.length == 6 || hex.length == 8) {
      rInt = int.parse(hex.substring(0, 2), radix: 16);
      gInt = int.parse(hex.substring(2, 4), radix: 16);
      bInt = int.parse(hex.substring(4, 6), radix: 16);
      if (hex.length == 8) {
        aInt = int.parse(hex.substring(6, 8), radix: 16);
      }
    }

    return SdlxFColor(rInt / 255.0, gInt / 255.0, bInt / 255.0, aInt / 255.0);
  }

  final double r;
  final double g;
  final double b;
  final double a;

  static int _dtoi(double v) => (v * 255).round().clamp(0, 255);
  static String _vtos(double v) => _dtoi(v).toRadixString(16).padLeft(2, '0');

  SdlxColor toInt() => SdlxColor(_dtoi(r), _dtoi(g), _dtoi(b), _dtoi(a));

  String toStringCode({
    String header = '#',
    bool upperCase = false,
    bool ignoreAlpha = false,
  }) {
    var result = '';
    result += header;
    result += _vtos(r);
    result += _vtos(g);
    result += _vtos(b);
    if (!ignoreAlpha) {
      result += _vtos(a);
    }
    if (upperCase) {
      result = result.toUpperCase();
    }
    return result;
  }

  SdlxFColor moveTowards(SdlxFColor target, double dt, {double speed = 1.0}) {
    final factor = (dt * speed).clamp(0.0, 1.0);
    return SdlxFColor(
      r + (target.r - r) * factor,
      g + (target.g - g) * factor,
      b + (target.b - b) * factor,
      a + (target.a - a) * factor,
    );
  }

  Pointer<SdlFColor> calloc() {
    final pointer = ffi.calloc<SdlFColor>();
    pointer.ref.r = r;
    pointer.ref.g = g;
    pointer.ref.b = b;
    pointer.ref.a = a;
    return pointer;
  }
}

extension SdlxFColorListExtension on List<SdlxFColor> {
  Pointer<SdlFColor> calloc() {
    final buffersPointer = ffi.calloc<SdlFColor>(length);
    for (var i = 0; i < length; i++) {
      final bufferPointer = buffersPointer + i;
      bufferPointer.ref.r = this[i].r;
      bufferPointer.ref.g = this[i].g;
      bufferPointer.ref.b = this[i].b;
      bufferPointer.ref.a = this[i].a;
    }
    return buffersPointer;
  }
}
