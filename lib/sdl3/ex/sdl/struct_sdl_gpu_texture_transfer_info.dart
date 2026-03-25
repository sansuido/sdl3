part of '../../sdl.dart';

class SdlxGpuTextureTransferInfo {
  SdlxGpuTextureTransferInfo({
    Pointer<SdlGpuTransferBuffer>? transferBuffer,
    this.offset = 0,
    this.pixelsPerRow = 0,
    this.rowsPerLayer = 0,
  }) {
    this.transferBuffer = transferBuffer ?? nullptr;
  }
  late Pointer<SdlGpuTransferBuffer> transferBuffer;
  int offset;
  int pixelsPerRow;
  int rowsPerLayer;

  Pointer<SdlGpuTextureTransferInfo> calloc() {
    final pointer = ffi.calloc<SdlGpuTextureTransferInfo>();
    pointer.ref.transferBuffer = transferBuffer;
    pointer.ref.offset = offset;
    pointer.ref.pixelsPerRow = pixelsPerRow;
    pointer.ref.rowsPerLayer = rowsPerLayer;
    return pointer;
  }
}
