part of '../../../sdl.dart';

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
    this.cycle = false,
    this.cycleResolveTexture = false,
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
  bool cycle;
  bool cycleResolveTexture;

  Pointer<SdlGpuColorTargetInfo> calloc() {
    final pointer = ffi.calloc<SdlGpuColorTargetInfo>();
    pointer.ref.texture = texture;
    pointer.ref.mipLevel = mipLevel;
    pointer.ref.layerOrDepthPlane = layerOrDepthPlane;
    pointer.ref.clearColor.r = clearColor.r;
    pointer.ref.clearColor.g = clearColor.g;
    pointer.ref.clearColor.b = clearColor.b;
    pointer.ref.clearColor.a = clearColor.a;
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
      bufferPointer.ref.clearColor.r = this[n].clearColor.r;
      bufferPointer.ref.clearColor.g = this[n].clearColor.g;
      bufferPointer.ref.clearColor.b = this[n].clearColor.b;
      bufferPointer.ref.clearColor.a = this[n].clearColor.a;
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
