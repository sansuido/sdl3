part of '../../../sdl.dart';

class SdlxGpuSwapchainTextureInfo {
  SdlxGpuSwapchainTextureInfo({
    Pointer<SdlGpuTexture>? texture,
    this.w = 0,
    this.h = 0,
  }) {
    this.texture = texture ?? nullptr;
  }
  late Pointer<SdlGpuTexture> texture;
  int w;
  int h;
}
