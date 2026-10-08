part of '../sdl_gpu.dart';

class SdlxGpuTextureSamplerBinding {
  SdlxGpuTextureSamplerBinding({
    Pointer<SdlGpuTexture>? texture,
    Pointer<SdlGpuSampler>? sampler,
  }) : texture = texture ?? nullptr,
       sampler = sampler ?? nullptr;

  final Pointer<SdlGpuTexture> texture;
  final Pointer<SdlGpuSampler> sampler;

  Pointer<SdlGpuTextureSamplerBinding> calloc() {
    final pointer = ffi.calloc<SdlGpuTextureSamplerBinding>();
    pointer.ref.texture = texture;
    pointer.ref.sampler = sampler;
    return pointer;
  }
}

extension SdlxGpuTextureSamplerBindingListExtension
    on List<SdlxGpuTextureSamplerBinding> {
  Pointer<SdlGpuTextureSamplerBinding> calloc() {
    final buffersPointer = ffi.calloc<SdlGpuTextureSamplerBinding>(length);
    for (var n = 0; n < length; n++) {
      final bufferPointer = buffersPointer + n;
      bufferPointer.ref.texture = this[n].texture;
      bufferPointer.ref.sampler = this[n].sampler;
    }
    return buffersPointer;
  }
}
