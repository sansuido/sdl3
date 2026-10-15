part of '../sdl_gpu.dart';

class SdlxGpuTransferBufferLocation {
  SdlxGpuTransferBufferLocation({
    Pointer<SdlGpuTransferBuffer>? transferBuffer,
    this.offset = 0,
  }) : transferBuffer = transferBuffer ?? nullptr;

  final Pointer<SdlGpuTransferBuffer> transferBuffer;
  final int offset;

  Pointer<SdlGpuTransferBufferLocation> toNative([
    Allocator allocator = ffi.calloc,
  ]) {
    final pointer = allocator<SdlGpuTransferBufferLocation>();
    pointer.ref.transferBuffer = transferBuffer;
    pointer.ref.offset = offset;
    return pointer;
  }
}
