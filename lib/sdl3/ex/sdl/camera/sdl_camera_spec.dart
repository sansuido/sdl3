part of '../../../sdl.dart';

class SdlxCameraSpec {
  SdlxCameraSpec({
    this.format = 0,
    this.colorspace = 0,
    this.width = 0,
    this.height = 0,
    this.framerateNumerator = 0,
    this.framerateDenominator = 0,
  });

  int format;
  int colorspace;
  int width;
  int height;
  int framerateNumerator;
  int framerateDenominator;

  void loadFromPointer(Pointer<SdlCameraSpec> pointer) {
    format = pointer.ref.format;
    colorspace = pointer.ref.colorspace;
    width = pointer.ref.width;
    height = pointer.ref.height;
    framerateNumerator = pointer.ref.framerateNumerator;
    framerateDenominator = pointer.ref.framerateDenominator;
  }

  Pointer<SdlCameraSpec> calloc() {
    final pointer = ffi.calloc<SdlCameraSpec>();
    pointer.ref.format = format;
    pointer.ref.colorspace = colorspace;
    pointer.ref.width = width;
    pointer.ref.height = height;
    pointer.ref.framerateNumerator = framerateNumerator;
    pointer.ref.framerateDenominator = framerateDenominator;
    return pointer;
  }
}
