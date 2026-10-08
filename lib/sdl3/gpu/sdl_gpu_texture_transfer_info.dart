part of '../sdl_gpu.dart';

class SdlxGpuTextureTransferInfo {
  SdlxGpuTextureTransferInfo({
    Pointer<SdlGpuTransferBuffer>? transferBuffer,
    this.offset = 0,
    this.pixelsPerRow = 0,
    this.rowsPerLayer = 0,
  }) : transferBuffer = transferBuffer ?? nullptr;

  final Pointer<SdlGpuTransferBuffer> transferBuffer;
  final int offset;
  final int pixelsPerRow;
  final int rowsPerLayer;

  Pointer<SdlGpuTextureTransferInfo> calloc() {
    final pointer = ffi.calloc<SdlGpuTextureTransferInfo>();
    pointer.ref.transferBuffer = transferBuffer;
    pointer.ref.offset = offset;
    pointer.ref.pixelsPerRow = pixelsPerRow;
    pointer.ref.rowsPerLayer = rowsPerLayer;
    return pointer;
  }
}
