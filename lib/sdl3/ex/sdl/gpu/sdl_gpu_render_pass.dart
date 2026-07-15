part of '../../../sdl.dart';

extension SdlGpuRenderPassPointerEx on Pointer<SdlGpuRenderPass> {
  ///
  /// Binds a graphics pipeline on a render pass to be used in rendering.
  ///
  /// A graphics pipeline must be bound before making any draw calls.
  ///
  /// \param render_pass a render pass handle.
  /// \param graphics_pipeline the graphics pipeline to bind.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_BindGPUGraphicsPipeline( SDL_GPURenderPass *render_pass, SDL_GPUGraphicsPipeline *graphics_pipeline)
  /// ```
  /// {@category gpu}
  void bindGraphicsPipeline(Pointer<SdlGpuGraphicsPipeline> graphicsPipeline) =>
      sdlBindGpuGraphicsPipeline(this, graphicsPipeline);

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
  void setViewport(SdlxGpuViewport viewport) =>
      sdlxSetGpuViewport(this, viewport);

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
  void setScissor(SdlxRect scissor) => sdlxSetGpuScissor(this, scissor);

  ///
  /// Sets the current blend constants on a command buffer.
  ///
  /// \param render_pass a render pass handle.
  /// \param blend_constants the blend constant color.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GPU_BLENDFACTOR_CONSTANT_COLOR
  /// \sa SDL_GPU_BLENDFACTOR_ONE_MINUS_CONSTANT_COLOR
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_SetGPUBlendConstants( SDL_GPURenderPass *render_pass, SDL_FColor blend_constants)
  /// ```
  /// {@category gpu}
  void setBlendConstants(SdlxFColor blendConstants) =>
      sdlxSetGpuBlendConstants(this, blendConstants);

  ///
  /// Sets the current stencil reference value on a command buffer.
  ///
  /// \param render_pass a render pass handle.
  /// \param reference the stencil reference value to set.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_SetGPUStencilReference( SDL_GPURenderPass *render_pass, Uint8 reference)
  /// ```
  /// {@category gpu}
  void setStencilReference(int reference) =>
      sdlSetGpuStencilReference(this, reference);

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
  void bindVertexBuffers(
    List<SdlxGpuBufferBinding> bindings, {
    int firstSlot = 0,
  }) => sdlxBindGpuVertexBuffers(this, bindings, firstSlot: firstSlot);

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
  void bindIndexBuffer(SdlxGpuBufferBinding binding, int indexElementSize) =>
      sdlxBindGpuIndexBuffer(this, binding, indexElementSize);

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
  void bindVertexSamplers(
    List<SdlxGpuTextureSamplerBinding> bindings, {
    int firstSlot = 0,
  }) => sdlxBindGpuVertexSamplers(this, bindings, firstSlot: firstSlot);

  ///
  /// Binds storage textures for use on the vertex shader.
  ///
  /// These textures must have been created with
  /// SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ.
  ///
  /// Be sure your shader is set up according to the requirements documented in
  /// SDL_CreateGPUShader().
  ///
  /// \param render_pass a render pass handle.
  /// \param first_slot the vertex storage texture slot to begin binding from.
  /// \param storage_textures an array of storage textures.
  /// \param num_bindings the number of storage texture to bind from the array.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_CreateGPUShader
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_BindGPUVertexStorageTextures( SDL_GPURenderPass *render_pass, Uint32 first_slot, SDL_GPUTexture *const *storage_textures, Uint32 num_bindings)
  /// ```
  /// {@category gpu}
  void bindVertexStorageTextures(
    List<Pointer<SdlGpuTexture>> storageTextures, {
    int firstSlot = 0,
  }) => sdlxBindGpuVertexStorageTextures(
    this,
    storageTextures,
    firstSlot: firstSlot,
  );

  ///
  /// Binds storage buffers for use on the vertex shader.
  ///
  /// These buffers must have been created with
  /// SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ.
  ///
  /// Be sure your shader is set up according to the requirements documented in
  /// SDL_CreateGPUShader().
  ///
  /// \param render_pass a render pass handle.
  /// \param first_slot the vertex storage buffer slot to begin binding from.
  /// \param storage_buffers an array of buffers.
  /// \param num_bindings the number of buffers to bind from the array.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_CreateGPUShader
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_BindGPUVertexStorageBuffers( SDL_GPURenderPass *render_pass, Uint32 first_slot, SDL_GPUBuffer *const *storage_buffers, Uint32 num_bindings)
  /// ```
  /// {@category gpu}
  void bindVertexStorageBuffers(
    List<Pointer<SdlGpuBuffer>> storageBuffers, {
    int firstSlot = 0,
  }) => sdlxBindGpuVertexStorageBuffers(
    this,
    storageBuffers,
    firstSlot: firstSlot,
  );

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
  void bindFragmentSamplers(
    List<SdlxGpuTextureSamplerBinding> bindings, {
    int firstSlot = 0,
  }) => sdlxBindGpuFragmentSamplers(this, bindings, firstSlot: firstSlot);

  ///
  /// Binds storage textures for use on the fragment shader.
  ///
  /// These textures must have been created with
  /// SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ.
  ///
  /// Be sure your shader is set up according to the requirements documented in
  /// SDL_CreateGPUShader().
  ///
  /// \param render_pass a render pass handle.
  /// \param first_slot the fragment storage texture slot to begin binding from.
  /// \param storage_textures an array of storage textures.
  /// \param num_bindings the number of storage textures to bind from the array.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_CreateGPUShader
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_BindGPUFragmentStorageTextures( SDL_GPURenderPass *render_pass, Uint32 first_slot, SDL_GPUTexture *const *storage_textures, Uint32 num_bindings)
  /// ```
  /// {@category gpu}
  void bindFragmentStorageTextures(
    List<Pointer<SdlGpuTexture>> storageTextures, {
    int firstSlot = 0,
  }) => sdlxBindGpuFragmentStorageTextures(
    this,
    storageTextures,
    firstSlot: firstSlot,
  );

  ///
  /// Binds storage buffers for use on the fragment shader.
  ///
  /// These buffers must have been created with
  /// SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ.
  ///
  /// Be sure your shader is set up according to the requirements documented in
  /// SDL_CreateGPUShader().
  ///
  /// \param render_pass a render pass handle.
  /// \param first_slot the fragment storage buffer slot to begin binding from.
  /// \param storage_buffers an array of storage buffers.
  /// \param num_bindings the number of storage buffers to bind from the array.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_CreateGPUShader
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_BindGPUFragmentStorageBuffers( SDL_GPURenderPass *render_pass, Uint32 first_slot, SDL_GPUBuffer *const *storage_buffers, Uint32 num_bindings)
  /// ```
  /// {@category gpu}
  void bindFragmentStorageBuffers(
    List<Pointer<SdlGpuBuffer>> storageBuffers, {
    int firstSlot = 0,
  }) => sdlxBindGpuFragmentStorageBuffers(
    this,
    storageBuffers,
    firstSlot: firstSlot,
  );

  ///
  /// Draws data using bound graphics state with an index buffer and instancing
  /// enabled.
  ///
  /// You must not call this function before binding a graphics pipeline.
  ///
  /// Note that the `first_vertex` and `first_instance` parameters are NOT
  /// compatible with built-in vertex/instance ID variables in shaders (for
  /// example, SV_VertexID); GPU APIs and shader languages do not define these
  /// built-in variables consistently, so if your shader depends on them, the
  /// only way to keep behavior consistent and portable is to always pass 0 for
  /// the correlating parameter in the draw calls.
  ///
  /// \param render_pass a render pass handle.
  /// \param num_indices the number of indices to draw per instance.
  /// \param num_instances the number of instances to draw.
  /// \param first_index the starting index within the index buffer.
  /// \param vertex_offset value added to vertex index before indexing into the
  /// vertex buffer.
  /// \param first_instance the ID of the first instance to draw.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_DrawGPUIndexedPrimitives( SDL_GPURenderPass *render_pass, Uint32 num_indices, Uint32 num_instances, Uint32 first_index, Sint32 vertex_offset, Uint32 first_instance)
  /// ```
  /// {@category gpu}
  void drawIndexedPrimitives(
    int numIndices,
    int numInstances,
    int firstIndex,
    int vertexOffset,
    int firstInstance,
  ) => sdlDrawGpuIndexedPrimitives(
    this,
    numIndices,
    numInstances,
    firstIndex,
    vertexOffset,
    firstInstance,
  );

  ///
  /// Draws data using bound graphics state.
  ///
  /// You must not call this function before binding a graphics pipeline.
  ///
  /// Note that the `first_vertex` and `first_instance` parameters are NOT
  /// compatible with built-in vertex/instance ID variables in shaders (for
  /// example, SV_VertexID); GPU APIs and shader languages do not define these
  /// built-in variables consistently, so if your shader depends on them, the
  /// only way to keep behavior consistent and portable is to always pass 0 for
  /// the correlating parameter in the draw calls.
  ///
  /// \param render_pass a render pass handle.
  /// \param num_vertices the number of vertices to draw.
  /// \param num_instances the number of instances that will be drawn.
  /// \param first_vertex the index of the first vertex to draw.
  /// \param first_instance the ID of the first instance to draw.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_DrawGPUPrimitives( SDL_GPURenderPass *render_pass, Uint32 num_vertices, Uint32 num_instances, Uint32 first_vertex, Uint32 first_instance)
  /// ```
  /// {@category gpu}
  void drawPrimitives(
    int numVertices,
    int numInstances,
    int firstVertex,
    int firstInstance,
  ) => sdlDrawGpuPrimitives(
    this,
    numVertices,
    numInstances,
    firstVertex,
    firstInstance,
  );

  ///
  /// Draws data using bound graphics state and with draw parameters set from a
  /// buffer.
  ///
  /// The buffer must consist of tightly-packed draw parameter sets that each
  /// match the layout of SDL_GPUIndirectDrawCommand. You must not call this
  /// function before binding a graphics pipeline.
  ///
  /// \param render_pass a render pass handle.
  /// \param buffer a buffer containing draw parameters.
  /// \param offset the offset to start reading from the draw buffer.
  /// \param draw_count the number of draw parameter sets that should be read
  /// from the draw buffer.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_DrawGPUPrimitivesIndirect( SDL_GPURenderPass *render_pass, SDL_GPUBuffer *buffer, Uint32 offset, Uint32 draw_count)
  /// ```
  /// {@category gpu}
  void drawPrimitivesIndirect(
    Pointer<SdlGpuBuffer> buffer,
    int offset,
    int drawCount,
  ) => sdlDrawGpuPrimitivesIndirect(this, buffer, offset, drawCount);

  ///
  /// Draws data using bound graphics state with an index buffer enabled and with
  /// draw parameters set from a buffer.
  ///
  /// The buffer must consist of tightly-packed draw parameter sets that each
  /// match the layout of SDL_GPUIndexedIndirectDrawCommand. You must not call
  /// this function before binding a graphics pipeline.
  ///
  /// \param render_pass a render pass handle.
  /// \param buffer a buffer containing draw parameters.
  /// \param offset the offset to start reading from the draw buffer.
  /// \param draw_count the number of draw parameter sets that should be read
  /// from the draw buffer.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_DrawGPUIndexedPrimitivesIndirect( SDL_GPURenderPass *render_pass, SDL_GPUBuffer *buffer, Uint32 offset, Uint32 draw_count)
  /// ```
  /// {@category gpu}
  void drawIndexedPrimitivesIndirect(
    Pointer<SdlGpuBuffer> buffer,
    int offset,
    int drawCount,
  ) => sdlDrawGpuIndexedPrimitivesIndirect(this, buffer, offset, drawCount);

  ///
  /// Ends the given render pass.
  ///
  /// All bound graphics state on the render pass command buffer is unset. The
  /// render pass handle is now invalid.
  ///
  /// \param render_pass a render pass handle.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_EndGPURenderPass( SDL_GPURenderPass *render_pass)
  /// ```
  /// {@category gpu}
  void end() => sdlEndGpuRenderPass(this);
}
