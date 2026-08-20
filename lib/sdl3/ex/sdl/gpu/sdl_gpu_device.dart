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
  ///
  /// See also:
  /// - [SDL_DestroyGPUDevice - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_DestroyGPUDevice)
  ///
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
  ///
  /// See also:
  /// - [SDL_GetGPUDeviceDriver - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetGPUDeviceDriver)
  ///
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
  ///
  /// See also:
  /// - [SDL_GetGPUShaderFormats - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetGPUShaderFormats)
  ///
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
  ///
  /// See also:
  /// - [SDL_GetGPUDeviceProperties - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetGPUDeviceProperties)
  ///
  /// {@category gpu}
  int getProperties() => sdlGetGpuDeviceProperties(this);

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
  ///
  /// See also:
  /// - [SDL_CreateGPUGraphicsPipeline - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_CreateGPUGraphicsPipeline)
  ///
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
  ///
  /// See also:
  /// - [SDL_CreateGPUSampler - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_CreateGPUSampler)
  ///
  /// {@category gpu}
  Pointer<SdlGpuSampler> createSampler(SdlxGpuSamplerCreateInfo createinfo) =>
      sdlxCreateGpuSampler(this, createinfo);

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
  ///
  /// See also:
  /// - [SDL_CreateGPUTexture - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_CreateGPUTexture)
  ///
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
  ///
  /// See also:
  /// - [SDL_CreateGPUBuffer - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_CreateGPUBuffer)
  ///
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
  ///
  /// See also:
  /// - [SDL_SetGPUBufferName - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetGPUBufferName)
  ///
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
  ///
  /// See also:
  /// - [SDL_SetGPUTextureName - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetGPUTextureName)
  ///
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
  ///
  /// See also:
  /// - [SDL_ReleaseGPUTexture - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUTexture)
  ///
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
  ///
  /// See also:
  /// - [SDL_ReleaseGPUSampler - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUSampler)
  ///
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
  ///
  /// See also:
  /// - [SDL_ReleaseGPUBuffer - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUBuffer)
  ///
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
  ///
  /// See also:
  /// - [SDL_ReleaseGPUTransferBuffer - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUTransferBuffer)
  ///
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
  ///
  /// See also:
  /// - [SDL_ReleaseGPUComputePipeline - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUComputePipeline)
  ///
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
  ///
  /// See also:
  /// - [SDL_ReleaseGPUShader - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUShader)
  ///
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
  ///
  /// See also:
  /// - [SDL_ReleaseGPUGraphicsPipeline - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUGraphicsPipeline)
  ///
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
  ///
  /// See also:
  /// - [SDL_AcquireGPUCommandBuffer - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_AcquireGPUCommandBuffer)
  ///
  /// {@category gpu}
  Pointer<SdlGpuCommandBuffer> acquireCommandBuffer() =>
      sdlAcquireGpuCommandBuffer(this);

  ///
  /// Maps a transfer buffer into application address space.
  ///
  /// You must unmap the transfer buffer before encoding upload commands using
  /// SDL_UnmapGPUTransferBuffer. The memory is owned by the graphics driver - do
  /// NOT call SDL_free() on the returned pointer.
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
  ///
  /// See also:
  /// - [SDL_MapGPUTransferBuffer - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_MapGPUTransferBuffer)
  ///
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
  ///
  /// See also:
  /// - [SDL_UnmapGPUTransferBuffer - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_UnmapGPUTransferBuffer)
  ///
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
  ///
  /// See also:
  /// - [SDL_WindowSupportsGPUSwapchainComposition - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_WindowSupportsGPUSwapchainComposition)
  ///
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
  ///
  /// See also:
  /// - [SDL_WindowSupportsGPUPresentMode - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_WindowSupportsGPUPresentMode)
  ///
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
  ///
  /// See also:
  /// - [SDL_ClaimWindowForGPUDevice - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_ClaimWindowForGPUDevice)
  ///
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
  ///
  /// See also:
  /// - [SDL_ReleaseWindowFromGPUDevice - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_ReleaseWindowFromGPUDevice)
  ///
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
  ///
  /// See also:
  /// - [SDL_SetGPUSwapchainParameters - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetGPUSwapchainParameters)
  ///
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
  ///
  /// See also:
  /// - [SDL_SetGPUAllowedFramesInFlight - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetGPUAllowedFramesInFlight)
  ///
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
  ///
  /// See also:
  /// - [SDL_GetGPUSwapchainTextureFormat - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetGPUSwapchainTextureFormat)
  ///
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
  ///
  /// See also:
  /// - [SDL_WaitForGPUSwapchain - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_WaitForGPUSwapchain)
  ///
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
  ///
  /// See also:
  /// - [SDL_WaitForGPUIdle - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_WaitForGPUIdle)
  ///
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
  ///
  /// See also:
  /// - [SDL_WaitForGPUFences - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_WaitForGPUFences)
  ///
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
  ///
  /// See also:
  /// - [SDL_QueryGPUFence - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_QueryGPUFence)
  ///
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
  ///
  /// See also:
  /// - [SDL_ReleaseGPUFence - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUFence)
  ///
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
  ///
  /// See also:
  /// - [SDL_GPUTextureSupportsFormat - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GPUTextureSupportsFormat)
  ///
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
  ///
  /// See also:
  /// - [SDL_GPUTextureSupportsSampleCount - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GPUTextureSupportsSampleCount)
  ///
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
  ///
  /// See also:
  /// - [SDL_GDKSuspendGPU - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GDKSuspendGPU)
  ///
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
  ///
  /// See also:
  /// - [SDL_GDKResumeGPU - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GDKResumeGPU)
  ///
  /// {@category gpu}
  void gdkResume() => sdlGdkResumeGpu(this);
}
