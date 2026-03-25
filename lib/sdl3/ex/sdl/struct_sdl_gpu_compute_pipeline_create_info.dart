part of '../../sdl.dart';

class SdlxGpuComputePipelineCreateInfo {
  SdlxGpuComputePipelineCreateInfo({
    this.codeSize = 0,
    Pointer<Uint8>? code,
    String? entrypoint,
    this.format = 0,
    this.numSamplers = 0,
    this.numReadonlyStorageTextures = 0,
    this.numReadonlyStorageBuffers = 0,
    this.numReadwriteStorageTextures = 0,
    this.numReadwriteStorageBuffers = 0,
    this.numUniformBuffers = 0,
    this.threadcountX = 0,
    this.threadcountY = 0,
    this.threadcountZ = 0,
    this.props = 0,
  }) {
    this.code = code ?? nullptr;
    this.entrypoint = entrypoint ?? '';
  }
  int codeSize;
  late Pointer<Uint8> code;
  late String entrypoint;
  int format;
  int numSamplers;
  int numReadonlyStorageTextures;
  int numReadonlyStorageBuffers;
  int numReadwriteStorageTextures;
  int numReadwriteStorageBuffers;
  int numUniformBuffers;
  int threadcountX;
  int threadcountY;
  int threadcountZ;
  int props;

  Pointer<SdlGpuComputePipelineCreateInfo> calloc() {
    final pointer = ffi.calloc<SdlGpuComputePipelineCreateInfo>();

    pointer.ref.codeSize = codeSize;
    pointer.ref.code = code;
    if (entrypoint.isNotEmpty) {
      pointer.ref.entrypoint = entrypoint.toNativeUtf8();
    }
    pointer.ref.format = format;
    pointer.ref.numSamplers = numSamplers;
    pointer.ref.numReadonlyStorageTextures = numReadonlyStorageTextures;
    pointer.ref.numReadonlyStorageBuffers = numReadonlyStorageBuffers;
    pointer.ref.numReadwriteStorageTextures = numReadwriteStorageTextures;
    pointer.ref.numReadwriteStorageBuffers = numReadwriteStorageBuffers;
    pointer.ref.numUniformBuffers = numUniformBuffers;
    pointer.ref.threadcountX = threadcountX;
    pointer.ref.threadcountY = threadcountY;
    pointer.ref.threadcountZ = threadcountZ;
    pointer.ref.props = props;

    return pointer;
  }
}

extension SdlGpuComputePipelineCreateInfoCallocAllFreeExtension
    on Pointer<SdlGpuComputePipelineCreateInfo> {
  void callocAllFree() {
    if (ref.entrypoint != nullptr) {
      ref.entrypoint.callocFree();
    }
    callocFree();
  }
}
