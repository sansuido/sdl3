part of '../sdl_shadercross.dart';

class SdlxShaderCrossSpirvInfo {
  SdlxShaderCrossSpirvInfo({
    Uint8List? bytecode,
    this.entrypoint = '',
    this.shaderStage = 0,
    this.props = 0,
  }) : bytecode = bytecode ?? Uint8List(0);

  final Uint8List bytecode;
  final String entrypoint;
  final int shaderStage;
  final int props;

  Pointer<SdlShaderCrossSpirvInfo> calloc() {
    final pointer = ffi.calloc<SdlShaderCrossSpirvInfo>();
    if (bytecode.isNotEmpty) {
      pointer.ref.bytecode = ffi.calloc<Uint8>(bytecode.length)
        ..asTypedList(bytecode.length).setAll(0, bytecode);
      pointer.ref.bytecodeSize = bytecode.length;
    }
    if (entrypoint.isNotEmpty) {
      pointer.ref.entrypoint = entrypoint.toNativeUtf8();
    }
    pointer.ref.shaderStage = shaderStage;
    pointer.ref.props = props;
    return pointer;
  }
}

extension SdlShaderCrossSpirvInfoCallocAllFreeExtension
    on Pointer<SdlShaderCrossSpirvInfo> {
  void callocAllFree() {
    if (ref.bytecode != nullptr) {
      ref.bytecode.callocFree();
    }
    if (ref.entrypoint != nullptr) {
      ref.entrypoint.callocFree();
    }
    callocFree();
  }
}
