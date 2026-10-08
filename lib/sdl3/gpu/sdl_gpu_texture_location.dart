part of '../sdl_gpu.dart';

class SdlxGpuTextureLocation {
  SdlxGpuTextureLocation({
    Pointer<SdlGpuTexture>? texture,
    this.mipLevel = 0,
    this.layer = 0,
    this.x = 0,
    this.y = 0,
    this.z = 0,
  }) : texture = texture ?? nullptr;

  final Pointer<SdlGpuTexture> texture;
  final int mipLevel;
  final int layer;
  final int x;
  final int y;
  final int z;

  Pointer<SdlGpuTextureLocation> calloc() {
    final pointer = ffi.calloc<SdlGpuTextureLocation>();
    pointer.ref.texture = texture;
    pointer.ref.mipLevel = mipLevel;
    pointer.ref.layer = layer;
    pointer.ref.x = x;
    pointer.ref.y = y;
    pointer.ref.z = z;
    return pointer;
  }
}
