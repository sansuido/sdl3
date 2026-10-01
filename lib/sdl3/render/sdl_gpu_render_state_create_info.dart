part of '../sdl_render.dart';

class SdlxGpuRenderStateCreateInfo {
  SdlxGpuRenderStateCreateInfo({
    Pointer<SdlGpuShader>? fragmentShader,
    List<SdlxGpuTextureSamplerBinding>? samplerBindings,
    List<Pointer<SdlGpuTexture>>? storageTextures,
    List<Pointer<SdlGpuBuffer>>? storageBuffers,
    this.props = 0,
  }) {
    this.fragmentShader = fragmentShader ?? nullptr;
    this.samplerBindings = samplerBindings ?? [];
    this.storageTextures = storageTextures ?? [];
    this.storageBuffers = storageBuffers ?? [];
  }
  late Pointer<SdlGpuShader> fragmentShader;
  //int numSamplerBindings;
  late List<SdlxGpuTextureSamplerBinding> samplerBindings;
  //int numStorageTextures;
  late List<Pointer<SdlGpuTexture>> storageTextures;
  //int numStorageBuffers;
  late List<Pointer<SdlGpuBuffer>> storageBuffers;
  int props;

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
