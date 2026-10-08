part of '../sdl_gpu.dart';

class SdlxGpuStorageBufferReadWriteBinding {
  SdlxGpuStorageBufferReadWriteBinding({
    Pointer<SdlGpuBuffer>? buffer,
    this.cycle = false,
  }) : buffer = buffer ?? nullptr;

  final Pointer<SdlGpuBuffer> buffer;
  final bool cycle;

  Pointer<SdlGpuStorageBufferReadWriteBinding> calloc() {
    final pointer = ffi.calloc<SdlGpuStorageBufferReadWriteBinding>();
    pointer.ref.buffer = buffer;
    pointer.ref.cycle = cycle;
    return pointer;
  }
}

extension SdlxGpuStorageBufferReadWriteBindingListExtension
    on List<SdlxGpuStorageBufferReadWriteBinding> {
  Pointer<SdlGpuStorageBufferReadWriteBinding> calloc() {
    final buffersPointer = ffi.calloc<SdlGpuStorageBufferReadWriteBinding>(
      length,
    );
    for (var n = 0; n < length; n++) {
      final bufferPointer = buffersPointer + n;
      bufferPointer.ref.buffer = this[n].buffer;
      bufferPointer.ref.cycle = this[n].cycle;
    }
    return buffersPointer;
  }
}
