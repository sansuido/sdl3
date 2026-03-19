part of '../../sdl_shadercross.dart';

class SdlxShaderCrossHlslDefine {
  SdlxShaderCrossHlslDefine({String? name, String? value}) {
    this.name = name ?? '';
    this.value = value ?? '';
  }
  late String name;
  late String value;
}

class SdlxShaderCrossHlslInfo {
  SdlxShaderCrossHlslInfo({
    String? source,
    String? entrypoint,
    String? includeDir,
    List<SdlxShaderCrossHlslDefine>? defines,
    this.shaderStage = 0,
    this.props = 0,
  }) {
    this.source = source ?? '';
    this.entrypoint = entrypoint ?? '';
    this.includeDir = includeDir ?? '';
    this.defines = defines ?? [];
  }
  late String source;
  late String entrypoint;
  late String includeDir;
  late List<SdlxShaderCrossHlslDefine> defines;
  int shaderStage;
  int props;
  var size = 0;

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
