part of '../../../sdl.dart';

class SdlxGpuTransferBufferCreateInfo {
  SdlxGpuTransferBufferCreateInfo({
    this.usage = 0,
    this.size = 0,
    this.props = 0,
  });
  int usage;
  int size;
  int props;

  Pointer<SdlGpuTransferBufferCreateInfo> calloc() {
    final pointer = ffi.calloc<SdlGpuTransferBufferCreateInfo>();
    pointer.ref.usage = usage;
    pointer.ref.size = size;
    pointer.ref.props = props;
    return pointer;
  }
}
