// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Creates a GPU context.
///
/// \param formatFlags a bitflag indicating which shader formats the app is
/// able to provide.
/// \param debugMode enable debug mode properties and validations.
/// \param name the preferred GPU driver, or NULL to let SDL pick the optimal
/// driver.
/// \returns a GPU context on success or NULL on failure.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetGPUDriver
/// \sa SDL_DestroyGPUDevice
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUDevice *SDLCALL SDL_CreateGPUDevice( SDL_GPUShaderFormat formatFlags, SDL_bool debugMode, const char *name)
/// ```
Pointer<SdlGpuDevice> sdlCreateGpuDevice(
    int formatFlags, bool debugMode, String? name) {
  final sdlCreateGpuDeviceLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlGpuDevice> Function(
          Uint32 formatFlags, Uint8 debugMode, Pointer<Utf8> name),
      Pointer<SdlGpuDevice> Function(int formatFlags, int debugMode,
          Pointer<Utf8> name)>('SDL_CreateGPUDevice');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlCreateGpuDeviceLookupFunction(
      formatFlags, debugMode ? 1 : 0, namePointer);
  calloc.free(namePointer);
  return result;
}

///
/// Creates a GPU context.
///
/// These are the supported properties:
///
/// - `SDL_PROP_GPU_DEVICE_CREATE_DEBUGMODE_BOOL`: enable debug mode properties
/// and validations, defaults to SDL_TRUE.
/// - `SDL_PROP_GPU_DEVICE_CREATE_PREFERLOWPOWER_BOOL`: enable to prefer energy
/// efficiency over maximum GPU performance, defaults to SDL_FALSE.
/// - `SDL_PROP_GPU_DEVICE_CREATE_NAME_STRING`: the name of the GPU driver to
/// use, if a specific one is desired.
///
/// These are the current shader format properties:
///
/// - `SDL_PROP_GPU_DEVICE_CREATE_SHADERS_SECRET_BOOL`: The app is able to
/// provide shaders for an NDA platform.
/// - `SDL_PROP_GPU_DEVICE_CREATE_SHADERS_SPIRV_BOOL`: The app is able to
/// provide SPIR-V shaders if applicable.
/// - SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXBC_BOOL`: The app is able to provide
/// DXBC shaders if applicable
/// `SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXIL_BOOL`: The app is able to
/// provide DXIL shaders if applicable.
/// - `SDL_PROP_GPU_DEVICE_CREATE_SHADERS_MSL_BOOL`: The app is able to provide
/// MSL shaders if applicable.
/// - `SDL_PROP_GPU_DEVICE_CREATE_SHADERS_METALLIB_BOOL`: The app is able to
/// provide Metal shader libraries if applicable.
///
/// With the D3D12 renderer:
///
/// - `SDL_PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING`: the prefix to
/// use for all vertex semantics, default is "TEXCOORD".
///
/// \param props the properties to use.
/// \returns a GPU context on success or NULL on failure.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetGPUDriver
/// \sa SDL_DestroyGPUDevice
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUDevice *SDLCALL SDL_CreateGPUDeviceWithProperties( SDL_PropertiesID props)
/// ```
Pointer<SdlGpuDevice> sdlCreateGpuDeviceWithProperties(int props) {
  final sdlCreateGpuDeviceWithPropertiesLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlGpuDevice> Function(Uint32 props),
      Pointer<SdlGpuDevice> Function(
          int props)>('SDL_CreateGPUDeviceWithProperties');
  return sdlCreateGpuDeviceWithPropertiesLookupFunction(props);
}

///
/// Destroys a GPU context previously returned by SDL_CreateGPUDevice.
///
/// \param device a GPU Context to destroy.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_CreateGPUDevice
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_DestroyGPUDevice(SDL_GPUDevice *device)
/// ```
void sdlDestroyGpuDevice(Pointer<SdlGpuDevice> device) {
  final sdlDestroyGpuDeviceLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlGpuDevice> device),
      void Function(Pointer<SdlGpuDevice> device)>('SDL_DestroyGPUDevice');
  return sdlDestroyGpuDeviceLookupFunction(device);
}

///
/// Returns the backend used to create this GPU context.
///
/// \param device a GPU context to query.
/// \returns an SDL_GPUDriver value, or SDL_GPU_DRIVER_INVALID on error.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUDriver SDLCALL SDL_GetGPUDriver(SDL_GPUDevice *device)
/// ```
int sdlGetGpuDriver(Pointer<SdlGpuDevice> device) {
  final sdlGetGpuDriverLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlGpuDevice> device),
      int Function(Pointer<SdlGpuDevice> device)>('SDL_GetGPUDriver');
  return sdlGetGpuDriverLookupFunction(device);
}

///
/// Creates a pipeline object to be used in a compute workflow.
///
/// Shader resource bindings must be authored to follow a particular order. For
/// SPIR-V shaders, use the following resource sets: 0: Read-only storage
/// textures, followed by read-only storage buffers 1: Write-only storage
/// textures, followed by write-only storage buffers 2: Uniform buffers
///
/// For DXBC Shader Model 5_0 shaders, use the following register order: For t
/// registers: Read-only storage textures, followed by read-only storage
/// buffers For u registers: Write-only storage textures, followed by
/// write-only storage buffers For b registers: Uniform buffers
///
/// For DXIL shaders, use the following register order: (t[n], space0):
/// Read-only storage textures, followed by read-only storage buffers (u[n],
/// space1): Write-only storage textures, followed by write-only storage
/// buffers (b[n], space2): Uniform buffers
///
/// For MSL/metallib, use the following order: For [[buffer]]: Uniform buffers,
/// followed by write-only storage buffers, followed by write-only storage
/// buffers For [[texture]]: Read-only storage textures, followed by write-only
/// storage textures
///
/// \param device a GPU Context.
/// \param computePipelineCreateInfo a struct describing the state of the
/// requested compute pipeline.
/// \returns a compute pipeline object on success, or NULL on failure.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_BindGPUComputePipeline
/// \sa SDL_ReleaseGPUComputePipeline
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUComputePipeline *SDLCALL SDL_CreateGPUComputePipeline( SDL_GPUDevice *device, SDL_GPUComputePipelineCreateInfo *computePipelineCreateInfo)
/// ```
Pointer<SdlGpuComputePipeline> sdlCreateGpuComputePipeline(
    Pointer<SdlGpuDevice> device,
    Pointer<SdlGpuComputePipelineCreateInfo> computePipelineCreateInfo) {
  final sdlCreateGpuComputePipelineLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlGpuComputePipeline> Function(Pointer<SdlGpuDevice> device,
          Pointer<SdlGpuComputePipelineCreateInfo> computePipelineCreateInfo),
      Pointer<SdlGpuComputePipeline> Function(
          Pointer<SdlGpuDevice> device,
          Pointer<SdlGpuComputePipelineCreateInfo>
              computePipelineCreateInfo)>('SDL_CreateGPUComputePipeline');
  return sdlCreateGpuComputePipelineLookupFunction(
      device, computePipelineCreateInfo);
}

///
/// Creates a pipeline object to be used in a graphics workflow.
///
/// \param device a GPU Context.
/// \param pipelineCreateInfo a struct describing the state of the desired
/// graphics pipeline.
/// \returns a graphics pipeline object on success, or NULL on failure.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_CreateGPUShader
/// \sa SDL_BindGPUGraphicsPipeline
/// \sa SDL_ReleaseGPUGraphicsPipeline
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUGraphicsPipeline *SDLCALL SDL_CreateGPUGraphicsPipeline( SDL_GPUDevice *device, SDL_GPUGraphicsPipelineCreateInfo *pipelineCreateInfo)
/// ```
Pointer<SdlGpuGraphicsPipeline> sdlCreateGpuGraphicsPipeline(
    Pointer<SdlGpuDevice> device,
    Pointer<SdlGpuGraphicsPipelineCreateInfo> pipelineCreateInfo) {
  final sdlCreateGpuGraphicsPipelineLookupFunction = libSdl3.lookupFunction<
          Pointer<SdlGpuGraphicsPipeline> Function(Pointer<SdlGpuDevice> device,
              Pointer<SdlGpuGraphicsPipelineCreateInfo> pipelineCreateInfo),
          Pointer<SdlGpuGraphicsPipeline> Function(Pointer<SdlGpuDevice> device,
              Pointer<SdlGpuGraphicsPipelineCreateInfo> pipelineCreateInfo)>(
      'SDL_CreateGPUGraphicsPipeline');
  return sdlCreateGpuGraphicsPipelineLookupFunction(device, pipelineCreateInfo);
}

///
/// Creates a sampler object to be used when binding textures in a graphics
/// workflow.
///
/// \param device a GPU Context.
/// \param samplerCreateInfo a struct describing the state of the desired
/// sampler.
/// \returns a sampler object on success, or NULL on failure.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_BindGPUVertexSamplers
/// \sa SDL_BindGPUFragmentSamplers
/// \sa SDL_ReleaseSampler
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUSampler *SDLCALL SDL_CreateGPUSampler( SDL_GPUDevice *device, SDL_GPUSamplerCreateInfo *samplerCreateInfo)
/// ```
Pointer<SdlGpuSampler> sdlCreateGpuSampler(Pointer<SdlGpuDevice> device,
    Pointer<SdlGpuSamplerCreateInfo> samplerCreateInfo) {
  final sdlCreateGpuSamplerLookupFunction = libSdl3.lookupFunction<
          Pointer<SdlGpuSampler> Function(Pointer<SdlGpuDevice> device,
              Pointer<SdlGpuSamplerCreateInfo> samplerCreateInfo),
          Pointer<SdlGpuSampler> Function(Pointer<SdlGpuDevice> device,
              Pointer<SdlGpuSamplerCreateInfo> samplerCreateInfo)>(
      'SDL_CreateGPUSampler');
  return sdlCreateGpuSamplerLookupFunction(device, samplerCreateInfo);
}

///
/// Creates a shader to be used when creating a graphics pipeline.
///
/// Shader resource bindings must be authored to follow a particular order
/// depending on the shader format.
///
/// For SPIR-V shaders, use the following resource sets: For vertex shaders: 0:
/// Sampled textures, followed by storage textures, followed by storage buffers
/// 1: Uniform buffers For fragment shaders: 2: Sampled textures, followed by
/// storage textures, followed by storage buffers 3: Uniform buffers
///
/// For DXBC Shader Model 5_0 shaders, use the following register order: For t
/// registers: Sampled textures, followed by storage textures, followed by
/// storage buffers For s registers: Samplers with indices corresponding to the
/// sampled textures For b registers: Uniform buffers
///
/// For DXIL shaders, use the following register order: For vertex shaders:
/// (t[n], space0): Sampled textures, followed by storage textures, followed by
/// storage buffers (s[n], space0): Samplers with indices corresponding to the
/// sampled textures (b[n], space1): Uniform buffers For pixel shaders: (t[n],
/// space2): Sampled textures, followed by storage textures, followed by
/// storage buffers (s[n], space2): Samplers with indices corresponding to the
/// sampled textures (b[n], space3): Uniform buffers
///
/// For MSL/metallib, use the following order: For [[texture]]: Sampled
/// textures, followed by storage textures For [[sampler]]: Samplers with
/// indices corresponding to the sampled textures For [[buffer]]: Uniform
/// buffers, followed by storage buffers. Vertex buffer 0 is bound at
/// [[buffer(30)]], vertex buffer 1 at [[buffer(29)]], and so on. Rather than
/// manually authoring vertex buffer indices, use the [[stage_in]] attribute
/// which will automatically use the vertex input information from the
/// SDL_GPUPipeline.
///
/// \param device a GPU Context.
/// \param shaderCreateInfo a struct describing the state of the desired
/// shader.
/// \returns a shader object on success, or NULL on failure.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_CreateGPUGraphicsPipeline
/// \sa SDL_ReleaseGPUShader
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUShader *SDLCALL SDL_CreateGPUShader( SDL_GPUDevice *device, SDL_GPUShaderCreateInfo *shaderCreateInfo)
/// ```
Pointer<SdlGpuShader> sdlCreateGpuShader(Pointer<SdlGpuDevice> device,
    Pointer<SdlGpuShaderCreateInfo> shaderCreateInfo) {
  final sdlCreateGpuShaderLookupFunction = libSdl3.lookupFunction<
          Pointer<SdlGpuShader> Function(Pointer<SdlGpuDevice> device,
              Pointer<SdlGpuShaderCreateInfo> shaderCreateInfo),
          Pointer<SdlGpuShader> Function(Pointer<SdlGpuDevice> device,
              Pointer<SdlGpuShaderCreateInfo> shaderCreateInfo)>(
      'SDL_CreateGPUShader');
  return sdlCreateGpuShaderLookupFunction(device, shaderCreateInfo);
}

///
/// Creates a texture object to be used in graphics or compute workflows.
///
/// The contents of this texture are undefined until data is written to the
/// texture.
///
/// Note that certain combinations of usage flags are invalid. For example, a
/// texture cannot have both the SAMPLER and GRAPHICS_STORAGE_READ flags.
///
/// If you request a sample count higher than the hardware supports, the
/// implementation will automatically fall back to the highest available sample
/// count.
///
/// \param device a GPU Context.
/// \param textureCreateInfo a struct describing the state of the texture to
/// create.
/// \returns a texture object on success, or NULL on failure.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_UploadToGPUTexture
/// \sa SDL_DownloadFromGPUTexture
/// \sa SDL_BindGPUVertexSamplers
/// \sa SDL_BindGPUVertexStorageTextures
/// \sa SDL_BindGPUFragmentSamplers
/// \sa SDL_BindGPUFragmentStorageTextures
/// \sa SDL_BindGPUComputeStorageTextures
/// \sa SDL_BlitGPUTexture
/// \sa SDL_ReleaseGPUTexture
/// \sa SDL_GPUTextureSupportsFormat
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUTexture *SDLCALL SDL_CreateGPUTexture( SDL_GPUDevice *device, SDL_GPUTextureCreateInfo *textureCreateInfo)
/// ```
Pointer<SdlGpuTexture> sdlCreateGpuTexture(Pointer<SdlGpuDevice> device,
    Pointer<SdlGpuTextureCreateInfo> textureCreateInfo) {
  final sdlCreateGpuTextureLookupFunction = libSdl3.lookupFunction<
          Pointer<SdlGpuTexture> Function(Pointer<SdlGpuDevice> device,
              Pointer<SdlGpuTextureCreateInfo> textureCreateInfo),
          Pointer<SdlGpuTexture> Function(Pointer<SdlGpuDevice> device,
              Pointer<SdlGpuTextureCreateInfo> textureCreateInfo)>(
      'SDL_CreateGPUTexture');
  return sdlCreateGpuTextureLookupFunction(device, textureCreateInfo);
}

///
/// Creates a buffer object to be used in graphics or compute workflows.
///
/// The contents of this buffer are undefined until data is written to the
/// buffer.
///
/// Note that certain combinations of usage flags are invalid. For example, a
/// buffer cannot have both the VERTEX and INDEX flags.
///
/// \param device a GPU Context.
/// \param bufferCreateInfo a struct describing the state of the buffer to
/// create.
/// \returns a buffer object on success, or NULL on failure.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_UploadToGPUBuffer
/// \sa SDL_BindGPUVertexBuffers
/// \sa SDL_BindGPUIndexBuffer
/// \sa SDL_BindGPUVertexStorageBuffers
/// \sa SDL_BindGPUFragmentStorageBuffers
/// \sa SDL_BindGPUComputeStorageBuffers
/// \sa SDL_ReleaseGPUBuffer
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUBuffer *SDLCALL SDL_CreateGPUBuffer( SDL_GPUDevice *device, SDL_GPUBufferCreateInfo *bufferCreateInfo)
/// ```
Pointer<SdlGpuBuffer> sdlCreateGpuBuffer(Pointer<SdlGpuDevice> device,
    Pointer<SdlGpuBufferCreateInfo> bufferCreateInfo) {
  final sdlCreateGpuBufferLookupFunction = libSdl3.lookupFunction<
          Pointer<SdlGpuBuffer> Function(Pointer<SdlGpuDevice> device,
              Pointer<SdlGpuBufferCreateInfo> bufferCreateInfo),
          Pointer<SdlGpuBuffer> Function(Pointer<SdlGpuDevice> device,
              Pointer<SdlGpuBufferCreateInfo> bufferCreateInfo)>(
      'SDL_CreateGPUBuffer');
  return sdlCreateGpuBufferLookupFunction(device, bufferCreateInfo);
}

///
/// Creates a transfer buffer to be used when uploading to or downloading from
/// graphics resources.
///
/// \param device a GPU Context.
/// \param transferBufferCreateInfo a struct describing the state of the
/// transfer buffer to create.
/// \returns a transfer buffer on success, or NULL on failure.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_UploadToGPUBuffer
/// \sa SDL_DownloadFromGPUBuffer
/// \sa SDL_UploadToGPUTexture
/// \sa SDL_DownloadFromGPUTexture
/// \sa SDL_ReleaseGPUTransferBuffer
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUTransferBuffer *SDLCALL SDL_CreateGPUTransferBuffer( SDL_GPUDevice *device, SDL_GPUTransferBufferCreateInfo *transferBufferCreateInfo)
/// ```
Pointer<SdlGpuTransferBuffer> sdlCreateGpuTransferBuffer(
    Pointer<SdlGpuDevice> device,
    Pointer<SdlGpuTransferBufferCreateInfo> transferBufferCreateInfo) {
  final sdlCreateGpuTransferBufferLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlGpuTransferBuffer> Function(Pointer<SdlGpuDevice> device,
          Pointer<SdlGpuTransferBufferCreateInfo> transferBufferCreateInfo),
      Pointer<SdlGpuTransferBuffer> Function(
          Pointer<SdlGpuDevice> device,
          Pointer<SdlGpuTransferBufferCreateInfo>
              transferBufferCreateInfo)>('SDL_CreateGPUTransferBuffer');
  return sdlCreateGpuTransferBufferLookupFunction(
      device, transferBufferCreateInfo);
}

///
/// Sets an arbitrary string constant to label a buffer.
///
/// Useful for debugging.
///
/// \param device a GPU Context.
/// \param buffer a buffer to attach the name to.
/// \param text a UTF-8 string constant to mark as the name of the buffer.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_SetGPUBufferName( SDL_GPUDevice *device, SDL_GPUBuffer *buffer, const char *text)
/// ```
void sdlSetGpuBufferName(
    Pointer<SdlGpuDevice> device, Pointer<SdlGpuBuffer> buffer, String? text) {
  final sdlSetGpuBufferNameLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlGpuDevice> device, Pointer<SdlGpuBuffer> buffer,
          Pointer<Utf8> text),
      void Function(Pointer<SdlGpuDevice> device, Pointer<SdlGpuBuffer> buffer,
          Pointer<Utf8> text)>('SDL_SetGPUBufferName');
  final textPointer = text != null ? text.toNativeUtf8() : nullptr;
  final result = sdlSetGpuBufferNameLookupFunction(device, buffer, textPointer);
  calloc.free(textPointer);
  return result;
}

///
/// Sets an arbitrary string constant to label a texture.
///
/// Useful for debugging.
///
/// \param device a GPU Context.
/// \param texture a texture to attach the name to.
/// \param text a UTF-8 string constant to mark as the name of the texture.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_SetGPUTextureName( SDL_GPUDevice *device, SDL_GPUTexture *texture, const char *text)
/// ```
void sdlSetGpuTextureName(Pointer<SdlGpuDevice> device,
    Pointer<SdlGpuTexture> texture, String? text) {
  final sdlSetGpuTextureNameLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlGpuDevice> device,
          Pointer<SdlGpuTexture> texture, Pointer<Utf8> text),
      void Function(
          Pointer<SdlGpuDevice> device,
          Pointer<SdlGpuTexture> texture,
          Pointer<Utf8> text)>('SDL_SetGPUTextureName');
  final textPointer = text != null ? text.toNativeUtf8() : nullptr;
  final result =
      sdlSetGpuTextureNameLookupFunction(device, texture, textPointer);
  calloc.free(textPointer);
  return result;
}

///
/// Inserts an arbitrary string label into the command buffer callstream.
///
/// Useful for debugging.
///
/// \param commandBuffer a command buffer.
/// \param text a UTF-8 string constant to insert as the label.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_InsertGPUDebugLabel( SDL_GPUCommandBuffer *commandBuffer, const char *text)
/// ```
void sdlInsertGpuDebugLabel(
    Pointer<SdlGpuCommandBuffer> commandBuffer, String? text) {
  final sdlInsertGpuDebugLabelLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Pointer<SdlGpuCommandBuffer> commandBuffer, Pointer<Utf8> text),
      void Function(Pointer<SdlGpuCommandBuffer> commandBuffer,
          Pointer<Utf8> text)>('SDL_InsertGPUDebugLabel');
  final textPointer = text != null ? text.toNativeUtf8() : nullptr;
  final result =
      sdlInsertGpuDebugLabelLookupFunction(commandBuffer, textPointer);
  calloc.free(textPointer);
  return result;
}

///
/// Begins a debug group with an arbitary name.
///
/// Used for denoting groups of calls when viewing the command buffer
/// callstream in a graphics debugging tool.
///
/// Each call to SDL_PushGPUDebugGroup must have a corresponding call to
/// SDL_PopGPUDebugGroup.
///
/// On some backends (e.g. Metal), pushing a debug group during a
/// render/blit/compute pass will create a group that is scoped to the native
/// pass rather than the command buffer. For best results, if you push a debug
/// group during a pass, always pop it in the same pass.
///
/// \param commandBuffer a command buffer.
/// \param name a UTF-8 string constant that names the group.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_PopGPUDebugGroup
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_PushGPUDebugGroup( SDL_GPUCommandBuffer *commandBuffer, const char *name)
/// ```
void sdlPushGpuDebugGroup(
    Pointer<SdlGpuCommandBuffer> commandBuffer, String? name) {
  final sdlPushGpuDebugGroupLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Pointer<SdlGpuCommandBuffer> commandBuffer, Pointer<Utf8> name),
      void Function(Pointer<SdlGpuCommandBuffer> commandBuffer,
          Pointer<Utf8> name)>('SDL_PushGPUDebugGroup');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlPushGpuDebugGroupLookupFunction(commandBuffer, namePointer);
  calloc.free(namePointer);
  return result;
}

///
/// Ends the most-recently pushed debug group.
///
/// \param commandBuffer a command buffer.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_PushGPUDebugGroup
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_PopGPUDebugGroup( SDL_GPUCommandBuffer *commandBuffer)
/// ```
void sdlPopGpuDebugGroup(Pointer<SdlGpuCommandBuffer> commandBuffer) {
  final sdlPopGpuDebugGroupLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlGpuCommandBuffer> commandBuffer),
      void Function(
          Pointer<SdlGpuCommandBuffer> commandBuffer)>('SDL_PopGPUDebugGroup');
  return sdlPopGpuDebugGroupLookupFunction(commandBuffer);
}

///
/// Frees the given texture as soon as it is safe to do so.
///
/// You must not reference the texture after calling this function.
///
/// \param device a GPU context.
/// \param texture a texture to be destroyed.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ReleaseGPUTexture( SDL_GPUDevice *device, SDL_GPUTexture *texture)
/// ```
void sdlReleaseGpuTexture(
    Pointer<SdlGpuDevice> device, Pointer<SdlGpuTexture> texture) {
  final sdlReleaseGpuTextureLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Pointer<SdlGpuDevice> device, Pointer<SdlGpuTexture> texture),
      void Function(Pointer<SdlGpuDevice> device,
          Pointer<SdlGpuTexture> texture)>('SDL_ReleaseGPUTexture');
  return sdlReleaseGpuTextureLookupFunction(device, texture);
}

///
/// Frees the given sampler as soon as it is safe to do so.
///
/// You must not reference the texture after calling this function.
///
/// \param device a GPU context.
/// \param sampler a sampler to be destroyed.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ReleaseGPUSampler( SDL_GPUDevice *device, SDL_GPUSampler *sampler)
/// ```
void sdlReleaseGpuSampler(
    Pointer<SdlGpuDevice> device, Pointer<SdlGpuSampler> sampler) {
  final sdlReleaseGpuSamplerLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Pointer<SdlGpuDevice> device, Pointer<SdlGpuSampler> sampler),
      void Function(Pointer<SdlGpuDevice> device,
          Pointer<SdlGpuSampler> sampler)>('SDL_ReleaseGPUSampler');
  return sdlReleaseGpuSamplerLookupFunction(device, sampler);
}

///
/// Frees the given buffer as soon as it is safe to do so.
///
/// You must not reference the buffer after calling this function.
///
/// \param device a GPU context.
/// \param buffer a buffer to be destroyed.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ReleaseGPUBuffer( SDL_GPUDevice *device, SDL_GPUBuffer *buffer)
/// ```
void sdlReleaseGpuBuffer(
    Pointer<SdlGpuDevice> device, Pointer<SdlGpuBuffer> buffer) {
  final sdlReleaseGpuBufferLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlGpuDevice> device, Pointer<SdlGpuBuffer> buffer),
      void Function(Pointer<SdlGpuDevice> device,
          Pointer<SdlGpuBuffer> buffer)>('SDL_ReleaseGPUBuffer');
  return sdlReleaseGpuBufferLookupFunction(device, buffer);
}

///
/// Frees the given transfer buffer as soon as it is safe to do so.
///
/// You must not reference the transfer buffer after calling this function.
///
/// \param device a GPU context.
/// \param transferBuffer a transfer buffer to be destroyed.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ReleaseGPUTransferBuffer( SDL_GPUDevice *device, SDL_GPUTransferBuffer *transferBuffer)
/// ```
void sdlReleaseGpuTransferBuffer(Pointer<SdlGpuDevice> device,
    Pointer<SdlGpuTransferBuffer> transferBuffer) {
  final sdlReleaseGpuTransferBufferLookupFunction = libSdl3.lookupFunction<
          Void Function(Pointer<SdlGpuDevice> device,
              Pointer<SdlGpuTransferBuffer> transferBuffer),
          void Function(Pointer<SdlGpuDevice> device,
              Pointer<SdlGpuTransferBuffer> transferBuffer)>(
      'SDL_ReleaseGPUTransferBuffer');
  return sdlReleaseGpuTransferBufferLookupFunction(device, transferBuffer);
}

///
/// Frees the given compute pipeline as soon as it is safe to do so.
///
/// You must not reference the compute pipeline after calling this function.
///
/// \param device a GPU context.
/// \param computePipeline a compute pipeline to be destroyed.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ReleaseGPUComputePipeline( SDL_GPUDevice *device, SDL_GPUComputePipeline *computePipeline)
/// ```
void sdlReleaseGpuComputePipeline(Pointer<SdlGpuDevice> device,
    Pointer<SdlGpuComputePipeline> computePipeline) {
  final sdlReleaseGpuComputePipelineLookupFunction = libSdl3.lookupFunction<
          Void Function(Pointer<SdlGpuDevice> device,
              Pointer<SdlGpuComputePipeline> computePipeline),
          void Function(Pointer<SdlGpuDevice> device,
              Pointer<SdlGpuComputePipeline> computePipeline)>(
      'SDL_ReleaseGPUComputePipeline');
  return sdlReleaseGpuComputePipelineLookupFunction(device, computePipeline);
}

///
/// Frees the given shader as soon as it is safe to do so.
///
/// You must not reference the shader after calling this function.
///
/// \param device a GPU context.
/// \param shader a shader to be destroyed.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ReleaseGPUShader( SDL_GPUDevice *device, SDL_GPUShader *shader)
/// ```
void sdlReleaseGpuShader(
    Pointer<SdlGpuDevice> device, Pointer<SdlGpuShader> shader) {
  final sdlReleaseGpuShaderLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlGpuDevice> device, Pointer<SdlGpuShader> shader),
      void Function(Pointer<SdlGpuDevice> device,
          Pointer<SdlGpuShader> shader)>('SDL_ReleaseGPUShader');
  return sdlReleaseGpuShaderLookupFunction(device, shader);
}

///
/// Frees the given graphics pipeline as soon as it is safe to do so.
///
/// You must not reference the graphics pipeline after calling this function.
///
/// \param device a GPU context.
/// \param graphicsPipeline a graphics pipeline to be destroyed.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ReleaseGPUGraphicsPipeline( SDL_GPUDevice *device, SDL_GPUGraphicsPipeline *graphicsPipeline)
/// ```
void sdlReleaseGpuGraphicsPipeline(Pointer<SdlGpuDevice> device,
    Pointer<SdlGpuGraphicsPipeline> graphicsPipeline) {
  final sdlReleaseGpuGraphicsPipelineLookupFunction = libSdl3.lookupFunction<
          Void Function(Pointer<SdlGpuDevice> device,
              Pointer<SdlGpuGraphicsPipeline> graphicsPipeline),
          void Function(Pointer<SdlGpuDevice> device,
              Pointer<SdlGpuGraphicsPipeline> graphicsPipeline)>(
      'SDL_ReleaseGPUGraphicsPipeline');
  return sdlReleaseGpuGraphicsPipelineLookupFunction(device, graphicsPipeline);
}

///
/// Acquire a command buffer.
///
/// This command buffer is managed by the implementation and should not be
/// freed by the user. The command buffer may only be used on the thread it was
/// acquired on. The command buffer should be submitted on the thread it was
/// acquired on.
///
/// \param device a GPU context.
/// \returns a command buffer.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SubmitGPUCommandBuffer
/// \sa SDL_SubmitGPUCommandBufferAndAcquireFence
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUCommandBuffer *SDLCALL SDL_AcquireGPUCommandBuffer( SDL_GPUDevice *device)
/// ```
Pointer<SdlGpuCommandBuffer> sdlAcquireGpuCommandBuffer(
    Pointer<SdlGpuDevice> device) {
  final sdlAcquireGpuCommandBufferLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlGpuCommandBuffer> Function(Pointer<SdlGpuDevice> device),
      Pointer<SdlGpuCommandBuffer> Function(
          Pointer<SdlGpuDevice> device)>('SDL_AcquireGPUCommandBuffer');
  return sdlAcquireGpuCommandBufferLookupFunction(device);
}

///
/// Pushes data to a vertex uniform slot on the command buffer.
///
/// Subsequent draw calls will use this uniform data.
///
/// \param commandBuffer a command buffer.
/// \param slotIndex the vertex uniform slot to push data to.
/// \param data client data to write.
/// \param dataLengthInBytes the length of the data to write.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_PushGPUVertexUniformData( SDL_GPUCommandBuffer *commandBuffer, Uint32 slotIndex, const void *data, Uint32 dataLengthInBytes)
/// ```
void sdlPushGpuVertexUniformData(Pointer<SdlGpuCommandBuffer> commandBuffer,
    int slotIndex, Pointer<NativeType> data, int dataLengthInBytes) {
  final sdlPushGpuVertexUniformDataLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlGpuCommandBuffer> commandBuffer,
          Uint32 slotIndex, Pointer<NativeType> data, Uint32 dataLengthInBytes),
      void Function(
          Pointer<SdlGpuCommandBuffer> commandBuffer,
          int slotIndex,
          Pointer<NativeType> data,
          int dataLengthInBytes)>('SDL_PushGPUVertexUniformData');
  return sdlPushGpuVertexUniformDataLookupFunction(
      commandBuffer, slotIndex, data, dataLengthInBytes);
}

///
/// Pushes data to a fragment uniform slot on the command buffer.
///
/// Subsequent draw calls will use this uniform data.
///
/// \param commandBuffer a command buffer.
/// \param slotIndex the fragment uniform slot to push data to.
/// \param data client data to write.
/// \param dataLengthInBytes the length of the data to write.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_PushGPUFragmentUniformData( SDL_GPUCommandBuffer *commandBuffer, Uint32 slotIndex, const void *data, Uint32 dataLengthInBytes)
/// ```
void sdlPushGpuFragmentUniformData(Pointer<SdlGpuCommandBuffer> commandBuffer,
    int slotIndex, Pointer<NativeType> data, int dataLengthInBytes) {
  final sdlPushGpuFragmentUniformDataLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlGpuCommandBuffer> commandBuffer,
          Uint32 slotIndex, Pointer<NativeType> data, Uint32 dataLengthInBytes),
      void Function(
          Pointer<SdlGpuCommandBuffer> commandBuffer,
          int slotIndex,
          Pointer<NativeType> data,
          int dataLengthInBytes)>('SDL_PushGPUFragmentUniformData');
  return sdlPushGpuFragmentUniformDataLookupFunction(
      commandBuffer, slotIndex, data, dataLengthInBytes);
}

///
/// Pushes data to a uniform slot on the command buffer.
///
/// Subsequent draw calls will use this uniform data.
///
/// \param commandBuffer a command buffer.
/// \param slotIndex the uniform slot to push data to.
/// \param data client data to write.
/// \param dataLengthInBytes the length of the data to write.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_PushGPUComputeUniformData( SDL_GPUCommandBuffer *commandBuffer, Uint32 slotIndex, const void *data, Uint32 dataLengthInBytes)
/// ```
void sdlPushGpuComputeUniformData(Pointer<SdlGpuCommandBuffer> commandBuffer,
    int slotIndex, Pointer<NativeType> data, int dataLengthInBytes) {
  final sdlPushGpuComputeUniformDataLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlGpuCommandBuffer> commandBuffer,
          Uint32 slotIndex, Pointer<NativeType> data, Uint32 dataLengthInBytes),
      void Function(
          Pointer<SdlGpuCommandBuffer> commandBuffer,
          int slotIndex,
          Pointer<NativeType> data,
          int dataLengthInBytes)>('SDL_PushGPUComputeUniformData');
  return sdlPushGpuComputeUniformDataLookupFunction(
      commandBuffer, slotIndex, data, dataLengthInBytes);
}

///
/// Begins a render pass on a command buffer.
///
/// A render pass consists of a set of texture subresources (or depth slices in
/// the 3D texture case) which will be rendered to during the render pass,
/// along with corresponding clear values and load/store operations. All
/// operations related to graphics pipelines must take place inside of a render
/// pass. A default viewport and scissor state are automatically set when this
/// is called. You cannot begin another render pass, or begin a compute pass or
/// copy pass until you have ended the render pass.
///
/// \param commandBuffer a command buffer.
/// \param colorAttachmentInfos an array of texture subresources with
/// corresponding clear values and load/store ops.
/// \param colorAttachmentCount the number of color attachments in the
/// colorAttachmentInfos array.
/// \param depthStencilAttachmentInfo a texture subresource with corresponding
/// clear value and load/store ops, may be
/// NULL.
/// \returns a render pass handle.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_EndGPURenderPass
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPURenderPass *SDLCALL SDL_BeginGPURenderPass( SDL_GPUCommandBuffer *commandBuffer, SDL_GPUColorAttachmentInfo *colorAttachmentInfos, Uint32 colorAttachmentCount, SDL_GPUDepthStencilAttachmentInfo *depthStencilAttachmentInfo)
/// ```
Pointer<SdlGpuRenderPass> sdlBeginGpuRenderPass(
    Pointer<SdlGpuCommandBuffer> commandBuffer,
    Pointer<SdlGpuColorAttachmentInfo> colorAttachmentInfos,
    int colorAttachmentCount,
    Pointer<SdlGpuDepthStencilAttachmentInfo> depthStencilAttachmentInfo) {
  final sdlBeginGpuRenderPassLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlGpuRenderPass> Function(
          Pointer<SdlGpuCommandBuffer> commandBuffer,
          Pointer<SdlGpuColorAttachmentInfo> colorAttachmentInfos,
          Uint32 colorAttachmentCount,
          Pointer<SdlGpuDepthStencilAttachmentInfo> depthStencilAttachmentInfo),
      Pointer<SdlGpuRenderPass> Function(
          Pointer<SdlGpuCommandBuffer> commandBuffer,
          Pointer<SdlGpuColorAttachmentInfo> colorAttachmentInfos,
          int colorAttachmentCount,
          Pointer<SdlGpuDepthStencilAttachmentInfo>
              depthStencilAttachmentInfo)>('SDL_BeginGPURenderPass');
  return sdlBeginGpuRenderPassLookupFunction(commandBuffer,
      colorAttachmentInfos, colorAttachmentCount, depthStencilAttachmentInfo);
}

///
/// Binds a graphics pipeline on a render pass to be used in rendering.
///
/// A graphics pipeline must be bound before making any draw calls.
///
/// \param renderPass a render pass handle.
/// \param graphicsPipeline the graphics pipeline to bind.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_BindGPUGraphicsPipeline( SDL_GPURenderPass *renderPass, SDL_GPUGraphicsPipeline *graphicsPipeline)
/// ```
void sdlBindGpuGraphicsPipeline(Pointer<SdlGpuRenderPass> renderPass,
    Pointer<SdlGpuGraphicsPipeline> graphicsPipeline) {
  final sdlBindGpuGraphicsPipelineLookupFunction = libSdl3.lookupFunction<
          Void Function(Pointer<SdlGpuRenderPass> renderPass,
              Pointer<SdlGpuGraphicsPipeline> graphicsPipeline),
          void Function(Pointer<SdlGpuRenderPass> renderPass,
              Pointer<SdlGpuGraphicsPipeline> graphicsPipeline)>(
      'SDL_BindGPUGraphicsPipeline');
  return sdlBindGpuGraphicsPipelineLookupFunction(renderPass, graphicsPipeline);
}

///
/// Sets the current viewport state on a command buffer.
///
/// \param renderPass a render pass handle.
/// \param viewport the viewport to set.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_SetGPUViewport( SDL_GPURenderPass *renderPass, SDL_GPUViewport *viewport)
/// ```
void sdlSetGpuViewport(
    Pointer<SdlGpuRenderPass> renderPass, Pointer<SdlGpuViewport> viewport) {
  final sdlSetGpuViewportLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlGpuRenderPass> renderPass,
          Pointer<SdlGpuViewport> viewport),
      void Function(Pointer<SdlGpuRenderPass> renderPass,
          Pointer<SdlGpuViewport> viewport)>('SDL_SetGPUViewport');
  return sdlSetGpuViewportLookupFunction(renderPass, viewport);
}

///
/// Sets the current scissor state on a command buffer.
///
/// \param renderPass a render pass handle.
/// \param scissor the scissor area to set.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_SetGPUScissor( SDL_GPURenderPass *renderPass, SDL_Rect *scissor)
/// ```
void sdlSetGpuScissor(
    Pointer<SdlGpuRenderPass> renderPass, Pointer<SdlRect> scissor) {
  final sdlSetGpuScissorLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Pointer<SdlGpuRenderPass> renderPass, Pointer<SdlRect> scissor),
      void Function(Pointer<SdlGpuRenderPass> renderPass,
          Pointer<SdlRect> scissor)>('SDL_SetGPUScissor');
  return sdlSetGpuScissorLookupFunction(renderPass, scissor);
}

///
/// Binds vertex buffers on a command buffer for use with subsequent draw
/// calls.
///
/// \param renderPass a render pass handle.
/// \param firstBinding the starting bind point for the vertex buffers.
/// \param pBindings an array of SDL_GPUBufferBinding structs containing vertex
/// buffers and offset values.
/// \param bindingCount the number of bindings in the pBindings array.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_BindGPUVertexBuffers( SDL_GPURenderPass *renderPass, Uint32 firstBinding, SDL_GPUBufferBinding *pBindings, Uint32 bindingCount)
/// ```
void sdlBindGpuVertexBuffers(
    Pointer<SdlGpuRenderPass> renderPass,
    int firstBinding,
    Pointer<SdlGpuBufferBinding> pBindings,
    int bindingCount) {
  final sdlBindGpuVertexBuffersLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlGpuRenderPass> renderPass, Uint32 firstBinding,
          Pointer<SdlGpuBufferBinding> pBindings, Uint32 bindingCount),
      void Function(
          Pointer<SdlGpuRenderPass> renderPass,
          int firstBinding,
          Pointer<SdlGpuBufferBinding> pBindings,
          int bindingCount)>('SDL_BindGPUVertexBuffers');
  return sdlBindGpuVertexBuffersLookupFunction(
      renderPass, firstBinding, pBindings, bindingCount);
}

///
/// Binds an index buffer on a command buffer for use with subsequent draw
/// calls.
///
/// \param renderPass a render pass handle.
/// \param pBinding a pointer to a struct containing an index buffer and
/// offset.
/// \param indexElementSize whether the index values in the buffer are 16- or
/// 32-bit.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_BindGPUIndexBuffer( SDL_GPURenderPass *renderPass, SDL_GPUBufferBinding *pBinding, SDL_GPUIndexElementSize indexElementSize)
/// ```
void sdlBindGpuIndexBuffer(Pointer<SdlGpuRenderPass> renderPass,
    Pointer<SdlGpuBufferBinding> pBinding, int indexElementSize) {
  final sdlBindGpuIndexBufferLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlGpuRenderPass> renderPass,
          Pointer<SdlGpuBufferBinding> pBinding, Int32 indexElementSize),
      void Function(
          Pointer<SdlGpuRenderPass> renderPass,
          Pointer<SdlGpuBufferBinding> pBinding,
          int indexElementSize)>('SDL_BindGPUIndexBuffer');
  return sdlBindGpuIndexBufferLookupFunction(
      renderPass, pBinding, indexElementSize);
}

///
/// Binds texture-sampler pairs for use on the vertex shader.
///
/// The textures must have been created with SDL_GPU_TEXTUREUSAGE_SAMPLER_BIT.
///
/// \param renderPass a render pass handle.
/// \param firstSlot the vertex sampler slot to begin binding from.
/// \param textureSamplerBindings an array of texture-sampler binding structs.
/// \param bindingCount the number of texture-sampler pairs to bind from the
/// array.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_BindGPUVertexSamplers( SDL_GPURenderPass *renderPass, Uint32 firstSlot, SDL_GPUTextureSamplerBinding *textureSamplerBindings, Uint32 bindingCount)
/// ```
void sdlBindGpuVertexSamplers(
    Pointer<SdlGpuRenderPass> renderPass,
    int firstSlot,
    Pointer<SdlGpuTextureSamplerBinding> textureSamplerBindings,
    int bindingCount) {
  final sdlBindGpuVertexSamplersLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Pointer<SdlGpuRenderPass> renderPass,
          Uint32 firstSlot,
          Pointer<SdlGpuTextureSamplerBinding> textureSamplerBindings,
          Uint32 bindingCount),
      void Function(
          Pointer<SdlGpuRenderPass> renderPass,
          int firstSlot,
          Pointer<SdlGpuTextureSamplerBinding> textureSamplerBindings,
          int bindingCount)>('SDL_BindGPUVertexSamplers');
  return sdlBindGpuVertexSamplersLookupFunction(
      renderPass, firstSlot, textureSamplerBindings, bindingCount);
}

///
/// Binds storage textures for use on the vertex shader.
///
/// These textures must have been created with
/// SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ_BIT.
///
/// \param renderPass a render pass handle.
/// \param firstSlot the vertex storage texture slot to begin binding from.
/// \param storageTextures an array of storage textures.
/// \param bindingCount the number of storage texture to bind from the array.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_BindGPUVertexStorageTextures( SDL_GPURenderPass *renderPass, Uint32 firstSlot, SDL_GPUTexture **storageTextures, Uint32 bindingCount)
/// ```
void sdlBindGpuVertexStorageTextures(
    Pointer<SdlGpuRenderPass> renderPass,
    int firstSlot,
    Pointer<Pointer<SdlGpuTexture>> storageTextures,
    int bindingCount) {
  final sdlBindGpuVertexStorageTexturesLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlGpuRenderPass> renderPass, Uint32 firstSlot,
          Pointer<Pointer<SdlGpuTexture>> storageTextures, Uint32 bindingCount),
      void Function(
          Pointer<SdlGpuRenderPass> renderPass,
          int firstSlot,
          Pointer<Pointer<SdlGpuTexture>> storageTextures,
          int bindingCount)>('SDL_BindGPUVertexStorageTextures');
  return sdlBindGpuVertexStorageTexturesLookupFunction(
      renderPass, firstSlot, storageTextures, bindingCount);
}

///
/// Binds storage buffers for use on the vertex shader.
///
/// These buffers must have been created with
/// SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ_BIT.
///
/// \param renderPass a render pass handle.
/// \param firstSlot the vertex storage buffer slot to begin binding from.
/// \param storageBuffers an array of buffers.
/// \param bindingCount the number of buffers to bind from the array.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_BindGPUVertexStorageBuffers( SDL_GPURenderPass *renderPass, Uint32 firstSlot, SDL_GPUBuffer **storageBuffers, Uint32 bindingCount)
/// ```
void sdlBindGpuVertexStorageBuffers(
    Pointer<SdlGpuRenderPass> renderPass,
    int firstSlot,
    Pointer<Pointer<SdlGpuBuffer>> storageBuffers,
    int bindingCount) {
  final sdlBindGpuVertexStorageBuffersLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlGpuRenderPass> renderPass, Uint32 firstSlot,
          Pointer<Pointer<SdlGpuBuffer>> storageBuffers, Uint32 bindingCount),
      void Function(
          Pointer<SdlGpuRenderPass> renderPass,
          int firstSlot,
          Pointer<Pointer<SdlGpuBuffer>> storageBuffers,
          int bindingCount)>('SDL_BindGPUVertexStorageBuffers');
  return sdlBindGpuVertexStorageBuffersLookupFunction(
      renderPass, firstSlot, storageBuffers, bindingCount);
}

///
/// Binds texture-sampler pairs for use on the fragment shader.
///
/// The textures must have been created with SDL_GPU_TEXTUREUSAGE_SAMPLER_BIT.
///
/// \param renderPass a render pass handle.
/// \param firstSlot the fragment sampler slot to begin binding from.
/// \param textureSamplerBindings an array of texture-sampler binding structs.
/// \param bindingCount the number of texture-sampler pairs to bind from the
/// array.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_BindGPUFragmentSamplers( SDL_GPURenderPass *renderPass, Uint32 firstSlot, SDL_GPUTextureSamplerBinding *textureSamplerBindings, Uint32 bindingCount)
/// ```
void sdlBindGpuFragmentSamplers(
    Pointer<SdlGpuRenderPass> renderPass,
    int firstSlot,
    Pointer<SdlGpuTextureSamplerBinding> textureSamplerBindings,
    int bindingCount) {
  final sdlBindGpuFragmentSamplersLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Pointer<SdlGpuRenderPass> renderPass,
          Uint32 firstSlot,
          Pointer<SdlGpuTextureSamplerBinding> textureSamplerBindings,
          Uint32 bindingCount),
      void Function(
          Pointer<SdlGpuRenderPass> renderPass,
          int firstSlot,
          Pointer<SdlGpuTextureSamplerBinding> textureSamplerBindings,
          int bindingCount)>('SDL_BindGPUFragmentSamplers');
  return sdlBindGpuFragmentSamplersLookupFunction(
      renderPass, firstSlot, textureSamplerBindings, bindingCount);
}

///
/// Binds storage textures for use on the fragment shader.
///
/// These textures must have been created with
/// SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ_BIT.
///
/// \param renderPass a render pass handle.
/// \param firstSlot the fragment storage texture slot to begin binding from.
/// \param storageTextures an array of storage textures.
/// \param bindingCount the number of storage textures to bind from the array.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_BindGPUFragmentStorageTextures( SDL_GPURenderPass *renderPass, Uint32 firstSlot, SDL_GPUTexture **storageTextures, Uint32 bindingCount)
/// ```
void sdlBindGpuFragmentStorageTextures(
    Pointer<SdlGpuRenderPass> renderPass,
    int firstSlot,
    Pointer<Pointer<SdlGpuTexture>> storageTextures,
    int bindingCount) {
  final sdlBindGpuFragmentStorageTexturesLookupFunction =
      libSdl3.lookupFunction<
          Void Function(
              Pointer<SdlGpuRenderPass> renderPass,
              Uint32 firstSlot,
              Pointer<Pointer<SdlGpuTexture>> storageTextures,
              Uint32 bindingCount),
          void Function(
              Pointer<SdlGpuRenderPass> renderPass,
              int firstSlot,
              Pointer<Pointer<SdlGpuTexture>> storageTextures,
              int bindingCount)>('SDL_BindGPUFragmentStorageTextures');
  return sdlBindGpuFragmentStorageTexturesLookupFunction(
      renderPass, firstSlot, storageTextures, bindingCount);
}

///
/// Binds storage buffers for use on the fragment shader.
///
/// These buffers must have been created with
/// SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ_BIT.
///
/// \param renderPass a render pass handle.
/// \param firstSlot the fragment storage buffer slot to begin binding from.
/// \param storageBuffers an array of storage buffers.
/// \param bindingCount the number of storage buffers to bind from the array.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_BindGPUFragmentStorageBuffers( SDL_GPURenderPass *renderPass, Uint32 firstSlot, SDL_GPUBuffer **storageBuffers, Uint32 bindingCount)
/// ```
void sdlBindGpuFragmentStorageBuffers(
    Pointer<SdlGpuRenderPass> renderPass,
    int firstSlot,
    Pointer<Pointer<SdlGpuBuffer>> storageBuffers,
    int bindingCount) {
  final sdlBindGpuFragmentStorageBuffersLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlGpuRenderPass> renderPass, Uint32 firstSlot,
          Pointer<Pointer<SdlGpuBuffer>> storageBuffers, Uint32 bindingCount),
      void Function(
          Pointer<SdlGpuRenderPass> renderPass,
          int firstSlot,
          Pointer<Pointer<SdlGpuBuffer>> storageBuffers,
          int bindingCount)>('SDL_BindGPUFragmentStorageBuffers');
  return sdlBindGpuFragmentStorageBuffersLookupFunction(
      renderPass, firstSlot, storageBuffers, bindingCount);
}

///
/// Draws data using bound graphics state with an index buffer and instancing
/// enabled.
///
/// You must not call this function before binding a graphics pipeline.
///
/// Note that the `firstVertex` and `firstInstance` parameters are NOT
/// compatible with built-in vertex/instance ID variables in shaders (for
/// example, SV_VertexID). If your shader depends on these variables, the
/// correlating draw call parameter MUST be 0.
///
/// \param renderPass a render pass handle.
/// \param indexCount the number of vertices to draw per instance.
/// \param instanceCount the number of instances to draw.
/// \param firstIndex the starting index within the index buffer.
/// \param vertexOffset value added to vertex index before indexing into the
/// vertex buffer.
/// \param firstInstance the ID of the first instance to draw.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_DrawGPUIndexedPrimitives( SDL_GPURenderPass *renderPass, Uint32 indexCount, Uint32 instanceCount, Uint32 firstIndex, Sint32 vertexOffset, Uint32 firstInstance)
/// ```
void sdlDrawGpuIndexedPrimitives(
    Pointer<SdlGpuRenderPass> renderPass,
    int indexCount,
    int instanceCount,
    int firstIndex,
    int vertexOffset,
    int firstInstance) {
  final sdlDrawGpuIndexedPrimitivesLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Pointer<SdlGpuRenderPass> renderPass,
          Uint32 indexCount,
          Uint32 instanceCount,
          Uint32 firstIndex,
          Int32 vertexOffset,
          Uint32 firstInstance),
      void Function(
          Pointer<SdlGpuRenderPass> renderPass,
          int indexCount,
          int instanceCount,
          int firstIndex,
          int vertexOffset,
          int firstInstance)>('SDL_DrawGPUIndexedPrimitives');
  return sdlDrawGpuIndexedPrimitivesLookupFunction(renderPass, indexCount,
      instanceCount, firstIndex, vertexOffset, firstInstance);
}

///
/// Draws data using bound graphics state.
///
/// You must not call this function before binding a graphics pipeline.
///
/// Note that the `firstVertex` and `firstInstance` parameters are NOT
/// compatible with built-in vertex/instance ID variables in shaders (for
/// example, SV_VertexID). If your shader depends on these variables, the
/// correlating draw call parameter MUST be 0.
///
/// \param renderPass a render pass handle.
/// \param vertexCount the number of vertices to draw.
/// \param instanceCount the number of instances that will be drawn.
/// \param firstVertex the index of the first vertex to draw.
/// \param firstInstance the ID of the first instance to draw.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_DrawGPUPrimitives( SDL_GPURenderPass *renderPass, Uint32 vertexCount, Uint32 instanceCount, Uint32 firstVertex, Uint32 firstInstance)
/// ```
void sdlDrawGpuPrimitives(Pointer<SdlGpuRenderPass> renderPass, int vertexCount,
    int instanceCount, int firstVertex, int firstInstance) {
  final sdlDrawGpuPrimitivesLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlGpuRenderPass> renderPass, Uint32 vertexCount,
          Uint32 instanceCount, Uint32 firstVertex, Uint32 firstInstance),
      void Function(
          Pointer<SdlGpuRenderPass> renderPass,
          int vertexCount,
          int instanceCount,
          int firstVertex,
          int firstInstance)>('SDL_DrawGPUPrimitives');
  return sdlDrawGpuPrimitivesLookupFunction(
      renderPass, vertexCount, instanceCount, firstVertex, firstInstance);
}

///
/// Draws data using bound graphics state and with draw parameters set from a
/// buffer.
///
/// The buffer layout should match the layout of SDL_GPUIndirectDrawCommand.
/// You must not call this function before binding a graphics pipeline.
///
/// \param renderPass a render pass handle.
/// \param buffer a buffer containing draw parameters.
/// \param offsetInBytes the offset to start reading from the draw buffer.
/// \param drawCount the number of draw parameter sets that should be read from
/// the draw buffer.
/// \param stride the byte stride between sets of draw parameters.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_DrawGPUPrimitivesIndirect( SDL_GPURenderPass *renderPass, SDL_GPUBuffer *buffer, Uint32 offsetInBytes, Uint32 drawCount, Uint32 stride)
/// ```
void sdlDrawGpuPrimitivesIndirect(
    Pointer<SdlGpuRenderPass> renderPass,
    Pointer<SdlGpuBuffer> buffer,
    int offsetInBytes,
    int drawCount,
    int stride) {
  final sdlDrawGpuPrimitivesIndirectLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Pointer<SdlGpuRenderPass> renderPass,
          Pointer<SdlGpuBuffer> buffer,
          Uint32 offsetInBytes,
          Uint32 drawCount,
          Uint32 stride),
      void Function(
          Pointer<SdlGpuRenderPass> renderPass,
          Pointer<SdlGpuBuffer> buffer,
          int offsetInBytes,
          int drawCount,
          int stride)>('SDL_DrawGPUPrimitivesIndirect');
  return sdlDrawGpuPrimitivesIndirectLookupFunction(
      renderPass, buffer, offsetInBytes, drawCount, stride);
}

///
/// Draws data using bound graphics state with an index buffer enabled and with
/// draw parameters set from a buffer.
///
/// The buffer layout should match the layout of
/// SDL_GPUIndexedIndirectDrawCommand. You must not call this function before
/// binding a graphics pipeline.
///
/// \param renderPass a render pass handle.
/// \param buffer a buffer containing draw parameters.
/// \param offsetInBytes the offset to start reading from the draw buffer.
/// \param drawCount the number of draw parameter sets that should be read from
/// the draw buffer.
/// \param stride the byte stride between sets of draw parameters.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_DrawGPUIndexedPrimitivesIndirect( SDL_GPURenderPass *renderPass, SDL_GPUBuffer *buffer, Uint32 offsetInBytes, Uint32 drawCount, Uint32 stride)
/// ```
void sdlDrawGpuIndexedPrimitivesIndirect(
    Pointer<SdlGpuRenderPass> renderPass,
    Pointer<SdlGpuBuffer> buffer,
    int offsetInBytes,
    int drawCount,
    int stride) {
  final sdlDrawGpuIndexedPrimitivesIndirectLookupFunction =
      libSdl3.lookupFunction<
          Void Function(
              Pointer<SdlGpuRenderPass> renderPass,
              Pointer<SdlGpuBuffer> buffer,
              Uint32 offsetInBytes,
              Uint32 drawCount,
              Uint32 stride),
          void Function(
              Pointer<SdlGpuRenderPass> renderPass,
              Pointer<SdlGpuBuffer> buffer,
              int offsetInBytes,
              int drawCount,
              int stride)>('SDL_DrawGPUIndexedPrimitivesIndirect');
  return sdlDrawGpuIndexedPrimitivesIndirectLookupFunction(
      renderPass, buffer, offsetInBytes, drawCount, stride);
}

///
/// Ends the given render pass.
///
/// All bound graphics state on the render pass command buffer is unset. The
/// render pass handle is now invalid.
///
/// \param renderPass a render pass handle.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_EndGPURenderPass( SDL_GPURenderPass *renderPass)
/// ```
void sdlEndGpuRenderPass(Pointer<SdlGpuRenderPass> renderPass) {
  final sdlEndGpuRenderPassLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlGpuRenderPass> renderPass),
      void Function(
          Pointer<SdlGpuRenderPass> renderPass)>('SDL_EndGPURenderPass');
  return sdlEndGpuRenderPassLookupFunction(renderPass);
}

///
/// Begins a compute pass on a command buffer.
///
/// A compute pass is defined by a set of texture subresources and buffers that
/// will be written to by compute pipelines. These textures and buffers must
/// have been created with the COMPUTE_STORAGE_WRITE bit. All operations
/// related to compute pipelines must take place inside of a compute pass. You
/// must not begin another compute pass, or a render pass or copy pass before
/// ending the compute pass.
///
/// A VERY IMPORTANT NOTE Textures and buffers bound as write-only MUST NOT be
/// read from during the compute pass. Doing so will result in undefined
/// behavior. If your compute work requires reading the output from a previous
/// dispatch, you MUST end the current compute pass and begin a new one before
/// you can safely access the data.
///
/// \param commandBuffer a command buffer.
/// \param storageTextureBindings an array of writeable storage texture binding
/// structs.
/// \param storageTextureBindingCount the number of storage textures to bind
/// from the array.
/// \param storageBufferBindings an array of writeable storage buffer binding
/// structs.
/// \param storageBufferBindingCount the number of storage buffers to bind from
/// the array.
/// \returns a compute pass handle.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_EndGPUComputePass
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUComputePass *SDLCALL SDL_BeginGPUComputePass( SDL_GPUCommandBuffer *commandBuffer, SDL_GPUStorageTextureWriteOnlyBinding *storageTextureBindings, Uint32 storageTextureBindingCount, SDL_GPUStorageBufferWriteOnlyBinding *storageBufferBindings, Uint32 storageBufferBindingCount)
/// ```
Pointer<SdlGpuComputePass> sdlBeginGpuComputePass(
    Pointer<SdlGpuCommandBuffer> commandBuffer,
    Pointer<SdlGpuStorageTextureWriteOnlyBinding> storageTextureBindings,
    int storageTextureBindingCount,
    Pointer<SdlGpuStorageBufferWriteOnlyBinding> storageBufferBindings,
    int storageBufferBindingCount) {
  final sdlBeginGpuComputePassLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlGpuComputePass> Function(
          Pointer<SdlGpuCommandBuffer> commandBuffer,
          Pointer<SdlGpuStorageTextureWriteOnlyBinding> storageTextureBindings,
          Uint32 storageTextureBindingCount,
          Pointer<SdlGpuStorageBufferWriteOnlyBinding> storageBufferBindings,
          Uint32 storageBufferBindingCount),
      Pointer<SdlGpuComputePass> Function(
          Pointer<SdlGpuCommandBuffer> commandBuffer,
          Pointer<SdlGpuStorageTextureWriteOnlyBinding> storageTextureBindings,
          int storageTextureBindingCount,
          Pointer<SdlGpuStorageBufferWriteOnlyBinding> storageBufferBindings,
          int storageBufferBindingCount)>('SDL_BeginGPUComputePass');
  return sdlBeginGpuComputePassLookupFunction(
      commandBuffer,
      storageTextureBindings,
      storageTextureBindingCount,
      storageBufferBindings,
      storageBufferBindingCount);
}

///
/// Binds a compute pipeline on a command buffer for use in compute dispatch.
///
/// \param computePass a compute pass handle.
/// \param computePipeline a compute pipeline to bind.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_BindGPUComputePipeline( SDL_GPUComputePass *computePass, SDL_GPUComputePipeline *computePipeline)
/// ```
void sdlBindGpuComputePipeline(Pointer<SdlGpuComputePass> computePass,
    Pointer<SdlGpuComputePipeline> computePipeline) {
  final sdlBindGpuComputePipelineLookupFunction = libSdl3.lookupFunction<
          Void Function(Pointer<SdlGpuComputePass> computePass,
              Pointer<SdlGpuComputePipeline> computePipeline),
          void Function(Pointer<SdlGpuComputePass> computePass,
              Pointer<SdlGpuComputePipeline> computePipeline)>(
      'SDL_BindGPUComputePipeline');
  return sdlBindGpuComputePipelineLookupFunction(computePass, computePipeline);
}

///
/// Binds storage textures as readonly for use on the compute pipeline.
///
/// These textures must have been created with
/// SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ_BIT.
///
/// \param computePass a compute pass handle.
/// \param firstSlot the compute storage texture slot to begin binding from.
/// \param storageTextures an array of storage textures.
/// \param bindingCount the number of storage textures to bind from the array.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_BindGPUComputeStorageTextures( SDL_GPUComputePass *computePass, Uint32 firstSlot, SDL_GPUTexture **storageTextures, Uint32 bindingCount)
/// ```
void sdlBindGpuComputeStorageTextures(
    Pointer<SdlGpuComputePass> computePass,
    int firstSlot,
    Pointer<Pointer<SdlGpuTexture>> storageTextures,
    int bindingCount) {
  final sdlBindGpuComputeStorageTexturesLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlGpuComputePass> computePass, Uint32 firstSlot,
          Pointer<Pointer<SdlGpuTexture>> storageTextures, Uint32 bindingCount),
      void Function(
          Pointer<SdlGpuComputePass> computePass,
          int firstSlot,
          Pointer<Pointer<SdlGpuTexture>> storageTextures,
          int bindingCount)>('SDL_BindGPUComputeStorageTextures');
  return sdlBindGpuComputeStorageTexturesLookupFunction(
      computePass, firstSlot, storageTextures, bindingCount);
}

///
/// Binds storage buffers as readonly for use on the compute pipeline.
///
/// These buffers must have been created with
/// SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ_BIT.
///
/// \param computePass a compute pass handle.
/// \param firstSlot the compute storage buffer slot to begin binding from.
/// \param storageBuffers an array of storage buffer binding structs.
/// \param bindingCount the number of storage buffers to bind from the array.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_BindGPUComputeStorageBuffers( SDL_GPUComputePass *computePass, Uint32 firstSlot, SDL_GPUBuffer **storageBuffers, Uint32 bindingCount)
/// ```
void sdlBindGpuComputeStorageBuffers(
    Pointer<SdlGpuComputePass> computePass,
    int firstSlot,
    Pointer<Pointer<SdlGpuBuffer>> storageBuffers,
    int bindingCount) {
  final sdlBindGpuComputeStorageBuffersLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlGpuComputePass> computePass, Uint32 firstSlot,
          Pointer<Pointer<SdlGpuBuffer>> storageBuffers, Uint32 bindingCount),
      void Function(
          Pointer<SdlGpuComputePass> computePass,
          int firstSlot,
          Pointer<Pointer<SdlGpuBuffer>> storageBuffers,
          int bindingCount)>('SDL_BindGPUComputeStorageBuffers');
  return sdlBindGpuComputeStorageBuffersLookupFunction(
      computePass, firstSlot, storageBuffers, bindingCount);
}

///
/// Dispatches compute work.
///
/// You must not call this function before binding a compute pipeline.
///
/// A VERY IMPORTANT NOTE If you dispatch multiple times in a compute pass, and
/// the dispatches write to the same resource region as each other, there is no
/// guarantee of which order the writes will occur. If the write order matters,
/// you MUST end the compute pass and begin another one.
///
/// \param computePass a compute pass handle.
/// \param groupCountX number of local workgroups to dispatch in the X
/// dimension.
/// \param groupCountY number of local workgroups to dispatch in the Y
/// dimension.
/// \param groupCountZ number of local workgroups to dispatch in the Z
/// dimension.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_DispatchGPUCompute( SDL_GPUComputePass *computePass, Uint32 groupCountX, Uint32 groupCountY, Uint32 groupCountZ)
/// ```
void sdlDispatchGpuCompute(Pointer<SdlGpuComputePass> computePass,
    int groupCountX, int groupCountY, int groupCountZ) {
  final sdlDispatchGpuComputeLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlGpuComputePass> computePass, Uint32 groupCountX,
          Uint32 groupCountY, Uint32 groupCountZ),
      void Function(Pointer<SdlGpuComputePass> computePass, int groupCountX,
          int groupCountY, int groupCountZ)>('SDL_DispatchGPUCompute');
  return sdlDispatchGpuComputeLookupFunction(
      computePass, groupCountX, groupCountY, groupCountZ);
}

///
/// Dispatches compute work with parameters set from a buffer.
///
/// The buffer layout should match the layout of
/// SDL_GPUIndirectDispatchCommand. You must not call this function before
/// binding a compute pipeline.
///
/// A VERY IMPORTANT NOTE If you dispatch multiple times in a compute pass, and
/// the dispatches write to the same resource region as each other, there is no
/// guarantee of which order the writes will occur. If the write order matters,
/// you MUST end the compute pass and begin another one.
///
/// \param computePass a compute pass handle.
/// \param buffer a buffer containing dispatch parameters.
/// \param offsetInBytes the offset to start reading from the dispatch buffer.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_DispatchGPUComputeIndirect( SDL_GPUComputePass *computePass, SDL_GPUBuffer *buffer, Uint32 offsetInBytes)
/// ```
void sdlDispatchGpuComputeIndirect(Pointer<SdlGpuComputePass> computePass,
    Pointer<SdlGpuBuffer> buffer, int offsetInBytes) {
  final sdlDispatchGpuComputeIndirectLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlGpuComputePass> computePass,
          Pointer<SdlGpuBuffer> buffer, Uint32 offsetInBytes),
      void Function(
          Pointer<SdlGpuComputePass> computePass,
          Pointer<SdlGpuBuffer> buffer,
          int offsetInBytes)>('SDL_DispatchGPUComputeIndirect');
  return sdlDispatchGpuComputeIndirectLookupFunction(
      computePass, buffer, offsetInBytes);
}

///
/// Ends the current compute pass.
///
/// All bound compute state on the command buffer is unset. The compute pass
/// handle is now invalid.
///
/// \param computePass a compute pass handle.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_EndGPUComputePass( SDL_GPUComputePass *computePass)
/// ```
void sdlEndGpuComputePass(Pointer<SdlGpuComputePass> computePass) {
  final sdlEndGpuComputePassLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlGpuComputePass> computePass),
      void Function(
          Pointer<SdlGpuComputePass> computePass)>('SDL_EndGPUComputePass');
  return sdlEndGpuComputePassLookupFunction(computePass);
}

///
/// Maps a transfer buffer into application address space.
///
/// You must unmap the transfer buffer before encoding upload commands.
///
/// \param device a GPU context.
/// \param transferBuffer a transfer buffer.
/// \param cycle if SDL_TRUE, cycles the transfer buffer if it is bound.
/// \returns the address of the mapped transfer buffer memory.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void *SDLCALL SDL_MapGPUTransferBuffer( SDL_GPUDevice *device, SDL_GPUTransferBuffer *transferBuffer, SDL_bool cycle)
/// ```
Pointer<NativeType> sdlMapGpuTransferBuffer(Pointer<SdlGpuDevice> device,
    Pointer<SdlGpuTransferBuffer> transferBuffer, bool cycle) {
  final sdlMapGpuTransferBufferLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(Pointer<SdlGpuDevice> device,
          Pointer<SdlGpuTransferBuffer> transferBuffer, Uint8 cycle),
      Pointer<NativeType> Function(
          Pointer<SdlGpuDevice> device,
          Pointer<SdlGpuTransferBuffer> transferBuffer,
          int cycle)>('SDL_MapGPUTransferBuffer');
  return sdlMapGpuTransferBufferLookupFunction(
      device, transferBuffer, cycle ? 1 : 0);
}

///
/// Unmaps a previously mapped transfer buffer.
///
/// \param device a GPU context.
/// \param transferBuffer a previously mapped transfer buffer.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_UnmapGPUTransferBuffer( SDL_GPUDevice *device, SDL_GPUTransferBuffer *transferBuffer)
/// ```
void sdlUnmapGpuTransferBuffer(Pointer<SdlGpuDevice> device,
    Pointer<SdlGpuTransferBuffer> transferBuffer) {
  final sdlUnmapGpuTransferBufferLookupFunction = libSdl3.lookupFunction<
          Void Function(Pointer<SdlGpuDevice> device,
              Pointer<SdlGpuTransferBuffer> transferBuffer),
          void Function(Pointer<SdlGpuDevice> device,
              Pointer<SdlGpuTransferBuffer> transferBuffer)>(
      'SDL_UnmapGPUTransferBuffer');
  return sdlUnmapGpuTransferBufferLookupFunction(device, transferBuffer);
}

///
/// Begins a copy pass on a command buffer.
///
/// All operations related to copying to or from buffers or textures take place
/// inside a copy pass. You must not begin another copy pass, or a render pass
/// or compute pass before ending the copy pass.
///
/// \param commandBuffer a command buffer.
/// \returns a copy pass handle.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUCopyPass *SDLCALL SDL_BeginGPUCopyPass( SDL_GPUCommandBuffer *commandBuffer)
/// ```
Pointer<SdlGpuCopyPass> sdlBeginGpuCopyPass(
    Pointer<SdlGpuCommandBuffer> commandBuffer) {
  final sdlBeginGpuCopyPassLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlGpuCopyPass> Function(
          Pointer<SdlGpuCommandBuffer> commandBuffer),
      Pointer<SdlGpuCopyPass> Function(
          Pointer<SdlGpuCommandBuffer> commandBuffer)>('SDL_BeginGPUCopyPass');
  return sdlBeginGpuCopyPassLookupFunction(commandBuffer);
}

///
/// Uploads data from a transfer buffer to a texture.
///
/// The upload occurs on the GPU timeline. You may assume that the upload has
/// finished in subsequent commands.
///
/// You must align the data in the transfer buffer to a multiple of the texel
/// size of the texture format.
///
/// \param copyPass a copy pass handle.
/// \param source the source transfer buffer with image layout information.
/// \param destination the destination texture region.
/// \param cycle if SDL_TRUE, cycles the texture if the texture is bound,
/// otherwise overwrites the data.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_UploadToGPUTexture( SDL_GPUCopyPass *copyPass, SDL_GPUTextureTransferInfo *source, SDL_GPUTextureRegion *destination, SDL_bool cycle)
/// ```
void sdlUploadToGpuTexture(
    Pointer<SdlGpuCopyPass> copyPass,
    Pointer<SdlGpuTextureTransferInfo> source,
    Pointer<SdlGpuTextureRegion> destination,
    bool cycle) {
  final sdlUploadToGpuTextureLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Pointer<SdlGpuCopyPass> copyPass,
          Pointer<SdlGpuTextureTransferInfo> source,
          Pointer<SdlGpuTextureRegion> destination,
          Uint8 cycle),
      void Function(
          Pointer<SdlGpuCopyPass> copyPass,
          Pointer<SdlGpuTextureTransferInfo> source,
          Pointer<SdlGpuTextureRegion> destination,
          int cycle)>('SDL_UploadToGPUTexture');
  return sdlUploadToGpuTextureLookupFunction(
      copyPass, source, destination, cycle ? 1 : 0);
}

///
/// Uploads data from a transfer buffer to a buffer.
///
/// The upload occurs on the GPU timeline. You may assume that the upload has
/// finished in subsequent commands.
///
/// \param copyPass a copy pass handle.
/// \param source the source transfer buffer with offset.
/// \param destination the destination buffer with offset and size.
/// \param cycle if SDL_TRUE, cycles the buffer if it is bound, otherwise
/// overwrites the data.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_UploadToGPUBuffer( SDL_GPUCopyPass *copyPass, SDL_GPUTransferBufferLocation *source, SDL_GPUBufferRegion *destination, SDL_bool cycle)
/// ```
void sdlUploadToGpuBuffer(
    Pointer<SdlGpuCopyPass> copyPass,
    Pointer<SdlGpuTransferBufferLocation> source,
    Pointer<SdlGpuBufferRegion> destination,
    bool cycle) {
  final sdlUploadToGpuBufferLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Pointer<SdlGpuCopyPass> copyPass,
          Pointer<SdlGpuTransferBufferLocation> source,
          Pointer<SdlGpuBufferRegion> destination,
          Uint8 cycle),
      void Function(
          Pointer<SdlGpuCopyPass> copyPass,
          Pointer<SdlGpuTransferBufferLocation> source,
          Pointer<SdlGpuBufferRegion> destination,
          int cycle)>('SDL_UploadToGPUBuffer');
  return sdlUploadToGpuBufferLookupFunction(
      copyPass, source, destination, cycle ? 1 : 0);
}

///
/// Performs a texture-to-texture copy.
///
/// This copy occurs on the GPU timeline. You may assume the copy has finished
/// in subsequent commands.
///
/// \param copyPass a copy pass handle.
/// \param source a source texture region.
/// \param destination a destination texture region.
/// \param w the width of the region to copy.
/// \param h the height of the region to copy.
/// \param d the depth of the region to copy.
/// \param cycle if SDL_TRUE, cycles the destination texture if the destination
/// texture is bound, otherwise overwrites the data.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_CopyGPUTextureToTexture( SDL_GPUCopyPass *copyPass, SDL_GPUTextureLocation *source, SDL_GPUTextureLocation *destination, Uint32 w, Uint32 h, Uint32 d, SDL_bool cycle)
/// ```
void sdlCopyGpuTextureToTexture(
    Pointer<SdlGpuCopyPass> copyPass,
    Pointer<SdlGpuTextureLocation> source,
    Pointer<SdlGpuTextureLocation> destination,
    int w,
    int h,
    int d,
    bool cycle) {
  final sdlCopyGpuTextureToTextureLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Pointer<SdlGpuCopyPass> copyPass,
          Pointer<SdlGpuTextureLocation> source,
          Pointer<SdlGpuTextureLocation> destination,
          Uint32 w,
          Uint32 h,
          Uint32 d,
          Uint8 cycle),
      void Function(
          Pointer<SdlGpuCopyPass> copyPass,
          Pointer<SdlGpuTextureLocation> source,
          Pointer<SdlGpuTextureLocation> destination,
          int w,
          int h,
          int d,
          int cycle)>('SDL_CopyGPUTextureToTexture');
  return sdlCopyGpuTextureToTextureLookupFunction(
      copyPass, source, destination, w, h, d, cycle ? 1 : 0);
}

///
/// Performs a buffer-to-buffer copy.
///
/// This copy occurs on the GPU timeline. You may assume the copy has finished
/// in subsequent commands.
///
/// \param copyPass a copy pass handle.
/// \param source the buffer and offset to copy from.
/// \param destination the buffer and offset to copy to.
/// \param size the length of the buffer to copy.
/// \param cycle if SDL_TRUE, cycles the destination buffer if it is bound,
/// otherwise overwrites the data.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_CopyGPUBufferToBuffer( SDL_GPUCopyPass *copyPass, SDL_GPUBufferLocation *source, SDL_GPUBufferLocation *destination, Uint32 size, SDL_bool cycle)
/// ```
void sdlCopyGpuBufferToBuffer(
    Pointer<SdlGpuCopyPass> copyPass,
    Pointer<SdlGpuBufferLocation> source,
    Pointer<SdlGpuBufferLocation> destination,
    int size,
    bool cycle) {
  final sdlCopyGpuBufferToBufferLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Pointer<SdlGpuCopyPass> copyPass,
          Pointer<SdlGpuBufferLocation> source,
          Pointer<SdlGpuBufferLocation> destination,
          Uint32 size,
          Uint8 cycle),
      void Function(
          Pointer<SdlGpuCopyPass> copyPass,
          Pointer<SdlGpuBufferLocation> source,
          Pointer<SdlGpuBufferLocation> destination,
          int size,
          int cycle)>('SDL_CopyGPUBufferToBuffer');
  return sdlCopyGpuBufferToBufferLookupFunction(
      copyPass, source, destination, size, cycle ? 1 : 0);
}

///
/// Copies data from a texture to a transfer buffer on the GPU timeline.
///
/// This data is not guaranteed to be copied until the command buffer fence is
/// signaled.
///
/// \param copyPass a copy pass handle.
/// \param source the source texture region.
/// \param destination the destination transfer buffer with image layout
/// information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_DownloadFromGPUTexture( SDL_GPUCopyPass *copyPass, SDL_GPUTextureRegion *source, SDL_GPUTextureTransferInfo *destination)
/// ```
void sdlDownloadFromGpuTexture(
    Pointer<SdlGpuCopyPass> copyPass,
    Pointer<SdlGpuTextureRegion> source,
    Pointer<SdlGpuTextureTransferInfo> destination) {
  final sdlDownloadFromGpuTextureLookupFunction = libSdl3.lookupFunction<
          Void Function(
              Pointer<SdlGpuCopyPass> copyPass,
              Pointer<SdlGpuTextureRegion> source,
              Pointer<SdlGpuTextureTransferInfo> destination),
          void Function(
              Pointer<SdlGpuCopyPass> copyPass,
              Pointer<SdlGpuTextureRegion> source,
              Pointer<SdlGpuTextureTransferInfo> destination)>(
      'SDL_DownloadFromGPUTexture');
  return sdlDownloadFromGpuTextureLookupFunction(copyPass, source, destination);
}

///
/// Copies data from a buffer to a transfer buffer on the GPU timeline.
///
/// This data is not guaranteed to be copied until the command buffer fence is
/// signaled.
///
/// \param copyPass a copy pass handle.
/// \param source the source buffer with offset and size.
/// \param destination the destination transfer buffer with offset.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_DownloadFromGPUBuffer( SDL_GPUCopyPass *copyPass, SDL_GPUBufferRegion *source, SDL_GPUTransferBufferLocation *destination)
/// ```
void sdlDownloadFromGpuBuffer(
    Pointer<SdlGpuCopyPass> copyPass,
    Pointer<SdlGpuBufferRegion> source,
    Pointer<SdlGpuTransferBufferLocation> destination) {
  final sdlDownloadFromGpuBufferLookupFunction = libSdl3.lookupFunction<
          Void Function(
              Pointer<SdlGpuCopyPass> copyPass,
              Pointer<SdlGpuBufferRegion> source,
              Pointer<SdlGpuTransferBufferLocation> destination),
          void Function(
              Pointer<SdlGpuCopyPass> copyPass,
              Pointer<SdlGpuBufferRegion> source,
              Pointer<SdlGpuTransferBufferLocation> destination)>(
      'SDL_DownloadFromGPUBuffer');
  return sdlDownloadFromGpuBufferLookupFunction(copyPass, source, destination);
}

///
/// Ends the current copy pass.
///
/// \param copyPass a copy pass handle.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_EndGPUCopyPass( SDL_GPUCopyPass *copyPass)
/// ```
void sdlEndGpuCopyPass(Pointer<SdlGpuCopyPass> copyPass) {
  final sdlEndGpuCopyPassLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlGpuCopyPass> copyPass),
      void Function(Pointer<SdlGpuCopyPass> copyPass)>('SDL_EndGPUCopyPass');
  return sdlEndGpuCopyPassLookupFunction(copyPass);
}

///
/// Generates mipmaps for the given texture.
///
/// This function must not be called inside of any pass.
///
/// \param commandBuffer a commandBuffer.
/// \param texture a texture with more than 1 mip level.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_GenerateMipmapsForGPUTexture( SDL_GPUCommandBuffer *commandBuffer, SDL_GPUTexture *texture)
/// ```
void sdlGenerateMipmapsForGpuTexture(Pointer<SdlGpuCommandBuffer> commandBuffer,
    Pointer<SdlGpuTexture> texture) {
  final sdlGenerateMipmapsForGpuTextureLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlGpuCommandBuffer> commandBuffer,
          Pointer<SdlGpuTexture> texture),
      void Function(Pointer<SdlGpuCommandBuffer> commandBuffer,
          Pointer<SdlGpuTexture> texture)>('SDL_GenerateMipmapsForGPUTexture');
  return sdlGenerateMipmapsForGpuTextureLookupFunction(commandBuffer, texture);
}

///
/// Blits from a source texture region to a destination texture region.
///
/// This function must not be called inside of any pass.
///
/// \param commandBuffer a command buffer.
/// \param source the texture region to copy from.
/// \param destination the texture region to copy to.
/// \param flipMode the flip mode for the source texture region.
/// \param filterMode the filter mode that will be used when blitting.
/// \param cycle if SDL_TRUE, cycles the destination texture if the destination
/// texture is bound, otherwise overwrites the data.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_BlitGPUTexture( SDL_GPUCommandBuffer *commandBuffer, SDL_GPUBlitRegion *source, SDL_GPUBlitRegion *destination, SDL_FlipMode flipMode, SDL_GPUFilter filterMode, SDL_bool cycle)
/// ```
void sdlBlitGpuTexture(
    Pointer<SdlGpuCommandBuffer> commandBuffer,
    Pointer<SdlGpuBlitRegion> source,
    Pointer<SdlGpuBlitRegion> destination,
    int flipMode,
    int filterMode,
    bool cycle) {
  final sdlBlitGpuTextureLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Pointer<SdlGpuCommandBuffer> commandBuffer,
          Pointer<SdlGpuBlitRegion> source,
          Pointer<SdlGpuBlitRegion> destination,
          Int32 flipMode,
          Int32 filterMode,
          Uint8 cycle),
      void Function(
          Pointer<SdlGpuCommandBuffer> commandBuffer,
          Pointer<SdlGpuBlitRegion> source,
          Pointer<SdlGpuBlitRegion> destination,
          int flipMode,
          int filterMode,
          int cycle)>('SDL_BlitGPUTexture');
  return sdlBlitGpuTextureLookupFunction(
      commandBuffer, source, destination, flipMode, filterMode, cycle ? 1 : 0);
}

///
/// Determines whether a swapchain composition is supported by the window.
///
/// The window must be claimed before calling this function.
///
/// \param device a GPU context.
/// \param window an SDL_Window.
/// \param swapchainComposition the swapchain composition to check.
/// \returns SDL_TRUE if supported, SDL_FALSE if unsupported (or on error).
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_ClaimWindowForGPUDevice
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_WindowSupportsGPUSwapchainComposition( SDL_GPUDevice *device, SDL_Window *window, SDL_GPUSwapchainComposition swapchainComposition)
/// ```
bool sdlWindowSupportsGpuSwapchainComposition(Pointer<SdlGpuDevice> device,
    Pointer<SdlWindow> window, int swapchainComposition) {
  final sdlWindowSupportsGpuSwapchainCompositionLookupFunction =
      libSdl3.lookupFunction<
              Uint8 Function(Pointer<SdlGpuDevice> device,
                  Pointer<SdlWindow> window, Int32 swapchainComposition),
              int Function(Pointer<SdlGpuDevice> device,
                  Pointer<SdlWindow> window, int swapchainComposition)>(
          'SDL_WindowSupportsGPUSwapchainComposition');
  return sdlWindowSupportsGpuSwapchainCompositionLookupFunction(
          device, window, swapchainComposition) ==
      1;
}

///
/// Determines whether a presentation mode is supported by the window.
///
/// The window must be claimed before calling this function.
///
/// \param device a GPU context.
/// \param window an SDL_Window.
/// \param presentMode the presentation mode to check.
/// \returns SDL_TRUE if supported, SDL_FALSE if unsupported (or on error).
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_ClaimWindowForGPUDevice
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_WindowSupportsGPUPresentMode( SDL_GPUDevice *device, SDL_Window *window, SDL_GPUPresentMode presentMode)
/// ```
bool sdlWindowSupportsGpuPresentMode(
    Pointer<SdlGpuDevice> device, Pointer<SdlWindow> window, int presentMode) {
  final sdlWindowSupportsGpuPresentModeLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlGpuDevice> device, Pointer<SdlWindow> window,
          Int32 presentMode),
      int Function(Pointer<SdlGpuDevice> device, Pointer<SdlWindow> window,
          int presentMode)>('SDL_WindowSupportsGPUPresentMode');
  return sdlWindowSupportsGpuPresentModeLookupFunction(
          device, window, presentMode) ==
      1;
}

///
/// Claims a window, creating a swapchain structure for it.
///
/// This must be called before SDL_AcquireGPUSwapchainTexture is called using
/// the window.
///
/// The swapchain will be created with SDL_GPU_SWAPCHAINCOMPOSITION_SDR and
/// SDL_GPU_PRESENTMODE_VSYNC. If you want to have different swapchain
/// parameters, you must call SetSwapchainParameters after claiming the window.
///
/// \param device a GPU context.
/// \param window an SDL_Window.
/// \returns SDL_TRUE on success, otherwise SDL_FALSE.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_AcquireGPUSwapchainTexture
/// \sa SDL_ReleaseWindowFromGPUDevice
/// \sa SDL_WindowSupportsGPUPresentMode
/// \sa SDL_WindowSupportsGPUSwapchainComposition
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_ClaimWindowForGPUDevice( SDL_GPUDevice *device, SDL_Window *window)
/// ```
bool sdlClaimWindowForGpuDevice(
    Pointer<SdlGpuDevice> device, Pointer<SdlWindow> window) {
  final sdlClaimWindowForGpuDeviceLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlGpuDevice> device, Pointer<SdlWindow> window),
      int Function(Pointer<SdlGpuDevice> device,
          Pointer<SdlWindow> window)>('SDL_ClaimWindowForGPUDevice');
  return sdlClaimWindowForGpuDeviceLookupFunction(device, window) == 1;
}

///
/// Unclaims a window, destroying its swapchain structure.
///
/// \param device a GPU context.
/// \param window an SDL_Window that has been claimed.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_ClaimWindowForGPUDevice
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ReleaseWindowFromGPUDevice( SDL_GPUDevice *device, SDL_Window *window)
/// ```
void sdlReleaseWindowFromGpuDevice(
    Pointer<SdlGpuDevice> device, Pointer<SdlWindow> window) {
  final sdlReleaseWindowFromGpuDeviceLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlGpuDevice> device, Pointer<SdlWindow> window),
      void Function(Pointer<SdlGpuDevice> device,
          Pointer<SdlWindow> window)>('SDL_ReleaseWindowFromGPUDevice');
  return sdlReleaseWindowFromGpuDeviceLookupFunction(device, window);
}

///
/// Changes the swapchain parameters for the given claimed window.
///
/// This function will fail if the requested present mode or swapchain
/// composition are unsupported by the device. Check if the parameters are
/// supported via SDL_WindowSupportsGPUPresentMode /
/// SDL_WindowSupportsGPUSwapchainComposition prior to calling this function.
///
/// SDL_GPU_PRESENTMODE_VSYNC and SDL_GPU_SWAPCHAINCOMPOSITION_SDR are always
/// supported.
///
/// \param device a GPU context.
/// \param window an SDL_Window that has been claimed.
/// \param swapchainComposition the desired composition of the swapchain.
/// \param presentMode the desired present mode for the swapchain.
/// \returns SDL_TRUE if successful, SDL_FALSE on error.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_WindowSupportsGPUPresentMode
/// \sa SDL_WindowSupportsGPUSwapchainComposition
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_SetGPUSwapchainParameters( SDL_GPUDevice *device, SDL_Window *window, SDL_GPUSwapchainComposition swapchainComposition, SDL_GPUPresentMode presentMode)
/// ```
bool sdlSetGpuSwapchainParameters(Pointer<SdlGpuDevice> device,
    Pointer<SdlWindow> window, int swapchainComposition, int presentMode) {
  final sdlSetGpuSwapchainParametersLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlGpuDevice> device, Pointer<SdlWindow> window,
          Int32 swapchainComposition, Int32 presentMode),
      int Function(
          Pointer<SdlGpuDevice> device,
          Pointer<SdlWindow> window,
          int swapchainComposition,
          int presentMode)>('SDL_SetGPUSwapchainParameters');
  return sdlSetGpuSwapchainParametersLookupFunction(
          device, window, swapchainComposition, presentMode) ==
      1;
}

///
/// Obtains the texture format of the swapchain for the given window.
///
/// \param device a GPU context.
/// \param window an SDL_Window that has been claimed.
/// \returns the texture format of the swapchain.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUTextureFormat SDLCALL SDL_GetGPUSwapchainTextureFormat( SDL_GPUDevice *device, SDL_Window *window)
/// ```
int sdlGetGpuSwapchainTextureFormat(
    Pointer<SdlGpuDevice> device, Pointer<SdlWindow> window) {
  final sdlGetGpuSwapchainTextureFormatLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlGpuDevice> device, Pointer<SdlWindow> window),
      int Function(Pointer<SdlGpuDevice> device,
          Pointer<SdlWindow> window)>('SDL_GetGPUSwapchainTextureFormat');
  return sdlGetGpuSwapchainTextureFormatLookupFunction(device, window);
}

///
/// Acquire a texture to use in presentation.
///
/// When a swapchain texture is acquired on a command buffer, it will
/// automatically be submitted for presentation when the command buffer is
/// submitted. The swapchain texture should only be referenced by the command
/// buffer used to acquire it. May return NULL under certain conditions. This
/// is not necessarily an error. This texture is managed by the implementation
/// and must not be freed by the user. You MUST NOT call this function from any
/// thread other than the one that created the window.
///
/// \param commandBuffer a command buffer.
/// \param window a window that has been claimed.
/// \param pWidth a pointer filled in with the swapchain width.
/// \param pHeight a pointer filled in with the swapchain height.
/// \returns a swapchain texture.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_ClaimWindowForGPUDevice
/// \sa SDL_SubmitGPUCommandBuffer
/// \sa SDL_SubmitGPUCommandBufferAndAcquireFence
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUTexture *SDLCALL SDL_AcquireGPUSwapchainTexture( SDL_GPUCommandBuffer *commandBuffer, SDL_Window *window, Uint32 *pWidth, Uint32 *pHeight)
/// ```
Pointer<SdlGpuTexture> sdlAcquireGpuSwapchainTexture(
    Pointer<SdlGpuCommandBuffer> commandBuffer,
    Pointer<SdlWindow> window,
    Pointer<Uint32> pWidth,
    Pointer<Uint32> pHeight) {
  final sdlAcquireGpuSwapchainTextureLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlGpuTexture> Function(
          Pointer<SdlGpuCommandBuffer> commandBuffer,
          Pointer<SdlWindow> window,
          Pointer<Uint32> pWidth,
          Pointer<Uint32> pHeight),
      Pointer<SdlGpuTexture> Function(
          Pointer<SdlGpuCommandBuffer> commandBuffer,
          Pointer<SdlWindow> window,
          Pointer<Uint32> pWidth,
          Pointer<Uint32> pHeight)>('SDL_AcquireGPUSwapchainTexture');
  return sdlAcquireGpuSwapchainTextureLookupFunction(
      commandBuffer, window, pWidth, pHeight);
}

///
/// Submits a command buffer so its commands can be processed on the GPU.
///
/// It is invalid to use the command buffer after this is called.
///
/// This must be called from the thread the command buffer was acquired on.
///
/// All commands in the submission are guaranteed to begin executing before any
/// command in a subsequent submission begins executing.
///
/// \param commandBuffer a command buffer.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_AcquireGPUCommandBuffer
/// \sa SDL_AcquireGPUSwapchainTexture
/// \sa SDL_SubmitGPUCommandBufferAndAcquireFence
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_SubmitGPUCommandBuffer( SDL_GPUCommandBuffer *commandBuffer)
/// ```
void sdlSubmitGpuCommandBuffer(Pointer<SdlGpuCommandBuffer> commandBuffer) {
  final sdlSubmitGpuCommandBufferLookupFunction = libSdl3.lookupFunction<
          Void Function(Pointer<SdlGpuCommandBuffer> commandBuffer),
          void Function(Pointer<SdlGpuCommandBuffer> commandBuffer)>(
      'SDL_SubmitGPUCommandBuffer');
  return sdlSubmitGpuCommandBufferLookupFunction(commandBuffer);
}

///
/// Submits a command buffer so its commands can be processed on the GPU, and
/// acquires a fence associated with the command buffer.
///
/// You must release this fence when it is no longer needed or it will cause a
/// leak. It is invalid to use the command buffer after this is called.
///
/// This must be called from the thread the command buffer was acquired on.
///
/// All commands in the submission are guaranteed to begin executing before any
/// command in a subsequent submission begins executing.
///
/// \param commandBuffer a command buffer.
/// \returns a fence associated with the command buffer.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_AcquireGPUCommandBuffer
/// \sa SDL_AcquireGPUSwapchainTexture
/// \sa SDL_SubmitGPUCommandBuffer
/// \sa SDL_ReleaseGPUFence
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUFence *SDLCALL SDL_SubmitGPUCommandBufferAndAcquireFence( SDL_GPUCommandBuffer *commandBuffer)
/// ```
Pointer<SdlGpuFence> sdlSubmitGpuCommandBufferAndAcquireFence(
    Pointer<SdlGpuCommandBuffer> commandBuffer) {
  final sdlSubmitGpuCommandBufferAndAcquireFenceLookupFunction =
      libSdl3.lookupFunction<
              Pointer<SdlGpuFence> Function(
                  Pointer<SdlGpuCommandBuffer> commandBuffer),
              Pointer<SdlGpuFence> Function(
                  Pointer<SdlGpuCommandBuffer> commandBuffer)>(
          'SDL_SubmitGPUCommandBufferAndAcquireFence');
  return sdlSubmitGpuCommandBufferAndAcquireFenceLookupFunction(commandBuffer);
}

///
/// Blocks the thread until the GPU is completely idle.
///
/// \param device a GPU context.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_WaitForGPUFences
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_WaitForGPUIdle( SDL_GPUDevice *device)
/// ```
void sdlWaitForGpuIdle(Pointer<SdlGpuDevice> device) {
  final sdlWaitForGpuIdleLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlGpuDevice> device),
      void Function(Pointer<SdlGpuDevice> device)>('SDL_WaitForGPUIdle');
  return sdlWaitForGpuIdleLookupFunction(device);
}

///
/// Blocks the thread until the given fences are signaled.
///
/// \param device a GPU context.
/// \param waitAll if 0, wait for any fence to be signaled, if 1, wait for all
/// fences to be signaled.
/// \param pFences an array of fences to wait on.
/// \param fenceCount the number of fences in the pFences array.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SubmitGPUCommandBufferAndAcquireFence
/// \sa SDL_WaitForGPUIdle
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_WaitForGPUFences( SDL_GPUDevice *device, SDL_bool waitAll, SDL_GPUFence **pFences, Uint32 fenceCount)
/// ```
void sdlWaitForGpuFences(Pointer<SdlGpuDevice> device, bool waitAll,
    Pointer<Pointer<SdlGpuFence>> pFences, int fenceCount) {
  final sdlWaitForGpuFencesLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlGpuDevice> device, Uint8 waitAll,
          Pointer<Pointer<SdlGpuFence>> pFences, Uint32 fenceCount),
      void Function(
          Pointer<SdlGpuDevice> device,
          int waitAll,
          Pointer<Pointer<SdlGpuFence>> pFences,
          int fenceCount)>('SDL_WaitForGPUFences');
  return sdlWaitForGpuFencesLookupFunction(
      device, waitAll ? 1 : 0, pFences, fenceCount);
}

///
/// Checks the status of a fence.
///
/// \param device a GPU context.
/// \param fence a fence.
/// \returns SDL_TRUE if the fence is signaled, SDL_FALSE if it is not.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SubmitGPUCommandBufferAndAcquireFence
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_QueryGPUFence( SDL_GPUDevice *device, SDL_GPUFence *fence)
/// ```
bool sdlQueryGpuFence(
    Pointer<SdlGpuDevice> device, Pointer<SdlGpuFence> fence) {
  final sdlQueryGpuFenceLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlGpuDevice> device, Pointer<SdlGpuFence> fence),
      int Function(Pointer<SdlGpuDevice> device,
          Pointer<SdlGpuFence> fence)>('SDL_QueryGPUFence');
  return sdlQueryGpuFenceLookupFunction(device, fence) == 1;
}

///
/// Releases a fence obtained from SDL_SubmitGPUCommandBufferAndAcquireFence.
///
/// \param device a GPU context.
/// \param fence a fence.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SubmitGPUCommandBufferAndAcquireFence
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ReleaseGPUFence( SDL_GPUDevice *device, SDL_GPUFence *fence)
/// ```
void sdlReleaseGpuFence(
    Pointer<SdlGpuDevice> device, Pointer<SdlGpuFence> fence) {
  final sdlReleaseGpuFenceLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlGpuDevice> device, Pointer<SdlGpuFence> fence),
      void Function(Pointer<SdlGpuDevice> device,
          Pointer<SdlGpuFence> fence)>('SDL_ReleaseGPUFence');
  return sdlReleaseGpuFenceLookupFunction(device, fence);
}

///
/// Obtains the texel block size for a texture format.
///
/// \param textureFormat the texture format you want to know the texel size of.
/// \returns the texel block size of the texture format.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_UploadToGPUTexture
///
/// ```c
/// extern SDL_DECLSPEC Uint32 SDLCALL SDL_GPUTextureFormatTexelBlockSize( SDL_GPUTextureFormat textureFormat)
/// ```
int sdlGpuTextureFormatTexelBlockSize(int textureFormat) {
  final sdlGpuTextureFormatTexelBlockSizeLookupFunction =
      libSdl3.lookupFunction<
          Uint32 Function(Int32 textureFormat),
          int Function(
              int textureFormat)>('SDL_GPUTextureFormatTexelBlockSize');
  return sdlGpuTextureFormatTexelBlockSizeLookupFunction(textureFormat);
}

///
/// Determines whether a texture format is supported for a given type and
/// usage.
///
/// \param device a GPU context.
/// \param format the texture format to check.
/// \param type the type of texture (2D, 3D, Cube).
/// \param usage a bitmask of all usage scenarios to check.
/// \returns whether the texture format is supported for this type and usage.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_GPUTextureSupportsFormat( SDL_GPUDevice *device, SDL_GPUTextureFormat format, SDL_GPUTextureType type, SDL_GPUTextureUsageFlags usage)
/// ```
bool sdlGpuTextureSupportsFormat(
    Pointer<SdlGpuDevice> device, int format, int type, int usage) {
  final sdlGpuTextureSupportsFormatLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(
          Pointer<SdlGpuDevice> device, Int32 format, Int32 type, Uint32 usage),
      int Function(Pointer<SdlGpuDevice> device, int format, int type,
          int usage)>('SDL_GPUTextureSupportsFormat');
  return sdlGpuTextureSupportsFormatLookupFunction(
          device, format, type, usage) ==
      1;
}

///
/// Determines if a sample count for a texture format is supported.
///
/// \param device a GPU context.
/// \param format the texture format to check.
/// \param sampleCount the sample count to check.
/// \returns a hardware-specific version of min(preferred, possible).
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_GPUTextureSupportsSampleCount( SDL_GPUDevice *device, SDL_GPUTextureFormat format, SDL_GPUSampleCount sampleCount)
/// ```
bool sdlGpuTextureSupportsSampleCount(
    Pointer<SdlGpuDevice> device, int format, int sampleCount) {
  final sdlGpuTextureSupportsSampleCountLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(
          Pointer<SdlGpuDevice> device, Int32 format, Int32 sampleCount),
      int Function(Pointer<SdlGpuDevice> device, int format,
          int sampleCount)>('SDL_GPUTextureSupportsSampleCount');
  return sdlGpuTextureSupportsSampleCountLookupFunction(
          device, format, sampleCount) ==
      1;
}

///
/// Call this to suspend GPU operation on Xbox when you receive the
/// SDL_EVENT_DID_ENTER_BACKGROUND event.
///
/// Do NOT call any SDL_GPU functions after calling this function! This must
/// also be called before calling SDL_GDKSuspendComplete.
///
/// \param device a GPU context.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_AddEventWatch
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_GDKSuspendGPU(SDL_GPUDevice *device)
/// ```
void sdlGdkSuspendGpu(Pointer<SdlGpuDevice> device) {
  final sdlGdkSuspendGpuLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlGpuDevice> device),
      void Function(Pointer<SdlGpuDevice> device)>('SDL_GDKSuspendGPU');
  return sdlGdkSuspendGpuLookupFunction(device);
}

///
/// Call this to resume GPU operation on Xbox when you receive the
/// SDL_EVENT_WILL_ENTER_FOREGROUND event.
///
/// When resuming, this function MUST be called before calling any other
/// SDL_GPU functions.
///
/// \param device a GPU context.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_AddEventWatch
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_GDKResumeGPU(SDL_GPUDevice *device)
/// ```
void sdlGdkResumeGpu(Pointer<SdlGpuDevice> device) {
  final sdlGdkResumeGpuLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlGpuDevice> device),
      void Function(Pointer<SdlGpuDevice> device)>('SDL_GDKResumeGPU');
  return sdlGdkResumeGpuLookupFunction(device);
}
