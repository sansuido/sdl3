part of '../../../sdl.dart';

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
  }) {
    this.texture = texture ?? nullptr;
  }
  late Pointer<SdlGpuTexture> texture;
  int mipLevel;
  int layer;
  int x;
  int y;
  int z;
  int w;
  int h;
  int d;

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
