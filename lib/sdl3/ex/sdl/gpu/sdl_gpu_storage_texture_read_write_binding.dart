part of '../../../sdl.dart';

class SdlxGpuStorageTextureReadWriteBinding {
  SdlxGpuStorageTextureReadWriteBinding({
    Pointer<SdlGpuTexture>? texture,
    this.mipLevel = 0,
    this.layer = 0,
    this.cycle = false,
  }) {
    this.texture = texture ?? nullptr;
  }
  late Pointer<SdlGpuTexture> texture;
  int mipLevel;
  int layer;
  bool cycle;

  Pointer<SdlGpuStorageTextureReadWriteBinding> calloc() {
    final pointer = ffi.calloc<SdlGpuStorageTextureReadWriteBinding>();
    pointer.ref.texture = texture;
    pointer.ref.mipLevel = mipLevel;
    pointer.ref.layer = layer;
    pointer.ref.cycle = cycle;
    return pointer;
  }
}

extension SdlxGpuStorageTextureReadWriteBindingListExtension
    on List<SdlxGpuStorageTextureReadWriteBinding> {
  Pointer<SdlGpuStorageTextureReadWriteBinding> calloc() {
    final buffersPointer = ffi.calloc<SdlGpuStorageTextureReadWriteBinding>(
      length,
    );
    for (var n = 0; n < length; n++) {
      final bufferPointer = buffersPointer + n;
      bufferPointer.ref.texture = this[n].texture;
      bufferPointer.ref.mipLevel = this[n].mipLevel;
      bufferPointer.ref.layer = this[n].layer;
      bufferPointer.ref.cycle = this[n].cycle;
    }
    return buffersPointer;
  }
}
