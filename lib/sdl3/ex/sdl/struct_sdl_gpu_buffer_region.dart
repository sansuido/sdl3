part of '../../sdl.dart';

class SdlxGpuBufferRegion {
  SdlxGpuBufferRegion({
    Pointer<SdlGpuBuffer>? buffer,
    this.offset = 0,
    this.size = 0,
  }) {
    this.buffer = buffer ?? nullptr;
  }

  late Pointer<SdlGpuBuffer> buffer;
  int offset;
  int size;

  Pointer<SdlGpuBufferRegion> calloc() {
    final pointer = ffi.calloc<SdlGpuBufferRegion>();
    pointer.ref.buffer = buffer;
    pointer.ref.offset = offset;
    pointer.ref.size = size;
    return pointer;
  }
}

//// SDL_GPUBufferRegion
///// {@category gpu}
//final class SdlGpuBufferRegion extends Struct {
//  // [0]+(8)
//  external Pointer<SdlGpuBuffer> buffer;
//  // [8]+(4)
//  @Uint32()
//  external int offset;
//  // [12]+(4)
//  @Uint32()
//  external int size;
//}
//
