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
}
