part of '../../sdl.dart';

class SdlxGpuBufferLocation {
  SdlxGpuBufferLocation({Pointer<SdlGpuBuffer>? buffer, this.offset = 0}) {
    this.buffer = buffer ?? nullptr;
  }

  late Pointer<SdlGpuBuffer> buffer;
  int offset;

  Pointer<SdlGpuBufferLocation> calloc() {
    final pointer = ffi.calloc<SdlGpuBufferLocation>();
    pointer.ref.buffer = buffer;
    pointer.ref.offset = offset;
    return pointer;
  }
}
