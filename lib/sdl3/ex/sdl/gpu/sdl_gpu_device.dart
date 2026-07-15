// ignore_for_file: comment_references

part of '../../../sdl.dart';

extension SdlGpuDevicePointerEx on Pointer<SdlGpuDevice> {
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
  /// {@category gpu}
  void destroy() => sdlDestroyGpuDevice(this);

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
  /// {@category gpu}
  String? getDriver() => sdlGetGpuDeviceDriver(this);

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
  /// {@category gpu}
  int getShaderFormats() => sdlGetGpuShaderFormats(this);

  ///
  /// Get the properties associated with a GPU device.
  ///
  /// All properties are optional and may differ between GPU backends and SDL
  /// versions.
  ///
  /// The following properties are provided by SDL:
  ///
  /// `SDL_PROP_GPU_DEVICE_NAME_STRING`: Contains the name of the underlying
  /// device as reported by the system driver. This string has no standardized
  /// format, is highly inconsistent between hardware devices and drivers, and is
  /// able to change at any time. Do not attempt to parse this string as it is
  /// bound to fail at some point in the future when system drivers are updated,
  /// new hardware devices are introduced, or when SDL adds new GPU backends or
  /// modifies existing ones.
  ///
  /// Strings that have been found in the wild include:
  ///
  /// - GTX 970
  /// - GeForce GTX 970
  /// - NVIDIA GeForce GTX 970
  /// - Microsoft Direct3D12 (NVIDIA GeForce GTX 970)
  /// - NVIDIA Graphics Device
  /// - GeForce GPU
  /// - P106-100
  /// - AMD 15D8:C9
  /// - AMD Custom GPU 0405
  /// - AMD Radeon (TM) Graphics
  /// - ASUS Radeon RX 470 Series
  /// - Intel(R) Arc(tm) A380 Graphics (DG2)
  /// - Virtio-GPU Venus (NVIDIA TITAN V)
  /// - SwiftShader Device (LLVM 16.0.0)
  /// - llvmpipe (LLVM 15.0.4, 256 bits)
  /// - Microsoft Basic Render Driver
  /// - unknown device
  ///
  /// The above list shows that the same device can have different formats, the
  /// vendor name may or may not appear in the string, the included vendor name
  /// may not be the vendor of the chipset on the device, some manufacturers
  /// include pseudo-legal marks while others don't, some devices may not use a
  /// marketing name in the string, the device string may be wrapped by the name
  /// of a translation interface, the device may be emulated in software, or the
  /// string may contain generic text that does not identify the device at all.
  ///
  /// `SDL_PROP_GPU_DEVICE_DRIVER_NAME_STRING`: Contains the self-reported name
  /// of the underlying system driver.
  ///
  /// Strings that have been found in the wild include:
  ///
  /// - Intel Corporation
  /// - Intel open-source Mesa driver
  /// - Qualcomm Technologies Inc. Adreno Vulkan Driver
  /// - MoltenVK
  /// - Mali-G715
  /// - venus
  ///
  /// `SDL_PROP_GPU_DEVICE_DRIVER_VERSION_STRING`: Contains the self-reported
  /// version of the underlying system driver. This is a relatively short version
  /// string in an unspecified format. If SDL_PROP_GPU_DEVICE_DRIVER_INFO_STRING
  /// is available then that property should be preferred over this one as it may
  /// contain additional information that is useful for identifying the exact
  /// driver version used.
  ///
  /// Strings that have been found in the wild include:
  ///
  /// - 53.0.0
  /// - 0.405.2463
  /// - 32.0.15.6614
  ///
  /// `SDL_PROP_GPU_DEVICE_DRIVER_INFO_STRING`: Contains the detailed version
  /// information of the underlying system driver as reported by the driver. This
  /// is an arbitrary string with no standardized format and it may contain
  /// newlines. This property should be preferred over
  /// SDL_PROP_GPU_DEVICE_DRIVER_VERSION_STRING if it is available as it usually
  /// contains the same information but in a format that is easier to read.
  ///
  /// Strings that have been found in the wild include:
  ///
  /// - 101.6559
  /// - 1.2.11
  /// - Mesa 21.2.2 (LLVM 12.0.1)
  /// - Mesa 22.2.0-devel (git-f226222 2022-04-14 impish-oibaf-ppa)
  /// - v1.r53p0-00eac0.824c4f31403fb1fbf8ee1042422c2129
  ///
  /// This string has also been observed to be a multiline string (which has a
  /// trailing newline):
  ///
  /// ===
  /// Driver Build: 85da404, I46ff5fc46f, 1606794520
  /// Date: 11/30/20
  /// Compiler Version: EV031.31.04.01
  /// Driver Branch: promo490_3_Google
  /// ===
  ///
  /// \param device a GPU context to query.
  /// \returns a valid property ID on success or 0 on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.4.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_PropertiesID SDLCALL SDL_GetGPUDeviceProperties(SDL_GPUDevice *device)
  /// ```
  /// {@category gpu}
  int getProperties() => sdlGetGpuDeviceProperties(this);

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
  /// {@category gpu}
  Pointer<SdlGpuComputePipeline> createComputePipeline(
    SdlxGpuComputePipelineCreateInfo createinfo,
  ) => sdlxCreateGpuComputePipeline(this, createinfo);

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
  Pointer<SdlGpuGraphicsPipeline> createGraphicsPipeline(
    SdlxGpuGraphicsPipelineCreateInfo createinfo,
  ) => sdlxCreateGpuGraphicsPipeline(this, createinfo);

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
  /// {@category gpu}
  Pointer<SdlGpuSampler> createSampler(SdlxGpuSamplerCreateInfo createinfo) =>
      sdlxCreateGpuSampler(this, createinfo);

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
  Pointer<SdlGpuShader> createShader(SdlxGpuShaderCreateInfo createinfo) =>
      sdlxCreateGpuShader(this, createinfo);

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
  /// {@category gpu}
  Pointer<SdlGpuTexture> createTexture(SdlxGpuTextureCreateInfo createinfo) =>
      sdlxCreateGpuTexture(this, createinfo);

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
  Pointer<SdlGpuBuffer> createBuffer(SdlxGpuBufferCreateInfo createinfo) =>
      sdlxCreateGpuBuffer(this, createinfo);

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
  Pointer<SdlGpuTransferBuffer> createTransferBuffer(
    SdlxGpuTransferBufferCreateInfo createinfo,
  ) => sdlxCreateGpuTransferBuffer(this, createinfo);

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
  /// {@category gpu}
  void setBufferName(Pointer<SdlGpuBuffer> buffer, String text) =>
      sdlSetGpuBufferName(this, buffer, text);

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
  /// {@category gpu}
  void setTextureName(Pointer<SdlGpuTexture> texture, String text) =>
      sdlSetGpuTextureName(this, texture, text);

  ///
  /// Frees the given texture as soon as it is safe to do so.
  ///
  /// You must not reference the texture after calling this function.
  ///
  /// It is safe to pass NULL for `texture`, in that case this function is a
  /// no-op.
  ///
  /// \param device a GPU context.
  /// \param texture a texture to be destroyed.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_ReleaseGPUTexture( SDL_GPUDevice *device, SDL_GPUTexture *texture)
  /// ```
  /// {@category gpu}
  void releaseTexture(Pointer<SdlGpuTexture> texture) =>
      sdlReleaseGpuTexture(this, texture);

  ///
  /// Frees the given sampler as soon as it is safe to do so.
  ///
  /// You must not reference the sampler after calling this function.
  ///
  /// It is safe to pass NULL for `sampler`, in that case this function is a
  /// no-op.
  ///
  /// \param device a GPU context.
  /// \param sampler a sampler to be destroyed.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_ReleaseGPUSampler( SDL_GPUDevice *device, SDL_GPUSampler *sampler)
  /// ```
  /// {@category gpu}
  void releaseSampler(Pointer<SdlGpuSampler> sampler) =>
      sdlReleaseGpuSampler(this, sampler);

  ///
  /// Frees the given buffer as soon as it is safe to do so.
  ///
  /// You must not reference the buffer after calling this function.
  ///
  /// It is safe to pass NULL for `buffer`, in that case this function is a
  /// no-op.
  ///
  /// \param device a GPU context.
  /// \param buffer a buffer to be destroyed.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_ReleaseGPUBuffer( SDL_GPUDevice *device, SDL_GPUBuffer *buffer)
  /// ```
  /// {@category gpu}
  void releaseBuffer(Pointer<SdlGpuBuffer> buffer) =>
      sdlReleaseGpuBuffer(this, buffer);

  ///
  /// Frees the given transfer buffer as soon as it is safe to do so.
  ///
  /// You must not reference the transfer buffer after calling this function.
  ///
  /// It is safe to pass NULL for `transfer_buffer`, in that case this function
  /// is a no-op.
  ///
  /// \param device a GPU context.
  /// \param transfer_buffer a transfer buffer to be destroyed.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_ReleaseGPUTransferBuffer( SDL_GPUDevice *device, SDL_GPUTransferBuffer *transfer_buffer)
  /// ```
  /// {@category gpu}
  void releaseTransferBuffer(Pointer<SdlGpuTransferBuffer> transferBuffer) =>
      sdlReleaseGpuTransferBuffer(this, transferBuffer);

  ///
  /// Frees the given compute pipeline as soon as it is safe to do so.
  ///
  /// You must not reference the compute pipeline after calling this function.
  ///
  /// It is safe to pass NULL for `compute_pipeline`, in that case this function
  /// is a no-op.
  ///
  /// \param device a GPU context.
  /// \param compute_pipeline a compute pipeline to be destroyed.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_ReleaseGPUComputePipeline( SDL_GPUDevice *device, SDL_GPUComputePipeline *compute_pipeline)
  /// ```
  /// {@category gpu}
  void releaseComputePipeline(Pointer<SdlGpuComputePipeline> computePipeline) =>
      sdlReleaseGpuComputePipeline(this, computePipeline);

  ///
  /// Frees the given shader as soon as it is safe to do so.
  ///
  /// You must not reference the shader after calling this function.
  ///
  /// It is safe to pass NULL for `shader`, in that case this function is a
  /// no-op.
  ///
  /// \param device a GPU context.
  /// \param shader a shader to be destroyed.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_ReleaseGPUShader( SDL_GPUDevice *device, SDL_GPUShader *shader)
  /// ```
  /// {@category gpu}
  void releaseShader(Pointer<SdlGpuShader> shader) =>
      sdlReleaseGpuShader(this, shader);

  ///
  /// Frees the given graphics pipeline as soon as it is safe to do so.
  ///
  /// You must not reference the graphics pipeline after calling this function.
  ///
  /// It is safe to pass NULL for `graphics_pipeline`, in that case this function
  /// is a no-op.
  ///
  /// \param device a GPU context.
  /// \param graphics_pipeline a graphics pipeline to be destroyed.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_ReleaseGPUGraphicsPipeline( SDL_GPUDevice *device, SDL_GPUGraphicsPipeline *graphics_pipeline)
  /// ```
  /// {@category gpu}
  void releaseGraphicsPipeline(
    Pointer<SdlGpuGraphicsPipeline> graphicsPipeline,
  ) => sdlReleaseGpuGraphicsPipeline(this, graphicsPipeline);

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
  /// {@category gpu}
  Pointer<SdlGpuCommandBuffer> acquireCommandBuffer() =>
      sdlAcquireGpuCommandBuffer(this);

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
  /// {@category gpu}
  Pointer<Void> mapTransferBuffer(
    Pointer<SdlGpuTransferBuffer> transferBuffer, {
    bool cycle = false,
  }) => sdlMapGpuTransferBuffer(this, transferBuffer, cycle);

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
  /// {@category gpu}
  void unmapTransferBuffer(Pointer<SdlGpuTransferBuffer> transferBuffer) =>
      sdlUnmapGpuTransferBuffer(this, transferBuffer);

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
  /// {@category gpu}
  bool windowSupportsSwapchainComposition(
    Pointer<SdlWindow> window,
    int swapchainComposition,
  ) => sdlWindowSupportsGpuSwapchainComposition(
    this,
    window,
    swapchainComposition,
  );

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
  /// {@category gpu}
  bool windowSupportsPresentMode(Pointer<SdlWindow> window, int presentMode) =>
      sdlWindowSupportsGpuPresentMode(this, window, presentMode);

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
  /// {@category gpu}
  bool claimWindowFor(Pointer<SdlWindow> window) =>
      sdlClaimWindowForGpuDevice(this, window);

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
  /// {@category gpu}
  void releaseWindowFrom(Pointer<SdlWindow> window) =>
      sdlReleaseWindowFromGpuDevice(this, window);

  ///
  /// Changes the swapchain parameters for the given claimed window.
  ///
  /// This function will fail if the requested present mode or swapchain
  /// composition are unsupported by the device. Check if the parameters are
  /// supported via SDL_WindowSupportsGPUPresentMode /
  /// SDL_WindowSupportsGPUSwapchainComposition prior to calling this function.
  ///
  /// SDL_GPU_PRESENTMODE_VSYNC with SDL_GPU_SWAPCHAINCOMPOSITION_SDR is always
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
  /// {@category gpu}
  bool setSwapchainParameters(
    Pointer<SdlWindow> window,
    int swapchainComposition,
    int presentMode,
  ) => sdlSetGpuSwapchainParameters(
    this,
    window,
    swapchainComposition,
    presentMode,
  );

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
  /// {@category gpu}
  bool setAllowedFramesInFlight(int allowedFramesInFlight) =>
      sdlSetGpuAllowedFramesInFlight(this, allowedFramesInFlight);

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
  /// {@category gpu}
  int getSwapchainTextureFormat(Pointer<SdlWindow> window) =>
      sdlGetGpuSwapchainTextureFormat(this, window);

  ///
  /// Blocks the thread until all presenting command buffers are finished
  /// executing.
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
  /// {@category gpu}
  bool waitForSwapchain(Pointer<SdlWindow> window) =>
      sdlWaitForGpuSwapchain(this, window);

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
  /// {@category gpu}
  bool waitForIdle() => sdlWaitForGpuIdle(this);

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
  /// {@category gpu}
  bool waitForFences(
    List<Pointer<SdlGpuFence>> fences, {
    bool waitAll = true,
  }) => sdlxWaitForGpuFences(this, fences, waitAll: waitAll);

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
  /// {@category gpu}
  bool queryFence(Pointer<SdlGpuFence> fence) => sdlQueryGpuFence(this, fence);

  ///
  /// Releases a fence obtained from SDL_SubmitGPUCommandBufferAndAcquireFence.
  ///
  /// You must not reference the fence after calling this function.
  ///
  /// It is safe to pass NULL for `fence`, in that case this function is a no-op.
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
  /// {@category gpu}
  void releaseFence(Pointer<SdlGpuFence> fence) =>
      sdlReleaseGpuFence(this, fence);

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
  /// {@category gpu}
  bool textureSupportsFormat(int format, int type, int usage) =>
      sdlGpuTextureSupportsFormat(this, format, type, usage);

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
  /// {@category gpu}
  bool textureSupportsSampleCount(int format, int sampleCount) =>
      sdlGpuTextureSupportsSampleCount(this, format, sampleCount);

  ///
  /// Call this to suspend GPU operation on Xbox after receiving the
  /// SDL_EVENT_DID_ENTER_BACKGROUND event.
  ///
  /// Do NOT call any SDL_GPU functions after calling this function! This must
  /// also be called before calling SDL_GDKSuspendComplete.
  ///
  /// This function MUST be called from the application's render thread.
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
  /// {@category gpu}
  void gdkSuspend() => sdlGdkSuspendGpu(this);

  ///
  /// Call this to resume GPU operation on Xbox after receiving the
  /// SDL_EVENT_WILL_ENTER_FOREGROUND event.
  ///
  /// When resuming, this function MUST be called before calling any other
  /// SDL_GPU functions.
  ///
  /// This function MUST be called from the application's render thread.
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
  /// {@category gpu}
  void gdkResume() => sdlGdkResumeGpu(this);
}
