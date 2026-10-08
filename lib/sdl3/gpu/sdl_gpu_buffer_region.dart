part of '../sdl_gpu.dart';

class SdlxGpuBufferRegion {
  SdlxGpuBufferRegion({
    Pointer<SdlGpuBuffer>? buffer,
    this.offset = 0,
    this.size = 0,
  }) : buffer = buffer ?? nullptr;

  final Pointer<SdlGpuBuffer> buffer;
  final int offset;
  final int size;

  Pointer<SdlGpuBufferRegion> calloc() {
    final pointer = ffi.calloc<SdlGpuBufferRegion>();
    pointer.ref.buffer = buffer;
    pointer.ref.offset = offset;
    pointer.ref.size = size;
    return pointer;
  }
}
