// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
part of '../sdl_shadercross.dart';

// SDL_ShaderCross_IOVarMetadata
/// {@category shadercross}
final class SdlShaderCrossIoVarMetadata extends Struct {
  // [0]+(8)
  external Pointer<Int8> name;
  // [8]+(4)
  @Uint32()
  external int location;
  // [12]+(4)
  @Int32()
  external int vectorType;
  // [16]+(4)
  @Uint32()
  external int vectorSize;
}

// SDL_ShaderCross_GraphicsShaderResourceInfo
/// {@category shadercross}
final class SdlShaderCrossGraphicsShaderResourceInfo extends Struct {
  // [0]+(4)
  @Uint32()
  external int numSamplers;
  // [4]+(4)
  @Uint32()
  external int numStorageTextures;
  // [8]+(4)
  @Uint32()
  external int numStorageBuffers;
  // [12]+(4)
  @Uint32()
  external int numUniformBuffers;
}

// SDL_ShaderCross_GraphicsShaderMetadata
/// {@category shadercross}
final class SdlShaderCrossGraphicsShaderMetadata extends Struct {
  // [0]+(16)
  @Uint64()
  external int resourceInfo_1;
  @Uint64()
  external int resourceInfo_2;
  // [16]+(4)
  @Uint32()
  external int numInputs;
  // [24]+(8)
  external Pointer<SdlShaderCrossIoVarMetadata> inputs;
  // [32]+(4)
  @Uint32()
  external int numOutputs;
  // [40]+(8)
  external Pointer<SdlShaderCrossIoVarMetadata> outputs;
}

/// {@category shadercross}
extension SdlShaderCrossGraphicsShaderMetadataExtension
    on Pointer<SdlShaderCrossGraphicsShaderMetadata> {
  Pointer<SdlShaderCrossGraphicsShaderResourceInfo> get resourceInfo =>
      (cast<Uint8>() + 0).cast<SdlShaderCrossGraphicsShaderResourceInfo>();
}

// SDL_ShaderCross_ComputePipelineMetadata
/// {@category shadercross}
final class SdlShaderCrossComputePipelineMetadata extends Struct {
  // [0]+(4)
  @Uint32()
  external int numSamplers;
  // [4]+(4)
  @Uint32()
  external int numReadonlyStorageTextures;
  // [8]+(4)
  @Uint32()
  external int numReadonlyStorageBuffers;
  // [12]+(4)
  @Uint32()
  external int numReadwriteStorageTextures;
  // [16]+(4)
  @Uint32()
  external int numReadwriteStorageBuffers;
  // [20]+(4)
  @Uint32()
  external int numUniformBuffers;
  // [24]+(4)
  @Uint32()
  external int threadcountX;
  // [28]+(4)
  @Uint32()
  external int threadcountY;
  // [32]+(4)
  @Uint32()
  external int threadcountZ;
}

// SDL_ShaderCross_SPIRV_Info
/// {@category shadercross}
final class SdlShaderCrossSpirvInfo extends Struct {
  // [0]+(8)
  external Pointer<Uint8> bytecode;
  // [8]+(4)
  @Uint32()
  external int bytecodeSize;
  // [16]+(8)
  external Pointer<Utf8> entrypoint;
  // [24]+(4)
  @Int32()
  external int shaderStage;
  // [28]+(4)
  @Uint32()
  external int props;
}

// SDL_ShaderCross_HLSL_Define
/// {@category shadercross}
final class SdlShaderCrossHlslDefine extends Struct {
  // [0]+(8)
  external Pointer<Int8> name;
  // [8]+(8)
  external Pointer<Int8> value;
}

// SDL_ShaderCross_HLSL_Info
/// {@category shadercross}
final class SdlShaderCrossHlslInfo extends Struct {
  // [0]+(8)
  external Pointer<Utf8> source;
  // [8]+(8)
  external Pointer<Utf8> entrypoint;
  // [16]+(8)
  external Pointer<Utf8> includeDir;
  // [24]+(8)
  external Pointer<SdlShaderCrossHlslDefine> defines;
  // [32]+(4)
  @Int32()
  external int shaderStage;
  // [36]+(4)
  @Uint32()
  external int props;
}
