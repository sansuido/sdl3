part of '../../sdl.dart';

class SdlxFColor {
  SdlxFColor(this.r, this.g, this.b, [this.a = 1.0]);

  double r;
  double g;
  double b;
  double a;

  static SdlxFColor fromStringCode(String code) =>
      SdlxFColor(0, 0, 0)..loadFromStringCode(code);

  static int _dtoi(double v) => (v * 255).round().clamp(0, 255);
  static double _itod(int v) => v / 255;
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

  void loadFromStringCode(String code) {
    var code0 = code;
    final items = List<int>.generate(4, (code) => 0);
    items[3] = 0xff;
    var shift = 1;
    if (code0.startsWith('#')) {
      code0 = code0.substring(1);
    }
    if (code0.length >= 6) {
      shift = 2;
    }
    var itemIndex = 0;
    for (var pos = 0; pos < code0.length; pos += shift) {
      for (var calc = 0; calc < shift; calc++) {
        final c = code0[pos + calc].toLowerCase();
        var value = 0;
        switch (c) {
          case 'a':
          case 'b':
          case 'c':
          case 'd':
          case 'e':
          case 'f':
            value = c.codeUnitAt(0) - 'a'.codeUnitAt(0) + 10;
          default:
            value = c.codeUnitAt(0) - '0'.codeUnitAt(0);
        }
        if (calc == 0) {
          switch (shift) {
            case 1:
              items[itemIndex] += value * 32;
            case 2:
              items[itemIndex] += value * 16;
          }
        } else {
          items[itemIndex] += value;
        }
      }
      itemIndex++;
    }
    a = _itod(items[3]);
    b = _itod(items[2]);
    g = _itod(items[1]);
    r = _itod(items[0]);
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
