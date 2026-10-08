part of '../sdl_render.dart';

class SdlxGpuRenderStateCreateInfo {
  SdlxGpuRenderStateCreateInfo({
    Pointer<SdlGpuShader>? fragmentShader,
    this.samplerBindings = const [],
    this.storageTextures = const [],
    this.storageBuffers = const [],
    this.props = 0,
  }) : fragmentShader = fragmentShader ?? nullptr;

  final Pointer<SdlGpuShader> fragmentShader;
  final List<SdlxGpuTextureSamplerBinding> samplerBindings;
  final List<Pointer<SdlGpuTexture>> storageTextures;
  final List<Pointer<SdlGpuBuffer>> storageBuffers;
  final int props;

  Pointer<SdlGpuRenderStateCreateInfo> calloc() {
    final pointer = ffi.calloc<SdlGpuRenderStateCreateInfo>();
    pointer.ref.fragmentShader = fragmentShader;
    if (samplerBindings.isNotEmpty) {
      pointer.ref.numSamplerBindings = samplerBindings.length;
      pointer.ref.samplerBindings = samplerBindings.calloc();
    }
    if (storageTextures.isNotEmpty) {
      pointer.ref.numStorageTextures = storageTextures.length;
      pointer.ref.storageTextures = ffi.calloc<Pointer<SdlGpuTexture>>(
        storageTextures.length,
      );
      for (var i = 0; i < storageTextures.length; i++) {
        pointer.ref.storageTextures[i] = storageTextures[i];
      }
    }
    if (storageBuffers.isNotEmpty) {
      pointer.ref.numStorageBuffers = storageBuffers.length;
      pointer.ref.storageBuffers = ffi.calloc<Pointer<SdlGpuBuffer>>(
        storageBuffers.length,
      );
      for (var i = 0; i < storageBuffers.length; i++) {
        pointer.ref.storageBuffers[i] = storageBuffers[i];
      }
    }
    pointer.ref.props = props;
    return pointer;
  }
}

extension SdlGpuRenderStateCreateInfoPointerEx
    on Pointer<SdlGpuRenderStateCreateInfo> {
  void callocAllFree() {
    if (ref.samplerBindings != nullptr) {
      ref.samplerBindings.callocFree();
    }
    if (ref.storageTextures != nullptr) {
      ref.storageTextures.callocFree();
    }
    if (ref.storageBuffers != nullptr) {
      ref.storageBuffers.callocFree();
    }
    callocFree();
  }
}
