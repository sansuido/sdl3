part of '../sdl_gpu.dart';

class SdlxGpuDepthStencilTargetInfo {
  SdlxGpuDepthStencilTargetInfo({
    Pointer<SdlGpuTexture>? texture,
    this.clearDepth = 0,
    this.loadOp = 0,
    this.storeOp = 0,
    this.stencilLoadOp = 0,
    this.stencilStoreOp = 0,
    this.cycle = false,
    this.clearStencil = 0,
    this.mipLevel = 0,
    this.layer = 0,
  }) : texture = texture ?? nullptr;

  final Pointer<SdlGpuTexture> texture;
  final double clearDepth;
  final int loadOp;
  final int storeOp;
  final int stencilLoadOp;
  final int stencilStoreOp;
  final bool cycle;
  final int clearStencil;
  final int mipLevel;
  final int layer;

  Pointer<SdlGpuDepthStencilTargetInfo> calloc() {
    final pointer = ffi.calloc<SdlGpuDepthStencilTargetInfo>();
    pointer.ref.texture = texture;
    pointer.ref.clearDepth = clearDepth;
    pointer.ref.loadOp = loadOp;
    pointer.ref.storeOp = storeOp;
    pointer.ref.stencilLoadOp = stencilLoadOp;
    pointer.ref.stencilStoreOp = stencilStoreOp;
    pointer.ref.cycle = cycle;
    pointer.ref.clearStencil = clearStencil;
    pointer.ref.mipLevel = mipLevel;
    pointer.ref.layer = layer;
    return pointer;
  }
}
