// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
part of '../sdl_shadercross.dart';

///
/// Initializes SDL_shadercross
///
/// \threadsafety This should only be called once, from a single thread.
/// \returns true on success, false otherwise.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ShaderCross_Init(void)
/// ```
/// {@category shadercross}
bool sdlShaderCrossInit() {
  final sdlShaderCrossInitLookupFunction = _libShadercross
      .lookupFunction<Uint8 Function(), int Function()>('SDL_ShaderCross_Init');
  return sdlShaderCrossInitLookupFunction() == 1;
}

///
/// De-initializes SDL_shadercross
///
/// \threadsafety This should only be called once, from a single thread.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ShaderCross_Quit(void)
/// ```
/// {@category shadercross}
void sdlShaderCrossQuit() {
  final sdlShaderCrossQuitLookupFunction = _libShadercross
      .lookupFunction<Void Function(), void Function()>('SDL_ShaderCross_Quit');
  return sdlShaderCrossQuitLookupFunction();
}

///
/// Get the supported shader formats that SPIRV cross-compilation can output
///
/// \threadsafety It is safe to call this function from any thread.
/// \returns GPU shader formats supported by SPIRV cross-compilation.
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUShaderFormat SDLCALL SDL_ShaderCross_GetSPIRVShaderFormats(void)
/// ```
/// {@category shadercross}
int sdlShaderCrossGetSpirvShaderFormats() {
  final sdlShaderCrossGetSpirvShaderFormatsLookupFunction = _libShadercross
      .lookupFunction<Uint32 Function(), int Function()>(
        'SDL_ShaderCross_GetSPIRVShaderFormats',
      );
  return sdlShaderCrossGetSpirvShaderFormatsLookupFunction();
}

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
/// {@category shadercross}
Pointer<NativeType> sdlShaderCrossTranspileMslFromSpirv(
  Pointer<SdlShaderCrossSpirvInfo> info,
) {
  final sdlShaderCrossTranspileMslFromSpirvLookupFunction = _libShadercross
      .lookupFunction<
        Pointer<NativeType> Function(Pointer<SdlShaderCrossSpirvInfo> info),
        Pointer<NativeType> Function(Pointer<SdlShaderCrossSpirvInfo> info)
      >('SDL_ShaderCross_TranspileMSLFromSPIRV');
  return sdlShaderCrossTranspileMslFromSpirvLookupFunction(info);
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
/// {@category shadercross}
Pointer<NativeType> sdlShaderCrossTranspileHlslFromSpirv(
  Pointer<SdlShaderCrossSpirvInfo> info,
) {
  final sdlShaderCrossTranspileHlslFromSpirvLookupFunction = _libShadercross
      .lookupFunction<
        Pointer<NativeType> Function(Pointer<SdlShaderCrossSpirvInfo> info),
        Pointer<NativeType> Function(Pointer<SdlShaderCrossSpirvInfo> info)
      >('SDL_ShaderCross_TranspileHLSLFromSPIRV');
  return sdlShaderCrossTranspileHlslFromSpirvLookupFunction(info);
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
/// {@category shadercross}
Pointer<NativeType> sdlShaderCrossCompileDxbcFromSpirv(
  Pointer<SdlShaderCrossSpirvInfo> info,
  Pointer<Uint32> size,
) {
  final sdlShaderCrossCompileDxbcFromSpirvLookupFunction = _libShadercross
      .lookupFunction<
        Pointer<NativeType> Function(
          Pointer<SdlShaderCrossSpirvInfo> info,
          Pointer<Uint32> size,
        ),
        Pointer<NativeType> Function(
          Pointer<SdlShaderCrossSpirvInfo> info,
          Pointer<Uint32> size,
        )
      >('SDL_ShaderCross_CompileDXBCFromSPIRV');
  return sdlShaderCrossCompileDxbcFromSpirvLookupFunction(info, size);
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
/// {@category shadercross}
Pointer<NativeType> sdlShaderCrossCompileDxilFromSpirv(
  Pointer<SdlShaderCrossSpirvInfo> info,
  Pointer<Uint32> size,
) {
  final sdlShaderCrossCompileDxilFromSpirvLookupFunction = _libShadercross
      .lookupFunction<
        Pointer<NativeType> Function(
          Pointer<SdlShaderCrossSpirvInfo> info,
          Pointer<Uint32> size,
        ),
        Pointer<NativeType> Function(
          Pointer<SdlShaderCrossSpirvInfo> info,
          Pointer<Uint32> size,
        )
      >('SDL_ShaderCross_CompileDXILFromSPIRV');
  return sdlShaderCrossCompileDxilFromSpirvLookupFunction(info, size);
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
/// {@category shadercross}
Pointer<SdlGpuShader> sdlShaderCrossCompileGraphicsShaderFromSpirv(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlShaderCrossSpirvInfo> info,
  Pointer<SdlShaderCrossGraphicsShaderResourceInfo> resourceInfo,
  int props,
) {
  final sdlShaderCrossCompileGraphicsShaderFromSpirvLookupFunction =
      _libShadercross.lookupFunction<
        Pointer<SdlGpuShader> Function(
          Pointer<SdlGpuDevice> device,
          Pointer<SdlShaderCrossSpirvInfo> info,
          Pointer<SdlShaderCrossGraphicsShaderResourceInfo> resourceInfo,
          Uint32 props,
        ),
        Pointer<SdlGpuShader> Function(
          Pointer<SdlGpuDevice> device,
          Pointer<SdlShaderCrossSpirvInfo> info,
          Pointer<SdlShaderCrossGraphicsShaderResourceInfo> resourceInfo,
          int props,
        )
      >('SDL_ShaderCross_CompileGraphicsShaderFromSPIRV');
  return sdlShaderCrossCompileGraphicsShaderFromSpirvLookupFunction(
    device,
    info,
    resourceInfo,
    props,
  );
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
/// {@category shadercross}
Pointer<SdlGpuComputePipeline> sdlShaderCrossCompileComputePipelineFromSpirv(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlShaderCrossSpirvInfo> info,
  Pointer<SdlShaderCrossComputePipelineMetadata> metadata,
  int props,
) {
  final sdlShaderCrossCompileComputePipelineFromSpirvLookupFunction =
      _libShadercross.lookupFunction<
        Pointer<SdlGpuComputePipeline> Function(
          Pointer<SdlGpuDevice> device,
          Pointer<SdlShaderCrossSpirvInfo> info,
          Pointer<SdlShaderCrossComputePipelineMetadata> metadata,
          Uint32 props,
        ),
        Pointer<SdlGpuComputePipeline> Function(
          Pointer<SdlGpuDevice> device,
          Pointer<SdlShaderCrossSpirvInfo> info,
          Pointer<SdlShaderCrossComputePipelineMetadata> metadata,
          int props,
        )
      >('SDL_ShaderCross_CompileComputePipelineFromSPIRV');
  return sdlShaderCrossCompileComputePipelineFromSpirvLookupFunction(
    device,
    info,
    metadata,
    props,
  );
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
/// {@category shadercross}
Pointer<SdlShaderCrossGraphicsShaderMetadata>
sdlShaderCrossReflectGraphicsSpirv(
  Pointer<Uint8> bytecode,
  int bytecodeSize,
  int props,
) {
  final sdlShaderCrossReflectGraphicsSpirvLookupFunction = _libShadercross
      .lookupFunction<
        Pointer<SdlShaderCrossGraphicsShaderMetadata> Function(
          Pointer<Uint8> bytecode,
          Uint32 bytecodeSize,
          Uint32 props,
        ),
        Pointer<SdlShaderCrossGraphicsShaderMetadata> Function(
          Pointer<Uint8> bytecode,
          int bytecodeSize,
          int props,
        )
      >('SDL_ShaderCross_ReflectGraphicsSPIRV');
  return sdlShaderCrossReflectGraphicsSpirvLookupFunction(
    bytecode,
    bytecodeSize,
    props,
  );
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
/// {@category shadercross}
Pointer<SdlShaderCrossComputePipelineMetadata>
sdlShaderCrossReflectComputeSpirv(
  Pointer<Uint8> bytecode,
  int bytecodeSize,
  int props,
) {
  final sdlShaderCrossReflectComputeSpirvLookupFunction = _libShadercross
      .lookupFunction<
        Pointer<SdlShaderCrossComputePipelineMetadata> Function(
          Pointer<Uint8> bytecode,
          Uint32 bytecodeSize,
          Uint32 props,
        ),
        Pointer<SdlShaderCrossComputePipelineMetadata> Function(
          Pointer<Uint8> bytecode,
          int bytecodeSize,
          int props,
        )
      >('SDL_ShaderCross_ReflectComputeSPIRV');
  return sdlShaderCrossReflectComputeSpirvLookupFunction(
    bytecode,
    bytecodeSize,
    props,
  );
}

///
/// Get the supported shader formats that HLSL cross-compilation can output
///
/// \returns GPU shader formats supported by HLSL cross-compilation.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUShaderFormat SDLCALL SDL_ShaderCross_GetHLSLShaderFormats(void)
/// ```
/// {@category shadercross}
int sdlShaderCrossGetHlslShaderFormats() {
  final sdlShaderCrossGetHlslShaderFormatsLookupFunction = _libShadercross
      .lookupFunction<Uint32 Function(), int Function()>(
        'SDL_ShaderCross_GetHLSLShaderFormats',
      );
  return sdlShaderCrossGetHlslShaderFormatsLookupFunction();
}

///
/// Compile to DXBC bytecode from HLSL code via a SPIRV-Cross round trip.
///
/// You must SDL_free the returned buffer once you are done with it.
///
/// These are the optional properties that can be used:
///
/// - `SDL_SHADERCROSS_PROP_SHADER_DEBUG_ENABLE_BOOLEAN`: allows debug info to be emitted when relevant. Should only be used with debugging tools like Renderdoc.
/// - `SDL_SHADERCROSS_PROP_SHADER_DEBUG_ENABLE_BOOLEAN`: a UTF-8 name to be used with the shader. Relevant for use with debugging tools like Renderdoc.
/// - `SDL_SHADERCROSS_PROP_SHADER_CULL_UNUSED_BINDINGS_BOOLEAN`: When true, indicates that the compiler should not cull unused shader resources. This behavior is disabled by default.
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
/// {@category shadercross}
Pointer<NativeType> sdlShaderCrossCompileDxbcFromHlsl(
  Pointer<SdlShaderCrossHlslInfo> info,
  Pointer<Uint32> size,
) {
  final sdlShaderCrossCompileDxbcFromHlslLookupFunction = _libShadercross
      .lookupFunction<
        Pointer<NativeType> Function(
          Pointer<SdlShaderCrossHlslInfo> info,
          Pointer<Uint32> size,
        ),
        Pointer<NativeType> Function(
          Pointer<SdlShaderCrossHlslInfo> info,
          Pointer<Uint32> size,
        )
      >('SDL_ShaderCross_CompileDXBCFromHLSL');
  return sdlShaderCrossCompileDxbcFromHlslLookupFunction(info, size);
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
/// - `SDL_SHADERCROSS_PROP_SHADER_CULL_UNUSED_BINDINGS_BOOLEAN`: when true, indicates that the compiler should not cull unused shader resources. This behavior is disabled by default.
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
/// {@category shadercross}
Pointer<NativeType> sdlShaderCrossCompileDxilFromHlsl(
  Pointer<SdlShaderCrossHlslInfo> info,
  Pointer<Uint32> size,
) {
  final sdlShaderCrossCompileDxilFromHlslLookupFunction = _libShadercross
      .lookupFunction<
        Pointer<NativeType> Function(
          Pointer<SdlShaderCrossHlslInfo> info,
          Pointer<Uint32> size,
        ),
        Pointer<NativeType> Function(
          Pointer<SdlShaderCrossHlslInfo> info,
          Pointer<Uint32> size,
        )
      >('SDL_ShaderCross_CompileDXILFromHLSL');
  return sdlShaderCrossCompileDxilFromHlslLookupFunction(info, size);
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
/// - `SDL_SHADERCROSS_PROP_SHADER_CULL_UNUSED_BINDINGS_BOOLEAN`: when true, indicates that the compiler should not cull unused shader resources. This behavior is disabled by default.
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
/// {@category shadercross}
Pointer<NativeType> sdlShaderCrossCompileSpirvFromHlsl(
  Pointer<SdlShaderCrossHlslInfo> info,
  Pointer<Uint32> size,
) {
  final sdlShaderCrossCompileSpirvFromHlslLookupFunction = _libShadercross
      .lookupFunction<
        Pointer<NativeType> Function(
          Pointer<SdlShaderCrossHlslInfo> info,
          Pointer<Uint32> size,
        ),
        Pointer<NativeType> Function(
          Pointer<SdlShaderCrossHlslInfo> info,
          Pointer<Uint32> size,
        )
      >('SDL_ShaderCross_CompileSPIRVFromHLSL');
  return sdlShaderCrossCompileSpirvFromHlslLookupFunction(info, size);
}
