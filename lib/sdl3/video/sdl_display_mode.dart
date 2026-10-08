part of '../sdl_video.dart';

class SdlxDisplayMode {
  SdlxDisplayMode({
    this.displayId = 0,
    this.format = 0,
    this.w = 0,
    this.h = 0,
    this.pixelDensity = 0.0,
    this.refreshRate = 0.0,
    this.refreshRateNumerator = 0,
    this.refreshRateDenominator = 0,
    Pointer<SdlDisplayModeData>? internal,
  }) : internal = internal ?? nullptr;

  factory SdlxDisplayMode.fromPointer(Pointer<SdlDisplayMode> pointer) =>
      SdlxDisplayMode(
        displayId: pointer.ref.displayId,
        format: pointer.ref.format,
        w: pointer.ref.w,
        h: pointer.ref.h,
        pixelDensity: pointer.ref.pixelDensity,
        refreshRate: pointer.ref.refreshRate,
        refreshRateNumerator: pointer.ref.refreshRateNumerator,
        refreshRateDenominator: pointer.ref.refreshRateDenominator,
        internal: pointer.ref.internal,
      );

  final int displayId;
  final int format;
  final int w;
  final int h;
  final double pixelDensity;
  final double refreshRate;
  final int refreshRateNumerator;
  final int refreshRateDenominator;
  final Pointer<SdlDisplayModeData> internal;

  Pointer<SdlDisplayMode> calloc() {
    final pointer = ffi.calloc<SdlDisplayMode>();
    pointer.ref
      ..displayId = displayId
      ..format = format
      ..w = w
      ..h = h
      ..pixelDensity = pixelDensity
      ..refreshRate = refreshRate
      ..refreshRateNumerator = refreshRateNumerator
      ..refreshRateDenominator = refreshRateDenominator
      ..internal = internal;
    return pointer;
  }
}
