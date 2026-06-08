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
    this.cycle = false,
  }) {
    source = SdlxGpuBlitRegion();
    destination = SdlxGpuBlitRegion();
    clearColor = SdlxFColor(0, 0, 0);
  }

  late SdlxGpuBlitRegion source;
  late SdlxGpuBlitRegion destination;
  int loadOp;
  late SdlxFColor clearColor;
  int flipMode;
  int filter;
  bool cycle;

  Pointer<SdlGpuBlitInfo> calloc() {
    final pointer = ffi.calloc<SdlGpuBlitInfo>();
    pointer.ref.source.texture = source.texture;
    pointer.ref.source.mipLevel = source.mipLevel;
    pointer.ref.source.layerOrDepthPlane = source.layerOrDepthPlane;
    pointer.ref.source.x = source.x;
    pointer.ref.source.y = source.y;
    pointer.ref.source.w = source.w;
    pointer.ref.source.h = source.h;
    pointer.ref.destination.texture = destination.texture;
    pointer.ref.destination.mipLevel = destination.mipLevel;
    pointer.ref.destination.layerOrDepthPlane = destination.layerOrDepthPlane;
    pointer.ref.destination.x = destination.x;
    pointer.ref.destination.y = destination.y;
    pointer.ref.destination.w = destination.w;
    pointer.ref.destination.h = destination.h;
    pointer.ref.loadOp = loadOp;
    pointer.ref.clearColor.r = clearColor.r;
    pointer.ref.clearColor.g = clearColor.g;
    pointer.ref.clearColor.b = clearColor.b;
    pointer.ref.clearColor.a = clearColor.a;
    pointer.ref.flipMode = flipMode;
    pointer.ref.filter = filter;
    pointer.ref.cycle = cycle;
    return pointer;
  }
}
