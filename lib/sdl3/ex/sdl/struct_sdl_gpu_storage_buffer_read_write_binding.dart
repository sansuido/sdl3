part of '../../sdl.dart';

class SdlxGpuStorageBufferReadWriteBinding {
  SdlxGpuStorageBufferReadWriteBinding({
    Pointer<SdlGpuBuffer>? buffer,
    this.cycle = 0,
  }) {
    this.buffer = buffer ?? nullptr;
  }
  late Pointer<SdlGpuBuffer> buffer;
  int cycle;
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
