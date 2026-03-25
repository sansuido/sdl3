part of '../../sdl.dart';

class SdlxGpuShaderCreateInfo {
  SdlxGpuShaderCreateInfo({
    this.codeSize = 0,
    Pointer<Uint8>? code,
    String? entrypoint,
    this.format = 0,
    this.stage = 0,
    this.numSamplers = 0,
    this.numStorageTextures = 0,
    this.numStorageBuffers = 0,
    this.numUniformBuffers = 0,
    this.props = 0,
  }) {
    this.code = code ?? nullptr;
    this.entrypoint = entrypoint ?? '';
  }
  int codeSize;
  late Pointer<Uint8> code;
  late String entrypoint;
  int format;
  int stage;
  int numSamplers;
  int numStorageTextures;
  int numStorageBuffers;
  int numUniformBuffers;
  int props;

  Pointer<SdlGpuShaderCreateInfo> calloc() {
    final pointer = ffi.calloc<SdlGpuShaderCreateInfo>();
    pointer.ref.codeSize = codeSize;
    pointer.ref.code = code;
    if (entrypoint.isNotEmpty) {
      pointer.ref.entrypoint = entrypoint.toNativeUtf8();
    }
    pointer.ref.format = format;
    pointer.ref.stage = stage;
    pointer.ref.numSamplers = numSamplers;
    pointer.ref.numStorageTextures = numStorageTextures;
    pointer.ref.numStorageBuffers = numStorageBuffers;
    pointer.ref.numUniformBuffers = numUniformBuffers;
    pointer.ref.props = props;
    return pointer;
  }
}

extension SdlGpuShaderCreateInfoCallocAllFreeExtension
    on Pointer<SdlGpuShaderCreateInfo> {
  void callocAllFree() {
    if (ref.entrypoint != nullptr) {
      ref.entrypoint.callocFree();
    }
    callocFree();
  }
}
