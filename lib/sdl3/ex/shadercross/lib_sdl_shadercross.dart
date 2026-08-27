part of '../../sdl_shadercross.dart';

///
/// Transpile to MSL code from SPIRV code.
///
/// You must SDL_free the returned string once you are done with it.
///
/// These are the optional properties that can be used:
///
/// - `SDL_SHADERCROSS_PROP_SPIRV_MSL_VERSION_STRING`: specifies the MSL version that should be emitted. Defaults to 1.2.0.
///
/// \param info a struct describing the shader to transpile.
/// \returns an SDL_malloc'd string containing MSL code.
///
/// ```c
/// extern SDL_DECLSPEC void * SDLCALL SDL_ShaderCross_TranspileMSLFromSPIRV( const SDL_ShaderCross_SPIRV_Info *info)
/// ```
///
/// See also:
/// - [SDL_ShaderCross_TranspileMSLFromSPIRV - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_ShaderCross_TranspileMSLFromSPIRV)
///
/// {@category shadercross}
String? sdlxShaderCrossTranspileMslFromSpirv(SdlxShaderCrossSpirvInfo info) {
  String? hlsl;
  final infoPointer = info.calloc();
  final result = sdlShaderCrossTranspileMslFromSpirv(infoPointer).cast<Uint8>();
  if (result != nullptr) {
    hlsl = result.cast<Utf8>().toDartString();
  }
  infoPointer.callocAllFree();
  if (result == nullptr) {
    return null;
  }
  sdlFree(result.cast<Void>());
  return hlsl;
}

///
/// Transpile to HLSL code from SPIRV code.
///
/// You must SDL_free the returned string once you are done with it.
///
/// These are the optional properties that can be used:
///
/// - `SDL_SHADERCROSS_PROP_SPIRV_PSSL_COMPATIBILITY_BOOLEAN`: generates PSSL-compatible shader.
///
/// \param info a struct describing the shader to transpile.
/// \returns an SDL_malloc'd string containing HLSL code.
///
/// ```c
/// extern SDL_DECLSPEC void * SDLCALL SDL_ShaderCross_TranspileHLSLFromSPIRV( const SDL_ShaderCross_SPIRV_Info *info)
/// ```
///
/// See also:
/// - [SDL_ShaderCross_TranspileHLSLFromSPIRV - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_ShaderCross_TranspileHLSLFromSPIRV)
///
/// {@category shadercross}
String? sdlxShaderCrossTranspileHlslFromSpirv(SdlxShaderCrossSpirvInfo info) {
  String? hlsl;
  final infoPointer = info.calloc();
  final result = sdlShaderCrossTranspileHlslFromSpirv(infoPointer)
      .cast<Uint8>();
  if (result != nullptr) {
    hlsl = result.cast<Utf8>().toDartString();
  }
  infoPointer.callocAllFree();
  if (result == nullptr) {
    return null;
  }
  sdlFree(result.cast<Void>());
  return hlsl;
}

///
/// Compile DXBC bytecode from SPIRV code.
///
/// You must SDL_free the returned buffer once you are done with it.
///
/// \param info a struct describing the shader to transpile.
/// \param size filled in with the bytecode buffer size.
/// \returns an SDL_malloc'd buffer containing DXBC bytecode.
///
/// ```c
/// extern SDL_DECLSPEC void * SDLCALL SDL_ShaderCross_CompileDXBCFromSPIRV( const SDL_ShaderCross_SPIRV_Info *info, size_t *size)
/// ```
///
/// See also:
/// - [SDL_ShaderCross_CompileDXBCFromSPIRV - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_ShaderCross_CompileDXBCFromSPIRV)
///
/// {@category shadercross}
Uint8List? sdlxShaderCrossCompileDxbcFromSpirv(SdlxShaderCrossSpirvInfo info) {
  var shader = Uint8List(0);
  var size = 0;
  final infoPointer = info.calloc();
  final sizePointer = ffi.calloc<Size>();
  final result = sdlShaderCrossCompileDxbcFromSpirv(infoPointer, sizePointer);
  if (result != nullptr) {
    size = sizePointer.value;
    shader = Uint8List.fromList(result.cast<Uint8>().asTypedList(size));
  }
  sizePointer.callocFree();
  infoPointer.callocAllFree();
  if (result == nullptr) {
    return null;
  }
  sdlFree(result.cast<Void>());
  return shader;
}

///
/// Compile DXIL bytecode from SPIRV code.
///
/// You must SDL_free the returned buffer once you are done with it.
///
/// \param info a struct describing the shader to transpile.
/// \param size filled in with the bytecode buffer size.
/// \returns an SDL_malloc'd buffer containing DXIL bytecode.
///
/// ```c
/// extern SDL_DECLSPEC void * SDLCALL SDL_ShaderCross_CompileDXILFromSPIRV( const SDL_ShaderCross_SPIRV_Info *info, size_t *size)
/// ```
///
/// See also:
/// - [SDL_ShaderCross_CompileDXILFromSPIRV - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_ShaderCross_CompileDXILFromSPIRV)
///
/// {@category shadercross}
Uint8List? sdlxShaderCrossCompileDxilFromSpirv(SdlxShaderCrossSpirvInfo info) {
  var shader = Uint8List(0);
  var size = 0;
  final infoPointer = info.calloc();
  final sizePointer = ffi.calloc<Size>();
  final result = sdlShaderCrossCompileDxilFromSpirv(infoPointer, sizePointer);
  if (result != nullptr) {
    size = sizePointer.value;
    shader = Uint8List.fromList(result.cast<Uint8>().asTypedList(size));
  }
  sizePointer.callocFree();
  infoPointer.callocAllFree();
  if (result == nullptr) {
    return null;
  }
  sdlFree(result.cast<Void>());
  return shader;
}

///
/// Compile an SDL GPU shader from SPIRV code. If your shader source is HLSL, you should obtain SPIR-V bytecode from SDL_ShaderCross_CompileSPIRVFromHLSL().
///
/// \param device the SDL GPU device.
/// \param info a struct describing the shader to transpile.
/// \param resource_info a struct describing resource info of the shader. Can be obtained from SDL_ShaderCross_ReflectGraphicsSPIRV().
/// \param props a properties object filled in with extra shader metadata.
/// \returns a compiled SDL_GPUShader.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUShader * SDLCALL SDL_ShaderCross_CompileGraphicsShaderFromSPIRV( SDL_GPUDevice *device, const SDL_ShaderCross_SPIRV_Info *info, const SDL_ShaderCross_GraphicsShaderResourceInfo *resource_info, SDL_PropertiesID props)
/// ```
///
/// See also:
/// - [SDL_ShaderCross_CompileGraphicsShaderFromSPIRV - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_ShaderCross_CompileGraphicsShaderFromSPIRV)
///
/// {@category shadercross}
Pointer<SdlGpuShader> sdlxShaderCrossCompileGraphicsShaderFromSpirv(
  Pointer<SdlGpuDevice> device,
  SdlxShaderCrossSpirvInfo info, {
  SdlxShaderCrossGraphicsShaderMetadata? metadata,
  int props = 0,
}) {
  Pointer<SdlGpuShader> result = nullptr;
  final metadata0 =
      metadata ?? sdlxShaderCrossReflectGraphicsSpirv(info.bytecode);
  if (metadata0 != null) {
    final infoPointer = info.calloc();
    final resourceInfoPointer = metadata0.resourceInfo.calloc();
    result = sdlShaderCrossCompileGraphicsShaderFromSpirv(
      device,
      infoPointer,
      resourceInfoPointer,
      props,
    );
    resourceInfoPointer.callocFree();
    infoPointer.callocFree();
  }
  return result;
}

///
/// Compile an SDL GPU compute pipeline from SPIRV code. If your shader source is HLSL, you should obtain SPIR-V bytecode from SDL_ShaderCross_CompileSPIRVFromHLSL().
///
/// \param device the SDL GPU device.
/// \param info a struct describing the shader to transpile.
/// \param metadata a struct describing shader metadata. Can be obtained from SDL_ShaderCross_ReflectComputeSPIRV().
/// \param props a properties object filled in with extra shader metadata.
/// \returns a compiled SDL_GPUComputePipeline.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUComputePipeline * SDLCALL SDL_ShaderCross_CompileComputePipelineFromSPIRV( SDL_GPUDevice *device, const SDL_ShaderCross_SPIRV_Info *info, const SDL_ShaderCross_ComputePipelineMetadata *metadata, SDL_PropertiesID props)
/// ```
///
/// See also:
/// - [SDL_ShaderCross_CompileComputePipelineFromSPIRV - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_ShaderCross_CompileComputePipelineFromSPIRV)
///
/// {@category shadercross}
Pointer<SdlGpuComputePipeline> sdlxShaderCrossCompileComputePipelineFromSpirv(
  Pointer<SdlGpuDevice> device,
  SdlxShaderCrossSpirvInfo info, {
  SdlxShaderCrossComputePipelineMetadata? metadata,
  int props = 0,
}) {
  Pointer<SdlGpuComputePipeline> result = nullptr;
  final metadata0 =
      metadata ?? sdlxShaderCrossReflectComputeSpirv(info.bytecode);
  if (metadata0 != null) {
    final infoPointer = info.calloc();
    final metadataPointer = metadata0.calloc();
    result = sdlShaderCrossCompileComputePipelineFromSpirv(
      device,
      infoPointer,
      metadataPointer,
      props,
    );
    metadataPointer.callocFree();
    infoPointer.callocFree();
  }
  return result;
}

///
/// Reflect graphics shader info from SPIRV code. If your shader source is HLSL, you should obtain SPIR-V bytecode from SDL_ShaderCross_CompileSPIRVFromHLSL(). This must be freed with SDL_free() when you are done with the metadata.
///
/// \param bytecode the SPIRV bytecode.
/// \param bytecode_size the length of the SPIRV bytecode.
/// \param props a properties object filled in with extra shader metadata, provided by the user.
/// \returns A metadata struct on success, NULL otherwise. The struct must be free'd when it is no longer needed.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// ```c
/// extern SDL_DECLSPEC SDL_ShaderCross_GraphicsShaderMetadata * SDLCALL SDL_ShaderCross_ReflectGraphicsSPIRV( const Uint8 *bytecode, size_t bytecode_size, SDL_PropertiesID props)
/// ```
///
/// See also:
/// - [SDL_ShaderCross_ReflectGraphicsSPIRV - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_ShaderCross_ReflectGraphicsSPIRV)
///
/// {@category shadercross}
SdlxShaderCrossGraphicsShaderMetadata? sdlxShaderCrossReflectGraphicsSpirv(
  Uint8List bytecode, {
  int props = 0,
}) {
  SdlxShaderCrossGraphicsShaderMetadata? metadata;
  final bytecodePointer = ffi.calloc<Uint8>(bytecode.length)
    ..asTypedList(bytecode.length).setAll(0, bytecode);
  final result = sdlShaderCrossReflectGraphicsSpirv(
    bytecodePointer,
    bytecode.length,
    props,
  );
  if (result != nullptr) {
    metadata = SdlxShaderCrossGraphicsShaderMetadata()..loadFromPointer(result);
    sdlFree(result.cast<Void>());
  }
  bytecodePointer.callocFree();
  return metadata;
}

///
/// Reflect compute pipeline info from SPIRV code. If your shader source is HLSL, you should obtain SPIR-V bytecode from SDL_ShaderCross_CompileSPIRVFromHLSL(). This must be freed with SDL_free() when you are done with the metadata.
///
/// \param bytecode the SPIRV bytecode.
/// \param bytecode_size the length of the SPIRV bytecode.
/// \param props a properties object filled in with extra shader metadata, provided by the user.
/// \returns A metadata struct on success, NULL otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// ```c
/// extern SDL_DECLSPEC SDL_ShaderCross_ComputePipelineMetadata * SDLCALL SDL_ShaderCross_ReflectComputeSPIRV( const Uint8 *bytecode, size_t bytecode_size, SDL_PropertiesID props)
/// ```
///
/// See also:
/// - [SDL_ShaderCross_ReflectComputeSPIRV - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_ShaderCross_ReflectComputeSPIRV)
///
/// {@category shadercross}
SdlxShaderCrossComputePipelineMetadata? sdlxShaderCrossReflectComputeSpirv(
  Uint8List bytecode, {
  int props = 0,
}) {
  SdlxShaderCrossComputePipelineMetadata? metadata;
  final bytecodePointer = ffi.calloc<Uint8>(bytecode.length)
    ..asTypedList(bytecode.length).setAll(0, bytecode);
  final result = sdlShaderCrossReflectComputeSpirv(
    bytecodePointer,
    bytecode.length,
    props,
  );
  if (result != nullptr) {
    metadata = SdlxShaderCrossComputePipelineMetadata()
      ..loadFromPointer(result);
    sdlFree(result.cast<Void>());
  }
  bytecodePointer.callocFree();
  return metadata;
}

///
/// Compile to DXBC bytecode from HLSL code via a SPIRV-Cross round trip.
///
/// You must SDL_free the returned buffer once you are done with it.
///
/// These are the optional properties that can be used:
///
/// - `SDL_SHADERCROSS_PROP_SHADER_DEBUG_ENABLE_BOOLEAN`: allows debug info to be emitted when relevant. Should only be used with debugging tools like Renderdoc.
/// - `SDL_SHADERCROSS_PROP_SHADER_DEBUG_NAME_STRING`: a UTF-8 name to be used with the shader. Relevant for use with debugging tools like Renderdoc.
/// - `SDL_SHADERCROSS_PROP_SHADER_CULL_UNUSED_BINDINGS_BOOLEAN`: When true, indicates that the compiler should cull unused shader resources. This behavior is disabled by default.
/// - `SDL_SHADERCROSS_PROP_HLSL_SKIP_SPIRV_ROUNDTRIP_BOOLEAN`: When true, the SPIRV roundtrip is skipped. This behavior is disabled by default. Do not use this property if your shader uses Structured Buffers.
///
/// \param info a struct describing the shader to transpile.
/// \param size filled in with the bytecode buffer size.
/// \returns an SDL_malloc'd buffer containing DXBC bytecode.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// ```c
/// extern SDL_DECLSPEC void * SDLCALL SDL_ShaderCross_CompileDXBCFromHLSL( const SDL_ShaderCross_HLSL_Info *info, size_t *size)
/// ```
///
/// See also:
/// - [SDL_ShaderCross_CompileDXBCFromHLSL - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_ShaderCross_CompileDXBCFromHLSL)
///
/// {@category shadercross}
Uint8List? sdlxShaderCrossCompileDxbcFromHlsl(SdlxShaderCrossHlslInfo info) {
  var shader = Uint8List(0);
  var size = 0;
  final infoPointer = info.calloc();
  final sizePointer = calloc<Size>();
  final result = sdlShaderCrossCompileDxbcFromHlsl(
    infoPointer,
    sizePointer,
  ).cast<Uint8>();
  if (result != nullptr) {
    size = sizePointer.value;
    shader = Uint8List.fromList(result.cast<Uint8>().asTypedList(size));
  }
  sizePointer.callocFree();
  infoPointer.callocAllFree(info.defines.length);
  if (result == nullptr) {
    return null;
  }
  sdlFree(result.cast<Void>());
  return shader;
}

///
/// Compile to DXIL bytecode from HLSL code via a SPIRV-Cross round trip.
///
/// You must SDL_free the returned buffer once you are done with it.
///
/// These are the optional properties that can be used:
///
/// - `SDL_SHADERCROSS_PROP_SHADER_DEBUG_ENABLE_BOOLEAN`: allows debug info to be emitted when relevant. Should only be used with debugging tools like Renderdoc.
/// - `SDL_SHADERCROSS_PROP_SHADER_DEBUG_NAME_STRING`: a UTF-8 name to be used with the shader. Relevant for use with debugging tools like Renderdoc.
/// - `SDL_SHADERCROSS_PROP_SHADER_CULL_UNUSED_BINDINGS_BOOLEAN`: when true, indicates that the compiler should cull unused shader resources. This behavior is disabled by default.
/// - `SDL_SHADERCROSS_PROP_HLSL_SKIP_SPIRV_ROUNDTRIP_BOOLEAN`: when true, the SPIRV roundtrip is skipped. This behavior is disabled by default. Do not use this property if your shader uses Structured Buffers.
///
/// \param info a struct describing the shader to transpile.
/// \param size filled in with the bytecode buffer size.
/// \returns an SDL_malloc'd buffer containing DXIL bytecode.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// ```c
/// extern SDL_DECLSPEC void * SDLCALL SDL_ShaderCross_CompileDXILFromHLSL( const SDL_ShaderCross_HLSL_Info *info, size_t *size)
/// ```
///
/// See also:
/// - [SDL_ShaderCross_CompileDXILFromHLSL - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_ShaderCross_CompileDXILFromHLSL)
///
/// {@category shadercross}
Uint8List? sdlxShaderCrossCompileDxilFromHlsl(SdlxShaderCrossHlslInfo info) {
  var shader = Uint8List(0);
  var size = 0;
  final infoPointer = info.calloc();
  final sizePointer = calloc<Size>();
  final result = sdlShaderCrossCompileDxilFromHlsl(
    infoPointer,
    sizePointer,
  ).cast<Uint8>();
  if (result != nullptr) {
    size = sizePointer.value;
    shader = Uint8List.fromList(result.cast<Uint8>().asTypedList(size));
  }
  sizePointer.callocFree();
  infoPointer.callocAllFree(info.defines.length);
  if (result == nullptr) {
    return null;
  }
  sdlFree(result.cast<Void>());
  return shader;
}

///
/// Compile to SPIRV bytecode from HLSL code.
///
/// You must SDL_free the returned buffer once you are done with it.
///
/// These are the optional properties that can be used:
///
/// - `SDL_SHADERCROSS_PROP_SHADER_DEBUG_ENABLE_BOOLEAN`: allows debug info to be emitted when relevant. Should only be used with debugging tools like Renderdoc.
/// - `SDL_SHADERCROSS_PROP_SHADER_DEBUG_NAME_STRING`: a UTF-8 name to be used with the shader. Relevant for use with debugging tools like Renderdoc.
/// - `SDL_SHADERCROSS_PROP_SHADER_CULL_UNUSED_BINDINGS_BOOLEAN`: when true, indicates that the compiler should cull unused shader resources. This behavior is disabled by default.
///
/// \param info a struct describing the shader to transpile.
/// \param size filled in with the bytecode buffer size.
/// \returns an SDL_malloc'd buffer containing SPIRV bytecode.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// ```c
/// extern SDL_DECLSPEC void * SDLCALL SDL_ShaderCross_CompileSPIRVFromHLSL( const SDL_ShaderCross_HLSL_Info *info, size_t *size)
/// ```
///
/// See also:
/// - [SDL_ShaderCross_CompileSPIRVFromHLSL - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_ShaderCross_CompileSPIRVFromHLSL)
///
/// {@category shadercross}
Uint8List? sdlxShaderCrossCompileSpirvFromHlsl(SdlxShaderCrossHlslInfo info) {
  var shader = Uint8List(0);
  var size = 0;
  final infoPointer = info.calloc();
  final sizePointer = calloc<Size>();
  final result = sdlShaderCrossCompileSpirvFromHlsl(
    infoPointer,
    sizePointer,
  ).cast<Uint8>();
  if (result != nullptr) {
    size = sizePointer.value;
    shader = Uint8List.fromList(result.cast<Uint8>().asTypedList(size));
  }
  sizePointer.callocFree();
  infoPointer.callocAllFree(info.defines.length);
  if (result == nullptr) {
    return null;
  }
  sdlFree(result.cast<Void>());
  return shader;
}

Uint8List? _compileCodeFromHlsl({
  required int format,
  required SdlxShaderCrossHlslInfo info,
  required Uint8List spirv,
}) {
  switch (format) {
    case SdlkGpuShaderformat.dxbc:
      return sdlxShaderCrossCompileDxbcFromHlsl(info);
    case SdlkGpuShaderformat.dxil:
      return sdlxShaderCrossCompileDxilFromHlsl(info);
    case SdlkGpuShaderformat.msl:
      final mslString = sdlxShaderCrossTranspileMslFromSpirv(
        SdlxShaderCrossSpirvInfo()
          ..bytecode = spirv
          ..shaderStage = info.shaderStage
          ..entrypoint = info.entrypoint,
      );
      return mslString != null
          ? Uint8List.fromList(utf8.encode(mslString))
          : null;
    case SdlkGpuShaderformat.spirv:
    default:
      return spirv;
  }
}

({
  Pointer<SdlGpuShader> shader,
  SdlxShaderCrossGraphicsShaderMetadata metadata,
})?
sdlxShaderCrossGraphicsShaderFromHlsl(
  Pointer<SdlGpuDevice> device,
  int format,
  SdlxShaderCrossHlslInfo info, {
  int props = 0,
}) {
  final spirv = sdlxShaderCrossCompileSpirvFromHlsl(info);
  if (spirv == null) {
    return null;
  }
  final code = _compileCodeFromHlsl(format: format, info: info, spirv: spirv);
  if (code == null) {
    return null;
  }
  final metadata = sdlxShaderCrossReflectGraphicsSpirv(spirv);
  if (metadata == null) {
    return null;
  }
  final shader = sdlxCreateGpuShader(
    device,
    SdlxGpuShaderCreateInfo()
      ..code = code
      ..entrypoint = info.entrypoint
      ..format = format
      ..stage = info.shaderStage
      ..numSamplers = metadata.resourceInfo.numSamplers
      ..numStorageTextures = metadata.resourceInfo.numStorageTextures
      ..numStorageBuffers = metadata.resourceInfo.numStorageBuffers
      ..numUniformBuffers = metadata.resourceInfo.numUniformBuffers
      ..props = props,
  );
  if (shader == nullptr) {
    return null;
  }
  return (shader: shader, metadata: metadata);
}

({
  Pointer<SdlGpuComputePipeline> pipeline,
  SdlxShaderCrossComputePipelineMetadata metadata,
})?
sdlxShaderCrossComputePipelineFromHlsl(
  Pointer<SdlGpuDevice> device,
  int format,
  SdlxShaderCrossHlslInfo info, {
  int props = 0,
}) {
  info.shaderStage = SdlkShadercrossShaderstage.compute;
  final spirv = sdlxShaderCrossCompileSpirvFromHlsl(info);
  if (spirv == null) {
    return null;
  }
  final code = _compileCodeFromHlsl(format: format, info: info, spirv: spirv);
  if (code == null) {
    return null;
  }
  final metadata = sdlxShaderCrossReflectComputeSpirv(spirv);
  if (metadata == null) {
    return null;
  }
  final pipeline = sdlxCreateGpuComputePipeline(
    device,
    SdlxGpuComputePipelineCreateInfo()
      ..code = code
      ..entrypoint = info.entrypoint
      ..format = format
      ..numSamplers = metadata.numSamplers
      ..numReadonlyStorageTextures = metadata.numReadonlyStorageTextures
      ..numReadonlyStorageBuffers = metadata.numReadonlyStorageBuffers
      ..numReadwriteStorageTextures = metadata.numReadwriteStorageTextures
      ..numReadwriteStorageBuffers = metadata.numReadwriteStorageBuffers
      ..numUniformBuffers = metadata.numUniformBuffers
      ..threadcountX = metadata.threadcountX
      ..threadcountY = metadata.threadcountY
      ..threadcountZ = metadata.threadcountZ
      ..props = props,
  );
  if (pipeline == nullptr) {
    return null;
  }
  return (pipeline: pipeline, metadata: metadata);
}
