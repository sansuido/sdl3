part of '../../../sdl.dart';

extension SdlGpuRenderStatePointerEx on Pointer<SdlGpuRenderState> {
  ///
  /// Set sampler bindings variables in a custom GPU render state.
  ///
  /// The data is copied and will be binded using SDL_BindGPUFragmentSamplers()
  /// during draw call execution.
  ///
  /// \param state the state to modify.
  /// \param num_sampler_bindings The number of additional fragment samplers to
  /// bind.
  /// \param sampler_bindings Additional fragment samplers to bind.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// renderer.
  ///
  /// \since This function is available since SDL 3.6.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetGPURenderStateSamplerBindings(SDL_GPURenderState *state, int num_sampler_bindings, const SDL_GPUTextureSamplerBinding *sampler_bindings)
  /// ```
  ///
  /// See also:
  /// - [SDL_SetGPURenderStateSamplerBindings - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetGPURenderStateSamplerBindings)
  ///
  /// {@category render}
  bool setSamplerBindings(List<SdlxGpuTextureSamplerBinding> samplerBindings) =>
      sdlxSetGpuRenderStateSamplerBindings(this, samplerBindings);

  ///
  /// Set storage textures variables in a custom GPU render state.
  ///
  /// The data is copied and will be binded using
  /// SDL_BindGPUFragmentStorageTextures() during draw call execution.
  ///
  /// \param state the state to modify.
  /// \param num_storage_textures The number of storage textures to bind.
  /// \param storage_textures Storage textures to bind.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// renderer.
  ///
  /// \since This function is available since SDL 3.6.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetGPURenderStateStorageTextures(SDL_GPURenderState *state, int num_storage_textures, SDL_GPUTexture *const *storage_textures)
  /// ```
  ///
  /// See also:
  /// - [SDL_SetGPURenderStateStorageTextures - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetGPURenderStateStorageTextures)
  ///
  /// {@category render}
  bool setStorageTextures(List<Pointer<SdlGpuTexture>> storageTextures) =>
      sdlxSetGpuRenderStateStorageTextures(this, storageTextures);

  ///
  /// Set storage buffers variables in a custom GPU render state.
  ///
  /// The data is copied and will be binded using
  /// SDL_BindGPUFragmentStorageBuffers() during draw call execution.
  ///
  /// \param state the state to modify.
  /// \param num_storage_buffers The number of storage buffers to bind.
  /// \param storage_buffers Storage buffers to bind.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// renderer.
  ///
  /// \since This function is available since SDL 3.6.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetGPURenderStateStorageBuffers(SDL_GPURenderState *state, int num_storage_buffers, SDL_GPUBuffer *const *storage_buffers)
  /// ```
  ///
  /// See also:
  /// - [SDL_SetGPURenderStateStorageBuffers - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetGPURenderStateStorageBuffers)
  ///
  /// {@category render}
  bool setStorageBuffers(List<Pointer<SdlGpuBuffer>> storageBuffers) =>
      sdlxSetGpuRenderStateStorageBuffers(this, storageBuffers);

  ///
  /// Set fragment shader uniform variables in a custom GPU render state.
  ///
  /// The data is copied and will be pushed using
  /// SDL_PushGPUFragmentUniformData() during draw call execution.
  ///
  /// \param state the state to modify.
  /// \param slot_index the fragment uniform slot to push data to.
  /// \param data client data to write.
  /// \param length the length of the data to write.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// renderer.
  ///
  /// \since This function is available since SDL 3.4.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetGPURenderStateFragmentUniforms(SDL_GPURenderState *state, Uint32 slot_index, const void *data, Uint32 length)
  /// ```
  ///
  /// See also:
  /// - [SDL_SetGPURenderStateFragmentUniforms - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetGPURenderStateFragmentUniforms)
  ///
  /// {@category render}
  bool setFragmentUniforms(int slotIndex, Pointer<Void> data, int length) =>
      sdlSetGpuRenderStateFragmentUniforms(this, slotIndex, data, length);

  ///
  /// Destroy custom GPU render state.
  ///
  /// \param state the state to destroy.
  ///
  /// \threadsafety This function should be called on the thread that created the
  /// renderer.
  ///
  /// \since This function is available since SDL 3.4.0.
  ///
  /// \sa SDL_CreateGPURenderState
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_DestroyGPURenderState(SDL_GPURenderState *state)
  /// ```
  ///
  /// See also:
  /// - [SDL_DestroyGPURenderState - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_DestroyGPURenderState)
  ///
  /// {@category render}
  void destroy() => sdlDestroyGpuRenderState(this);
}
