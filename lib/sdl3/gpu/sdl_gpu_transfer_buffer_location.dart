part of '../sdl_gpu.dart';

class SdlxGpuTransferBufferLocation {
  SdlxGpuTransferBufferLocation({
    Pointer<SdlGpuTransferBuffer>? transferBuffer,
    this.offset = 0,
  }) : transferBuffer = transferBuffer ?? nullptr;

  final Pointer<SdlGpuTransferBuffer> transferBuffer;
  final int offset;

  Pointer<SdlGpuTransferBufferLocation> calloc() {
    final pointer = ffi.calloc<SdlGpuTransferBufferLocation>();
    pointer.ref.transferBuffer = transferBuffer;
    pointer.ref.offset = offset;
    return pointer;
  }
}
