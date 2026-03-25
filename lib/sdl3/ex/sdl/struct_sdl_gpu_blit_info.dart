part of '../../sdl.dart';

class SdlxGpuBlitRegion {
  SdlxGpuBlitRegion({
    Pointer<SdlGpuTexture>? texture,
    this.mipLevel = 0,
    this.layerOrDepthPlane = 0,
    this.x = 0,
    this.y = 0,
    this.w = 0,
    this.h = 0,
  }) {
    this.texture = texture ?? nullptr;
  }
  late Pointer<SdlGpuTexture> texture;
  int mipLevel;
  int layerOrDepthPlane;
  int x;
  int y;
  int w;
  int h;
}

class SdlxGpuBlitInfo {
  SdlxGpuBlitInfo({
    this.loadOp = 0,
    this.flipMode = 0,
    this.filter = 0,
    this.cycle = 0,
  }) {
    source = SdlxGpuBlitRegion();
    destination = SdlxGpuBlitRegion();
    clearColor = SdlxFColor();
  }

  late SdlxGpuBlitRegion source;
  late SdlxGpuBlitRegion destination;
  int loadOp;
  late SdlxFColor clearColor;
  int flipMode;
  int filter;
  int cycle;

  Pointer<SdlGpuBlitInfo> calloc() {
    final pointer = ffi.calloc<SdlGpuBlitInfo>();
    pointer.source.ref.texture = source.texture;
    pointer.source.ref.mipLevel = source.mipLevel;
    pointer.source.ref.layerOrDepthPlane = source.layerOrDepthPlane;
    pointer.source.ref.x = source.x;
    pointer.source.ref.y = source.y;
    pointer.source.ref.w = source.w;
    pointer.source.ref.h = source.h;
    pointer.destination.ref.texture = destination.texture;
    pointer.destination.ref.mipLevel = destination.mipLevel;
    pointer.destination.ref.layerOrDepthPlane = destination.layerOrDepthPlane;
    pointer.destination.ref.x = destination.x;
    pointer.destination.ref.y = destination.y;
    pointer.destination.ref.w = destination.w;
    pointer.destination.ref.h = destination.h;
    pointer.ref.loadOp = loadOp;
    pointer.clearColor.ref.r = clearColor.r;
    pointer.clearColor.ref.g = clearColor.g;
    pointer.clearColor.ref.b = clearColor.b;
    pointer.clearColor.ref.a = clearColor.a;
    pointer.ref.flipMode = flipMode;
    pointer.ref.filter = filter;
    pointer.ref.cycle = cycle;
    return pointer;
  }
}
