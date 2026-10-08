part of '../sdl_gpu.dart';

class SdlxGpuTransferBufferCreateInfo {
  const SdlxGpuTransferBufferCreateInfo({
    this.usage = 0,
    this.size = 0,
    this.props = 0,
  });

  final int usage;
  final int size;
  final int props;

  Pointer<SdlGpuTransferBufferCreateInfo> calloc() {
    final pointer = ffi.calloc<SdlGpuTransferBufferCreateInfo>();
    pointer.ref.usage = usage;
    pointer.ref.size = size;
    pointer.ref.props = props;
    return pointer;
  }
}
