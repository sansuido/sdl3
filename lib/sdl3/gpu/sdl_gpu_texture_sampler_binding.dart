part of '../sdl_gpu.dart';

class SdlxGpuTextureSamplerBinding {
  SdlxGpuTextureSamplerBinding({
    Pointer<SdlGpuTexture>? texture,
    Pointer<SdlGpuSampler>? sampler,
  }) : texture = texture ?? nullptr,
       sampler = sampler ?? nullptr;

  final Pointer<SdlGpuTexture> texture;
  final Pointer<SdlGpuSampler> sampler;

  Pointer<SdlGpuTextureSamplerBinding> toNative([
    Allocator allocator = ffi.calloc,
  ]) {
    final pointer = allocator<SdlGpuTextureSamplerBinding>();
    pointer.ref.texture = texture;
    pointer.ref.sampler = sampler;
    return pointer;
  }
}

extension SdlxGpuTextureSamplerBindingListExtension
    on List<SdlxGpuTextureSamplerBinding> {
  Pointer<SdlGpuTextureSamplerBinding> toNative([
    Allocator allocator = ffi.calloc,
  ]) {
    final buffersPointer = allocator<SdlGpuTextureSamplerBinding>(length);
    for (var n = 0; n < length; n++) {
      final bufferPointer = buffersPointer + n;
      bufferPointer.ref.texture = this[n].texture;
      bufferPointer.ref.sampler = this[n].sampler;
    }
    return buffersPointer;
  }
}
