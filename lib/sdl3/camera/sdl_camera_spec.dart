part of '../sdl_camera.dart';

class SdlxCameraSpec {
  const SdlxCameraSpec({
    this.format = 0,
    this.colorspace = 0,
    this.width = 0,
    this.height = 0,
    this.framerateNumerator = 0,
    this.framerateDenominator = 0,
  });

  factory SdlxCameraSpec.fromPointer(Pointer<SdlCameraSpec> pointer) =>
      SdlxCameraSpec(
        format: pointer.ref.format,
        colorspace: pointer.ref.colorspace,
        width: pointer.ref.width,
        height: pointer.ref.height,
        framerateNumerator: pointer.ref.framerateNumerator,
        framerateDenominator: pointer.ref.framerateDenominator,
      );

  final int format;
  final int colorspace;
  final int width;
  final int height;
  final int framerateNumerator;
  final int framerateDenominator;

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
