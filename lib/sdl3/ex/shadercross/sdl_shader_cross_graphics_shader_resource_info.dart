part of '../../sdl_shadercross.dart';

class SdlxShaderCrossGraphicsShaderResourceInfo {
  SdlxShaderCrossGraphicsShaderResourceInfo({
    this.numSamplers = 0,
    this.numStorageTextures = 0,
    this.numStorageBuffers = 0,
    this.numUniformBuffers = 0,
  });
  int numSamplers;
  int numStorageTextures;
  int numStorageBuffers;
  int numUniformBuffers;

  Pointer<SdlShaderCrossGraphicsShaderResourceInfo> calloc() {
    final pointer = ffi.calloc<SdlShaderCrossGraphicsShaderResourceInfo>();
    pointer.ref.numSamplers = numSamplers;
    pointer.ref.numStorageTextures = numStorageTextures;
    pointer.ref.numStorageBuffers = numStorageBuffers;
    pointer.ref.numUniformBuffers = numUniformBuffers;
    return pointer;
  }

  void loadFromPointer(
    Pointer<SdlShaderCrossGraphicsShaderResourceInfo> pointer,
  ) {
    numSamplers = pointer.ref.numSamplers;
    numStorageTextures = pointer.ref.numStorageTextures;
    numStorageBuffers = pointer.ref.numStorageBuffers;
    numUniformBuffers = pointer.ref.numUniformBuffers;
  }
}
