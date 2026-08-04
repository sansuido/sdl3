part of '../../../sdl.dart';

class SdlxGpuBufferCreateInfo {
  SdlxGpuBufferCreateInfo({this.usage = 0, this.size = 0, this.props = 0});

  int usage;
  int size;
  int props;

  Pointer<SdlGpuBufferCreateInfo> calloc() {
    final pointer = ffi.calloc<SdlGpuBufferCreateInfo>();
    pointer.ref.usage = usage;
    pointer.ref.size = size;
    pointer.ref.props = props;
    return pointer;
  }
}
