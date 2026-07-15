part of '../../../sdl.dart';

extension SdlGpuCommandBufferPointerEx on Pointer<SdlGpuCommandBuffer> {
  ///
  /// Inserts an arbitrary string label into the command buffer callstream.
  ///
  /// Useful for debugging.
  ///
  /// On Direct3D 12, using SDL_InsertGPUDebugLabel requires
  /// WinPixEventRuntime.dll to be in your PATH or in the same directory as your
  /// executable. See
  /// [here](https://devblogs.microsoft.com/pix/winpixeventruntime/)
  /// for instructions on how to obtain it.
  ///
  /// \param command_buffer a command buffer.
  /// \param text a UTF-8 string constant to insert as the label.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_InsertGPUDebugLabel( SDL_GPUCommandBuffer *command_buffer, const char *text)
  /// ```
  /// {@category gpu}
  void insertDebugLabel(String text) => sdlInsertGpuDebugLabel(this, text);

  ///
  /// Begins a debug group with an arbitrary name.
  ///
  /// Used for denoting groups of calls when viewing the command buffer
  /// callstream in a graphics debugging tool.
  ///
  /// Each call to SDL_PushGPUDebugGroup must have a corresponding call to
  /// SDL_PopGPUDebugGroup.
  ///
  /// On Direct3D 12, using SDL_PushGPUDebugGroup requires WinPixEventRuntime.dll
  /// to be in your PATH or in the same directory as your executable. See
  /// [here](https://devblogs.microsoft.com/pix/winpixeventruntime/)
  /// for instructions on how to obtain it.
  ///
  /// On some backends (e.g. Metal), pushing a debug group during a
  /// render/blit/compute pass will create a group that is scoped to the native
  /// pass rather than the command buffer. For best results, if you push a debug
  /// group during a pass, always pop it in the same pass.
  ///
  /// \param command_buffer a command buffer.
  /// \param name a UTF-8 string constant that names the group.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_PopGPUDebugGroup
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_PushGPUDebugGroup( SDL_GPUCommandBuffer *command_buffer, const char *name)
  /// ```
  /// {@category gpu}
  void pushDebugGroup(String name) => sdlPushGpuDebugGroup(this, name);

  ///
  /// Ends the most-recently pushed debug group.
  ///
  /// On Direct3D 12, using SDL_PopGPUDebugGroup requires WinPixEventRuntime.dll
  /// to be in your PATH or in the same directory as your executable. See
  /// [here](https://devblogs.microsoft.com/pix/winpixeventruntime/)
  /// for instructions on how to obtain it.
  ///
  /// \param command_buffer a command buffer.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_PushGPUDebugGroup
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_PopGPUDebugGroup( SDL_GPUCommandBuffer *command_buffer)
  /// ```
  /// {@category gpu}
  void popDebugGroup() => sdlPopGpuDebugGroup(this);

  ///
  /// Pushes data to a vertex uniform slot on the command buffer.
  ///
  /// Subsequent draw calls in this command buffer will use this uniform data.
  ///
  /// The data being pushed must respect std140 layout conventions. In practical
  /// terms this means you must ensure that vec3 and vec4 fields are 16-byte
  /// aligned.
  ///
  /// For detailed information about accessing uniform data from a shader, please
  /// refer to SDL_CreateGPUShader.
  ///
  /// \param command_buffer a command buffer.
  /// \param slot_index the vertex uniform slot to push data to.
  /// \param data client data to write.
  /// \param length the length of the data to write.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_PushGPUVertexUniformData( SDL_GPUCommandBuffer *command_buffer, Uint32 slot_index, const void *data, Uint32 length)
  /// ```
  /// {@category gpu}
  void pushVertexUniformData(int slotIndex, Pointer<Void> data, int length) =>
      sdlPushGpuVertexUniformData(this, slotIndex, data, length);

  ///
  /// Pushes data to a fragment uniform slot on the command buffer.
  ///
  /// Subsequent draw calls in this command buffer will use this uniform data.
  ///
  /// The data being pushed must respect std140 layout conventions. In practical
  /// terms this means you must ensure that vec3 and vec4 fields are 16-byte
  /// aligned.
  ///
  /// \param command_buffer a command buffer.
  /// \param slot_index the fragment uniform slot to push data to.
  /// \param data client data to write.
  /// \param length the length of the data to write.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_PushGPUFragmentUniformData( SDL_GPUCommandBuffer *command_buffer, Uint32 slot_index, const void *data, Uint32 length)
  /// ```
  /// {@category gpu}
  void pushFragmentUniformData(int slotIndex, Pointer<Void> data, int length) =>
      sdlPushGpuFragmentUniformData(this, slotIndex, data, length);

  ///
  /// Pushes data to a uniform slot on the command buffer.
  ///
  /// Subsequent draw calls in this command buffer will use this uniform data.
  ///
  /// The data being pushed must respect std140 layout conventions. In practical
  /// terms this means you must ensure that vec3 and vec4 fields are 16-byte
  /// aligned.
  ///
  /// \param command_buffer a command buffer.
  /// \param slot_index the uniform slot to push data to.
  /// \param data client data to write.
  /// \param length the length of the data to write.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_PushGPUComputeUniformData( SDL_GPUCommandBuffer *command_buffer, Uint32 slot_index, const void *data, Uint32 length)
  /// ```
  /// {@category gpu}
  void pushComputeUniformData(int slotIndex, Pointer<Void> data, int length) =>
      sdlPushGpuComputeUniformData(this, slotIndex, data, length);

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
  /// Using SDL_GPU_LOADOP_LOAD before any contents have been written to the
  /// texture subresource will result in undefined behavior. SDL_GPU_LOADOP_CLEAR
  /// will set the contents of the texture subresource to a single value before
  /// any rendering is performed. It's fine to do an empty render pass using
  /// SDL_GPU_STOREOP_STORE to clear a texture, but in general it's better to
  /// think of clearing not as an independent operation but as something that's
  /// done as the beginning of a render pass.
  ///
  /// \param command_buffer a command buffer.
  /// \param color_target_infos an array of texture subresources with
  /// corresponding clear values and load/store ops.
  /// \param num_color_targets the number of color targets in the
  /// color_target_infos array.
  /// \param depth_stencil_target_info a texture subresource with corresponding
  /// clear value and load/store ops, may be
  /// NULL.
  /// \returns a render pass handle.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_EndGPURenderPass
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_GPURenderPass * SDLCALL SDL_BeginGPURenderPass( SDL_GPUCommandBuffer *command_buffer, const SDL_GPUColorTargetInfo *color_target_infos, Uint32 num_color_targets, const SDL_GPUDepthStencilTargetInfo *depth_stencil_target_info)
  /// ```
  /// {@category gpu}
  Pointer<SdlGpuRenderPass> beginRenderPass(
    List<SdlxGpuColorTargetInfo> colorTargetInfo, {
    SdlxGpuDepthStencilTargetInfo? depthStencilTargetInfo,
  }) => sdlxBeginGpuRenderPass(
    this,
    colorTargetInfo,
    depthStencilTargetInfo: depthStencilTargetInfo,
  );

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
  Pointer<SdlGpuComputePass> beginComputePass({
    List<SdlxGpuStorageTextureReadWriteBinding>? textures,
    List<SdlxGpuStorageBufferReadWriteBinding>? buffers,
  }) => sdlxBeginGpuComputePass(this, textures: textures, buffers: buffers);

  ///
  /// Begins a copy pass on a command buffer.
  ///
  /// All operations related to copying to or from buffers or textures take place
  /// inside a copy pass. You must not begin another copy pass, or a render pass
  /// or compute pass before ending the copy pass.
  ///
  /// \param command_buffer a command buffer.
  /// \returns a copy pass handle.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_EndGPUCopyPass
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_GPUCopyPass * SDLCALL SDL_BeginGPUCopyPass( SDL_GPUCommandBuffer *command_buffer)
  /// ```
  /// {@category gpu}
  Pointer<SdlGpuCopyPass> beginCopyPass() => sdlBeginGpuCopyPass(this);

  ///
  /// Generates mipmaps for the given texture.
  ///
  /// This function must not be called inside of any pass.
  ///
  /// \param command_buffer a command_buffer.
  /// \param texture a texture with more than 1 mip level.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_GenerateMipmapsForGPUTexture( SDL_GPUCommandBuffer *command_buffer, SDL_GPUTexture *texture)
  /// ```
  /// {@category gpu}
  void generateMipmapsForTexture(Pointer<SdlGpuTexture> texture) =>
      sdlGenerateMipmapsForGpuTexture(this, texture);

  ///
  /// Blits from a source texture region to a destination texture region.
  ///
  /// This function must not be called inside of any pass.
  ///
  /// \param command_buffer a command buffer.
  /// \param info the blit info struct containing the blit parameters.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_BlitGPUTexture( SDL_GPUCommandBuffer *command_buffer, const SDL_GPUBlitInfo *info)
  /// ```
  /// {@category gpu}
  void blitTexture(SdlxGpuBlitInfo info) => sdlxBlitGpuTexture(this, info);

  ///
  /// Acquire a texture to use in presentation.
  ///
  /// When a swapchain texture is acquired on a command buffer, it will
  /// automatically be submitted for presentation when the command buffer is
  /// submitted. The swapchain texture should only be referenced by the command
  /// buffer used to acquire it.
  ///
  /// If too many frames are in flight, this function will fill the swapchain
  /// texture handle with NULL and return true. This is not an error. This NULL
  /// pointer should not be passed back into SDL. Instead, it should be
  /// considered as an indication to wait.
  ///
  /// In VSYNC present mode (which is the default) this function may block on
  /// vblank.
  ///
  /// If you use this function, it is possible to create a situation where many
  /// command buffers are allocated while the rendering context waits for the GPU
  /// to catch up, which will cause memory usage to grow. You should use
  /// SDL_WaitAndAcquireGPUSwapchainTexture() unless you know what you are doing
  /// with timing.
  ///
  /// The swapchain texture is managed by the implementation and must not be
  /// freed by the user. You MUST NOT call this function from any thread other
  /// than the one that created the window.
  ///
  /// \param command_buffer a command buffer.
  /// \param window a window that has been claimed.
  /// \param swapchain_texture a pointer filled in with a swapchain texture
  /// handle.
  /// \param swapchain_texture_width a pointer filled in with the swapchain
  /// texture width, may be NULL.
  /// \param swapchain_texture_height a pointer filled in with the swapchain
  /// texture height, may be NULL.
  /// \returns true on success, false on error; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called from the thread that
  /// created the window.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_ClaimWindowForGPUDevice
  /// \sa SDL_SubmitGPUCommandBuffer
  /// \sa SDL_SubmitGPUCommandBufferAndAcquireFence
  /// \sa SDL_CancelGPUCommandBuffer
  /// \sa SDL_GetWindowSizeInPixels
  /// \sa SDL_WaitForGPUSwapchain
  /// \sa SDL_WaitAndAcquireGPUSwapchainTexture
  /// \sa SDL_SetGPUAllowedFramesInFlight
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_AcquireGPUSwapchainTexture( SDL_GPUCommandBuffer *command_buffer, SDL_Window *window, SDL_GPUTexture **swapchain_texture, Uint32 *swapchain_texture_width, Uint32 *swapchain_texture_height)
  /// ```
  /// {@category gpu}
  ({int height, Pointer<SdlGpuTexture> texture, int width})?
  acquireSwapchainTexture(Pointer<SdlWindow> window) =>
      sdlxAcquireGpuSwapchainTexture(this, window);

  ///
  /// Blocks the thread until a swapchain texture is available to be acquired,
  /// and then acquires it.
  ///
  /// When a swapchain texture is acquired on a command buffer, it will
  /// automatically be submitted for presentation when the command buffer is
  /// submitted. The swapchain texture should only be referenced by the command
  /// buffer used to acquire it. It is an error to call
  /// SDL_CancelGPUCommandBuffer() after a swapchain texture is acquired.
  ///
  /// This function can fill the swapchain texture handle with NULL in certain
  /// cases, for example if the window is minimized. This is not an error. You
  /// should always make sure to check whether the pointer is NULL before
  /// actually using it.
  ///
  /// The swapchain texture is managed by the implementation and must not be
  /// freed by the user. You MUST NOT call this function from any thread other
  /// than the one that created the window.
  ///
  /// The swapchain texture is write-only and cannot be used as a sampler or for
  /// another reading operation.
  ///
  /// \param command_buffer a command buffer.
  /// \param window a window that has been claimed.
  /// \param swapchain_texture a pointer filled in with a swapchain texture
  /// handle.
  /// \param swapchain_texture_width a pointer filled in with the swapchain
  /// texture width, may be NULL.
  /// \param swapchain_texture_height a pointer filled in with the swapchain
  /// texture height, may be NULL.
  /// \returns true on success, false on error; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called from the thread that
  /// created the window.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_SubmitGPUCommandBuffer
  /// \sa SDL_SubmitGPUCommandBufferAndAcquireFence
  /// \sa SDL_AcquireGPUSwapchainTexture
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_WaitAndAcquireGPUSwapchainTexture( SDL_GPUCommandBuffer *command_buffer, SDL_Window *window, SDL_GPUTexture **swapchain_texture, Uint32 *swapchain_texture_width, Uint32 *swapchain_texture_height)
  /// ```
  /// {@category gpu}
  ({int height, Pointer<SdlGpuTexture> texture, int width})?
  waitAndAcquireSwapchainTexture(Pointer<SdlWindow> window) =>
      sdlxWaitAndAcquireGpuSwapchainTexture(this, window);

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
  /// \param command_buffer a command buffer.
  /// \returns true on success, false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_AcquireGPUCommandBuffer
  /// \sa SDL_WaitAndAcquireGPUSwapchainTexture
  /// \sa SDL_AcquireGPUSwapchainTexture
  /// \sa SDL_SubmitGPUCommandBufferAndAcquireFence
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SubmitGPUCommandBuffer( SDL_GPUCommandBuffer *command_buffer)
  /// ```
  /// {@category gpu}
  bool submit() => sdlSubmitGpuCommandBuffer(this);

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
  /// \param command_buffer a command buffer.
  /// \returns a fence associated with the command buffer, or NULL on failure;
  /// call SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_AcquireGPUCommandBuffer
  /// \sa SDL_WaitAndAcquireGPUSwapchainTexture
  /// \sa SDL_AcquireGPUSwapchainTexture
  /// \sa SDL_SubmitGPUCommandBuffer
  /// \sa SDL_ReleaseGPUFence
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_GPUFence * SDLCALL SDL_SubmitGPUCommandBufferAndAcquireFence( SDL_GPUCommandBuffer *command_buffer)
  /// ```
  /// {@category gpu}
  Pointer<SdlGpuFence> submitAndAcquireFence() =>
      sdlSubmitGpuCommandBufferAndAcquireFence(this);

  ///
  /// Cancels a command buffer.
  ///
  /// None of the enqueued commands are executed.
  ///
  /// It is an error to call this function after a swapchain texture has been
  /// acquired.
  ///
  /// This must be called from the thread the command buffer was acquired on.
  ///
  /// You must not reference the command buffer after calling this function.
  ///
  /// \param command_buffer a command buffer.
  /// \returns true on success, false on error; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_WaitAndAcquireGPUSwapchainTexture
  /// \sa SDL_AcquireGPUCommandBuffer
  /// \sa SDL_AcquireGPUSwapchainTexture
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_CancelGPUCommandBuffer( SDL_GPUCommandBuffer *command_buffer)
  /// ```
  /// {@category gpu}
  bool cancel() => sdlCancelGpuCommandBuffer(this);
}
