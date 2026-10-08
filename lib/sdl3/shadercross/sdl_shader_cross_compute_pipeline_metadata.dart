part of '../sdl_shadercross.dart';

class SdlxShaderCrossComputePipelineMetadata {
  const SdlxShaderCrossComputePipelineMetadata({
    this.numSamplers = 0,
    this.numReadonlyStorageTextures = 0,
    this.numReadonlyStorageBuffers = 0,
    this.numReadwriteStorageTextures = 0,
    this.numReadwriteStorageBuffers = 0,
    this.numUniformBuffers = 0,
    this.threadcountX = 0,
    this.threadcountY = 0,
    this.threadcountZ = 0,
  });

  factory SdlxShaderCrossComputePipelineMetadata.fromPointer(
    Pointer<SdlShaderCrossComputePipelineMetadata> pointer,
  ) => SdlxShaderCrossComputePipelineMetadata(
    numSamplers: pointer.ref.numSamplers,
    numReadonlyStorageTextures: pointer.ref.numReadonlyStorageTextures,
    numReadonlyStorageBuffers: pointer.ref.numReadonlyStorageBuffers,
    numReadwriteStorageTextures: pointer.ref.numReadwriteStorageTextures,
    numReadwriteStorageBuffers: pointer.ref.numReadwriteStorageBuffers,
    numUniformBuffers: pointer.ref.numUniformBuffers,
    threadcountX: pointer.ref.threadcountX,
    threadcountY: pointer.ref.threadcountY,
    threadcountZ: pointer.ref.threadcountZ,
  );

  final int numSamplers;
  final int numReadonlyStorageTextures;
  final int numReadonlyStorageBuffers;
  final int numReadwriteStorageTextures;
  final int numReadwriteStorageBuffers;
  final int numUniformBuffers;
  final int threadcountX;
  final int threadcountY;
  final int threadcountZ;

  Pointer<SdlShaderCrossComputePipelineMetadata> calloc() {
    final pointer = ffi.calloc<SdlShaderCrossComputePipelineMetadata>();
    pointer.ref.numSamplers = numSamplers;
    pointer.ref.numReadonlyStorageTextures = numReadonlyStorageTextures;
    pointer.ref.numReadonlyStorageBuffers = numReadonlyStorageBuffers;
    pointer.ref.numReadwriteStorageTextures = numReadwriteStorageTextures;
    pointer.ref.numReadwriteStorageBuffers = numReadwriteStorageBuffers;
    pointer.ref.numUniformBuffers = numUniformBuffers;
    pointer.ref.threadcountX = threadcountX;
    pointer.ref.threadcountY = threadcountY;
    pointer.ref.threadcountZ = threadcountZ;
    return pointer;
  }
}
