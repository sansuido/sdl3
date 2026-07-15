part of '../../../sdl.dart';

extension SdlGpuComputePassPointerEx on Pointer<SdlGpuComputePass> {
  ///
  /// Binds a compute pipeline on a command buffer for use in compute dispatch.
  ///
  /// \param compute_pass a compute pass handle.
  /// \param compute_pipeline a compute pipeline to bind.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_BindGPUComputePipeline( SDL_GPUComputePass *compute_pass, SDL_GPUComputePipeline *compute_pipeline)
  /// ```
  /// {@category gpu}
  void bindPipeline(Pointer<SdlGpuComputePipeline> computePipeline) =>
      sdlBindGpuComputePipeline(this, computePipeline);

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
  void bindSamplers(
    List<SdlxGpuTextureSamplerBinding> bindings, {
    int firstSlot = 0,
  }) => sdlxBindGpuComputeSamplers(this, bindings, firstSlot: firstSlot);

  ///
  /// Binds storage textures as readonly for use on the compute pipeline.
  ///
  /// These textures must have been created with
  /// SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ.
  ///
  /// Be sure your shader is set up according to the requirements documented in
  /// SDL_CreateGPUComputePipeline().
  ///
  /// \param compute_pass a compute pass handle.
  /// \param first_slot the compute storage texture slot to begin binding from.
  /// \param storage_textures an array of storage textures.
  /// \param num_bindings the number of storage textures to bind from the array.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_CreateGPUComputePipeline
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_BindGPUComputeStorageTextures( SDL_GPUComputePass *compute_pass, Uint32 first_slot, SDL_GPUTexture *const *storage_textures, Uint32 num_bindings)
  /// ```
  /// {@category gpu}
  void bindStorageTextures(
    List<Pointer<SdlGpuTexture>> storageTextures, {
    int firstSlot = 0,
  }) => sdlxBindGpuComputeStorageTextures(
    this,
    storageTextures,
    firstSlot: firstSlot,
  );

  ///
  /// Binds storage buffers as readonly for use on the compute pipeline.
  ///
  /// These buffers must have been created with
  /// SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ.
  ///
  /// Be sure your shader is set up according to the requirements documented in
  /// SDL_CreateGPUComputePipeline().
  ///
  /// \param compute_pass a compute pass handle.
  /// \param first_slot the compute storage buffer slot to begin binding from.
  /// \param storage_buffers an array of storage buffer binding structs.
  /// \param num_bindings the number of storage buffers to bind from the array.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_CreateGPUComputePipeline
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_BindGPUComputeStorageBuffers( SDL_GPUComputePass *compute_pass, Uint32 first_slot, SDL_GPUBuffer *const *storage_buffers, Uint32 num_bindings)
  /// ```
  /// {@category gpu}
  void bindStorageBuffers(
    List<Pointer<SdlGpuBuffer>> storageBuffers, {
    int firstSlot = 0,
  }) => sdlxBindGpuComputeStorageBuffers(
    this,
    storageBuffers,
    firstSlot: firstSlot,
  );

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
  /// \param compute_pass a compute pass handle.
  /// \param groupcount_x number of local workgroups to dispatch in the X
  /// dimension.
  /// \param groupcount_y number of local workgroups to dispatch in the Y
  /// dimension.
  /// \param groupcount_z number of local workgroups to dispatch in the Z
  /// dimension.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_DispatchGPUCompute( SDL_GPUComputePass *compute_pass, Uint32 groupcount_x, Uint32 groupcount_y, Uint32 groupcount_z)
  /// ```
  /// {@category gpu}
  void dispatch(int groupcountX, int groupcountY, int groupcountZ) =>
      sdlDispatchGpuCompute(this, groupcountX, groupcountY, groupcountZ);

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
  /// \param compute_pass a compute pass handle.
  /// \param buffer a buffer containing dispatch parameters.
  /// \param offset the offset to start reading from the dispatch buffer.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_DispatchGPUComputeIndirect( SDL_GPUComputePass *compute_pass, SDL_GPUBuffer *buffer, Uint32 offset)
  /// ```
  /// {@category gpu}
  void dispatchIndirect(Pointer<SdlGpuBuffer> buffer, int offset) =>
      sdlDispatchGpuComputeIndirect(this, buffer, offset);

  ///
  /// Ends the current compute pass.
  ///
  /// All bound compute state on the command buffer is unset. The compute pass
  /// handle is now invalid.
  ///
  /// \param compute_pass a compute pass handle.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_EndGPUComputePass( SDL_GPUComputePass *compute_pass)
  /// ```
  /// {@category gpu}
  void end() => sdlEndGpuComputePass(this);
}
