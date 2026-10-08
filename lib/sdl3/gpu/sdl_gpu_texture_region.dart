part of '../sdl_gpu.dart';

class SdlxGpuTextureRegion {
  SdlxGpuTextureRegion({
    Pointer<SdlGpuTexture>? texture,
    this.mipLevel = 0,
    this.layer = 0,
    this.x = 0,
    this.y = 0,
    this.z = 0,
    this.w = 0,
    this.h = 0,
    this.d = 0,
  }) : texture = texture ?? nullptr;

  final Pointer<SdlGpuTexture> texture;
  final int mipLevel;
  final int layer;
  final int x;
  final int y;
  final int z;
  final int w;
  final int h;
  final int d;

  Pointer<SdlGpuTextureRegion> calloc() {
    final pointer = ffi.calloc<SdlGpuTextureRegion>();
    pointer.ref.texture = texture;
    pointer.ref.mipLevel = mipLevel;
    pointer.ref.layer = layer;
    pointer.ref.x = x;
    pointer.ref.y = y;
    pointer.ref.z = z;
    pointer.ref.w = w;
    pointer.ref.h = h;
    pointer.ref.d = d;
    return pointer;
  }
}
