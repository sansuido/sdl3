part of '../sdl_gpu.dart';

class SdlxGpuComputePipelineCreateInfo {
  SdlxGpuComputePipelineCreateInfo({
    Uint8List? code,
    this.entrypoint = '',
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
    this.code = code ?? Uint8List(0);
  }
  late Uint8List code;
  String entrypoint;
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
    if (code.isNotEmpty) {
      final codePointer = ffi.calloc<Uint8>(code.length)
        ..asTypedList(code.length).setAll(0, code);
      pointer.ref.codeSize = code.length;
      pointer.ref.code = codePointer;
    }
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
    if (ref.code != nullptr) {
      ref.code.callocFree();
    }
    if (ref.entrypoint != nullptr) {
      ref.entrypoint.callocFree();
    }
    callocFree();
  }
}
