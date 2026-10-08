part of '../sdl_gpu.dart';

class SdlxGpuViewport {
  const SdlxGpuViewport({
    this.x = 0,
    this.y = 0,
    this.w = 0,
    this.h = 0,
    this.minDepth = 0,
    this.maxDepth = 0,
  });

  final double x;
  final double y;
  final double w;
  final double h;
  final double minDepth;
  final double maxDepth;

  Pointer<SdlGpuViewport> calloc() {
    final pointer = ffi.calloc<SdlGpuViewport>();
    pointer.ref.x = x;
    pointer.ref.y = y;
    pointer.ref.w = w;
    pointer.ref.h = h;
    pointer.ref.minDepth = minDepth;
    pointer.ref.maxDepth = maxDepth;
    return pointer;
  }
}
