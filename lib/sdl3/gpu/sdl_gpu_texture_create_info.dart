part of '../sdl_gpu.dart';

class SdlxGpuTextureCreateInfo {
  const SdlxGpuTextureCreateInfo({
    this.type = 0,
    this.format = 0,
    this.usage = 0,
    this.width = 0,
    this.height = 0,
    this.layerCountOrDepth = 0,
    this.numLevels = 0,
    this.sampleCount = 0,
    this.props = 0,
  });

  final int type;
  final int format;
  final int usage;
  final int width;
  final int height;
  final int layerCountOrDepth;
  final int numLevels;
  final int sampleCount;
  final int props;

  Pointer<SdlGpuTextureCreateInfo> calloc() {
    final pointer = ffi.calloc<SdlGpuTextureCreateInfo>();
    pointer.ref.type = type;
    pointer.ref.format = format;
    pointer.ref.usage = usage;
    pointer.ref.width = width;
    pointer.ref.height = height;
    pointer.ref.layerCountOrDepth = layerCountOrDepth;
    pointer.ref.numLevels = numLevels;
    pointer.ref.sampleCount = sampleCount;
    pointer.ref.props = props;
    return pointer;
  }
}
