part of '../sdl_gpu.dart';

class SdlxGpuShaderCreateInfo {
  SdlxGpuShaderCreateInfo({
    Uint8List? code,
    this.entrypoint = '',
    this.format = 0,
    this.stage = 0,
    this.numSamplers = 0,
    this.numStorageTextures = 0,
    this.numStorageBuffers = 0,
    this.numUniformBuffers = 0,
    this.props = 0,
  }) {
    this.code = code ?? Uint8List(0);
  }
  late Uint8List code;
  String entrypoint;
  int format;
  int stage;
  int numSamplers;
  int numStorageTextures;
  int numStorageBuffers;
  int numUniformBuffers;
  int props;

  Pointer<SdlGpuShaderCreateInfo> calloc() {
    final pointer = ffi.calloc<SdlGpuShaderCreateInfo>();
    if (code.isNotEmpty) {
      final codePointer = ffi.calloc<Uint8>(code.length)
        ..asTypedList(code.length).setAll(0, code);
      pointer.ref.codeSize = code.length;
      pointer.ref.code = codePointer;
    }
    if (entrypoint.isNotEmpty) {
      pointer.ref.entrypoint = entrypoint.toNativeUtf8();
    }
    pointer.ref.format = format;
    pointer.ref.stage = stage;
    pointer.ref.numSamplers = numSamplers;
    pointer.ref.numStorageTextures = numStorageTextures;
    pointer.ref.numStorageBuffers = numStorageBuffers;
    pointer.ref.numUniformBuffers = numUniformBuffers;
    pointer.ref.props = props;
    return pointer;
  }
}

extension SdlGpuShaderCreateInfoCallocAllFreeExtension
    on Pointer<SdlGpuShaderCreateInfo> {
  void callocAllFree() {
    if (ref.code != nullptr) {
      ref.code.callocFree();
    }
    if (ref.entrypoint != nullptr) {
      ref.entrypoint.callocFree();
    }
    callocFree();
  }
}
