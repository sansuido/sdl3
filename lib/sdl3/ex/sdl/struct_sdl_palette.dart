part of '../../sdl.dart';

class SdlxPalette {
  SdlxPalette({List<SdlxColor>? colors, this.version = 0, this.refcount = 0}) {
    this.colors = colors ?? [];
  }

  late List<SdlxColor> colors;
  int version;
  int refcount;

  void loadFromPointer(Pointer<SdlPalette> pointer) {
    version = pointer.ref.version;
    refcount = pointer.ref.refcount;
    colors.clear();
    if (pointer.ref.ncolors != 0) {
      for (var i = 0; i < pointer.ref.ncolors; i++) {
        final colorPointer = pointer.ref.colors + i;
        colors.add(
          SdlxColor(
            colorPointer.ref.r,
            colorPointer.ref.g,
            colorPointer.ref.b,
            colorPointer.ref.a,
          ),
        );
      }
    }
  }

  Pointer<SdlPalette> calloc() {
    final pointer = ffi.calloc<SdlPalette>();
    if (colors.isNotEmpty) {
      pointer.ref.ncolors = colors.length;
      pointer.ref.colors = ffi.calloc<SdlColor>(colors.length);
      for (var i = 0; i < colors.length; i++) {
        pointer.ref.colors[i].r = colors[i].r;
        pointer.ref.colors[i].g = colors[i].g;
        pointer.ref.colors[i].b = colors[i].b;
        pointer.ref.colors[i].a = colors[i].a;
      }
    }
    pointer.ref.version = version;
    pointer.ref.refcount = refcount;
    return pointer;
  }
}

extension SdlPaletteCallocAllFreeExtension on Pointer<SdlPalette> {
  void callocAllFree() {
    if (ref.ncolors != 0) {
      ref.colors.callocFree();
    }
    callocFree();
  }
}
