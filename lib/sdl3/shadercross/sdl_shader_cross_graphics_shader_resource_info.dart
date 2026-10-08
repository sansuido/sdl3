part of '../sdl_shadercross.dart';

class SdlxShaderCrossGraphicsShaderResourceInfo {
  const SdlxShaderCrossGraphicsShaderResourceInfo({
    this.numSamplers = 0,
    this.numStorageTextures = 0,
    this.numStorageBuffers = 0,
    this.numUniformBuffers = 0,
  });

  factory SdlxShaderCrossGraphicsShaderResourceInfo.fromPointer(
    Pointer<SdlShaderCrossGraphicsShaderResourceInfo> pointer,
  ) {
    final ref = pointer.ref;
    return SdlxShaderCrossGraphicsShaderResourceInfo(
      numSamplers: ref.numSamplers,
      numStorageTextures: ref.numStorageTextures,
      numStorageBuffers: ref.numStorageBuffers,
      numUniformBuffers: ref.numUniformBuffers,
    );
  }

  factory SdlxShaderCrossGraphicsShaderResourceInfo.fromRef(
    SdlShaderCrossGraphicsShaderResourceInfo ref,
  ) => SdlxShaderCrossGraphicsShaderResourceInfo(
    numSamplers: ref.numSamplers,
    numStorageTextures: ref.numStorageTextures,
    numStorageBuffers: ref.numStorageBuffers,
    numUniformBuffers: ref.numUniformBuffers,
  );

  final int numSamplers;
  final int numStorageTextures;
  final int numStorageBuffers;
  final int numUniformBuffers;

  void copyTo(SdlShaderCrossGraphicsShaderResourceInfo ref) {
    ref
      ..numSamplers = numSamplers
      ..numStorageTextures = numStorageTextures
      ..numStorageBuffers = numStorageBuffers
      ..numUniformBuffers = numUniformBuffers;
  }

  Pointer<SdlShaderCrossGraphicsShaderResourceInfo> calloc([
    Allocator allocator = ffi.calloc,
  ]) {
    final pointer = allocator<SdlShaderCrossGraphicsShaderResourceInfo>();
    copyTo(pointer.ref);
    return pointer;
  }
}
