// ignore_for_file: comment_references
part of '../../../sdl.dart';

///
/// Creates a pipeline object to be used in a compute workflow.
///
/// Shader resource bindings must be authored to follow a particular convention
/// depending on the shader format. See below for details.
///
/// ---
///
/// **SPIR-V**
///
/// For compute shaders, use:
///
/// - Set 0 for samplers, read-only storage textures, and read-only storage
/// buffers
/// - Set 1 for read-write storage textures and read-write storage buffers
/// - Set 2 for uniform data
///
/// The first resource in a given set must have a `binding` of 0. Additional
/// resources must appear at consecutive bindings (1, 2, etc), leaving no gaps
/// in the set.
///
/// All samplers must come first in the binding order of Set 0, in order of how
/// they are bound via `SDL_BindGPUComputeSamplers()`.
///
/// All read-only storage textures must come after all samplers in the binding
/// order, in order of how they are bound via
/// `SDL_BindGPUComputeStorageTextures()`.
///
/// All read-only storage buffers must come after all read-only storage
/// textures in the binding order, in order of how they are bound via
/// `SDL_BindGPUComputeStorageBuffers()`.
///
/// All read-write storage textures must come first in the binding order of Set
/// 1, in order of how they are bound via `SDL_BeginGPUComputePass()`.
///
/// All read-write storage buffers must come after all read-write storage
/// textures in the binding order, in order of how they are bound via
/// `SDL_BeginGPUComputePass()`.
///
/// **Example**
///
/// If a compute shader binds 2 of each resource type, its binding layout
/// should look like this:
///
/// ===glsl
/// // Any samplers come first in Set 0, in SDL bind slot order
/// layout(set = 0, binding = 0) sampler2d samplerBoundToSlot0;
/// layout(set = 0, binding = 1) sampler2d samplerBoundToSlot1;
/// // Any read-only storage textures come next in Set 0, in SDL bind slot order
/// layout(set = 0, binding = 2) image2d storageTextureBoundToSlot0;
/// layout(set = 0, binding = 3) image2d storageTextureBoundToSlot1;
/// // Any read-only storage buffers come next in Set 0, in SDL bind slot order
/// layout(set = 0, binding = 4) buffer storageBufferBoundToSlot0;
/// layout(set = 0, binding = 5) buffer storageBufferBoundToSlot1;
/// // Any read-write storage textures come first in Set 1, in SDL bind slot order
/// layout(set = 1, binding = 0) image2d rwStorageTextureBoundToSlot0;
/// layout(set = 1, binding = 1) image2d rwStorageTextureBoundToSlot1;
/// // Any read-write storage buffers come next in Set 1, in SDL bind slot order
/// layout(set = 1, binding = 2) buffer rwStorageBufferBoundToSlot0;
/// layout(set = 1, binding = 3) buffer rwStorageBufferBoundToSlot1;
/// // Any uniform buffers are in Set 2, in SDL slot order
/// layout(set = 2, binding = 0) uniform UniformDataBoundToSlot0 {};
/// layout(set = 2, binding = 1) uniform UniformDataBoundToSlot1 {};
/// ===
///
/// ---
///
/// **DXBC / DXIL (HLSL)**
///
/// For compute shaders, use:
///
/// - `(t[n], space0)` for sampled textures, read-only storage textures, and
/// read-only storage buffers
/// - `(s[n], space0)` for samplers
/// - `(u[n], space1)` for read-write storage textures and read-write storage
/// buffers
/// - `(b[n], space2)` for uniform data
///
/// The first resource in a given register set must have a register index of
/// `0`. Additional resources must appear at consecutive indices (1, 2, etc),
/// leaving no gaps in the register set.
///
/// All sampled textures must come first in the `t` register set, in order of
/// how they are bound via `SDL_BindGPUComputeSamplers()`.
///
/// All sampler objects must be in the `s` register set, in the same order as
/// the textures above.
///
/// All read-only storage textures must come after all samplers in the `t`
/// register set, in order of how they are bound via
/// `SDL_BindComputeStorageTextures()`.
///
/// All read-only storage buffers must come after all storage textures in the
/// `t` register set, in order of how they are bound via
/// `SDL_BindComputeStorageBuffers()`.
///
/// All read-write storage textures must come first in the `u` register set in
/// `space1`, in order of how they are bound via `SDL_BeginGPUComputePass()`.
///
/// All read-write storage buffers must come after all read-write storage
/// textures in the `u` register set in `space1`, in order of how they are
/// bound via `SDL_BeginGPUComputePass()`.
///
/// **Example**
///
/// If a compute shader binds 2 of each resource type, the layout should look
/// like this:
///
/// ```c
/// // Any samplers and sampled textures come first in their respective register sets, in SDL bind slot order
/// SamplerState SamplerBoundToSlot0 : register( s0, space0 );
/// SamplerState SamplerBoundToSlot1 : register( s1, space0 );
/// Texture2D SampledTextureBoundToSlot0 : register( t0, space0 );
/// Texture2D SampledTextureBoundToSlot1 : register( t1, space0 );
/// // Any read-only storage textures come next in the `t` register set, in SDL bind slot order
/// Texture2D StorageTextureBoundToSlot0 : register( t2, space0 );
/// Texture2D StorageTextureBoundToSlot1 : register( t3, space0 );
/// // Any read-only storage buffers come next in the `t` register set, in SDL bind slot order
/// ByteAddressBuffer StorageBufferBoundToSlot0 : register( t4, space0 );
/// ByteAddressBuffer StorageBufferBoundToSlot1 : register( t5, space0 );
/// // Any read-write storage textures come first in the `u` register set in space1, in SDL bind slot order
/// RWTexture2D RWStorageTextureBoundToSlot0 : register( u0, space1 );
/// RWTexture2D RWStorageTextureBoundToSlot1 : register( u1, space1 );
/// // Any read-write storage buffers come next in the `u` register set in space1, in SDL bind slot order
/// RWByteAddressBuffer RWStorageTextureBoundToSlot0 : register( u2, space1 );
/// RWByteAddressBuffer RWStorageTextureBoundToSlot1 : register( u3, space1 );
/// // Any uniform buffers are in the `b` register set in space2, in SDL slot order
/// cbuffer UniformDataBoundToSlot0 : register( b0, space2 ) { ... };
/// cbuffer UniformDataBoundToSlot1 : register( b1, space2 ) { ... };
/// ```
///
/// ---
///
/// **MSL / Metallib (Metal Shading Language)**
///
/// The first resource in a given argument table must have an index of `0`.
/// Additional resources must appear at consecutive indices (1, 2, etc),
/// leaving no gaps in the table.
///
/// All sampled textures must come first in the `[[texture]]` argument table,
/// in order of how they are bound via `SDL_BindGPUComputeSamplers()`.
///
/// All sampler objects must be in the `[[sampler]]` argument table, in the
/// same order as the textures above.
///
/// All read-only storage textures must come after all sampled textures in the
/// `[[texture]]` argument table, in order of how they are bound via
/// `SDL_BindGPUComputeStorageTextures()`.
///
/// All read-write storage textures must come after all read-only storage
/// textures in the `[[texture]]` argument table, in order of how they are
/// bound via `SDL_BeginGPUComputePass()`.
///
/// All uniform buffers must come first in the `[[buffer]]` argument table, in
/// order of their slots in `SDL_PushGPUComputeUniformData()`.
///
/// All read-only storage buffers must come after all uniform buffers in the
/// `[[buffer]]` argument table, in order of how they are bound via
/// `SDL_BindGPUComputeStorageBuffers()`.
///
/// All read-write storage buffers must come after all read-only storage
/// buffers in the `[[buffer]]` argument table, in order of how they are bound
/// via `SDL_BeginGPUComputePass()`.
///
/// **Example**
///
/// For a compute shader binding 2 of each resource type, the main function
/// signature should look like this:
///
/// ```c++
/// kernel void ExampleComputeShader(
/// // Any samplers go in the `sampler` table, in SDL bind slot order
/// sampler samplerBoundToSlot0 [[sampler(0)]],
/// sampler samplerBoundToSlot1 [[sampler(1)]],
/// // Any sampled textures come first in the `texture` table, in SDL bind slot order
/// texture2d<float> sampledTextureBoundToSlot0 [[texture(0)]],
/// texture2d<float> sampledTextureBoundToSlot1 [[texture(1)]],
/// // Any read-only storage textures come next in the `texture` table, in SDL bind slot order
/// texture2d<float> storageTextureBoundToSlot0 [[texture(2)]],
/// texture2d<float> storageTextureBoundToSlot1 [[texture(3)]],
/// // Any read-write storage textures come next in the `texture` table, in SDL bind slot order
/// texture2d<float, access::write> rwStorageTextureBoundToSlot0 [[texture(4)]];
/// texture2d<float, access::write> rwStorageTextureBoundToSlot1 [[texture(5)]];
/// // Any uniform buffers come first in the `buffer` table, in SDL slot order
/// constant SomeUniformStruct uniformDataBoundToSlot0 [[buffer(0)]],
/// constant SomeUniformStruct uniformDataBoundToSlot1 [[buffer(1)]],
/// // Any read-only storage buffers come next in the `buffer` table, in SDL bind slot order
/// device SomeBufferStruct& storageBufferBoundToSlot0 [[buffer(2)]],
/// device SomeBufferStruct& storageBufferBoundToSlot1 [[buffer(3)]]);
/// // Any read-write storage buffers come next in the `buffer` table, in SDL bind slot order
/// device SomeBufferStruct& rwStorageBufferBoundToSlot0 [[buffer(4)]];
/// device SomeBufferStruct& rwStorageBufferBoundToSlot1 [[buffer(5)]]);
/// ```
///
/// ---
///
/// There are optional properties that can be provided through `props`. These
/// are the supported properties:
///
/// - `SDL_PROP_GPU_COMPUTEPIPELINE_CREATE_NAME_STRING`: a name that can be
/// displayed in debugging tools.
///
/// \param device a GPU Context.
/// \param createinfo a struct describing the state of the compute pipeline to
/// create.
/// \returns a compute pipeline object on success, or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_BindGPUComputePipeline
/// \sa SDL_ReleaseGPUComputePipeline
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUComputePipeline * SDLCALL SDL_CreateGPUComputePipeline( SDL_GPUDevice *device, const SDL_GPUComputePipelineCreateInfo *createinfo)
/// ```
///
/// See also:
/// - [SDL_CreateGPUComputePipeline - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_CreateGPUComputePipeline)
///
/// {@category gpu}
Pointer<SdlGpuComputePipeline> sdlxCreateGpuComputePipeline(
  Pointer<SdlGpuDevice> device,
  SdlxGpuComputePipelineCreateInfo createinfo,
) {
  Pointer<SdlGpuComputePipeline> result;
  final pointer = createinfo.calloc();
  result = sdlCreateGpuComputePipeline(device, pointer);
  pointer.callocAllFree();
  return result;
}

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
///
/// See also:
/// - [SDL_CreateGPUGraphicsPipeline - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_CreateGPUGraphicsPipeline)
///
/// {@category gpu}
Pointer<SdlGpuGraphicsPipeline> sdlxCreateGpuGraphicsPipeline(
  Pointer<SdlGpuDevice> device,
  SdlxGpuGraphicsPipelineCreateInfo createinfo,
) {
  Pointer<SdlGpuGraphicsPipeline> result;
  final pointer = createinfo.calloc();
  result = sdlCreateGpuGraphicsPipeline(device, pointer);
  pointer.callocAllFree();
  return result;
}

///
/// Creates a sampler object to be used when binding textures in a graphics
/// workflow.
///
/// There are optional properties that can be provided through `props`. These
/// are the supported properties:
///
/// - `SDL_PROP_GPU_SAMPLER_CREATE_NAME_STRING`: a name that can be displayed
/// in debugging tools.
///
/// \param device a GPU Context.
/// \param createinfo a struct describing the state of the sampler to create.
/// \returns a sampler object on success, or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_BindGPUVertexSamplers
/// \sa SDL_BindGPUFragmentSamplers
/// \sa SDL_ReleaseGPUSampler
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUSampler * SDLCALL SDL_CreateGPUSampler( SDL_GPUDevice *device, const SDL_GPUSamplerCreateInfo *createinfo)
/// ```
///
/// See also:
/// - [SDL_CreateGPUSampler - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_CreateGPUSampler)
///
/// {@category gpu}
Pointer<SdlGpuSampler> sdlxCreateGpuSampler(
  Pointer<SdlGpuDevice> device,
  SdlxGpuSamplerCreateInfo createinfo,
) {
  Pointer<SdlGpuSampler> result;
  final pointer = createinfo.calloc();
  result = sdlCreateGpuSampler(device, pointer);
  pointer.callocFree();
  return result;
}

///
/// Creates a shader to be used when creating a graphics pipeline.
///
/// Shader resource bindings must be authored to follow a particular convention
/// depending on the shader format. See below for details.
///
/// ---
///
/// **SPIR-V**
///
/// For vertex shaders, use: - Set 0 for samplers, storage textures, and
/// storage buffers - Set 1 for uniform data
///
/// For fragment shaders, use: - Set 2 for samplers, storage textures, and
/// storage buffers - Set 3 for uniform data
///
/// The first resource in a given set must have a `binding` of 0. Additional
/// resources must appear at consecutive bindings (1, 2, etc), leaving no gaps
/// in the set.
///
/// All samplers must come first in the binding order, in order of how they are
/// bound via `SDL_BindGPU*Samplers()`.
///
/// All storage textures must come after all samplers in the binding order, in
/// order of how they are bound via `SDL_Bind*StorageTextures()`.
///
/// All storage buffers must come after all storage textures in the binding
/// order, in order of how they are bound via `SDL_Bind*StorageBuffers()`.
///
/// **Example**
///
/// If a vertex shader binds 2 samplers, 2 storage textures, 2 storage buffers,
/// and 2 uniform buffers, its binding layout should look like this:
///
/// ===glsl
/// // Any samplers come first in the set, in SDL bind slot order
/// layout(set = 0, binding = 0) sampler2d samplerBoundToSlot0;
/// layout(set = 0, binding = 1) sampler2d samplerBoundToSlot1;
/// // Any storage textures come next in the set, in SDL bind slot order
/// layout(set = 0, binding = 2) texture2d storageTextureBoundToSlot0;
/// layout(set = 0, binding = 3) texture2d storageTextureBoundToSlot1;
/// // Any storage buffers come next in the set, in SDL bind slot order
/// layout(set = 0, binding = 4) buffer storageBufferBoundToSlot0;
/// layout(set = 0, binding = 5) buffer storageBufferBoundToSlot1;
/// // Any uniform buffers are in their own set, in SDL slot order
/// layout(set = 1, binding = 0) uniform UniformDataBoundToSlot0 {};
/// layout(set = 1, binding = 1) uniform UniformDataBoundToSlot1 {};
/// ===
///
/// ---
///
/// **DXBC / DXIL (HLSL)**
///
/// For vertex shaders, use: - `(t[n], space0)` for sampled textures, storage
/// textures, and storage buffers - `(s[n], space0)` for samplers - `(b[n],
/// space1)` for uniform data
///
/// For fragment (aka "pixel") shaders, use: - `(t[n], space2)` for sampled
/// textures, storage textures, and storage buffers - `(s[n], space2)` for
/// samplers - `(b[n], space3)` for uniform data
///
/// The first resource in a given register set must have a register index of
/// `0`. Additional resources must appear at consecutive indices (1, 2, etc),
/// leaving no gaps in the register set.
///
/// All sampled textures must come first in the `t` register set, in order of
/// how they are bound via `SDL_BindGPU*Samplers()`.
///
/// All sampler objects must be in the `s` register set, in the same order as
/// the textures above.
///
/// All storage textures must come after all samplers in the `t` register set,
/// in order of how they are bound via `SDL_Bind*StorageTextures()`.
///
/// All storage buffers must come after all storage textures in the `t`
/// register set, in order of how they are bound via
/// `SDL_Bind*StorageBuffers()`.
///
/// **Example**
///
/// If a pixel shader binds 2 samplers, 2 storage textures, 2 storage buffers,
/// and 2 uniform buffers, its binding layout should look like this:
///
/// ```c
/// // Any samplers and sampled textures come first in their respective register sets, in SDL bind slot order
/// SamplerState SamplerBoundToSlot0 : register( s0, space2 );
/// SamplerState SamplerBoundToSlot1 : register( s1, space2 );
/// Texture2D SampledTextureBoundToSlot0 : register( t0, space2 );
/// Texture2D SampledTextureBoundToSlot1 : register( t1, space2 );
/// // Any storage textures come next in the `t` register set, in SDL bind slot order
/// Texture2D StorageTextureBoundToSlot0 : register( t2, space2 );
/// Texture2D StorageTextureBoundToSlot1 : register( t3, space2 );
/// // Any storage buffers come next in the `t` register set, in SDL bind slot order
/// ByteAddressBuffer StorageBufferBoundToSlot0 : register( t4, space2 );
/// ByteAddressBuffer StorageBufferBoundToSlot1 : register( t5, space2 );
/// // Any uniform buffers are in the `b` register set *and* in their own space, in SDL slot order
/// cbuffer UniformDataBoundToSlot0 : register( b0, space4 ) { ... };
/// cbuffer UniformDataBoundToSlot1 : register( b1, space4 ) { ... };
/// ```
///
/// ---
///
/// **MSL / Metallib (Metal Shading Language)**
///
/// The first resource in a given argument table must have an index of `0`.
/// Additional resources must appear at consecutive indices (1, 2, etc),
/// leaving no gaps in the table. (_Except_ in the case of vertex buffers,
/// which are mentioned below.)
///
/// All sampled textures must come first in the `[[texture]]` argument table,
/// in order of how they are bound via `SDL_BindGPU*Samplers()`.
///
/// All sampler objects must be in the `[[sampler]]` argument table, in the
/// same order as the textures above.
///
/// All storage textures must come after all sampled textures in the
/// `[[texture]]` argument table, in order of how they are bound via
/// `SDL_BindGPU*StorageTextures()`.
///
/// All uniform buffers must come first in the `[[buffer]]` argument table, in
/// order of their slots in `SDL_PushGPU*UniformData()`.
///
/// All storage buffers must come after all uniform buffers in the `[[buffer]]`
/// argument table, in order of how they are bound via
/// `SDL_BindGPU*StorageBuffers()`.
///
/// In Metal, vertex buffers are also included in the `[[buffer]]` argument
/// table. To work around this, SDL forces the vertex buffer bound to slot 0 to
/// be bound at `[[buffer(14)]]`. The vertex buffer in slot 1 will be bound to
/// `[[buffer(15)]]`, and so on. Rather than manually authoring vertex buffer
/// indices, use the `[[stage_in]]` attribute which will automatically use the
/// vertex input information from the SDL_GPUGraphicsPipeline.
///
/// **Example**
///
/// For a vertex shader with 1 vertex buffer, 2 samplers, 2 storage textures, 2
/// storage buffers, and 2 uniform buffers, the main function signature should
/// look something like this:
///
/// ```c++
/// vertex VertexOutput ExampleVertexShader(
/// // Vertex buffers are their own special thing...
/// SomeVertexInput input [[stage_in]], // alternatively, SomeVertexInput input [[buffer(14)]]
/// // Any samplers go in the `sampler` table, in SDL bind slot order
/// sampler samplerBoundToSlot0 [[sampler(0)]],
/// sampler samplerBoundToSlot1 [[sampler(1)]],
/// // Any sampled textures come first in the `texture` table, in SDL bind slot order
/// texture2d<float> sampledTextureBoundToSlot0 [[texture(0)]],
/// texture2d<float> sampledTextureBoundToSlot1 [[texture(1)]],
/// // Any storage textures come next in the `texture` table, in SDL bind slot order
/// texture2d<float> storageTextureBoundToSlot0 [[texture(2)]],
/// texture2d<float> storageTextureBoundToSlot1 [[texture(3)]],
/// // Any uniform buffers come first in the `buffer` table, in SDL slot order
/// constant SomeUniformStruct uniformDataBoundToSlot0 [[buffer(0)]],
/// constant SomeUniformStruct uniformDataBoundToSlot1 [[buffer(1)]],
/// // Any storage buffers come next in the `buffer` table, in SDL bind slot order
/// device SomeBufferStruct& storageBufferBoundToSlot0 [[buffer(2)]],
/// device SomeBufferStruct& storageBufferBoundToSlot1 [[buffer(3)]]);
///
/// ```
///
/// ---
///
/// Shader semantics other than system-value semantics do not matter in D3D12.
/// For ease of use, the SDL implementation assumes that non system-value
/// semantics will all be `TEXCOORD`. If you are using HLSL as the shader
/// source language, your vertex semantics should start at `TEXCOORD0` and
/// increment like so: `TEXCOORD1`, `TEXCOORD2`, etc.
///
/// If you wish to change the semantic prefix to something other than
/// `TEXCOORD` you can use
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
///
/// See also:
/// - [SDL_CreateGPUShader - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_CreateGPUShader)
///
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
/// Creates a texture object to be used in graphics or compute workflows.
///
/// The contents of this texture are undefined until data is written to the
/// texture, either via SDL_UploadToGPUTexture or by performing a render or
/// compute pass with this texture as a target.
///
/// Note that certain combinations of usage flags are invalid. For example, a
/// texture cannot have both the SAMPLER and GRAPHICS_STORAGE_READ flags.
///
/// If you request a sample count higher than the hardware supports, the
/// implementation will automatically fall back to the highest available sample
/// count.
///
/// There are optional properties that can be provided through
/// SDL_GPUTextureCreateInfo's `props`. These are the supported properties:
///
/// - `SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_R_FLOAT`: (Direct3D 12 only) if
/// the texture usage is SDL_GPU_TEXTUREUSAGE_COLOR_TARGET, clear the texture
/// to a color with this red intensity. Defaults to zero.
/// - `SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_G_FLOAT`: (Direct3D 12 only) if
/// the texture usage is SDL_GPU_TEXTUREUSAGE_COLOR_TARGET, clear the texture
/// to a color with this green intensity. Defaults to zero.
/// - `SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_B_FLOAT`: (Direct3D 12 only) if
/// the texture usage is SDL_GPU_TEXTUREUSAGE_COLOR_TARGET, clear the texture
/// to a color with this blue intensity. Defaults to zero.
/// - `SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_A_FLOAT`: (Direct3D 12 only) if
/// the texture usage is SDL_GPU_TEXTUREUSAGE_COLOR_TARGET, clear the texture
/// to a color with this alpha intensity. Defaults to zero.
/// - `SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_DEPTH_FLOAT`: (Direct3D 12 only)
/// if the texture usage is SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET, clear
/// the texture to a depth of this value. Defaults to zero.
/// - `SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_STENCIL_NUMBER`: (Direct3D 12
/// only) if the texture usage is SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET,
/// clear the texture to a stencil of this Uint8 value. Defaults to zero.
/// - `SDL_PROP_GPU_TEXTURE_CREATE_NAME_STRING`: a name that can be displayed
/// in debugging tools.
///
/// \param device a GPU Context.
/// \param createinfo a struct describing the state of the texture to create.
/// \returns a texture object on success, or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_UploadToGPUTexture
/// \sa SDL_DownloadFromGPUTexture
/// \sa SDL_BeginGPURenderPass
/// \sa SDL_BeginGPUComputePass
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
/// extern SDL_DECLSPEC SDL_GPUTexture * SDLCALL SDL_CreateGPUTexture( SDL_GPUDevice *device, const SDL_GPUTextureCreateInfo *createinfo)
/// ```
///
/// See also:
/// - [SDL_CreateGPUTexture - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_CreateGPUTexture)
///
/// {@category gpu}
Pointer<SdlGpuTexture> sdlxCreateGpuTexture(
  Pointer<SdlGpuDevice> device,
  SdlxGpuTextureCreateInfo createinfo,
) {
  Pointer<SdlGpuTexture> result;
  final pointer = createinfo.calloc();
  result = sdlCreateGpuTexture(device, pointer);
  pointer.callocFree();
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
///
/// See also:
/// - [SDL_CreateGPUBuffer - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_CreateGPUBuffer)
///
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
/// \sa SDL_MapGPUTransferBuffer
/// \sa SDL_UnmapGPUTransferBuffer
/// \sa SDL_UploadToGPUBuffer
/// \sa SDL_DownloadFromGPUBuffer
/// \sa SDL_UploadToGPUTexture
/// \sa SDL_DownloadFromGPUTexture
/// \sa SDL_ReleaseGPUTransferBuffer
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUTransferBuffer * SDLCALL SDL_CreateGPUTransferBuffer( SDL_GPUDevice *device, const SDL_GPUTransferBufferCreateInfo *createinfo)
/// ```
///
/// See also:
/// - [SDL_CreateGPUTransferBuffer - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_CreateGPUTransferBuffer)
///
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
///
/// See also:
/// - [SDL_BeginGPURenderPass - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_BeginGPURenderPass)
///
/// {@category gpu}
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
///
/// See also:
/// - [SDL_SetGPUViewport - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetGPUViewport)
///
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
///
/// See also:
/// - [SDL_SetGPUScissor - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetGPUScissor)
///
/// {@category gpu}
void sdlxSetGpuScissor(Pointer<SdlGpuRenderPass> renderPass, SdlxRect scissor) {
  final pointer = scissor.calloc();
  sdlSetGpuScissor(renderPass, pointer);
  pointer.callocFree();
}

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
///
/// See also:
/// - [SDL_SetGPUBlendConstants - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetGPUBlendConstants)
///
/// {@category gpu}
void sdlxSetGpuBlendConstants(
  Pointer<SdlGpuRenderPass> renderPass,
  SdlxFColor blendAnts,
) {
  final pointer = blendAnts.calloc();
  sdlSetGpuBlendConstants(renderPass, pointer.ref);
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
///
/// See also:
/// - [SDL_BindGPUVertexBuffers - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_BindGPUVertexBuffers)
///
/// {@category gpu}
void sdlxBindGpuVertexBuffers(
  Pointer<SdlGpuRenderPass> renderPass,
  List<SdlxGpuBufferBinding> bindings, {
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
///
/// See also:
/// - [SDL_BindGPUIndexBuffer - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_BindGPUIndexBuffer)
///
/// {@category gpu}
void sdlxBindGpuIndexBuffer(
  Pointer<SdlGpuRenderPass> renderPass,
  SdlxGpuBufferBinding binding,
  int indexElementSize,
) {
  final bindingPointer = binding.calloc();
  sdlBindGpuIndexBuffer(renderPass, bindingPointer, indexElementSize);
  bindingPointer.callocFree();
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
///
/// See also:
/// - [SDL_BindGPUVertexSamplers - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_BindGPUVertexSamplers)
///
/// {@category gpu}
void sdlxBindGpuVertexSamplers(
  Pointer<SdlGpuRenderPass> renderPass,
  List<SdlxGpuTextureSamplerBinding> bindings, {
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
///
/// See also:
/// - [SDL_BindGPUVertexStorageTextures - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_BindGPUVertexStorageTextures)
///
/// {@category gpu}
void sdlxBindGpuVertexStorageTextures(
  Pointer<SdlGpuRenderPass> renderPass,
  List<Pointer<SdlGpuTexture>> storageTextures, {
  int firstSlot = 0,
}) {
  final pointer = ffi.calloc<Pointer<SdlGpuTexture>>(storageTextures.length);
  for (var i = 0; i < storageTextures.length; i++) {
    pointer[i] = storageTextures[i];
  }
  sdlBindGpuVertexStorageTextures(
    renderPass,
    firstSlot,
    pointer,
    storageTextures.length,
  );
  pointer.callocFree();
}

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
///
/// See also:
/// - [SDL_BindGPUVertexStorageBuffers - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_BindGPUVertexStorageBuffers)
///
/// {@category gpu}
void sdlxBindGpuVertexStorageBuffers(
  Pointer<SdlGpuRenderPass> renderPass,
  List<Pointer<SdlGpuBuffer>> storageBuffers, {
  int firstSlot = 0,
}) {
  final pointer = ffi.calloc<Pointer<SdlGpuBuffer>>(storageBuffers.length);
  for (var i = 0; i < storageBuffers.length; i++) {
    pointer[i] = storageBuffers[i];
  }
  sdlBindGpuVertexStorageBuffers(
    renderPass,
    firstSlot,
    pointer,
    storageBuffers.length,
  );
  pointer.callocFree();
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
///
/// See also:
/// - [SDL_BindGPUFragmentSamplers - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_BindGPUFragmentSamplers)
///
/// {@category gpu}
void sdlxBindGpuFragmentSamplers(
  Pointer<SdlGpuRenderPass> renderPass,
  List<SdlxGpuTextureSamplerBinding> bindings, {
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
///
/// See also:
/// - [SDL_BindGPUFragmentStorageTextures - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_BindGPUFragmentStorageTextures)
///
/// {@category gpu}
void sdlxBindGpuFragmentStorageTextures(
  Pointer<SdlGpuRenderPass> renderPass,
  List<Pointer<SdlGpuTexture>> storageTextures, {
  int firstSlot = 0,
}) {
  final pointer = ffi.calloc<Pointer<SdlGpuTexture>>(storageTextures.length);
  for (var i = 0; i < storageTextures.length; i++) {
    pointer[i] = storageTextures[i];
  }
  sdlBindGpuFragmentStorageTextures(
    renderPass,
    firstSlot,
    pointer,
    storageTextures.length,
  );
  pointer.callocFree();
}

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
///
/// See also:
/// - [SDL_BindGPUFragmentStorageBuffers - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_BindGPUFragmentStorageBuffers)
///
/// {@category gpu}
void sdlxBindGpuFragmentStorageBuffers(
  Pointer<SdlGpuRenderPass> renderPass,
  List<Pointer<SdlGpuBuffer>> storageBuffers, {
  int firstSlot = 0,
}) {
  final pointer = ffi.calloc<Pointer<SdlGpuBuffer>>(storageBuffers.length);
  for (var i = 0; i < storageBuffers.length; i++) {
    pointer[i] = storageBuffers[i];
  }
  sdlBindGpuFragmentStorageBuffers(
    renderPass,
    firstSlot,
    pointer,
    storageBuffers.length,
  );
  pointer.callocFree();
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
///
/// See also:
/// - [SDL_BeginGPUComputePass - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_BeginGPUComputePass)
///
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
///
/// See also:
/// - [SDL_BindGPUComputeSamplers - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_BindGPUComputeSamplers)
///
/// {@category gpu}
void sdlxBindGpuComputeSamplers(
  Pointer<SdlGpuComputePass> computePass,
  List<SdlxGpuTextureSamplerBinding> bindings, {
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
///
/// See also:
/// - [SDL_BindGPUComputeStorageTextures - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_BindGPUComputeStorageTextures)
///
/// {@category gpu}
void sdlxBindGpuComputeStorageTextures(
  Pointer<SdlGpuComputePass> computePass,
  List<Pointer<SdlGpuTexture>> storageTextures, {
  int firstSlot = 0,
}) {
  final pointer = ffi.calloc<Pointer<SdlGpuTexture>>(storageTextures.length);
  for (var i = 0; i < storageTextures.length; i++) {
    pointer[i] = storageTextures[i];
  }
  sdlBindGpuComputeStorageTextures(
    computePass,
    firstSlot,
    pointer,
    storageTextures.length,
  );
  pointer.callocFree();
}

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
///
/// See also:
/// - [SDL_BindGPUComputeStorageBuffers - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_BindGPUComputeStorageBuffers)
///
/// {@category gpu}
void sdlxBindGpuComputeStorageBuffers(
  Pointer<SdlGpuComputePass> computePass,
  List<Pointer<SdlGpuBuffer>> storageBuffers, {
  int firstSlot = 0,
}) {
  final pointer = ffi.calloc<Pointer<SdlGpuBuffer>>(storageBuffers.length);
  for (var i = 0; i < storageBuffers.length; i++) {
    pointer[i] = storageBuffers[i];
  }
  sdlBindGpuComputeStorageBuffers(
    computePass,
    firstSlot,
    pointer,
    storageBuffers.length,
  );
  pointer.callocFree();
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
/// \param copy_pass a copy pass handle.
/// \param source the source transfer buffer with image layout information.
/// \param destination the destination texture region.
/// \param cycle if true, cycles the texture if the texture is bound, otherwise
/// overwrites the data.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_UploadToGPUTexture( SDL_GPUCopyPass *copy_pass, const SDL_GPUTextureTransferInfo *source, const SDL_GPUTextureRegion *destination, bool cycle)
/// ```
///
/// See also:
/// - [SDL_UploadToGPUTexture - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_UploadToGPUTexture)
///
/// {@category gpu}
void sdlxUploadToGpuTexture(
  Pointer<SdlGpuCopyPass> copyPass,
  SdlxGpuTextureTransferInfo source,
  SdlxGpuTextureRegion destination, {
  bool cycle = false,
}) {
  final sourcePointer = source.calloc();
  final destinationPointer = destination.calloc();
  sdlUploadToGpuTexture(copyPass, sourcePointer, destinationPointer, cycle);
  sourcePointer.callocFree();
  destinationPointer.callocFree();
}

///
/// Uploads data from a transfer buffer to a buffer.
///
/// The upload occurs on the GPU timeline. You may assume that the upload has
/// finished in subsequent commands.
///
/// \param copy_pass a copy pass handle.
/// \param source the source transfer buffer with offset.
/// \param destination the destination buffer with offset and size.
/// \param cycle if true, cycles the buffer if it is already bound, otherwise
/// overwrites the data.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_UploadToGPUBuffer( SDL_GPUCopyPass *copy_pass, const SDL_GPUTransferBufferLocation *source, const SDL_GPUBufferRegion *destination, bool cycle)
/// ```
///
/// See also:
/// - [SDL_UploadToGPUBuffer - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_UploadToGPUBuffer)
///
/// {@category gpu}
void sdlxUploadToGpuBuffer(
  Pointer<SdlGpuCopyPass> copyPass,
  SdlxGpuTransferBufferLocation source,
  SdlxGpuBufferRegion destination, {
  bool cycle = false,
}) {
  final sourcePointer = source.calloc();
  final destinationPointer = destination.calloc();
  sdlUploadToGpuBuffer(copyPass, sourcePointer, destinationPointer, cycle);
  sourcePointer.callocFree();
  destinationPointer.callocFree();
}

///
/// Performs a texture-to-texture copy.
///
/// This copy occurs on the GPU timeline. You may assume the copy has finished
/// in subsequent commands.
///
/// This function does not support copying between depth and color textures.
/// For those, copy the texture to a buffer and then to the destination
/// texture.
///
/// \param copy_pass a copy pass handle.
/// \param source a source texture region.
/// \param destination a destination texture region.
/// \param w the width of the region to copy.
/// \param h the height of the region to copy.
/// \param d the depth of the region to copy.
/// \param cycle if true, cycles the destination texture if the destination
/// texture is bound, otherwise overwrites the data.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_CopyGPUTextureToTexture( SDL_GPUCopyPass *copy_pass, const SDL_GPUTextureLocation *source, const SDL_GPUTextureLocation *destination, Uint32 w, Uint32 h, Uint32 d, bool cycle)
/// ```
///
/// See also:
/// - [SDL_CopyGPUTextureToTexture - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_CopyGPUTextureToTexture)
///
/// {@category gpu}
void sdlxCopyGpuTextureToTexture(
  Pointer<SdlGpuCopyPass> copyPass,
  SdlxGpuTextureLocation source,
  SdlxGpuTextureLocation destination,
  int w,
  int h,
  int d, {
  bool cycle = false,
}) {
  final sourcePointer = source.calloc();
  final destinationPointer = destination.calloc();
  sdlCopyGpuTextureToTexture(
    copyPass,
    sourcePointer,
    destinationPointer,
    w,
    h,
    d,
    cycle,
  );
  sourcePointer.callocFree();
  destinationPointer.callocFree();
}

///
/// Performs a buffer-to-buffer copy.
///
/// This copy occurs on the GPU timeline. You may assume the copy has finished
/// in subsequent commands.
///
/// \param copy_pass a copy pass handle.
/// \param source the buffer and offset to copy from.
/// \param destination the buffer and offset to copy to.
/// \param size the length of the buffer to copy.
/// \param cycle if true, cycles the destination buffer if it is already bound,
/// otherwise overwrites the data.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_CopyGPUBufferToBuffer( SDL_GPUCopyPass *copy_pass, const SDL_GPUBufferLocation *source, const SDL_GPUBufferLocation *destination, Uint32 size, bool cycle)
/// ```
///
/// See also:
/// - [SDL_CopyGPUBufferToBuffer - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_CopyGPUBufferToBuffer)
///
/// {@category gpu}
void sdlxCopyGpuBufferToBuffer(
  Pointer<SdlGpuCopyPass> copyPass,
  SdlxGpuBufferLocation source,
  SdlxGpuBufferLocation destination,
  int size, {
  bool cycle = false,
}) {
  final sourcePointer = source.calloc();
  final destinationPointer = destination.calloc();
  sdlCopyGpuBufferToBuffer(
    copyPass,
    sourcePointer,
    destinationPointer,
    size,
    cycle,
  );
  sourcePointer.callocFree();
  destinationPointer.callocFree();
}

///
/// Copies data from a texture to a transfer buffer on the GPU timeline.
///
/// This data is not guaranteed to be copied until the command buffer fence is
/// signaled.
///
/// \param copy_pass a copy pass handle.
/// \param source the source texture region.
/// \param destination the destination transfer buffer with image layout
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_DownloadFromGPUTexture( SDL_GPUCopyPass *copy_pass, const SDL_GPUTextureRegion *source, const SDL_GPUTextureTransferInfo *destination)
/// ```
///
/// See also:
/// - [SDL_DownloadFromGPUTexture - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_DownloadFromGPUTexture)
///
/// {@category gpu}
//void sdlDownloadFromGpuTexture(Pointer<SdlGpuCopyPass> copyPass, Pointer<SdlGpuTextureRegion> source, Pointer<SdlGpuTextureTransferInfo> destination) {
void sdlxDownloadFromGpuTexture(
  Pointer<SdlGpuCopyPass> copyPass,
  SdlxGpuTextureRegion source,
  SdlxGpuTextureTransferInfo destination,
) {
  final sourcePointer = source.calloc();
  final destinationPointer = destination.calloc();
  sdlDownloadFromGpuTexture(copyPass, sourcePointer, destinationPointer);
  sourcePointer.callocFree();
  destinationPointer.callocFree();
}

///
/// Copies data from a buffer to a transfer buffer on the GPU timeline.
///
/// This data is not guaranteed to be copied until the command buffer fence is
/// signaled.
///
/// \param copy_pass a copy pass handle.
/// \param source the source buffer with offset and size.
/// \param destination the destination transfer buffer with offset.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_DownloadFromGPUBuffer( SDL_GPUCopyPass *copy_pass, const SDL_GPUBufferRegion *source, const SDL_GPUTransferBufferLocation *destination)
/// ```
///
/// See also:
/// - [SDL_DownloadFromGPUBuffer - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_DownloadFromGPUBuffer)
///
/// {@category gpu}
void sdlxDownloadFromGpuBuffer(
  Pointer<SdlGpuCopyPass> copyPass,
  SdlxGpuBufferRegion source,
  SdlxGpuTransferBufferLocation destination,
) {
  final sourcePointer = source.calloc();
  final destinationPointer = destination.calloc();
  sdlDownloadFromGpuBuffer(copyPass, sourcePointer, destinationPointer);
  sourcePointer.callocFree();
  destinationPointer.callocFree();
}

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
///
/// See also:
/// - [SDL_BlitGPUTexture - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_BlitGPUTexture)
///
/// {@category gpu}
void sdlxBlitGpuTexture(
  Pointer<SdlGpuCommandBuffer> commandBuffer,
  SdlxGpuBlitInfo info,
) {
  final pointer = info.calloc();
  sdlBlitGpuTexture(commandBuffer, pointer);
  pointer.callocFree();
}

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
///
/// See also:
/// - [SDL_AcquireGPUSwapchainTexture - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_AcquireGPUSwapchainTexture)
///
/// {@category gpu}
({int height, Pointer<SdlGpuTexture> texture, int width})?
sdlxAcquireGpuSwapchainTexture(
  Pointer<SdlGpuCommandBuffer> commandBuffer,
  Pointer<SdlWindow> window,
) {
  Pointer<SdlGpuTexture> texture = nullptr;
  var width = 0;
  var height = 0;
  final texturePointer = calloc<Pointer<SdlGpuTexture>>();
  final widthPointer = calloc<Uint32>();
  final heightPointer = calloc<Uint32>();
  final bl = sdlAcquireGpuSwapchainTexture(
    commandBuffer,
    window,
    texturePointer,
    widthPointer,
    heightPointer,
  );
  if (bl) {
    texture = texturePointer.value;
    width = widthPointer.value;
    height = heightPointer.value;
  }
  texturePointer.callocFree();
  widthPointer.callocFree();
  heightPointer.callocFree();
  if (!bl) {
    return null;
  }
  return (texture: texture, width: width, height: height);
}

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
///
/// See also:
/// - [SDL_WaitAndAcquireGPUSwapchainTexture - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_WaitAndAcquireGPUSwapchainTexture)
///
/// {@category gpu}
({int height, Pointer<SdlGpuTexture> texture, int width})?
sdlxWaitAndAcquireGpuSwapchainTexture(
  Pointer<SdlGpuCommandBuffer> commandBuffer,
  Pointer<SdlWindow> window,
) {
  Pointer<SdlGpuTexture> texture = nullptr;
  var width = 0;
  var height = 0;
  final texturePointer = calloc<Pointer<SdlGpuTexture>>();
  final widthPointer = calloc<Uint32>();
  final heightPointer = calloc<Uint32>();
  final bl = sdlWaitAndAcquireGpuSwapchainTexture(
    commandBuffer,
    window,
    texturePointer,
    widthPointer,
    heightPointer,
  );
  if (bl) {
    texture = texturePointer.value;
    width = widthPointer.value;
    height = heightPointer.value;
  }
  texturePointer.callocFree();
  widthPointer.callocFree();
  heightPointer.callocFree();
  if (!bl) {
    return null;
  }
  return (texture: texture, width: width, height: height);
}

///
/// Blocks the thread until the given fences are signaled.
///
/// \param device a GPU context.
/// \param wait_all if 0, wait for any fence to be signaled, if 1, wait for all
/// fences to be signaled.
/// \param fences an array of fences to wait on.
/// \param num_fences the number of fences in the fences array.
/// \returns true on success, false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SubmitGPUCommandBufferAndAcquireFence
/// \sa SDL_WaitForGPUIdle
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_WaitForGPUFences( SDL_GPUDevice *device, bool wait_all, SDL_GPUFence *const *fences, Uint32 num_fences)
/// ```
///
/// See also:
/// - [SDL_WaitForGPUFences - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_WaitForGPUFences)
///
/// {@category gpu}
bool sdlxWaitForGpuFences(
  Pointer<SdlGpuDevice> device,
  List<Pointer<SdlGpuFence>> fences, {
  bool waitAll = true,
}) {
  bool result;
  final pointer = ffi.calloc<Pointer<SdlGpuFence>>(fences.length);
  for (var i = 0; i < fences.length; i++) {
    pointer[i] = fences[i];
  }
  result = sdlWaitForGpuFences(device, waitAll, pointer, fences.length);
  pointer.callocFree();
  return result;
}
