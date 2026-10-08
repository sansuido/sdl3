part of '../sdl_shadercross.dart';

class SdlxShaderCrossHlslDefine {
  const SdlxShaderCrossHlslDefine({this.name = '', this.value = ''});
  final String name;
  final String value;
}

class SdlxShaderCrossHlslInfo {
  const SdlxShaderCrossHlslInfo({
    this.source = '',
    this.entrypoint = '',
    this.includeDir = '',
    this.defines = const [],
    this.shaderStage = 0,
    this.props = 0,
  });

  final String source;
  final String entrypoint;
  final String includeDir;
  final List<SdlxShaderCrossHlslDefine> defines;
  final int shaderStage;
  final int props;

  SdlxShaderCrossHlslInfo copyWith({
    String? source,
    String? entrypoint,
    String? includeDir,
    List<SdlxShaderCrossHlslDefine>? defines,
    int? shaderStage,
  }) => SdlxShaderCrossHlslInfo(
    source: source ?? this.source,
    entrypoint: entrypoint ?? this.entrypoint,
    includeDir: includeDir ?? this.includeDir,
    defines: defines ?? this.defines,
    shaderStage: shaderStage ?? this.shaderStage,
  );

  Pointer<SdlShaderCrossHlslInfo> calloc() {
    final pointer = ffi.calloc<SdlShaderCrossHlslInfo>();
    if (source.isNotEmpty) {
      pointer.ref.source = source.toNativeUtf8();
    }
    if (entrypoint.isNotEmpty) {
      pointer.ref.entrypoint = entrypoint.toNativeUtf8();
    }
    if (includeDir.isNotEmpty) {
      pointer.ref.includeDir = includeDir.toNativeUtf8();
    }
    if (defines.isNotEmpty) {
      final definesPointer = ffi.calloc<SdlShaderCrossHlslDefine>(
        defines.length,
      );
      for (var i = 0; i < defines.length; i++) {
        if (defines[i].name.isNotEmpty) {
          definesPointer[i].name = defines[i].name.toNativeUtf8().cast<Int8>();
        }
        if (defines[i].value.isNotEmpty) {
          definesPointer[i].value = defines[i].value
              .toNativeUtf8()
              .cast<Int8>();
        }
      }
      pointer.ref.defines = definesPointer;
    }
    pointer.ref.shaderStage = shaderStage;
    pointer.ref.props = props;
    return pointer;
  }
}

extension SdlShaderCrossHlslInfoCallocAllFreeExtension
    on Pointer<SdlShaderCrossHlslInfo> {
  void callocAllFree(int definesLength) {
    if (ref.source != nullptr) {
      ref.source.callocFree();
    }
    if (ref.entrypoint != nullptr) {
      ref.entrypoint.callocFree();
    }
    if (ref.includeDir != nullptr) {
      ref.includeDir.callocFree();
    }
    if (ref.defines != nullptr) {
      for (var i = 0; i < definesLength; i++) {
        final define = ref.defines + i;
        if (define.ref.name != nullptr) {
          define.ref.name.callocFree();
        }
        if (define.ref.value != nullptr) {
          define.ref.value.callocFree();
        }
      }
      ref.defines.callocFree();
    }
    callocFree();
  }
}
