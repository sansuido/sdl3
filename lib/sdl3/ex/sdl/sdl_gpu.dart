// ignore_for_file: avoid_positional_boolean_parameters, comment_references
part of '../../sdl.dart';

///
/// Creates a pipeline object to be used in a graphics workflow.
///
/// There are optional properties that can be provided through `props`. These
/// are the supported properties:
///
/// - `SDL_PROP_GPU_GRAPHICSPIPELINE_CREATE_NAME_STRING`: a name that can be
/// displayed in debugging tools.
///
/// \param device a GPU Context.
/// \param createinfo a struct describing the state of the graphics pipeline to
/// create.
/// \returns a graphics pipeline object on success, or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CreateGPUShader
/// \sa SDL_BindGPUGraphicsPipeline
/// \sa SDL_ReleaseGPUGraphicsPipeline
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUGraphicsPipeline * SDLCALL SDL_CreateGPUGraphicsPipeline( SDL_GPUDevice *device, const SDL_GPUGraphicsPipelineCreateInfo *createinfo)
/// ```
/// {@category gpu}
Pointer<SdlGpuGraphicsPipeline> sdlxCreateGpuGraphicsPipeline(
  Pointer<SdlGpuDevice> device,
  SdlxGpuGraphicsPipelineCreateInfo info,
) {
  Pointer<SdlGpuGraphicsPipeline> result;
  final pointer = info.calloc();
  result = sdlCreateGpuGraphicsPipeline(device, pointer);
  pointer.callocAllFree();
  return result;
}

///
/// Creates a shader to be used when creating a graphics pipeline.
///
/// Shader resource bindings must be authored to follow a particular order
/// depending on the shader format.
///
/// For SPIR-V shaders, use the following resource sets:
///
/// For vertex shaders:
///
/// - 0: Sampled textures, followed by storage textures, followed by storage
/// buffers
/// - 1: Uniform buffers
///
/// For fragment shaders:
///
/// - 2: Sampled textures, followed by storage textures, followed by storage
/// buffers
/// - 3: Uniform buffers
///
/// For DXBC and DXIL shaders, use the following register order:
///
/// For vertex shaders:
///
/// - (t[n], space0): Sampled textures, followed by storage textures, followed
/// by storage buffers
/// - (s[n], space0): Samplers with indices corresponding to the sampled
/// textures
/// - (b[n], space1): Uniform buffers
///
/// For pixel shaders:
///
/// - (t[n], space2): Sampled textures, followed by storage textures, followed
/// by storage buffers
/// - (s[n], space2): Samplers with indices corresponding to the sampled
/// textures
/// - (b[n], space3): Uniform buffers
///
/// For MSL/metallib, use the following order:
///
/// - [[texture]]: Sampled textures, followed by storage textures
/// - [[sampler]]: Samplers with indices corresponding to the sampled textures
/// - [[buffer]]: Uniform buffers, followed by storage buffers. Vertex buffer 0
/// is bound at [[buffer(14)]], vertex buffer 1 at [[buffer(15)]], and so on.
/// Rather than manually authoring vertex buffer indices, use the
/// [[stage_in]] attribute which will automatically use the vertex input
/// information from the SDL_GPUGraphicsPipeline.
///
/// Shader semantics other than system-value semantics do not matter in D3D12
/// and for ease of use the SDL implementation assumes that non system-value
/// semantics will all be TEXCOORD. If you are using HLSL as the shader source
/// language, your vertex semantics should start at TEXCOORD0 and increment
/// like so: TEXCOORD1, TEXCOORD2, etc. If you wish to change the semantic
/// prefix to something other than TEXCOORD you can use
/// SDL_PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING with
/// SDL_CreateGPUDeviceWithProperties().
///
/// There are optional properties that can be provided through `props`. These
/// are the supported properties:
///
/// - `SDL_PROP_GPU_SHADER_CREATE_NAME_STRING`: a name that can be displayed in
/// debugging tools.
///
/// \param device a GPU Context.
/// \param createinfo a struct describing the state of the shader to create.
/// \returns a shader object on success, or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CreateGPUGraphicsPipeline
/// \sa SDL_ReleaseGPUShader
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUShader * SDLCALL SDL_CreateGPUShader( SDL_GPUDevice *device, const SDL_GPUShaderCreateInfo *createinfo)
/// ```
/// {@category gpu}
Pointer<SdlGpuShader> sdlxCreateGpuShader(
  Pointer<SdlGpuDevice> device,
  SdlxGpuShaderCreateInfo createinfo,
) {
  Pointer<SdlGpuShader> result;
  final pointer = createinfo.calloc();
  result = sdlCreateGpuShader(device, pointer);
  pointer.callocAllFree();
  return result;
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
/// If you use a STORAGE flag, the data in the buffer must respect std140
/// layout conventions. In practical terms this means you must ensure that vec3
/// and vec4 fields are 16-byte aligned.
///
/// For better understanding of underlying concepts and memory management with
/// SDL GPU API, you may refer
/// [this blog post](https://moonside.games/posts/sdl-gpu-concepts-cycling/)
/// .
///
/// There are optional properties that can be provided through `props`. These
/// are the supported properties:
///
/// - `SDL_PROP_GPU_BUFFER_CREATE_NAME_STRING`: a name that can be displayed in
/// debugging tools.
///
/// \param device a GPU Context.
/// \param createinfo a struct describing the state of the buffer to create.
/// \returns a buffer object on success, or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_UploadToGPUBuffer
/// \sa SDL_DownloadFromGPUBuffer
/// \sa SDL_CopyGPUBufferToBuffer
/// \sa SDL_BindGPUVertexBuffers
/// \sa SDL_BindGPUIndexBuffer
/// \sa SDL_BindGPUVertexStorageBuffers
/// \sa SDL_BindGPUFragmentStorageBuffers
/// \sa SDL_DrawGPUPrimitivesIndirect
/// \sa SDL_DrawGPUIndexedPrimitivesIndirect
/// \sa SDL_BindGPUComputeStorageBuffers
/// \sa SDL_DispatchGPUComputeIndirect
/// \sa SDL_ReleaseGPUBuffer
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUBuffer * SDLCALL SDL_CreateGPUBuffer( SDL_GPUDevice *device, const SDL_GPUBufferCreateInfo *createinfo)
/// ```
/// {@category gpu}
Pointer<SdlGpuBuffer> sdlxCreateGpuBuffer(
  Pointer<SdlGpuDevice> device,
  SdlxGpuBufferCreateInfo createinfo,
) {
  Pointer<SdlGpuBuffer> result;
  final pointer = createinfo.calloc();
  result = sdlCreateGpuBuffer(device, pointer);
  pointer.callocFree();
  return result;
}

///
/// Creates a transfer buffer to be used when uploading to or downloading from
/// graphics resources.
///
/// Download buffers can be particularly expensive to create, so it is good
/// practice to reuse them if data will be downloaded regularly.
///
/// There are optional properties that can be provided through `props`. These
/// are the supported properties:
///
/// - `SDL_PROP_GPU_TRANSFERBUFFER_CREATE_NAME_STRING`: a name that can be
/// displayed in debugging tools.
///
/// \param device a GPU Context.
/// \param createinfo a struct describing the state of the transfer buffer to
/// create.
/// \returns a transfer buffer on success, or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_UploadToGPUBuffer
/// \sa SDL_DownloadFromGPUBuffer
/// \sa SDL_UploadToGPUTexture
/// \sa SDL_DownloadFromGPUTexture
/// \sa SDL_ReleaseGPUTransferBuffer
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUTransferBuffer * SDLCALL SDL_CreateGPUTransferBuffer( SDL_GPUDevice *device, const SDL_GPUTransferBufferCreateInfo *createinfo)
/// ```
/// {@category gpu}
Pointer<SdlGpuTransferBuffer> sdlxCreateGpuTransferBuffer(
  Pointer<SdlGpuDevice> device,
  SdlxGpuTransferBufferCreateInfo createinfo,
) {
  Pointer<SdlGpuTransferBuffer> result;
  final pointer = createinfo.calloc();
  result = sdlCreateGpuTransferBuffer(device, pointer);
  pointer.callocFree();
  return result;
}

Pointer<SdlGpuRenderPass> sdlxBeginGpuRenderPass(
  Pointer<SdlGpuCommandBuffer> commandBuffer,
  List<SdlxGpuColorTargetInfo> colorTargetInfo, {
  SdlxGpuDepthStencilTargetInfo? depthStencilTargetInfo,
}) {
  Pointer<SdlGpuRenderPass> result = nullptr;
  Pointer<SdlGpuDepthStencilTargetInfo> depthStencilTargetInfoPointer = nullptr;
  if (colorTargetInfo.isNotEmpty) {
    final infosPointer = colorTargetInfo.calloc();
    if (depthStencilTargetInfo != null) {
      depthStencilTargetInfoPointer = depthStencilTargetInfo.calloc();
    }
    result = sdlBeginGpuRenderPass(
      commandBuffer,
      infosPointer,
      colorTargetInfo.length,
      depthStencilTargetInfoPointer,
    );
    infosPointer.callocFree();
    if (depthStencilTargetInfoPointer != nullptr) {
      depthStencilTargetInfoPointer.callocFree();
    }
  }
  return result;
}

///
/// Sets the current viewport state on a command buffer.
///
/// \param render_pass a render pass handle.
/// \param viewport the viewport to set.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_SetGPUViewport( SDL_GPURenderPass *render_pass, const SDL_GPUViewport *viewport)
/// ```
/// {@category gpu}
void sdlxSetGpuViewport(
  Pointer<SdlGpuRenderPass> renderPass,
  SdlxGpuViewport viewport,
) {
  final pointer = viewport.calloc();
  sdlSetGpuViewport(renderPass, pointer);
  pointer.callocFree();
}

///
/// Sets the current scissor state on a command buffer.
///
/// \param render_pass a render pass handle.
/// \param scissor the scissor area to set.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_SetGPUScissor( SDL_GPURenderPass *render_pass, const SDL_Rect *scissor)
/// ```
/// {@category gpu}
void sdlxSetGpuScissor(Pointer<SdlGpuRenderPass> renderPass, SdlxRect scissor) {
  final pointer = scissor.calloc();
  sdlSetGpuScissor(renderPass, pointer);
  pointer.callocFree();
}

///
/// Binds vertex buffers on a command buffer for use with subsequent draw
/// calls.
///
/// \param render_pass a render pass handle.
/// \param first_slot the vertex buffer slot to begin binding from.
/// \param bindings an array of SDL_GPUBufferBinding structs containing vertex
/// buffers and offset values.
/// \param num_bindings the number of bindings in the bindings array.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_BindGPUVertexBuffers( SDL_GPURenderPass *render_pass, Uint32 first_slot, const SDL_GPUBufferBinding *bindings, Uint32 num_bindings)
/// ```
/// {@category gpu}
void sdlxBindGpuVertexBuffers(
  Pointer<SdlGpuRenderPass> renderPass, {
  required List<SdlxGpuBufferBinding> bindings,
  int firstSlot = 0,
}) {
  if (bindings.isNotEmpty) {
    final bindingsPointer = bindings.calloc();
    sdlBindGpuVertexBuffers(
      renderPass,
      firstSlot,
      bindingsPointer,
      bindings.length,
    );
    bindingsPointer.callocFree();
  }
}

///
/// Binds an index buffer on a command buffer for use with subsequent draw
/// calls.
///
/// \param render_pass a render pass handle.
/// \param binding a pointer to a struct containing an index buffer and offset.
/// \param index_element_size whether the index values in the buffer are 16- or
/// 32-bit.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_BindGPUIndexBuffer( SDL_GPURenderPass *render_pass, const SDL_GPUBufferBinding *binding, SDL_GPUIndexElementSize index_element_size)
/// ```
/// {@category gpu}
void sdlxBindGpuIndexBuffer(
  Pointer<SdlGpuRenderPass> renderPass, {
  required List<SdlxGpuBufferBinding> bindings,
}) {
  if (bindings.isNotEmpty) {
    final bindingsPointer = bindings.calloc();
    sdlBindGpuIndexBuffer(renderPass, bindingsPointer, bindings.length);
    bindingsPointer.callocFree();
  }
}

///
/// Binds texture-sampler pairs for use on the vertex shader.
///
/// The textures must have been created with SDL_GPU_TEXTUREUSAGE_SAMPLER.
///
/// Be sure your shader is set up according to the requirements documented in
/// SDL_CreateGPUShader().
///
/// \param render_pass a render pass handle.
/// \param first_slot the vertex sampler slot to begin binding from.
/// \param texture_sampler_bindings an array of texture-sampler binding
/// structs.
/// \param num_bindings the number of texture-sampler pairs to bind from the
/// array.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CreateGPUShader
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_BindGPUVertexSamplers( SDL_GPURenderPass *render_pass, Uint32 first_slot, const SDL_GPUTextureSamplerBinding *texture_sampler_bindings, Uint32 num_bindings)
/// ```
/// {@category gpu}
void sdlxBindGpuVertexSamplers(
  Pointer<SdlGpuRenderPass> renderPass, {
  required List<SdlxGpuTextureSamplerBinding> bindings,
  int firstSlot = 0,
}) {
  if (bindings.isNotEmpty) {
    final bindingsPointer = bindings.calloc();
    sdlBindGpuVertexSamplers(
      renderPass,
      firstSlot,
      bindingsPointer,
      bindings.length,
    );
    bindingsPointer.callocFree();
  }
}

///
/// Binds texture-sampler pairs for use on the fragment shader.
///
/// The textures must have been created with SDL_GPU_TEXTUREUSAGE_SAMPLER.
///
/// Be sure your shader is set up according to the requirements documented in
/// SDL_CreateGPUShader().
///
/// \param render_pass a render pass handle.
/// \param first_slot the fragment sampler slot to begin binding from.
/// \param texture_sampler_bindings an array of texture-sampler binding
/// structs.
/// \param num_bindings the number of texture-sampler pairs to bind from the
/// array.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CreateGPUShader
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_BindGPUFragmentSamplers( SDL_GPURenderPass *render_pass, Uint32 first_slot, const SDL_GPUTextureSamplerBinding *texture_sampler_bindings, Uint32 num_bindings)
/// ```
/// {@category gpu}
void sdlxBindGpuFragmentSamplers(
  Pointer<SdlGpuRenderPass> renderPass, {
  required List<SdlxGpuTextureSamplerBinding> bindings,
  int firstSlot = 0,
}) {
  if (bindings.isNotEmpty) {
    final bindingsPointer = bindings.calloc();
    sdlBindGpuFragmentSamplers(
      renderPass,
      firstSlot,
      bindingsPointer,
      bindings.length,
    );
    bindingsPointer.callocFree();
  }
}

///
/// Begins a compute pass on a command buffer.
///
/// A compute pass is defined by a set of texture subresources and buffers that
/// may be written to by compute pipelines. These textures and buffers must
/// have been created with the COMPUTE_STORAGE_WRITE bit or the
/// COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE bit. If you do not create a texture
/// with COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE, you must not read from the
/// texture in the compute pass. All operations related to compute pipelines
/// must take place inside of a compute pass. You must not begin another
/// compute pass, or a render pass or copy pass before ending the compute pass.
///
/// A VERY IMPORTANT NOTE - Reads and writes in compute passes are NOT
/// implicitly synchronized. This means you may cause data races by both
/// reading and writing a resource region in a compute pass, or by writing
/// multiple times to a resource region. If your compute work depends on
/// reading the completed output from a previous dispatch, you MUST end the
/// current compute pass and begin a new one before you can safely access the
/// data. Otherwise you will receive unexpected results. Reading and writing a
/// texture in the same compute pass is only supported by specific texture
/// formats. Make sure you check the format support!
///
/// \param command_buffer a command buffer.
/// \param storage_texture_bindings an array of writeable storage texture
/// binding structs.
/// \param num_storage_texture_bindings the number of storage textures to bind
/// from the array.
/// \param storage_buffer_bindings an array of writeable storage buffer binding
/// structs.
/// \param num_storage_buffer_bindings the number of storage buffers to bind
/// from the array.
/// \returns a compute pass handle.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_EndGPUComputePass
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUComputePass * SDLCALL SDL_BeginGPUComputePass( SDL_GPUCommandBuffer *command_buffer, const SDL_GPUStorageTextureReadWriteBinding *storage_texture_bindings, Uint32 num_storage_texture_bindings, const SDL_GPUStorageBufferReadWriteBinding *storage_buffer_bindings, Uint32 num_storage_buffer_bindings)
/// ```
/// {@category gpu}
Pointer<SdlGpuComputePass> sdlxBeginGpuComputePass(
  Pointer<SdlGpuCommandBuffer> commandBuffer, {
  List<SdlxGpuStorageTextureReadWriteBinding>? textures,
  List<SdlxGpuStorageBufferReadWriteBinding>? buffers,
}) {
  Pointer<SdlGpuComputePass> result = nullptr;
  if (textures != null || buffers != null) {
    Pointer<SdlGpuStorageTextureReadWriteBinding> texturesPointer = nullptr;
    var texturesLength = 0;
    Pointer<SdlGpuStorageBufferReadWriteBinding> buffersPointer = nullptr;
    var buffersLength = 0;
    if (textures != null) {
      texturesLength = textures.length;
      texturesPointer = textures.calloc();
    }
    if (buffers != null) {
      buffersLength = buffers.length;
      buffersPointer = buffers.calloc();
    }
    result = sdlBeginGpuComputePass(
      commandBuffer,
      texturesPointer,
      texturesLength,
      buffersPointer,
      buffersLength,
    );
    if (texturesPointer != nullptr) {
      texturesPointer.callocFree();
    }
    if (buffersPointer != nullptr) {
      buffersPointer.callocFree();
    }
  }
  return result;
}

///
/// Binds texture-sampler pairs for use on the compute shader.
///
/// The textures must have been created with SDL_GPU_TEXTUREUSAGE_SAMPLER.
///
/// Be sure your shader is set up according to the requirements documented in
/// SDL_CreateGPUComputePipeline().
///
/// \param compute_pass a compute pass handle.
/// \param first_slot the compute sampler slot to begin binding from.
/// \param texture_sampler_bindings an array of texture-sampler binding
/// structs.
/// \param num_bindings the number of texture-sampler bindings to bind from the
/// array.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CreateGPUComputePipeline
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_BindGPUComputeSamplers( SDL_GPUComputePass *compute_pass, Uint32 first_slot, const SDL_GPUTextureSamplerBinding *texture_sampler_bindings, Uint32 num_bindings)
/// ```
/// {@category gpu}
void sdlxBindGpuComputeSamplers(
  Pointer<SdlGpuComputePass> computePass, {
  required List<SdlxGpuTextureSamplerBinding> bindings,
  int firstSlot = 0,
}) {
  if (bindings.isNotEmpty) {
    final bindingsPointer = bindings.calloc();
    sdlBindGpuComputeSamplers(
      computePass,
      firstSlot,
      bindingsPointer,
      bindings.length,
    );
    bindingsPointer.callocFree();
  }
}

/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_UploadToGPUBuffer( SDL_GPUCopyPass *copy_pass, const SDL_GPUTransferBufferLocation *source, const SDL_GPUBufferRegion *destination, bool cycle)
/// ```
void sdlxUploadToGpuBuffer(
  Pointer<SdlGpuCopyPass> copyPass,
  SdlxGpuTransferBufferLocation source,
  SdlxGpuBufferRegion destination,
  bool cycle,
) {
  final sourcePointer = source.calloc();
  final destinationPointer = destination.calloc();
  sdlUploadToGpuBuffer(copyPass, sourcePointer, destinationPointer, cycle);
  sourcePointer.callocFree();
  destinationPointer.callocFree();
}
