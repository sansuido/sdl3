part of '../sdl_gpu.dart';

class SdlxGpuBufferBinding {
  SdlxGpuBufferBinding({Pointer<SdlGpuBuffer>? buffer, this.offset = 0})
    : buffer = buffer ?? nullptr;
  final Pointer<SdlGpuBuffer> buffer;
  final int offset;

  Pointer<SdlGpuBufferBinding> calloc() {
    final pointer = ffi.calloc<SdlGpuBufferBinding>();
    pointer.ref.buffer = buffer;
    pointer.ref.offset = offset;
    return pointer;
  }
}

extension SdlxGpuBufferBindingListExtension on List<SdlxGpuBufferBinding> {
  Pointer<SdlGpuBufferBinding> calloc() {
    final buffersPointer = ffi.calloc<SdlGpuBufferBinding>(length);
    for (var n = 0; n < length; n++) {
      final bufferPointer = buffersPointer + n;
      bufferPointer.ref.buffer = this[n].buffer;
      bufferPointer.ref.offset = this[n].offset;
    }
    return buffersPointer;
  }
}
