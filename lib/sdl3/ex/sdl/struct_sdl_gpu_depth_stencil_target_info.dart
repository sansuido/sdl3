part of '../../sdl.dart';

class SdlxGpuDepthStencilTargetInfo {
  SdlxGpuDepthStencilTargetInfo({
    Pointer<SdlGpuTexture>? texture,
    this.clearDepth = 0,
    this.loadOp = 0,
    this.storeOp = 0,
    this.stencilLoadOp = 0,
    this.stencilStoreOp = 0,
    this.cycle = 0,
    this.clearStencil = 0,
    this.mipLevel = 0,
    this.layer = 0,
  }) {
    this.texture = texture ?? nullptr;
  }
  late Pointer<SdlGpuTexture> texture;
  double clearDepth;
  int loadOp;
  int storeOp;
  int stencilLoadOp;
  int stencilStoreOp;
  int cycle;
  int clearStencil;
  int mipLevel;
  int layer;

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

//// SDL_GPUDepthStencilTargetInfo
///// {@category gpu}
//final class SdlGpuDepthStencilTargetInfo extends Struct {
//  // [0]+(8)
//  external Pointer<SdlGpuTexture> texture;
//  // [8]+(4)
//  @Float()
//  external double clearDepth;
//  // [12]+(4)
//  @Int32()
//  external int loadOp;
//  // [16]+(4)
//  @Int32()
//  external int storeOp;
//  // [20]+(4)
//  @Int32()
//  external int stencilLoadOp;
//  // [24]+(4)
//  @Int32()
//  external int stencilStoreOp;
//  // [28]+(1)
//  @Uint8()
//  external int cycle;
//  // [29]+(1)
//  @Uint8()
//  external int clearStencil;
//  // [30]+(1)
//  @Uint8()
//  external int mipLevel;
//  // [31]+(1)
//  @Uint8()
//  external int layer;
//}
//
