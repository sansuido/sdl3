part of '../../sdl.dart';

class SdlxGpuTransferBufferLocation {
  SdlxGpuTransferBufferLocation({
    Pointer<SdlGpuTransferBuffer>? transferBuffer,
    this.offset = 0,
  }) {
    this.transferBuffer = transferBuffer ?? nullptr;
  }

  late Pointer<SdlGpuTransferBuffer> transferBuffer;
  int offset;

  Pointer<SdlGpuTransferBufferLocation> calloc() {
    final pointer = ffi.calloc<SdlGpuTransferBufferLocation>();
    pointer.ref.transferBuffer = transferBuffer;
    pointer.ref.offset = offset;
    return pointer;
  }
}
