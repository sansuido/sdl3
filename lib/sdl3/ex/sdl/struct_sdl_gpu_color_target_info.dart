part of '../../sdl.dart';

class SdlxGpuColorTargetInfo {
  SdlxGpuColorTargetInfo({
    Pointer<SdlGpuTexture>? texture,
    this.mipLevel = 0,
    this.layerOrDepthPlane = 0,
    SdlxFColor? clearColor,
    this.loadOp = 0,
    this.storeOp = 0,
    Pointer<SdlGpuTexture>? resolveTexture,
    this.resolveMipLevel = 0,
    this.resolveLayer = 0,
    this.cycle = 0,
    this.cycleResolveTexture = 0,
  }) {
    this.texture = texture ?? nullptr;
    this.clearColor = clearColor ?? SdlxFColor(0, 0, 0);
    this.resolveTexture = resolveTexture ?? nullptr;
  }
  late Pointer<SdlGpuTexture> texture;
  int mipLevel;
  int layerOrDepthPlane;
  late SdlxFColor clearColor;
  int loadOp;
  int storeOp;
  late Pointer<SdlGpuTexture> resolveTexture;
  int resolveMipLevel;
  int resolveLayer;
  int cycle;
  int cycleResolveTexture;

  Pointer<SdlGpuColorTargetInfo> calloc() {
    final pointer = ffi.calloc<SdlGpuColorTargetInfo>();
    pointer.ref.texture = texture;
    pointer.ref.mipLevel = mipLevel;
    pointer.ref.layerOrDepthPlane = layerOrDepthPlane;
    pointer.clearColor.ref.r = clearColor.r;
    pointer.clearColor.ref.g = clearColor.g;
    pointer.clearColor.ref.b = clearColor.b;
    pointer.clearColor.ref.a = clearColor.a;
    pointer.ref.loadOp = loadOp;
    pointer.ref.storeOp = storeOp;
    pointer.ref.resolveTexture = resolveTexture;
    pointer.ref.resolveMipLevel = resolveMipLevel;
    pointer.ref.resolveLayer = resolveLayer;
    pointer.ref.cycle = cycle;
    pointer.ref.cycleResolveTexture = cycleResolveTexture;
    return pointer;
  }
}

extension SdlxGpuColorTargetInfoListExtension on List<SdlxGpuColorTargetInfo> {
  Pointer<SdlGpuColorTargetInfo> calloc() {
    final buffersPointer = ffi.calloc<SdlGpuColorTargetInfo>(length);
    for (var n = 0; n < length; n++) {
      final bufferPointer = buffersPointer + n;
      bufferPointer.ref.texture = this[n].texture;
      bufferPointer.ref.mipLevel = this[n].mipLevel;
      bufferPointer.ref.layerOrDepthPlane = this[n].layerOrDepthPlane;
      bufferPointer.clearColor.ref.r = this[n].clearColor.r;
      bufferPointer.clearColor.ref.g = this[n].clearColor.g;
      bufferPointer.clearColor.ref.b = this[n].clearColor.b;
      bufferPointer.clearColor.ref.a = this[n].clearColor.a;
      bufferPointer.ref.loadOp = this[n].loadOp;
      bufferPointer.ref.storeOp = this[n].storeOp;
      bufferPointer.ref.resolveTexture = this[n].resolveTexture;
      bufferPointer.ref.resolveMipLevel = this[n].resolveMipLevel;
      bufferPointer.ref.resolveLayer = this[n].resolveLayer;
      bufferPointer.ref.cycle = this[n].cycle;
      bufferPointer.ref.cycleResolveTexture = this[n].cycleResolveTexture;
    }
    return buffersPointer;
  }
}
