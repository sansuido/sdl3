part of '../../sdl.dart';

class SdlxGpuTextureLocation {
  SdlxGpuTextureLocation({
    Pointer<SdlGpuTexture>? texture,
    this.mipLevel = 0,
    this.layer = 0,
    this.x = 0,
    this.y = 0,
    this.z = 0,
  }) {
    this.texture = texture ?? nullptr;
  }
  late Pointer<SdlGpuTexture> texture;
  int mipLevel;
  int layer;
  int x;
  int y;
  int z;

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
