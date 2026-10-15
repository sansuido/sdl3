part of '../sdl_gpu.dart';

class SdlxGpuBufferLocation {
  SdlxGpuBufferLocation({Pointer<SdlGpuBuffer>? buffer, this.offset = 0})
    : buffer = buffer ?? nullptr;

  final Pointer<SdlGpuBuffer> buffer;
  final int offset;

  Pointer<SdlGpuBufferLocation> toNative([Allocator allocator = ffi.calloc]) {
    final pointer = allocator<SdlGpuBufferLocation>();
    pointer.ref.buffer = buffer;
    pointer.ref.offset = offset;
    return pointer;
  }
}
