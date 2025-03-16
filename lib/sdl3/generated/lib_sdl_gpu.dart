// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Checks for GPU runtime support.
///
/// \param format_flags a bitflag indicating which shader formats the app is
/// able to provide.
/// \param name the preferred GPU driver, or NULL to let SDL pick the optimal
/// driver.
/// \returns true if supported, false otherwise.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CreateGPUDevice
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GPUSupportsShaderFormats( SDL_GPUShaderFormat format_flags, const char *name)
/// ```
bool sdlGpuSupportsShaderFormats(int formatFlags, String? name) {
  final sdlGpuSupportsShaderFormatsLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(Uint32 formatFlags, Pointer<Utf8> name),
    int Function(int formatFlags, Pointer<Utf8> name)
  >('SDL_GPUSupportsShaderFormats');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result =
      sdlGpuSupportsShaderFormatsLookupFunction(formatFlags, namePointer) == 1;
  calloc.free(namePointer);
  return result;
}

///
/// Checks for GPU runtime support.
///
/// \param props the properties to use.
/// \returns true if supported, false otherwise.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CreateGPUDeviceWithProperties
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GPUSupportsProperties( SDL_PropertiesID props)
/// ```
bool sdlGpuSupportsProperties(int props) {
  final sdlGpuSupportsPropertiesLookupFunction = libSdl3
      .lookupFunction<Uint8 Function(Uint32 props), int Function(int props)>(
        'SDL_GPUSupportsProperties',
      );
  return sdlGpuSupportsPropertiesLookupFunction(props) == 1;
}

///
/// Creates a GPU context.
///
/// \param format_flags a bitflag indicating which shader formats the app is
/// able to provide.
/// \param debug_mode enable debug mode properties and validations.
/// \param name the preferred GPU driver, or NULL to let SDL pick the optimal
/// driver.
/// \returns a GPU context on success or NULL on failure; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetGPUShaderFormats
/// \sa SDL_GetGPUDeviceDriver
/// \sa SDL_DestroyGPUDevice
/// \sa SDL_GPUSupportsShaderFormats
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUDevice * SDLCALL SDL_CreateGPUDevice( SDL_GPUShaderFormat format_flags, bool debug_mode, const char *name)
/// ```
Pointer<SdlGpuDevice> sdlCreateGpuDevice(
  int formatFlags,
  bool debugMode,
  String? name,
) {
  final sdlCreateGpuDeviceLookupFunction = libSdl3.lookupFunction<
    Pointer<SdlGpuDevice> Function(
      Uint32 formatFlags,
      Uint8 debugMode,
      Pointer<Utf8> name,
    ),
    Pointer<SdlGpuDevice> Function(
      int formatFlags,
      int debugMode,
      Pointer<Utf8> name,
    )
  >('SDL_CreateGPUDevice');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlCreateGpuDeviceLookupFunction(
    formatFlags,
    debugMode ? 1 : 0,
    namePointer,
  );
  calloc.free(namePointer);
  return result;
}

///
/// Creates a GPU context.
///
/// These are the supported properties:
///
/// - `SDL_PROP_GPU_DEVICE_CREATE_DEBUGMODE_BOOLEAN`: enable debug mode
/// properties and validations, defaults to true.
/// - `SDL_PROP_GPU_DEVICE_CREATE_PREFERLOWPOWER_BOOLEAN`: enable to prefer
/// energy efficiency over maximum GPU performance, defaults to false.
/// - `SDL_PROP_GPU_DEVICE_CREATE_NAME_STRING`: the name of the GPU driver to
/// use, if a specific one is desired.
///
/// These are the current shader format properties:
///
/// - `SDL_PROP_GPU_DEVICE_CREATE_SHADERS_PRIVATE_BOOLEAN`: The app is able to
/// provide shaders for an NDA platform.
/// - `SDL_PROP_GPU_DEVICE_CREATE_SHADERS_SPIRV_BOOLEAN`: The app is able to
/// provide SPIR-V shaders if applicable.
/// - `SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXBC_BOOLEAN`: The app is able to
/// provide DXBC shaders if applicable
/// - `SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXIL_BOOLEAN`: The app is able to
/// provide DXIL shaders if applicable.
/// - `SDL_PROP_GPU_DEVICE_CREATE_SHADERS_MSL_BOOLEAN`: The app is able to
/// provide MSL shaders if applicable.
/// - `SDL_PROP_GPU_DEVICE_CREATE_SHADERS_METALLIB_BOOLEAN`: The app is able to
/// provide Metal shader libraries if applicable.
///
/// With the D3D12 renderer:
///
/// - `SDL_PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING`: the prefix to
/// use for all vertex semantics, default is "TEXCOORD".
///
/// \param props the properties to use.
/// \returns a GPU context on success or NULL on failure; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetGPUShaderFormats
/// \sa SDL_GetGPUDeviceDriver
/// \sa SDL_DestroyGPUDevice
/// \sa SDL_GPUSupportsProperties
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUDevice * SDLCALL SDL_CreateGPUDeviceWithProperties( SDL_PropertiesID props)
/// ```
Pointer<SdlGpuDevice> sdlCreateGpuDeviceWithProperties(int props) {
  final sdlCreateGpuDeviceWithPropertiesLookupFunction = libSdl3.lookupFunction<
    Pointer<SdlGpuDevice> Function(Uint32 props),
    Pointer<SdlGpuDevice> Function(int props)
  >('SDL_CreateGPUDeviceWithProperties');
  return sdlCreateGpuDeviceWithPropertiesLookupFunction(props);
}

///
/// Destroys a GPU context previously returned by SDL_CreateGPUDevice.
///
/// \param device a GPU Context to destroy.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CreateGPUDevice
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_DestroyGPUDevice(SDL_GPUDevice *device)
/// ```
void sdlDestroyGpuDevice(Pointer<SdlGpuDevice> device) {
  final sdlDestroyGpuDeviceLookupFunction = libSdl3.lookupFunction<
    Void Function(Pointer<SdlGpuDevice> device),
    void Function(Pointer<SdlGpuDevice> device)
  >('SDL_DestroyGPUDevice');
  return sdlDestroyGpuDeviceLookupFunction(device);
}

///
/// Get the number of GPU drivers compiled into SDL.
///
/// \returns the number of built in GPU drivers.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetGPUDriver
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetNumGPUDrivers(void)
/// ```
int sdlGetNumGpuDrivers() {
  final sdlGetNumGpuDriversLookupFunction = libSdl3
      .lookupFunction<Int32 Function(), int Function()>('SDL_GetNumGPUDrivers');
  return sdlGetNumGpuDriversLookupFunction();
}

///
/// Get the name of a built in GPU driver.
///
/// The GPU drivers are presented in the order in which they are normally
/// checked during initialization.
///
/// The names of drivers are all simple, low-ASCII identifiers, like "vulkan",
/// "metal" or "direct3d12". These never have Unicode characters, and are not
/// meant to be proper names.
///
/// \param index the index of a GPU driver.
/// \returns the name of the GPU driver with the given **index**.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetNumGPUDrivers
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetGPUDriver(int index)
/// ```
String? sdlGetGpuDriver(int index) {
  final sdlGetGpuDriverLookupFunction = libSdl3.lookupFunction<
    Pointer<Utf8> Function(Int32 index),
    Pointer<Utf8> Function(int index)
  >('SDL_GetGPUDriver');
  final result = sdlGetGpuDriverLookupFunction(index);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Returns the name of the backend used to create this GPU context.
///
/// \param device a GPU context to query.
/// \returns the name of the device's driver, or NULL on error.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetGPUDeviceDriver(SDL_GPUDevice *device)
/// ```
String? sdlGetGpuDeviceDriver(Pointer<SdlGpuDevice> device) {
  final sdlGetGpuDeviceDriverLookupFunction = libSdl3.lookupFunction<
    Pointer<Utf8> Function(Pointer<SdlGpuDevice> device),
    Pointer<Utf8> Function(Pointer<SdlGpuDevice> device)
  >('SDL_GetGPUDeviceDriver');
  final result = sdlGetGpuDeviceDriverLookupFunction(device);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Returns the supported shader formats for this GPU context.
///
/// \param device a GPU context to query.
/// \returns a bitflag indicating which shader formats the driver is able to
/// consume.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUShaderFormat SDLCALL SDL_GetGPUShaderFormats(SDL_GPUDevice *device)
/// ```
int sdlGetGpuShaderFormats(Pointer<SdlGpuDevice> device) {
  final sdlGetGpuShaderFormatsLookupFunction = libSdl3.lookupFunction<
    Uint32 Function(Pointer<SdlGpuDevice> device),
    int Function(Pointer<SdlGpuDevice> device)
  >('SDL_GetGPUShaderFormats');
  return sdlGetGpuShaderFormatsLookupFunction(device);
}

///
/// Creates a pipeline object to be used in a compute workflow.
///
/// Shader resource bindings must be authored to follow a particular order
/// depending on the shader format.
///
/// For SPIR-V shaders, use the following resource sets:
///
/// - 0: Sampled textures, followed by read-only storage textures, followed by
/// read-only storage buffers
/// - 1: Read-write storage textures, followed by read-write storage buffers
/// - 2: Uniform buffers
///
/// For DXBC and DXIL shaders, use the following register order:
///
/// - (t[n], space0): Sampled textures, followed by read-only storage textures,
/// followed by read-only storage buffers
/// - (u[n], space1): Read-write storage textures, followed by read-write
/// storage buffers
/// - (b[n], space2): Uniform buffers
///
/// For MSL/metallib, use the following order:
///
/// - [[buffer]]: Uniform buffers, followed by read-only storage buffers,
/// followed by read-write storage buffers
/// - [[texture]]: Sampled textures, followed by read-only storage textures,
/// followed by read-write storage textures
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
Pointer<SdlGpuComputePipeline> sdlCreateGpuComputePipeline(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuComputePipelineCreateInfo> createinfo,
) {
  final sdlCreateGpuComputePipelineLookupFunction = libSdl3.lookupFunction<
    Pointer<SdlGpuComputePipeline> Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlGpuComputePipelineCreateInfo> createinfo,
    ),
    Pointer<SdlGpuComputePipeline> Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlGpuComputePipelineCreateInfo> createinfo,
    )
  >('SDL_CreateGPUComputePipeline');
  return sdlCreateGpuComputePipelineLookupFunction(device, createinfo);
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
Pointer<SdlGpuGraphicsPipeline> sdlCreateGpuGraphicsPipeline(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuGraphicsPipelineCreateInfo> createinfo,
) {
  final sdlCreateGpuGraphicsPipelineLookupFunction = libSdl3.lookupFunction<
    Pointer<SdlGpuGraphicsPipeline> Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlGpuGraphicsPipelineCreateInfo> createinfo,
    ),
    Pointer<SdlGpuGraphicsPipeline> Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlGpuGraphicsPipelineCreateInfo> createinfo,
    )
  >('SDL_CreateGPUGraphicsPipeline');
  return sdlCreateGpuGraphicsPipelineLookupFunction(device, createinfo);
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
Pointer<SdlGpuSampler> sdlCreateGpuSampler(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuSamplerCreateInfo> createinfo,
) {
  final sdlCreateGpuSamplerLookupFunction = libSdl3.lookupFunction<
    Pointer<SdlGpuSampler> Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlGpuSamplerCreateInfo> createinfo,
    ),
    Pointer<SdlGpuSampler> Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlGpuSamplerCreateInfo> createinfo,
    )
  >('SDL_CreateGPUSampler');
  return sdlCreateGpuSamplerLookupFunction(device, createinfo);
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
Pointer<SdlGpuShader> sdlCreateGpuShader(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuShaderCreateInfo> createinfo,
) {
  final sdlCreateGpuShaderLookupFunction = libSdl3.lookupFunction<
    Pointer<SdlGpuShader> Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlGpuShaderCreateInfo> createinfo,
    ),
    Pointer<SdlGpuShader> Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlGpuShaderCreateInfo> createinfo,
    )
  >('SDL_CreateGPUShader');
  return sdlCreateGpuShaderLookupFunction(device, createinfo);
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
/// - `SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_STENCIL_UINT8`: (Direct3D 12
/// only) if the texture usage is SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET,
/// clear the texture to a stencil of this value. Defaults to zero.
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
Pointer<SdlGpuTexture> sdlCreateGpuTexture(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuTextureCreateInfo> createinfo,
) {
  final sdlCreateGpuTextureLookupFunction = libSdl3.lookupFunction<
    Pointer<SdlGpuTexture> Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlGpuTextureCreateInfo> createinfo,
    ),
    Pointer<SdlGpuTexture> Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlGpuTextureCreateInfo> createinfo,
    )
  >('SDL_CreateGPUTexture');
  return sdlCreateGpuTextureLookupFunction(device, createinfo);
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
Pointer<SdlGpuBuffer> sdlCreateGpuBuffer(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuBufferCreateInfo> createinfo,
) {
  final sdlCreateGpuBufferLookupFunction = libSdl3.lookupFunction<
    Pointer<SdlGpuBuffer> Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlGpuBufferCreateInfo> createinfo,
    ),
    Pointer<SdlGpuBuffer> Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlGpuBufferCreateInfo> createinfo,
    )
  >('SDL_CreateGPUBuffer');
  return sdlCreateGpuBufferLookupFunction(device, createinfo);
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
Pointer<SdlGpuTransferBuffer> sdlCreateGpuTransferBuffer(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuTransferBufferCreateInfo> createinfo,
) {
  final sdlCreateGpuTransferBufferLookupFunction = libSdl3.lookupFunction<
    Pointer<SdlGpuTransferBuffer> Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlGpuTransferBufferCreateInfo> createinfo,
    ),
    Pointer<SdlGpuTransferBuffer> Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlGpuTransferBufferCreateInfo> createinfo,
    )
  >('SDL_CreateGPUTransferBuffer');
  return sdlCreateGpuTransferBufferLookupFunction(device, createinfo);
}

///
/// Sets an arbitrary string constant to label a buffer.
///
/// You should use SDL_PROP_GPU_BUFFER_CREATE_NAME_STRING with
/// SDL_CreateGPUBuffer instead of this function to avoid thread safety issues.
///
/// \param device a GPU Context.
/// \param buffer a buffer to attach the name to.
/// \param text a UTF-8 string constant to mark as the name of the buffer.
///
/// \threadsafety This function is not thread safe, you must make sure the
/// buffer is not simultaneously used by any other thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CreateGPUBuffer
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_SetGPUBufferName( SDL_GPUDevice *device, SDL_GPUBuffer *buffer, const char *text)
/// ```
void sdlSetGpuBufferName(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuBuffer> buffer,
  String? text,
) {
  final sdlSetGpuBufferNameLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlGpuBuffer> buffer,
      Pointer<Utf8> text,
    ),
    void Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlGpuBuffer> buffer,
      Pointer<Utf8> text,
    )
  >('SDL_SetGPUBufferName');
  final textPointer = text != null ? text.toNativeUtf8() : nullptr;
  final result = sdlSetGpuBufferNameLookupFunction(device, buffer, textPointer);
  calloc.free(textPointer);
  return result;
}

///
/// Sets an arbitrary string constant to label a texture.
///
/// You should use SDL_PROP_GPU_TEXTURE_CREATE_NAME_STRING with
/// SDL_CreateGPUTexture instead of this function to avoid thread safety
/// issues.
///
/// \param device a GPU Context.
/// \param texture a texture to attach the name to.
/// \param text a UTF-8 string constant to mark as the name of the texture.
///
/// \threadsafety This function is not thread safe, you must make sure the
/// texture is not simultaneously used by any other thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CreateGPUTexture
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_SetGPUTextureName( SDL_GPUDevice *device, SDL_GPUTexture *texture, const char *text)
/// ```
void sdlSetGpuTextureName(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuTexture> texture,
  String? text,
) {
  final sdlSetGpuTextureNameLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlGpuTexture> texture,
      Pointer<Utf8> text,
    ),
    void Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlGpuTexture> texture,
      Pointer<Utf8> text,
    )
  >('SDL_SetGPUTextureName');
  final textPointer = text != null ? text.toNativeUtf8() : nullptr;
  final result = sdlSetGpuTextureNameLookupFunction(
    device,
    texture,
    textPointer,
  );
  calloc.free(textPointer);
  return result;
}

///
/// Inserts an arbitrary string label into the command buffer callstream.
///
/// Useful for debugging.
///
/// \param command_buffer a command buffer.
/// \param text a UTF-8 string constant to insert as the label.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_InsertGPUDebugLabel( SDL_GPUCommandBuffer *command_buffer, const char *text)
/// ```
void sdlInsertGpuDebugLabel(
  Pointer<SdlGpuCommandBuffer> commandBuffer,
  String? text,
) {
  final sdlInsertGpuDebugLabelLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuCommandBuffer> commandBuffer,
      Pointer<Utf8> text,
    ),
    void Function(
      Pointer<SdlGpuCommandBuffer> commandBuffer,
      Pointer<Utf8> text,
    )
  >('SDL_InsertGPUDebugLabel');
  final textPointer = text != null ? text.toNativeUtf8() : nullptr;
  final result = sdlInsertGpuDebugLabelLookupFunction(
    commandBuffer,
    textPointer,
  );
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
void sdlPushGpuDebugGroup(
  Pointer<SdlGpuCommandBuffer> commandBuffer,
  String? name,
) {
  final sdlPushGpuDebugGroupLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuCommandBuffer> commandBuffer,
      Pointer<Utf8> name,
    ),
    void Function(
      Pointer<SdlGpuCommandBuffer> commandBuffer,
      Pointer<Utf8> name,
    )
  >('SDL_PushGPUDebugGroup');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlPushGpuDebugGroupLookupFunction(commandBuffer, namePointer);
  calloc.free(namePointer);
  return result;
}

///
/// Ends the most-recently pushed debug group.
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
void sdlPopGpuDebugGroup(Pointer<SdlGpuCommandBuffer> commandBuffer) {
  final sdlPopGpuDebugGroupLookupFunction = libSdl3.lookupFunction<
    Void Function(Pointer<SdlGpuCommandBuffer> commandBuffer),
    void Function(Pointer<SdlGpuCommandBuffer> commandBuffer)
  >('SDL_PopGPUDebugGroup');
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
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ReleaseGPUTexture( SDL_GPUDevice *device, SDL_GPUTexture *texture)
/// ```
void sdlReleaseGpuTexture(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuTexture> texture,
) {
  final sdlReleaseGpuTextureLookupFunction = libSdl3.lookupFunction<
    Void Function(Pointer<SdlGpuDevice> device, Pointer<SdlGpuTexture> texture),
    void Function(Pointer<SdlGpuDevice> device, Pointer<SdlGpuTexture> texture)
  >('SDL_ReleaseGPUTexture');
  return sdlReleaseGpuTextureLookupFunction(device, texture);
}

///
/// Frees the given sampler as soon as it is safe to do so.
///
/// You must not reference the sampler after calling this function.
///
/// \param device a GPU context.
/// \param sampler a sampler to be destroyed.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ReleaseGPUSampler( SDL_GPUDevice *device, SDL_GPUSampler *sampler)
/// ```
void sdlReleaseGpuSampler(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuSampler> sampler,
) {
  final sdlReleaseGpuSamplerLookupFunction = libSdl3.lookupFunction<
    Void Function(Pointer<SdlGpuDevice> device, Pointer<SdlGpuSampler> sampler),
    void Function(Pointer<SdlGpuDevice> device, Pointer<SdlGpuSampler> sampler)
  >('SDL_ReleaseGPUSampler');
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
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ReleaseGPUBuffer( SDL_GPUDevice *device, SDL_GPUBuffer *buffer)
/// ```
void sdlReleaseGpuBuffer(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuBuffer> buffer,
) {
  final sdlReleaseGpuBufferLookupFunction = libSdl3.lookupFunction<
    Void Function(Pointer<SdlGpuDevice> device, Pointer<SdlGpuBuffer> buffer),
    void Function(Pointer<SdlGpuDevice> device, Pointer<SdlGpuBuffer> buffer)
  >('SDL_ReleaseGPUBuffer');
  return sdlReleaseGpuBufferLookupFunction(device, buffer);
}

///
/// Frees the given transfer buffer as soon as it is safe to do so.
///
/// You must not reference the transfer buffer after calling this function.
///
/// \param device a GPU context.
/// \param transfer_buffer a transfer buffer to be destroyed.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ReleaseGPUTransferBuffer( SDL_GPUDevice *device, SDL_GPUTransferBuffer *transfer_buffer)
/// ```
void sdlReleaseGpuTransferBuffer(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuTransferBuffer> transferBuffer,
) {
  final sdlReleaseGpuTransferBufferLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlGpuTransferBuffer> transferBuffer,
    ),
    void Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlGpuTransferBuffer> transferBuffer,
    )
  >('SDL_ReleaseGPUTransferBuffer');
  return sdlReleaseGpuTransferBufferLookupFunction(device, transferBuffer);
}

///
/// Frees the given compute pipeline as soon as it is safe to do so.
///
/// You must not reference the compute pipeline after calling this function.
///
/// \param device a GPU context.
/// \param compute_pipeline a compute pipeline to be destroyed.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ReleaseGPUComputePipeline( SDL_GPUDevice *device, SDL_GPUComputePipeline *compute_pipeline)
/// ```
void sdlReleaseGpuComputePipeline(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuComputePipeline> computePipeline,
) {
  final sdlReleaseGpuComputePipelineLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlGpuComputePipeline> computePipeline,
    ),
    void Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlGpuComputePipeline> computePipeline,
    )
  >('SDL_ReleaseGPUComputePipeline');
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
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ReleaseGPUShader( SDL_GPUDevice *device, SDL_GPUShader *shader)
/// ```
void sdlReleaseGpuShader(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuShader> shader,
) {
  final sdlReleaseGpuShaderLookupFunction = libSdl3.lookupFunction<
    Void Function(Pointer<SdlGpuDevice> device, Pointer<SdlGpuShader> shader),
    void Function(Pointer<SdlGpuDevice> device, Pointer<SdlGpuShader> shader)
  >('SDL_ReleaseGPUShader');
  return sdlReleaseGpuShaderLookupFunction(device, shader);
}

///
/// Frees the given graphics pipeline as soon as it is safe to do so.
///
/// You must not reference the graphics pipeline after calling this function.
///
/// \param device a GPU context.
/// \param graphics_pipeline a graphics pipeline to be destroyed.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ReleaseGPUGraphicsPipeline( SDL_GPUDevice *device, SDL_GPUGraphicsPipeline *graphics_pipeline)
/// ```
void sdlReleaseGpuGraphicsPipeline(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuGraphicsPipeline> graphicsPipeline,
) {
  final sdlReleaseGpuGraphicsPipelineLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlGpuGraphicsPipeline> graphicsPipeline,
    ),
    void Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlGpuGraphicsPipeline> graphicsPipeline,
    )
  >('SDL_ReleaseGPUGraphicsPipeline');
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
/// It is valid to acquire multiple command buffers on the same thread at once.
/// In fact a common design pattern is to acquire two command buffers per frame
/// where one is dedicated to render and compute passes and the other is
/// dedicated to copy passes and other preparatory work such as generating
/// mipmaps. Interleaving commands between the two command buffers reduces the
/// total amount of passes overall which improves rendering performance.
///
/// \param device a GPU context.
/// \returns a command buffer, or NULL on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SubmitGPUCommandBuffer
/// \sa SDL_SubmitGPUCommandBufferAndAcquireFence
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUCommandBuffer * SDLCALL SDL_AcquireGPUCommandBuffer( SDL_GPUDevice *device)
/// ```
Pointer<SdlGpuCommandBuffer> sdlAcquireGpuCommandBuffer(
  Pointer<SdlGpuDevice> device,
) {
  final sdlAcquireGpuCommandBufferLookupFunction = libSdl3.lookupFunction<
    Pointer<SdlGpuCommandBuffer> Function(Pointer<SdlGpuDevice> device),
    Pointer<SdlGpuCommandBuffer> Function(Pointer<SdlGpuDevice> device)
  >('SDL_AcquireGPUCommandBuffer');
  return sdlAcquireGpuCommandBufferLookupFunction(device);
}

///
/// Pushes data to a vertex uniform slot on the command buffer.
///
/// Subsequent draw calls will use this uniform data.
///
/// The data being pushed must respect std140 layout conventions. In practical
/// terms this means you must ensure that vec3 and vec4 fields are 16-byte
/// aligned.
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
void sdlPushGpuVertexUniformData(
  Pointer<SdlGpuCommandBuffer> commandBuffer,
  int slotIndex,
  Pointer<NativeType> data,
  int length,
) {
  final sdlPushGpuVertexUniformDataLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuCommandBuffer> commandBuffer,
      Uint32 slotIndex,
      Pointer<NativeType> data,
      Uint32 length,
    ),
    void Function(
      Pointer<SdlGpuCommandBuffer> commandBuffer,
      int slotIndex,
      Pointer<NativeType> data,
      int length,
    )
  >('SDL_PushGPUVertexUniformData');
  return sdlPushGpuVertexUniformDataLookupFunction(
    commandBuffer,
    slotIndex,
    data,
    length,
  );
}

///
/// Pushes data to a fragment uniform slot on the command buffer.
///
/// Subsequent draw calls will use this uniform data.
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
void sdlPushGpuFragmentUniformData(
  Pointer<SdlGpuCommandBuffer> commandBuffer,
  int slotIndex,
  Pointer<NativeType> data,
  int length,
) {
  final sdlPushGpuFragmentUniformDataLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuCommandBuffer> commandBuffer,
      Uint32 slotIndex,
      Pointer<NativeType> data,
      Uint32 length,
    ),
    void Function(
      Pointer<SdlGpuCommandBuffer> commandBuffer,
      int slotIndex,
      Pointer<NativeType> data,
      int length,
    )
  >('SDL_PushGPUFragmentUniformData');
  return sdlPushGpuFragmentUniformDataLookupFunction(
    commandBuffer,
    slotIndex,
    data,
    length,
  );
}

///
/// Pushes data to a uniform slot on the command buffer.
///
/// Subsequent draw calls will use this uniform data.
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
void sdlPushGpuComputeUniformData(
  Pointer<SdlGpuCommandBuffer> commandBuffer,
  int slotIndex,
  Pointer<NativeType> data,
  int length,
) {
  final sdlPushGpuComputeUniformDataLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuCommandBuffer> commandBuffer,
      Uint32 slotIndex,
      Pointer<NativeType> data,
      Uint32 length,
    ),
    void Function(
      Pointer<SdlGpuCommandBuffer> commandBuffer,
      int slotIndex,
      Pointer<NativeType> data,
      int length,
    )
  >('SDL_PushGPUComputeUniformData');
  return sdlPushGpuComputeUniformDataLookupFunction(
    commandBuffer,
    slotIndex,
    data,
    length,
  );
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
Pointer<SdlGpuRenderPass> sdlBeginGpuRenderPass(
  Pointer<SdlGpuCommandBuffer> commandBuffer,
  Pointer<SdlGpuColorTargetInfo> colorTargetInfos,
  int numColorTargets,
  Pointer<SdlGpuDepthStencilTargetInfo> depthStencilTargetInfo,
) {
  final sdlBeginGpuRenderPassLookupFunction = libSdl3.lookupFunction<
    Pointer<SdlGpuRenderPass> Function(
      Pointer<SdlGpuCommandBuffer> commandBuffer,
      Pointer<SdlGpuColorTargetInfo> colorTargetInfos,
      Uint32 numColorTargets,
      Pointer<SdlGpuDepthStencilTargetInfo> depthStencilTargetInfo,
    ),
    Pointer<SdlGpuRenderPass> Function(
      Pointer<SdlGpuCommandBuffer> commandBuffer,
      Pointer<SdlGpuColorTargetInfo> colorTargetInfos,
      int numColorTargets,
      Pointer<SdlGpuDepthStencilTargetInfo> depthStencilTargetInfo,
    )
  >('SDL_BeginGPURenderPass');
  return sdlBeginGpuRenderPassLookupFunction(
    commandBuffer,
    colorTargetInfos,
    numColorTargets,
    depthStencilTargetInfo,
  );
}

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
void sdlBindGpuGraphicsPipeline(
  Pointer<SdlGpuRenderPass> renderPass,
  Pointer<SdlGpuGraphicsPipeline> graphicsPipeline,
) {
  final sdlBindGpuGraphicsPipelineLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuRenderPass> renderPass,
      Pointer<SdlGpuGraphicsPipeline> graphicsPipeline,
    ),
    void Function(
      Pointer<SdlGpuRenderPass> renderPass,
      Pointer<SdlGpuGraphicsPipeline> graphicsPipeline,
    )
  >('SDL_BindGPUGraphicsPipeline');
  return sdlBindGpuGraphicsPipelineLookupFunction(renderPass, graphicsPipeline);
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
void sdlSetGpuViewport(
  Pointer<SdlGpuRenderPass> renderPass,
  Pointer<SdlGpuViewport> viewport,
) {
  final sdlSetGpuViewportLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuRenderPass> renderPass,
      Pointer<SdlGpuViewport> viewport,
    ),
    void Function(
      Pointer<SdlGpuRenderPass> renderPass,
      Pointer<SdlGpuViewport> viewport,
    )
  >('SDL_SetGPUViewport');
  return sdlSetGpuViewportLookupFunction(renderPass, viewport);
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
void sdlSetGpuScissor(
  Pointer<SdlGpuRenderPass> renderPass,
  Pointer<SdlRect> scissor,
) {
  final sdlSetGpuScissorLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuRenderPass> renderPass,
      Pointer<SdlRect> scissor,
    ),
    void Function(
      Pointer<SdlGpuRenderPass> renderPass,
      Pointer<SdlRect> scissor,
    )
  >('SDL_SetGPUScissor');
  return sdlSetGpuScissorLookupFunction(renderPass, scissor);
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
void sdlSetGpuBlendConstants(
  Pointer<SdlGpuRenderPass> renderPass,
  SdlFColor blendAnts,
) {
  final sdlSetGpuBlendConstantsLookupFunction = libSdl3.lookupFunction<
    Void Function(Pointer<SdlGpuRenderPass> renderPass, SdlFColor blendAnts),
    void Function(Pointer<SdlGpuRenderPass> renderPass, SdlFColor blendAnts)
  >('SDL_SetGPUBlendConstants');
  return sdlSetGpuBlendConstantsLookupFunction(renderPass, blendAnts);
}

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
void sdlSetGpuStencilReference(
  Pointer<SdlGpuRenderPass> renderPass,
  int reference,
) {
  final sdlSetGpuStencilReferenceLookupFunction = libSdl3.lookupFunction<
    Void Function(Pointer<SdlGpuRenderPass> renderPass, Uint8 reference),
    void Function(Pointer<SdlGpuRenderPass> renderPass, int reference)
  >('SDL_SetGPUStencilReference');
  return sdlSetGpuStencilReferenceLookupFunction(renderPass, reference);
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
void sdlBindGpuVertexBuffers(
  Pointer<SdlGpuRenderPass> renderPass,
  int firstSlot,
  Pointer<SdlGpuBufferBinding> bindings,
  int numBindings,
) {
  final sdlBindGpuVertexBuffersLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuRenderPass> renderPass,
      Uint32 firstSlot,
      Pointer<SdlGpuBufferBinding> bindings,
      Uint32 numBindings,
    ),
    void Function(
      Pointer<SdlGpuRenderPass> renderPass,
      int firstSlot,
      Pointer<SdlGpuBufferBinding> bindings,
      int numBindings,
    )
  >('SDL_BindGPUVertexBuffers');
  return sdlBindGpuVertexBuffersLookupFunction(
    renderPass,
    firstSlot,
    bindings,
    numBindings,
  );
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
void sdlBindGpuIndexBuffer(
  Pointer<SdlGpuRenderPass> renderPass,
  Pointer<SdlGpuBufferBinding> binding,
  int indexElementSize,
) {
  final sdlBindGpuIndexBufferLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuRenderPass> renderPass,
      Pointer<SdlGpuBufferBinding> binding,
      Int32 indexElementSize,
    ),
    void Function(
      Pointer<SdlGpuRenderPass> renderPass,
      Pointer<SdlGpuBufferBinding> binding,
      int indexElementSize,
    )
  >('SDL_BindGPUIndexBuffer');
  return sdlBindGpuIndexBufferLookupFunction(
    renderPass,
    binding,
    indexElementSize,
  );
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
void sdlBindGpuVertexSamplers(
  Pointer<SdlGpuRenderPass> renderPass,
  int firstSlot,
  Pointer<SdlGpuTextureSamplerBinding> textureSamplerBindings,
  int numBindings,
) {
  final sdlBindGpuVertexSamplersLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuRenderPass> renderPass,
      Uint32 firstSlot,
      Pointer<SdlGpuTextureSamplerBinding> textureSamplerBindings,
      Uint32 numBindings,
    ),
    void Function(
      Pointer<SdlGpuRenderPass> renderPass,
      int firstSlot,
      Pointer<SdlGpuTextureSamplerBinding> textureSamplerBindings,
      int numBindings,
    )
  >('SDL_BindGPUVertexSamplers');
  return sdlBindGpuVertexSamplersLookupFunction(
    renderPass,
    firstSlot,
    textureSamplerBindings,
    numBindings,
  );
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
void sdlBindGpuVertexStorageTextures(
  Pointer<SdlGpuRenderPass> renderPass,
  int firstSlot,
  Pointer<Pointer<SdlGpuTexture>> storageTextures,
  int numBindings,
) {
  final sdlBindGpuVertexStorageTexturesLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuRenderPass> renderPass,
      Uint32 firstSlot,
      Pointer<Pointer<SdlGpuTexture>> storageTextures,
      Uint32 numBindings,
    ),
    void Function(
      Pointer<SdlGpuRenderPass> renderPass,
      int firstSlot,
      Pointer<Pointer<SdlGpuTexture>> storageTextures,
      int numBindings,
    )
  >('SDL_BindGPUVertexStorageTextures');
  return sdlBindGpuVertexStorageTexturesLookupFunction(
    renderPass,
    firstSlot,
    storageTextures,
    numBindings,
  );
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
void sdlBindGpuVertexStorageBuffers(
  Pointer<SdlGpuRenderPass> renderPass,
  int firstSlot,
  Pointer<Pointer<SdlGpuBuffer>> storageBuffers,
  int numBindings,
) {
  final sdlBindGpuVertexStorageBuffersLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuRenderPass> renderPass,
      Uint32 firstSlot,
      Pointer<Pointer<SdlGpuBuffer>> storageBuffers,
      Uint32 numBindings,
    ),
    void Function(
      Pointer<SdlGpuRenderPass> renderPass,
      int firstSlot,
      Pointer<Pointer<SdlGpuBuffer>> storageBuffers,
      int numBindings,
    )
  >('SDL_BindGPUVertexStorageBuffers');
  return sdlBindGpuVertexStorageBuffersLookupFunction(
    renderPass,
    firstSlot,
    storageBuffers,
    numBindings,
  );
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
void sdlBindGpuFragmentSamplers(
  Pointer<SdlGpuRenderPass> renderPass,
  int firstSlot,
  Pointer<SdlGpuTextureSamplerBinding> textureSamplerBindings,
  int numBindings,
) {
  final sdlBindGpuFragmentSamplersLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuRenderPass> renderPass,
      Uint32 firstSlot,
      Pointer<SdlGpuTextureSamplerBinding> textureSamplerBindings,
      Uint32 numBindings,
    ),
    void Function(
      Pointer<SdlGpuRenderPass> renderPass,
      int firstSlot,
      Pointer<SdlGpuTextureSamplerBinding> textureSamplerBindings,
      int numBindings,
    )
  >('SDL_BindGPUFragmentSamplers');
  return sdlBindGpuFragmentSamplersLookupFunction(
    renderPass,
    firstSlot,
    textureSamplerBindings,
    numBindings,
  );
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
void sdlBindGpuFragmentStorageTextures(
  Pointer<SdlGpuRenderPass> renderPass,
  int firstSlot,
  Pointer<Pointer<SdlGpuTexture>> storageTextures,
  int numBindings,
) {
  final sdlBindGpuFragmentStorageTexturesLookupFunction = libSdl3
      .lookupFunction<
        Void Function(
          Pointer<SdlGpuRenderPass> renderPass,
          Uint32 firstSlot,
          Pointer<Pointer<SdlGpuTexture>> storageTextures,
          Uint32 numBindings,
        ),
        void Function(
          Pointer<SdlGpuRenderPass> renderPass,
          int firstSlot,
          Pointer<Pointer<SdlGpuTexture>> storageTextures,
          int numBindings,
        )
      >('SDL_BindGPUFragmentStorageTextures');
  return sdlBindGpuFragmentStorageTexturesLookupFunction(
    renderPass,
    firstSlot,
    storageTextures,
    numBindings,
  );
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
void sdlBindGpuFragmentStorageBuffers(
  Pointer<SdlGpuRenderPass> renderPass,
  int firstSlot,
  Pointer<Pointer<SdlGpuBuffer>> storageBuffers,
  int numBindings,
) {
  final sdlBindGpuFragmentStorageBuffersLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuRenderPass> renderPass,
      Uint32 firstSlot,
      Pointer<Pointer<SdlGpuBuffer>> storageBuffers,
      Uint32 numBindings,
    ),
    void Function(
      Pointer<SdlGpuRenderPass> renderPass,
      int firstSlot,
      Pointer<Pointer<SdlGpuBuffer>> storageBuffers,
      int numBindings,
    )
  >('SDL_BindGPUFragmentStorageBuffers');
  return sdlBindGpuFragmentStorageBuffersLookupFunction(
    renderPass,
    firstSlot,
    storageBuffers,
    numBindings,
  );
}

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
void sdlDrawGpuIndexedPrimitives(
  Pointer<SdlGpuRenderPass> renderPass,
  int numIndices,
  int numInstances,
  int firstIndex,
  int vertexOffset,
  int firstInstance,
) {
  final sdlDrawGpuIndexedPrimitivesLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuRenderPass> renderPass,
      Uint32 numIndices,
      Uint32 numInstances,
      Uint32 firstIndex,
      Int32 vertexOffset,
      Uint32 firstInstance,
    ),
    void Function(
      Pointer<SdlGpuRenderPass> renderPass,
      int numIndices,
      int numInstances,
      int firstIndex,
      int vertexOffset,
      int firstInstance,
    )
  >('SDL_DrawGPUIndexedPrimitives');
  return sdlDrawGpuIndexedPrimitivesLookupFunction(
    renderPass,
    numIndices,
    numInstances,
    firstIndex,
    vertexOffset,
    firstInstance,
  );
}

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
void sdlDrawGpuPrimitives(
  Pointer<SdlGpuRenderPass> renderPass,
  int numVertices,
  int numInstances,
  int firstVertex,
  int firstInstance,
) {
  final sdlDrawGpuPrimitivesLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuRenderPass> renderPass,
      Uint32 numVertices,
      Uint32 numInstances,
      Uint32 firstVertex,
      Uint32 firstInstance,
    ),
    void Function(
      Pointer<SdlGpuRenderPass> renderPass,
      int numVertices,
      int numInstances,
      int firstVertex,
      int firstInstance,
    )
  >('SDL_DrawGPUPrimitives');
  return sdlDrawGpuPrimitivesLookupFunction(
    renderPass,
    numVertices,
    numInstances,
    firstVertex,
    firstInstance,
  );
}

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
void sdlDrawGpuPrimitivesIndirect(
  Pointer<SdlGpuRenderPass> renderPass,
  Pointer<SdlGpuBuffer> buffer,
  int offset,
  int drawCount,
) {
  final sdlDrawGpuPrimitivesIndirectLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuRenderPass> renderPass,
      Pointer<SdlGpuBuffer> buffer,
      Uint32 offset,
      Uint32 drawCount,
    ),
    void Function(
      Pointer<SdlGpuRenderPass> renderPass,
      Pointer<SdlGpuBuffer> buffer,
      int offset,
      int drawCount,
    )
  >('SDL_DrawGPUPrimitivesIndirect');
  return sdlDrawGpuPrimitivesIndirectLookupFunction(
    renderPass,
    buffer,
    offset,
    drawCount,
  );
}

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
void sdlDrawGpuIndexedPrimitivesIndirect(
  Pointer<SdlGpuRenderPass> renderPass,
  Pointer<SdlGpuBuffer> buffer,
  int offset,
  int drawCount,
) {
  final sdlDrawGpuIndexedPrimitivesIndirectLookupFunction = libSdl3
      .lookupFunction<
        Void Function(
          Pointer<SdlGpuRenderPass> renderPass,
          Pointer<SdlGpuBuffer> buffer,
          Uint32 offset,
          Uint32 drawCount,
        ),
        void Function(
          Pointer<SdlGpuRenderPass> renderPass,
          Pointer<SdlGpuBuffer> buffer,
          int offset,
          int drawCount,
        )
      >('SDL_DrawGPUIndexedPrimitivesIndirect');
  return sdlDrawGpuIndexedPrimitivesIndirectLookupFunction(
    renderPass,
    buffer,
    offset,
    drawCount,
  );
}

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
void sdlEndGpuRenderPass(Pointer<SdlGpuRenderPass> renderPass) {
  final sdlEndGpuRenderPassLookupFunction = libSdl3.lookupFunction<
    Void Function(Pointer<SdlGpuRenderPass> renderPass),
    void Function(Pointer<SdlGpuRenderPass> renderPass)
  >('SDL_EndGPURenderPass');
  return sdlEndGpuRenderPassLookupFunction(renderPass);
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
Pointer<SdlGpuComputePass> sdlBeginGpuComputePass(
  Pointer<SdlGpuCommandBuffer> commandBuffer,
  Pointer<SdlGpuStorageTextureReadWriteBinding> storageTextureBindings,
  int numStorageTextureBindings,
  Pointer<SdlGpuStorageBufferReadWriteBinding> storageBufferBindings,
  int numStorageBufferBindings,
) {
  final sdlBeginGpuComputePassLookupFunction = libSdl3.lookupFunction<
    Pointer<SdlGpuComputePass> Function(
      Pointer<SdlGpuCommandBuffer> commandBuffer,
      Pointer<SdlGpuStorageTextureReadWriteBinding> storageTextureBindings,
      Uint32 numStorageTextureBindings,
      Pointer<SdlGpuStorageBufferReadWriteBinding> storageBufferBindings,
      Uint32 numStorageBufferBindings,
    ),
    Pointer<SdlGpuComputePass> Function(
      Pointer<SdlGpuCommandBuffer> commandBuffer,
      Pointer<SdlGpuStorageTextureReadWriteBinding> storageTextureBindings,
      int numStorageTextureBindings,
      Pointer<SdlGpuStorageBufferReadWriteBinding> storageBufferBindings,
      int numStorageBufferBindings,
    )
  >('SDL_BeginGPUComputePass');
  return sdlBeginGpuComputePassLookupFunction(
    commandBuffer,
    storageTextureBindings,
    numStorageTextureBindings,
    storageBufferBindings,
    numStorageBufferBindings,
  );
}

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
void sdlBindGpuComputePipeline(
  Pointer<SdlGpuComputePass> computePass,
  Pointer<SdlGpuComputePipeline> computePipeline,
) {
  final sdlBindGpuComputePipelineLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuComputePass> computePass,
      Pointer<SdlGpuComputePipeline> computePipeline,
    ),
    void Function(
      Pointer<SdlGpuComputePass> computePass,
      Pointer<SdlGpuComputePipeline> computePipeline,
    )
  >('SDL_BindGPUComputePipeline');
  return sdlBindGpuComputePipelineLookupFunction(computePass, computePipeline);
}

///
/// Binds texture-sampler pairs for use on the compute shader.
///
/// The textures must have been created with SDL_GPU_TEXTUREUSAGE_SAMPLER.
///
/// Be sure your shader is set up according to the requirements documented in
/// SDL_CreateGPUShader().
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
/// \sa SDL_CreateGPUShader
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_BindGPUComputeSamplers( SDL_GPUComputePass *compute_pass, Uint32 first_slot, const SDL_GPUTextureSamplerBinding *texture_sampler_bindings, Uint32 num_bindings)
/// ```
void sdlBindGpuComputeSamplers(
  Pointer<SdlGpuComputePass> computePass,
  int firstSlot,
  Pointer<SdlGpuTextureSamplerBinding> textureSamplerBindings,
  int numBindings,
) {
  final sdlBindGpuComputeSamplersLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuComputePass> computePass,
      Uint32 firstSlot,
      Pointer<SdlGpuTextureSamplerBinding> textureSamplerBindings,
      Uint32 numBindings,
    ),
    void Function(
      Pointer<SdlGpuComputePass> computePass,
      int firstSlot,
      Pointer<SdlGpuTextureSamplerBinding> textureSamplerBindings,
      int numBindings,
    )
  >('SDL_BindGPUComputeSamplers');
  return sdlBindGpuComputeSamplersLookupFunction(
    computePass,
    firstSlot,
    textureSamplerBindings,
    numBindings,
  );
}

///
/// Binds storage textures as readonly for use on the compute pipeline.
///
/// These textures must have been created with
/// SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ.
///
/// Be sure your shader is set up according to the requirements documented in
/// SDL_CreateGPUShader().
///
/// \param compute_pass a compute pass handle.
/// \param first_slot the compute storage texture slot to begin binding from.
/// \param storage_textures an array of storage textures.
/// \param num_bindings the number of storage textures to bind from the array.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CreateGPUShader
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_BindGPUComputeStorageTextures( SDL_GPUComputePass *compute_pass, Uint32 first_slot, SDL_GPUTexture *const *storage_textures, Uint32 num_bindings)
/// ```
void sdlBindGpuComputeStorageTextures(
  Pointer<SdlGpuComputePass> computePass,
  int firstSlot,
  Pointer<Pointer<SdlGpuTexture>> storageTextures,
  int numBindings,
) {
  final sdlBindGpuComputeStorageTexturesLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuComputePass> computePass,
      Uint32 firstSlot,
      Pointer<Pointer<SdlGpuTexture>> storageTextures,
      Uint32 numBindings,
    ),
    void Function(
      Pointer<SdlGpuComputePass> computePass,
      int firstSlot,
      Pointer<Pointer<SdlGpuTexture>> storageTextures,
      int numBindings,
    )
  >('SDL_BindGPUComputeStorageTextures');
  return sdlBindGpuComputeStorageTexturesLookupFunction(
    computePass,
    firstSlot,
    storageTextures,
    numBindings,
  );
}

///
/// Binds storage buffers as readonly for use on the compute pipeline.
///
/// These buffers must have been created with
/// SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ.
///
/// Be sure your shader is set up according to the requirements documented in
/// SDL_CreateGPUShader().
///
/// \param compute_pass a compute pass handle.
/// \param first_slot the compute storage buffer slot to begin binding from.
/// \param storage_buffers an array of storage buffer binding structs.
/// \param num_bindings the number of storage buffers to bind from the array.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CreateGPUShader
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_BindGPUComputeStorageBuffers( SDL_GPUComputePass *compute_pass, Uint32 first_slot, SDL_GPUBuffer *const *storage_buffers, Uint32 num_bindings)
/// ```
void sdlBindGpuComputeStorageBuffers(
  Pointer<SdlGpuComputePass> computePass,
  int firstSlot,
  Pointer<Pointer<SdlGpuBuffer>> storageBuffers,
  int numBindings,
) {
  final sdlBindGpuComputeStorageBuffersLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuComputePass> computePass,
      Uint32 firstSlot,
      Pointer<Pointer<SdlGpuBuffer>> storageBuffers,
      Uint32 numBindings,
    ),
    void Function(
      Pointer<SdlGpuComputePass> computePass,
      int firstSlot,
      Pointer<Pointer<SdlGpuBuffer>> storageBuffers,
      int numBindings,
    )
  >('SDL_BindGPUComputeStorageBuffers');
  return sdlBindGpuComputeStorageBuffersLookupFunction(
    computePass,
    firstSlot,
    storageBuffers,
    numBindings,
  );
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
void sdlDispatchGpuCompute(
  Pointer<SdlGpuComputePass> computePass,
  int groupcountX,
  int groupcountY,
  int groupcountZ,
) {
  final sdlDispatchGpuComputeLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuComputePass> computePass,
      Uint32 groupcountX,
      Uint32 groupcountY,
      Uint32 groupcountZ,
    ),
    void Function(
      Pointer<SdlGpuComputePass> computePass,
      int groupcountX,
      int groupcountY,
      int groupcountZ,
    )
  >('SDL_DispatchGPUCompute');
  return sdlDispatchGpuComputeLookupFunction(
    computePass,
    groupcountX,
    groupcountY,
    groupcountZ,
  );
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
/// \param compute_pass a compute pass handle.
/// \param buffer a buffer containing dispatch parameters.
/// \param offset the offset to start reading from the dispatch buffer.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_DispatchGPUComputeIndirect( SDL_GPUComputePass *compute_pass, SDL_GPUBuffer *buffer, Uint32 offset)
/// ```
void sdlDispatchGpuComputeIndirect(
  Pointer<SdlGpuComputePass> computePass,
  Pointer<SdlGpuBuffer> buffer,
  int offset,
) {
  final sdlDispatchGpuComputeIndirectLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuComputePass> computePass,
      Pointer<SdlGpuBuffer> buffer,
      Uint32 offset,
    ),
    void Function(
      Pointer<SdlGpuComputePass> computePass,
      Pointer<SdlGpuBuffer> buffer,
      int offset,
    )
  >('SDL_DispatchGPUComputeIndirect');
  return sdlDispatchGpuComputeIndirectLookupFunction(
    computePass,
    buffer,
    offset,
  );
}

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
void sdlEndGpuComputePass(Pointer<SdlGpuComputePass> computePass) {
  final sdlEndGpuComputePassLookupFunction = libSdl3.lookupFunction<
    Void Function(Pointer<SdlGpuComputePass> computePass),
    void Function(Pointer<SdlGpuComputePass> computePass)
  >('SDL_EndGPUComputePass');
  return sdlEndGpuComputePassLookupFunction(computePass);
}

///
/// Maps a transfer buffer into application address space.
///
/// You must unmap the transfer buffer before encoding upload commands. The
/// memory is owned by the graphics driver - do NOT call SDL_free() on the
/// returned pointer.
///
/// \param device a GPU context.
/// \param transfer_buffer a transfer buffer.
/// \param cycle if true, cycles the transfer buffer if it is already bound.
/// \returns the address of the mapped transfer buffer memory, or NULL on
/// failure; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void * SDLCALL SDL_MapGPUTransferBuffer( SDL_GPUDevice *device, SDL_GPUTransferBuffer *transfer_buffer, bool cycle)
/// ```
Pointer<NativeType> sdlMapGpuTransferBuffer(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuTransferBuffer> transferBuffer,
  bool cycle,
) {
  final sdlMapGpuTransferBufferLookupFunction = libSdl3.lookupFunction<
    Pointer<NativeType> Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlGpuTransferBuffer> transferBuffer,
      Uint8 cycle,
    ),
    Pointer<NativeType> Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlGpuTransferBuffer> transferBuffer,
      int cycle,
    )
  >('SDL_MapGPUTransferBuffer');
  return sdlMapGpuTransferBufferLookupFunction(
    device,
    transferBuffer,
    cycle ? 1 : 0,
  );
}

///
/// Unmaps a previously mapped transfer buffer.
///
/// \param device a GPU context.
/// \param transfer_buffer a previously mapped transfer buffer.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_UnmapGPUTransferBuffer( SDL_GPUDevice *device, SDL_GPUTransferBuffer *transfer_buffer)
/// ```
void sdlUnmapGpuTransferBuffer(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuTransferBuffer> transferBuffer,
) {
  final sdlUnmapGpuTransferBufferLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlGpuTransferBuffer> transferBuffer,
    ),
    void Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlGpuTransferBuffer> transferBuffer,
    )
  >('SDL_UnmapGPUTransferBuffer');
  return sdlUnmapGpuTransferBufferLookupFunction(device, transferBuffer);
}

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
/// ```c
/// extern SDL_DECLSPEC SDL_GPUCopyPass * SDLCALL SDL_BeginGPUCopyPass( SDL_GPUCommandBuffer *command_buffer)
/// ```
Pointer<SdlGpuCopyPass> sdlBeginGpuCopyPass(
  Pointer<SdlGpuCommandBuffer> commandBuffer,
) {
  final sdlBeginGpuCopyPassLookupFunction = libSdl3.lookupFunction<
    Pointer<SdlGpuCopyPass> Function(
      Pointer<SdlGpuCommandBuffer> commandBuffer,
    ),
    Pointer<SdlGpuCopyPass> Function(Pointer<SdlGpuCommandBuffer> commandBuffer)
  >('SDL_BeginGPUCopyPass');
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
void sdlUploadToGpuTexture(
  Pointer<SdlGpuCopyPass> copyPass,
  Pointer<SdlGpuTextureTransferInfo> source,
  Pointer<SdlGpuTextureRegion> destination,
  bool cycle,
) {
  final sdlUploadToGpuTextureLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuCopyPass> copyPass,
      Pointer<SdlGpuTextureTransferInfo> source,
      Pointer<SdlGpuTextureRegion> destination,
      Uint8 cycle,
    ),
    void Function(
      Pointer<SdlGpuCopyPass> copyPass,
      Pointer<SdlGpuTextureTransferInfo> source,
      Pointer<SdlGpuTextureRegion> destination,
      int cycle,
    )
  >('SDL_UploadToGPUTexture');
  return sdlUploadToGpuTextureLookupFunction(
    copyPass,
    source,
    destination,
    cycle ? 1 : 0,
  );
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
void sdlUploadToGpuBuffer(
  Pointer<SdlGpuCopyPass> copyPass,
  Pointer<SdlGpuTransferBufferLocation> source,
  Pointer<SdlGpuBufferRegion> destination,
  bool cycle,
) {
  final sdlUploadToGpuBufferLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuCopyPass> copyPass,
      Pointer<SdlGpuTransferBufferLocation> source,
      Pointer<SdlGpuBufferRegion> destination,
      Uint8 cycle,
    ),
    void Function(
      Pointer<SdlGpuCopyPass> copyPass,
      Pointer<SdlGpuTransferBufferLocation> source,
      Pointer<SdlGpuBufferRegion> destination,
      int cycle,
    )
  >('SDL_UploadToGPUBuffer');
  return sdlUploadToGpuBufferLookupFunction(
    copyPass,
    source,
    destination,
    cycle ? 1 : 0,
  );
}

///
/// Performs a texture-to-texture copy.
///
/// This copy occurs on the GPU timeline. You may assume the copy has finished
/// in subsequent commands.
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
void sdlCopyGpuTextureToTexture(
  Pointer<SdlGpuCopyPass> copyPass,
  Pointer<SdlGpuTextureLocation> source,
  Pointer<SdlGpuTextureLocation> destination,
  int w,
  int h,
  int d,
  bool cycle,
) {
  final sdlCopyGpuTextureToTextureLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuCopyPass> copyPass,
      Pointer<SdlGpuTextureLocation> source,
      Pointer<SdlGpuTextureLocation> destination,
      Uint32 w,
      Uint32 h,
      Uint32 d,
      Uint8 cycle,
    ),
    void Function(
      Pointer<SdlGpuCopyPass> copyPass,
      Pointer<SdlGpuTextureLocation> source,
      Pointer<SdlGpuTextureLocation> destination,
      int w,
      int h,
      int d,
      int cycle,
    )
  >('SDL_CopyGPUTextureToTexture');
  return sdlCopyGpuTextureToTextureLookupFunction(
    copyPass,
    source,
    destination,
    w,
    h,
    d,
    cycle ? 1 : 0,
  );
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
void sdlCopyGpuBufferToBuffer(
  Pointer<SdlGpuCopyPass> copyPass,
  Pointer<SdlGpuBufferLocation> source,
  Pointer<SdlGpuBufferLocation> destination,
  int size,
  bool cycle,
) {
  final sdlCopyGpuBufferToBufferLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuCopyPass> copyPass,
      Pointer<SdlGpuBufferLocation> source,
      Pointer<SdlGpuBufferLocation> destination,
      Uint32 size,
      Uint8 cycle,
    ),
    void Function(
      Pointer<SdlGpuCopyPass> copyPass,
      Pointer<SdlGpuBufferLocation> source,
      Pointer<SdlGpuBufferLocation> destination,
      int size,
      int cycle,
    )
  >('SDL_CopyGPUBufferToBuffer');
  return sdlCopyGpuBufferToBufferLookupFunction(
    copyPass,
    source,
    destination,
    size,
    cycle ? 1 : 0,
  );
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
void sdlDownloadFromGpuTexture(
  Pointer<SdlGpuCopyPass> copyPass,
  Pointer<SdlGpuTextureRegion> source,
  Pointer<SdlGpuTextureTransferInfo> destination,
) {
  final sdlDownloadFromGpuTextureLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuCopyPass> copyPass,
      Pointer<SdlGpuTextureRegion> source,
      Pointer<SdlGpuTextureTransferInfo> destination,
    ),
    void Function(
      Pointer<SdlGpuCopyPass> copyPass,
      Pointer<SdlGpuTextureRegion> source,
      Pointer<SdlGpuTextureTransferInfo> destination,
    )
  >('SDL_DownloadFromGPUTexture');
  return sdlDownloadFromGpuTextureLookupFunction(copyPass, source, destination);
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
void sdlDownloadFromGpuBuffer(
  Pointer<SdlGpuCopyPass> copyPass,
  Pointer<SdlGpuBufferRegion> source,
  Pointer<SdlGpuTransferBufferLocation> destination,
) {
  final sdlDownloadFromGpuBufferLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuCopyPass> copyPass,
      Pointer<SdlGpuBufferRegion> source,
      Pointer<SdlGpuTransferBufferLocation> destination,
    ),
    void Function(
      Pointer<SdlGpuCopyPass> copyPass,
      Pointer<SdlGpuBufferRegion> source,
      Pointer<SdlGpuTransferBufferLocation> destination,
    )
  >('SDL_DownloadFromGPUBuffer');
  return sdlDownloadFromGpuBufferLookupFunction(copyPass, source, destination);
}

///
/// Ends the current copy pass.
///
/// \param copy_pass a copy pass handle.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_EndGPUCopyPass( SDL_GPUCopyPass *copy_pass)
/// ```
void sdlEndGpuCopyPass(Pointer<SdlGpuCopyPass> copyPass) {
  final sdlEndGpuCopyPassLookupFunction = libSdl3.lookupFunction<
    Void Function(Pointer<SdlGpuCopyPass> copyPass),
    void Function(Pointer<SdlGpuCopyPass> copyPass)
  >('SDL_EndGPUCopyPass');
  return sdlEndGpuCopyPassLookupFunction(copyPass);
}

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
void sdlGenerateMipmapsForGpuTexture(
  Pointer<SdlGpuCommandBuffer> commandBuffer,
  Pointer<SdlGpuTexture> texture,
) {
  final sdlGenerateMipmapsForGpuTextureLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuCommandBuffer> commandBuffer,
      Pointer<SdlGpuTexture> texture,
    ),
    void Function(
      Pointer<SdlGpuCommandBuffer> commandBuffer,
      Pointer<SdlGpuTexture> texture,
    )
  >('SDL_GenerateMipmapsForGPUTexture');
  return sdlGenerateMipmapsForGpuTextureLookupFunction(commandBuffer, texture);
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
void sdlBlitGpuTexture(
  Pointer<SdlGpuCommandBuffer> commandBuffer,
  Pointer<SdlGpuBlitInfo> info,
) {
  final sdlBlitGpuTextureLookupFunction = libSdl3.lookupFunction<
    Void Function(
      Pointer<SdlGpuCommandBuffer> commandBuffer,
      Pointer<SdlGpuBlitInfo> info,
    ),
    void Function(
      Pointer<SdlGpuCommandBuffer> commandBuffer,
      Pointer<SdlGpuBlitInfo> info,
    )
  >('SDL_BlitGPUTexture');
  return sdlBlitGpuTextureLookupFunction(commandBuffer, info);
}

///
/// Determines whether a swapchain composition is supported by the window.
///
/// The window must be claimed before calling this function.
///
/// \param device a GPU context.
/// \param window an SDL_Window.
/// \param swapchain_composition the swapchain composition to check.
/// \returns true if supported, false if unsupported.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_ClaimWindowForGPUDevice
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_WindowSupportsGPUSwapchainComposition( SDL_GPUDevice *device, SDL_Window *window, SDL_GPUSwapchainComposition swapchain_composition)
/// ```
bool sdlWindowSupportsGpuSwapchainComposition(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlWindow> window,
  int swapchainComposition,
) {
  final sdlWindowSupportsGpuSwapchainCompositionLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlGpuDevice> device,
          Pointer<SdlWindow> window,
          Int32 swapchainComposition,
        ),
        int Function(
          Pointer<SdlGpuDevice> device,
          Pointer<SdlWindow> window,
          int swapchainComposition,
        )
      >('SDL_WindowSupportsGPUSwapchainComposition');
  return sdlWindowSupportsGpuSwapchainCompositionLookupFunction(
        device,
        window,
        swapchainComposition,
      ) ==
      1;
}

///
/// Determines whether a presentation mode is supported by the window.
///
/// The window must be claimed before calling this function.
///
/// \param device a GPU context.
/// \param window an SDL_Window.
/// \param present_mode the presentation mode to check.
/// \returns true if supported, false if unsupported.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_ClaimWindowForGPUDevice
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_WindowSupportsGPUPresentMode( SDL_GPUDevice *device, SDL_Window *window, SDL_GPUPresentMode present_mode)
/// ```
bool sdlWindowSupportsGpuPresentMode(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlWindow> window,
  int presentMode,
) {
  final sdlWindowSupportsGpuPresentModeLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlWindow> window,
      Int32 presentMode,
    ),
    int Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlWindow> window,
      int presentMode,
    )
  >('SDL_WindowSupportsGPUPresentMode');
  return sdlWindowSupportsGpuPresentModeLookupFunction(
        device,
        window,
        presentMode,
      ) ==
      1;
}

///
/// Claims a window, creating a swapchain structure for it.
///
/// This must be called before SDL_AcquireGPUSwapchainTexture is called using
/// the window. You should only call this function from the thread that created
/// the window.
///
/// The swapchain will be created with SDL_GPU_SWAPCHAINCOMPOSITION_SDR and
/// SDL_GPU_PRESENTMODE_VSYNC. If you want to have different swapchain
/// parameters, you must call SDL_SetGPUSwapchainParameters after claiming the
/// window.
///
/// \param device a GPU context.
/// \param window an SDL_Window.
/// \returns true on success, or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called from the thread that
/// created the window.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_WaitAndAcquireGPUSwapchainTexture
/// \sa SDL_ReleaseWindowFromGPUDevice
/// \sa SDL_WindowSupportsGPUPresentMode
/// \sa SDL_WindowSupportsGPUSwapchainComposition
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ClaimWindowForGPUDevice( SDL_GPUDevice *device, SDL_Window *window)
/// ```
bool sdlClaimWindowForGpuDevice(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlWindow> window,
) {
  final sdlClaimWindowForGpuDeviceLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(Pointer<SdlGpuDevice> device, Pointer<SdlWindow> window),
    int Function(Pointer<SdlGpuDevice> device, Pointer<SdlWindow> window)
  >('SDL_ClaimWindowForGPUDevice');
  return sdlClaimWindowForGpuDeviceLookupFunction(device, window) == 1;
}

///
/// Unclaims a window, destroying its swapchain structure.
///
/// \param device a GPU context.
/// \param window an SDL_Window that has been claimed.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_ClaimWindowForGPUDevice
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ReleaseWindowFromGPUDevice( SDL_GPUDevice *device, SDL_Window *window)
/// ```
void sdlReleaseWindowFromGpuDevice(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlWindow> window,
) {
  final sdlReleaseWindowFromGpuDeviceLookupFunction = libSdl3.lookupFunction<
    Void Function(Pointer<SdlGpuDevice> device, Pointer<SdlWindow> window),
    void Function(Pointer<SdlGpuDevice> device, Pointer<SdlWindow> window)
  >('SDL_ReleaseWindowFromGPUDevice');
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
/// \param swapchain_composition the desired composition of the swapchain.
/// \param present_mode the desired present mode for the swapchain.
/// \returns true if successful, false on error; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_WindowSupportsGPUPresentMode
/// \sa SDL_WindowSupportsGPUSwapchainComposition
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetGPUSwapchainParameters( SDL_GPUDevice *device, SDL_Window *window, SDL_GPUSwapchainComposition swapchain_composition, SDL_GPUPresentMode present_mode)
/// ```
bool sdlSetGpuSwapchainParameters(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlWindow> window,
  int swapchainComposition,
  int presentMode,
) {
  final sdlSetGpuSwapchainParametersLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlWindow> window,
      Int32 swapchainComposition,
      Int32 presentMode,
    ),
    int Function(
      Pointer<SdlGpuDevice> device,
      Pointer<SdlWindow> window,
      int swapchainComposition,
      int presentMode,
    )
  >('SDL_SetGPUSwapchainParameters');
  return sdlSetGpuSwapchainParametersLookupFunction(
        device,
        window,
        swapchainComposition,
        presentMode,
      ) ==
      1;
}

///
/// Configures the maximum allowed number of frames in flight.
///
/// The default value when the device is created is 2. This means that after
/// you have submitted 2 frames for presentation, if the GPU has not finished
/// working on the first frame, SDL_AcquireGPUSwapchainTexture() will fill the
/// swapchain texture pointer with NULL, and
/// SDL_WaitAndAcquireGPUSwapchainTexture() will block.
///
/// Higher values increase throughput at the expense of visual latency. Lower
/// values decrease visual latency at the expense of throughput.
///
/// Note that calling this function will stall and flush the command queue to
/// prevent synchronization issues.
///
/// The minimum value of allowed frames in flight is 1, and the maximum is 3.
///
/// \param device a GPU context.
/// \param allowed_frames_in_flight the maximum number of frames that can be
/// pending on the GPU.
/// \returns true if successful, false on error; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetGPUAllowedFramesInFlight( SDL_GPUDevice *device, Uint32 allowed_frames_in_flight)
/// ```
bool sdlSetGpuAllowedFramesInFlight(
  Pointer<SdlGpuDevice> device,
  int allowedFramesInFlight,
) {
  final sdlSetGpuAllowedFramesInFlightLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(Pointer<SdlGpuDevice> device, Uint32 allowedFramesInFlight),
    int Function(Pointer<SdlGpuDevice> device, int allowedFramesInFlight)
  >('SDL_SetGPUAllowedFramesInFlight');
  return sdlSetGpuAllowedFramesInFlightLookupFunction(
        device,
        allowedFramesInFlight,
      ) ==
      1;
}

///
/// Obtains the texture format of the swapchain for the given window.
///
/// Note that this format can change if the swapchain parameters change.
///
/// \param device a GPU context.
/// \param window an SDL_Window that has been claimed.
/// \returns the texture format of the swapchain.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUTextureFormat SDLCALL SDL_GetGPUSwapchainTextureFormat( SDL_GPUDevice *device, SDL_Window *window)
/// ```
int sdlGetGpuSwapchainTextureFormat(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlWindow> window,
) {
  final sdlGetGpuSwapchainTextureFormatLookupFunction = libSdl3.lookupFunction<
    Int32 Function(Pointer<SdlGpuDevice> device, Pointer<SdlWindow> window),
    int Function(Pointer<SdlGpuDevice> device, Pointer<SdlWindow> window)
  >('SDL_GetGPUSwapchainTextureFormat');
  return sdlGetGpuSwapchainTextureFormatLookupFunction(device, window);
}

///
/// Acquire a texture to use in presentation.
///
/// When a swapchain texture is acquired on a command buffer, it will
/// automatically be submitted for presentation when the command buffer is
/// submitted. The swapchain texture should only be referenced by the command
/// buffer used to acquire it.
///
/// This function will fill the swapchain texture handle with NULL if too many
/// frames are in flight. This is not an error.
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
bool sdlAcquireGpuSwapchainTexture(
  Pointer<SdlGpuCommandBuffer> commandBuffer,
  Pointer<SdlWindow> window,
  Pointer<Pointer<SdlGpuTexture>> swapchainTexture,
  Pointer<Uint32> swapchainTextureWidth,
  Pointer<Uint32> swapchainTextureHeight,
) {
  final sdlAcquireGpuSwapchainTextureLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(
      Pointer<SdlGpuCommandBuffer> commandBuffer,
      Pointer<SdlWindow> window,
      Pointer<Pointer<SdlGpuTexture>> swapchainTexture,
      Pointer<Uint32> swapchainTextureWidth,
      Pointer<Uint32> swapchainTextureHeight,
    ),
    int Function(
      Pointer<SdlGpuCommandBuffer> commandBuffer,
      Pointer<SdlWindow> window,
      Pointer<Pointer<SdlGpuTexture>> swapchainTexture,
      Pointer<Uint32> swapchainTextureWidth,
      Pointer<Uint32> swapchainTextureHeight,
    )
  >('SDL_AcquireGPUSwapchainTexture');
  return sdlAcquireGpuSwapchainTextureLookupFunction(
        commandBuffer,
        window,
        swapchainTexture,
        swapchainTextureWidth,
        swapchainTextureHeight,
      ) ==
      1;
}

///
/// Blocks the thread until a swapchain texture is available to be acquired.
///
/// \param device a GPU context.
/// \param window a window that has been claimed.
/// \returns true on success, false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called from the thread that
/// created the window.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_AcquireGPUSwapchainTexture
/// \sa SDL_WaitAndAcquireGPUSwapchainTexture
/// \sa SDL_SetGPUAllowedFramesInFlight
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_WaitForGPUSwapchain( SDL_GPUDevice *device, SDL_Window *window)
/// ```
bool sdlWaitForGpuSwapchain(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlWindow> window,
) {
  final sdlWaitForGpuSwapchainLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(Pointer<SdlGpuDevice> device, Pointer<SdlWindow> window),
    int Function(Pointer<SdlGpuDevice> device, Pointer<SdlWindow> window)
  >('SDL_WaitForGPUSwapchain');
  return sdlWaitForGpuSwapchainLookupFunction(device, window) == 1;
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
bool sdlWaitAndAcquireGpuSwapchainTexture(
  Pointer<SdlGpuCommandBuffer> commandBuffer,
  Pointer<SdlWindow> window,
  Pointer<Pointer<SdlGpuTexture>> swapchainTexture,
  Pointer<Uint32> swapchainTextureWidth,
  Pointer<Uint32> swapchainTextureHeight,
) {
  final sdlWaitAndAcquireGpuSwapchainTextureLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlGpuCommandBuffer> commandBuffer,
          Pointer<SdlWindow> window,
          Pointer<Pointer<SdlGpuTexture>> swapchainTexture,
          Pointer<Uint32> swapchainTextureWidth,
          Pointer<Uint32> swapchainTextureHeight,
        ),
        int Function(
          Pointer<SdlGpuCommandBuffer> commandBuffer,
          Pointer<SdlWindow> window,
          Pointer<Pointer<SdlGpuTexture>> swapchainTexture,
          Pointer<Uint32> swapchainTextureWidth,
          Pointer<Uint32> swapchainTextureHeight,
        )
      >('SDL_WaitAndAcquireGPUSwapchainTexture');
  return sdlWaitAndAcquireGpuSwapchainTextureLookupFunction(
        commandBuffer,
        window,
        swapchainTexture,
        swapchainTextureWidth,
        swapchainTextureHeight,
      ) ==
      1;
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
bool sdlSubmitGpuCommandBuffer(Pointer<SdlGpuCommandBuffer> commandBuffer) {
  final sdlSubmitGpuCommandBufferLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(Pointer<SdlGpuCommandBuffer> commandBuffer),
    int Function(Pointer<SdlGpuCommandBuffer> commandBuffer)
  >('SDL_SubmitGPUCommandBuffer');
  return sdlSubmitGpuCommandBufferLookupFunction(commandBuffer) == 1;
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
Pointer<SdlGpuFence> sdlSubmitGpuCommandBufferAndAcquireFence(
  Pointer<SdlGpuCommandBuffer> commandBuffer,
) {
  final sdlSubmitGpuCommandBufferAndAcquireFenceLookupFunction = libSdl3
      .lookupFunction<
        Pointer<SdlGpuFence> Function(
          Pointer<SdlGpuCommandBuffer> commandBuffer,
        ),
        Pointer<SdlGpuFence> Function(
          Pointer<SdlGpuCommandBuffer> commandBuffer,
        )
      >('SDL_SubmitGPUCommandBufferAndAcquireFence');
  return sdlSubmitGpuCommandBufferAndAcquireFenceLookupFunction(commandBuffer);
}

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
bool sdlCancelGpuCommandBuffer(Pointer<SdlGpuCommandBuffer> commandBuffer) {
  final sdlCancelGpuCommandBufferLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(Pointer<SdlGpuCommandBuffer> commandBuffer),
    int Function(Pointer<SdlGpuCommandBuffer> commandBuffer)
  >('SDL_CancelGPUCommandBuffer');
  return sdlCancelGpuCommandBufferLookupFunction(commandBuffer) == 1;
}

///
/// Blocks the thread until the GPU is completely idle.
///
/// \param device a GPU context.
/// \returns true on success, false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_WaitForGPUFences
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_WaitForGPUIdle( SDL_GPUDevice *device)
/// ```
bool sdlWaitForGpuIdle(Pointer<SdlGpuDevice> device) {
  final sdlWaitForGpuIdleLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(Pointer<SdlGpuDevice> device),
    int Function(Pointer<SdlGpuDevice> device)
  >('SDL_WaitForGPUIdle');
  return sdlWaitForGpuIdleLookupFunction(device) == 1;
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
bool sdlWaitForGpuFences(
  Pointer<SdlGpuDevice> device,
  bool waitAll,
  Pointer<Pointer<SdlGpuFence>> fences,
  int numFences,
) {
  final sdlWaitForGpuFencesLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(
      Pointer<SdlGpuDevice> device,
      Uint8 waitAll,
      Pointer<Pointer<SdlGpuFence>> fences,
      Uint32 numFences,
    ),
    int Function(
      Pointer<SdlGpuDevice> device,
      int waitAll,
      Pointer<Pointer<SdlGpuFence>> fences,
      int numFences,
    )
  >('SDL_WaitForGPUFences');
  return sdlWaitForGpuFencesLookupFunction(
        device,
        waitAll ? 1 : 0,
        fences,
        numFences,
      ) ==
      1;
}

///
/// Checks the status of a fence.
///
/// \param device a GPU context.
/// \param fence a fence.
/// \returns true if the fence is signaled, false if it is not.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SubmitGPUCommandBufferAndAcquireFence
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_QueryGPUFence( SDL_GPUDevice *device, SDL_GPUFence *fence)
/// ```
bool sdlQueryGpuFence(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuFence> fence,
) {
  final sdlQueryGpuFenceLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(Pointer<SdlGpuDevice> device, Pointer<SdlGpuFence> fence),
    int Function(Pointer<SdlGpuDevice> device, Pointer<SdlGpuFence> fence)
  >('SDL_QueryGPUFence');
  return sdlQueryGpuFenceLookupFunction(device, fence) == 1;
}

///
/// Releases a fence obtained from SDL_SubmitGPUCommandBufferAndAcquireFence.
///
/// You must not reference the fence after calling this function.
///
/// \param device a GPU context.
/// \param fence a fence.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SubmitGPUCommandBufferAndAcquireFence
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ReleaseGPUFence( SDL_GPUDevice *device, SDL_GPUFence *fence)
/// ```
void sdlReleaseGpuFence(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuFence> fence,
) {
  final sdlReleaseGpuFenceLookupFunction = libSdl3.lookupFunction<
    Void Function(Pointer<SdlGpuDevice> device, Pointer<SdlGpuFence> fence),
    void Function(Pointer<SdlGpuDevice> device, Pointer<SdlGpuFence> fence)
  >('SDL_ReleaseGPUFence');
  return sdlReleaseGpuFenceLookupFunction(device, fence);
}

///
/// Obtains the texel block size for a texture format.
///
/// \param format the texture format you want to know the texel size of.
/// \returns the texel block size of the texture format.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_UploadToGPUTexture
///
/// ```c
/// extern SDL_DECLSPEC Uint32 SDLCALL SDL_GPUTextureFormatTexelBlockSize( SDL_GPUTextureFormat format)
/// ```
int sdlGpuTextureFormatTexelBlockSize(int format) {
  final sdlGpuTextureFormatTexelBlockSizeLookupFunction = libSdl3
      .lookupFunction<Uint32 Function(Int32 format), int Function(int format)>(
        'SDL_GPUTextureFormatTexelBlockSize',
      );
  return sdlGpuTextureFormatTexelBlockSizeLookupFunction(format);
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
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GPUTextureSupportsFormat( SDL_GPUDevice *device, SDL_GPUTextureFormat format, SDL_GPUTextureType type, SDL_GPUTextureUsageFlags usage)
/// ```
bool sdlGpuTextureSupportsFormat(
  Pointer<SdlGpuDevice> device,
  int format,
  int type,
  int usage,
) {
  final sdlGpuTextureSupportsFormatLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(
      Pointer<SdlGpuDevice> device,
      Int32 format,
      Int32 type,
      Uint32 usage,
    ),
    int Function(Pointer<SdlGpuDevice> device, int format, int type, int usage)
  >('SDL_GPUTextureSupportsFormat');
  return sdlGpuTextureSupportsFormatLookupFunction(
        device,
        format,
        type,
        usage,
      ) ==
      1;
}

///
/// Determines if a sample count for a texture format is supported.
///
/// \param device a GPU context.
/// \param format the texture format to check.
/// \param sample_count the sample count to check.
/// \returns whether the sample count is supported for this texture format.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GPUTextureSupportsSampleCount( SDL_GPUDevice *device, SDL_GPUTextureFormat format, SDL_GPUSampleCount sample_count)
/// ```
bool sdlGpuTextureSupportsSampleCount(
  Pointer<SdlGpuDevice> device,
  int format,
  int sampleCount,
) {
  final sdlGpuTextureSupportsSampleCountLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(
      Pointer<SdlGpuDevice> device,
      Int32 format,
      Int32 sampleCount,
    ),
    int Function(Pointer<SdlGpuDevice> device, int format, int sampleCount)
  >('SDL_GPUTextureSupportsSampleCount');
  return sdlGpuTextureSupportsSampleCountLookupFunction(
        device,
        format,
        sampleCount,
      ) ==
      1;
}

///
/// Calculate the size in bytes of a texture format with dimensions.
///
/// \param format a texture format.
/// \param width width in pixels.
/// \param height height in pixels.
/// \param depth_or_layer_count depth for 3D textures or layer count otherwise.
/// \returns the size of a texture with this format and dimensions.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC Uint32 SDLCALL SDL_CalculateGPUTextureFormatSize( SDL_GPUTextureFormat format, Uint32 width, Uint32 height, Uint32 depth_or_layer_count)
/// ```
int sdlCalculateGpuTextureFormatSize(
  int format,
  int width,
  int height,
  int depthOrLayerCount,
) {
  final sdlCalculateGpuTextureFormatSizeLookupFunction = libSdl3.lookupFunction<
    Uint32 Function(
      Int32 format,
      Uint32 width,
      Uint32 height,
      Uint32 depthOrLayerCount,
    ),
    int Function(int format, int width, int height, int depthOrLayerCount)
  >('SDL_CalculateGPUTextureFormatSize');
  return sdlCalculateGpuTextureFormatSizeLookupFunction(
    format,
    width,
    height,
    depthOrLayerCount,
  );
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
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_AddEventWatch
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_GDKSuspendGPU(SDL_GPUDevice *device)
/// ```
void sdlGdkSuspendGpu(Pointer<SdlGpuDevice> device) {
  final sdlGdkSuspendGpuLookupFunction = libSdl3.lookupFunction<
    Void Function(Pointer<SdlGpuDevice> device),
    void Function(Pointer<SdlGpuDevice> device)
  >('SDL_GDKSuspendGPU');
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
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_AddEventWatch
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_GDKResumeGPU(SDL_GPUDevice *device)
/// ```
void sdlGdkResumeGpu(Pointer<SdlGpuDevice> device) {
  final sdlGdkResumeGpuLookupFunction = libSdl3.lookupFunction<
    Void Function(Pointer<SdlGpuDevice> device),
    void Function(Pointer<SdlGpuDevice> device)
  >('SDL_GDKResumeGPU');
  return sdlGdkResumeGpuLookupFunction(device);
}
