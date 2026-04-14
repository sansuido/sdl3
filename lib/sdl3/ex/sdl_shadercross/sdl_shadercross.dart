part of '../../sdl_shadercross.dart';

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
/// {@category shadercross}
Pointer<Uint8> sdlxShaderCrossCompileDxbcFromHlsl(
  SdlxShaderCrossHlslInfo info,
) {
  Pointer<Uint8> result = nullptr;
  final infoPointer = info.calloc();
  final sizePointer = calloc<Uint32>();
  result = sdlShaderCrossCompileDxbcFromHlsl(
    infoPointer,
    sizePointer,
  ).cast<Uint8>();
  info.size = sizePointer.value;
  sizePointer.callocFree();
  infoPointer.callocAllFree(info.defines.length);
  return result;
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
/// {@category shadercross}
Pointer<Uint8> sdlxShaderCrossCompileDxilFromHlsl(
  SdlxShaderCrossHlslInfo info,
) {
  Pointer<Uint8> result = nullptr;
  final infoPointer = info.calloc();
  final sizePointer = calloc<Uint32>();
  result = sdlShaderCrossCompileDxilFromHlsl(
    infoPointer,
    sizePointer,
  ).cast<Uint8>();
  info.size = sizePointer.value;
  sizePointer.callocFree();
  infoPointer.callocAllFree(info.defines.length);
  return result;
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
/// {@category shadercross}
Pointer<Uint8> sdlxShaderCrossCompileSpirvFromHlsl(
  SdlxShaderCrossHlslInfo info,
) {
  Pointer<Uint8> result = nullptr;
  final infoPointer = info.calloc();
  final sizePointer = calloc<Uint32>();
  result = sdlShaderCrossCompileSpirvFromHlsl(
    infoPointer,
    sizePointer,
  ).cast<Uint8>();
  info.size = sizePointer.value;
  sizePointer.callocFree();
  infoPointer.callocAllFree(info.defines.length);
  return result;
}
