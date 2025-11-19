// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
// ignore_for_file: avoid_positional_boolean_parameters
// ignore_for_file: comment_references
part of '../sdl.dart';

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
/// {@category gpu}
bool sdlGpuSupportsShaderFormats(int formatFlags, String? name) {
  final sdlGpuSupportsShaderFormatsLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
bool sdlGpuSupportsProperties(int props) {
  final sdlGpuSupportsPropertiesLookupFunction = _libSdl
      .lookupFunction<Uint8 Function(Uint32 props), int Function(int props)>(
        'SDL_GPUSupportsProperties',
      );
  return sdlGpuSupportsPropertiesLookupFunction(props) == 1;
}

///
/// Creates a GPU context.
///
/// The GPU driver name can be one of the following:
///
/// - "vulkan": [Vulkan](CategoryGPU#vulkan)
/// - "direct3d12": [D3D12](CategoryGPU#d3d12)
/// - "metal": [Metal](CategoryGPU#metal)
/// - NULL: let SDL pick the optimal driver
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
/// \sa SDL_CreateGPUDeviceWithProperties
/// \sa SDL_GetGPUShaderFormats
/// \sa SDL_GetGPUDeviceDriver
/// \sa SDL_DestroyGPUDevice
/// \sa SDL_GPUSupportsShaderFormats
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUDevice * SDLCALL SDL_CreateGPUDevice( SDL_GPUShaderFormat format_flags, bool debug_mode, const char *name)
/// ```
/// {@category gpu}
Pointer<SdlGpuDevice> sdlCreateGpuDevice(
  int formatFlags,
  bool debugMode,
  String? name,
) {
  final sdlCreateGpuDeviceLookupFunction = _libSdl
      .lookupFunction<
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
/// - `SDL_PROP_GPU_DEVICE_CREATE_VERBOSE_BOOLEAN`: enable to automatically log
/// useful debug information on device creation, defaults to true.
/// - `SDL_PROP_GPU_DEVICE_CREATE_NAME_STRING`: the name of the GPU driver to
/// use, if a specific one is desired.
/// - `SDL_PROP_GPU_DEVICE_CREATE_FEATURE_CLIP_DISTANCE_BOOLEAN`: Enable Vulkan
/// device feature shaderClipDistance. If disabled, clip distances are not
/// supported in shader code: gl_ClipDistance[] built-ins of GLSL,
/// SV_ClipDistance0/1 semantics of HLSL and [[clip_distance]] attribute of
/// Metal. Disabling optional features allows the application to run on some
/// older Android devices. Defaults to true.
/// - `SDL_PROP_GPU_DEVICE_CREATE_FEATURE_DEPTH_CLAMPING_BOOLEAN`: Enable
/// Vulkan device feature depthClamp. If disabled, there is no depth clamp
/// support and enable_depth_clip in SDL_GPURasterizerState must always be
/// set to true. Disabling optional features allows the application to run on
/// some older Android devices. Defaults to true.
/// - `SDL_PROP_GPU_DEVICE_CREATE_FEATURE_INDIRECT_DRAW_FIRST_INSTANCE_BOOLEAN`:
/// Enable Vulkan device feature drawIndirectFirstInstance. If disabled, the
/// argument first_instance of SDL_GPUIndirectDrawCommand must be set to
/// zero. Disabling optional features allows the application to run on some
/// older Android devices. Defaults to true.
/// - `SDL_PROP_GPU_DEVICE_CREATE_FEATURE_ANISOTROPY_BOOLEAN`: Enable Vulkan
/// device feature samplerAnisotropy. If disabled, enable_anisotropy of
/// SDL_GPUSamplerCreateInfo must be set to false. Disabling optional
/// features allows the application to run on some older Android devices.
/// Defaults to true.
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
/// With the D3D12 backend:
///
/// - `SDL_PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING`: the prefix to
/// use for all vertex semantics, default is "TEXCOORD".
/// - `SDL_PROP_GPU_DEVICE_CREATE_D3D12_ALLOW_FEWER_RESOURCE_SLOTS_BOOLEAN`: By
/// default, Resourcing Binding Tier 2 is required for D3D12 support.
/// However, an application can set this property to true to enable Tier 1
/// support, if (and only if) the application uses 8 or fewer storage
/// resources across all shader stages. As of writing, this property is
/// useful for targeting Intel Haswell and Broadwell GPUs; other hardware
/// either supports Tier 2 Resource Binding or does not support D3D12 in any
/// capacity. Defaults to false.
///
/// With the Vulkan backend:
///
/// - `SDL_PROP_GPU_DEVICE_CREATE_VULKAN_REQUIRE_HARDWARE_ACCELERATION_BOOLEAN`:
/// By default, Vulkan device enumeration includes drivers of all types,
/// including software renderers (for example, the Lavapipe Mesa driver).
/// This can be useful if your application _requires_ SDL_GPU, but if you can
/// provide your own fallback renderer (for example, an OpenGL renderer) this
/// property can be set to true. Defaults to false.
/// - `SDL_PROP_GPU_DEVICE_CREATE_VULKAN_OPTIONS_POINTER`: a pointer to an
/// SDL_GPUVulkanOptions structure to be processed during device creation.
/// This allows configuring a variety of Vulkan-specific options such as
/// increasing the API version and opting into extensions aside from the
/// minimal set SDL requires.
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
/// {@category gpu}
Pointer<SdlGpuDevice> sdlCreateGpuDeviceWithProperties(int props) {
  final sdlCreateGpuDeviceWithPropertiesLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlDestroyGpuDevice(Pointer<SdlGpuDevice> device) {
  final sdlDestroyGpuDeviceLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
int sdlGetNumGpuDrivers() {
  final sdlGetNumGpuDriversLookupFunction = _libSdl
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
/// {@category gpu}
String? sdlGetGpuDriver(int index) {
  final sdlGetGpuDriverLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
String? sdlGetGpuDeviceDriver(Pointer<SdlGpuDevice> device) {
  final sdlGetGpuDeviceDriverLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
int sdlGetGpuShaderFormats(Pointer<SdlGpuDevice> device) {
  final sdlGetGpuShaderFormatsLookupFunction = _libSdl
      .lookupFunction<
        Uint32 Function(Pointer<SdlGpuDevice> device),
        int Function(Pointer<SdlGpuDevice> device)
      >('SDL_GetGPUShaderFormats');
  return sdlGetGpuShaderFormatsLookupFunction(device);
}

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
int sdlGetGpuDeviceProperties(Pointer<SdlGpuDevice> device) {
  final sdlGetGpuDevicePropertiesLookupFunction = _libSdl
      .lookupFunction<
        Uint32 Function(Pointer<SdlGpuDevice> device),
        int Function(Pointer<SdlGpuDevice> device)
      >('SDL_GetGPUDeviceProperties');
  return sdlGetGpuDevicePropertiesLookupFunction(device);
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
/// {@category gpu}
Pointer<SdlGpuComputePipeline> sdlCreateGpuComputePipeline(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuComputePipelineCreateInfo> createinfo,
) {
  final sdlCreateGpuComputePipelineLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
Pointer<SdlGpuGraphicsPipeline> sdlCreateGpuGraphicsPipeline(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuGraphicsPipelineCreateInfo> createinfo,
) {
  final sdlCreateGpuGraphicsPipelineLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
Pointer<SdlGpuSampler> sdlCreateGpuSampler(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuSamplerCreateInfo> createinfo,
) {
  final sdlCreateGpuSamplerLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
Pointer<SdlGpuShader> sdlCreateGpuShader(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuShaderCreateInfo> createinfo,
) {
  final sdlCreateGpuShaderLookupFunction = _libSdl
      .lookupFunction<
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
Pointer<SdlGpuTexture> sdlCreateGpuTexture(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuTextureCreateInfo> createinfo,
) {
  final sdlCreateGpuTextureLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
Pointer<SdlGpuBuffer> sdlCreateGpuBuffer(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuBufferCreateInfo> createinfo,
) {
  final sdlCreateGpuBufferLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
Pointer<SdlGpuTransferBuffer> sdlCreateGpuTransferBuffer(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuTransferBufferCreateInfo> createinfo,
) {
  final sdlCreateGpuTransferBufferLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlSetGpuBufferName(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuBuffer> buffer,
  String? text,
) {
  final sdlSetGpuBufferNameLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlSetGpuTextureName(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuTexture> texture,
  String? text,
) {
  final sdlSetGpuTextureNameLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlInsertGpuDebugLabel(
  Pointer<SdlGpuCommandBuffer> commandBuffer,
  String? text,
) {
  final sdlInsertGpuDebugLabelLookupFunction = _libSdl
      .lookupFunction<
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
/// Begins a debug group with an arbitrary name.
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
/// {@category gpu}
void sdlPushGpuDebugGroup(
  Pointer<SdlGpuCommandBuffer> commandBuffer,
  String? name,
) {
  final sdlPushGpuDebugGroupLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlPopGpuDebugGroup(Pointer<SdlGpuCommandBuffer> commandBuffer) {
  final sdlPopGpuDebugGroupLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlReleaseGpuTexture(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuTexture> texture,
) {
  final sdlReleaseGpuTextureLookupFunction = _libSdl
      .lookupFunction<
        Void Function(
          Pointer<SdlGpuDevice> device,
          Pointer<SdlGpuTexture> texture,
        ),
        void Function(
          Pointer<SdlGpuDevice> device,
          Pointer<SdlGpuTexture> texture,
        )
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
/// {@category gpu}
void sdlReleaseGpuSampler(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuSampler> sampler,
) {
  final sdlReleaseGpuSamplerLookupFunction = _libSdl
      .lookupFunction<
        Void Function(
          Pointer<SdlGpuDevice> device,
          Pointer<SdlGpuSampler> sampler,
        ),
        void Function(
          Pointer<SdlGpuDevice> device,
          Pointer<SdlGpuSampler> sampler,
        )
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
/// {@category gpu}
void sdlReleaseGpuBuffer(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuBuffer> buffer,
) {
  final sdlReleaseGpuBufferLookupFunction = _libSdl
      .lookupFunction<
        Void Function(
          Pointer<SdlGpuDevice> device,
          Pointer<SdlGpuBuffer> buffer,
        ),
        void Function(
          Pointer<SdlGpuDevice> device,
          Pointer<SdlGpuBuffer> buffer,
        )
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
/// {@category gpu}
void sdlReleaseGpuTransferBuffer(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuTransferBuffer> transferBuffer,
) {
  final sdlReleaseGpuTransferBufferLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlReleaseGpuComputePipeline(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuComputePipeline> computePipeline,
) {
  final sdlReleaseGpuComputePipelineLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlReleaseGpuShader(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuShader> shader,
) {
  final sdlReleaseGpuShaderLookupFunction = _libSdl
      .lookupFunction<
        Void Function(
          Pointer<SdlGpuDevice> device,
          Pointer<SdlGpuShader> shader,
        ),
        void Function(
          Pointer<SdlGpuDevice> device,
          Pointer<SdlGpuShader> shader,
        )
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
/// {@category gpu}
void sdlReleaseGpuGraphicsPipeline(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuGraphicsPipeline> graphicsPipeline,
) {
  final sdlReleaseGpuGraphicsPipelineLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
Pointer<SdlGpuCommandBuffer> sdlAcquireGpuCommandBuffer(
  Pointer<SdlGpuDevice> device,
) {
  final sdlAcquireGpuCommandBufferLookupFunction = _libSdl
      .lookupFunction<
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
void sdlPushGpuVertexUniformData(
  Pointer<SdlGpuCommandBuffer> commandBuffer,
  int slotIndex,
  Pointer<NativeType> data,
  int length,
) {
  final sdlPushGpuVertexUniformDataLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlPushGpuFragmentUniformData(
  Pointer<SdlGpuCommandBuffer> commandBuffer,
  int slotIndex,
  Pointer<NativeType> data,
  int length,
) {
  final sdlPushGpuFragmentUniformDataLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlPushGpuComputeUniformData(
  Pointer<SdlGpuCommandBuffer> commandBuffer,
  int slotIndex,
  Pointer<NativeType> data,
  int length,
) {
  final sdlPushGpuComputeUniformDataLookupFunction = _libSdl
      .lookupFunction<
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
Pointer<SdlGpuRenderPass> sdlBeginGpuRenderPass(
  Pointer<SdlGpuCommandBuffer> commandBuffer,
  Pointer<SdlGpuColorTargetInfo> colorTargetInfos,
  int numColorTargets,
  Pointer<SdlGpuDepthStencilTargetInfo> depthStencilTargetInfo,
) {
  final sdlBeginGpuRenderPassLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlBindGpuGraphicsPipeline(
  Pointer<SdlGpuRenderPass> renderPass,
  Pointer<SdlGpuGraphicsPipeline> graphicsPipeline,
) {
  final sdlBindGpuGraphicsPipelineLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlSetGpuViewport(
  Pointer<SdlGpuRenderPass> renderPass,
  Pointer<SdlGpuViewport> viewport,
) {
  final sdlSetGpuViewportLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlSetGpuScissor(
  Pointer<SdlGpuRenderPass> renderPass,
  Pointer<SdlRect> scissor,
) {
  final sdlSetGpuScissorLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlSetGpuBlendConstants(
  Pointer<SdlGpuRenderPass> renderPass,
  SdlFColor blendAnts,
) {
  final sdlSetGpuBlendConstantsLookupFunction = _libSdl
      .lookupFunction<
        Void Function(
          Pointer<SdlGpuRenderPass> renderPass,
          SdlFColor blendAnts,
        ),
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
/// {@category gpu}
void sdlSetGpuStencilReference(
  Pointer<SdlGpuRenderPass> renderPass,
  int reference,
) {
  final sdlSetGpuStencilReferenceLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlBindGpuVertexBuffers(
  Pointer<SdlGpuRenderPass> renderPass,
  int firstSlot,
  Pointer<SdlGpuBufferBinding> bindings,
  int numBindings,
) {
  final sdlBindGpuVertexBuffersLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlBindGpuIndexBuffer(
  Pointer<SdlGpuRenderPass> renderPass,
  Pointer<SdlGpuBufferBinding> binding,
  int indexElementSize,
) {
  final sdlBindGpuIndexBufferLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlBindGpuVertexSamplers(
  Pointer<SdlGpuRenderPass> renderPass,
  int firstSlot,
  Pointer<SdlGpuTextureSamplerBinding> textureSamplerBindings,
  int numBindings,
) {
  final sdlBindGpuVertexSamplersLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlBindGpuVertexStorageTextures(
  Pointer<SdlGpuRenderPass> renderPass,
  int firstSlot,
  Pointer<Pointer<SdlGpuTexture>> storageTextures,
  int numBindings,
) {
  final sdlBindGpuVertexStorageTexturesLookupFunction = _libSdl
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
/// {@category gpu}
void sdlBindGpuVertexStorageBuffers(
  Pointer<SdlGpuRenderPass> renderPass,
  int firstSlot,
  Pointer<Pointer<SdlGpuBuffer>> storageBuffers,
  int numBindings,
) {
  final sdlBindGpuVertexStorageBuffersLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlBindGpuFragmentSamplers(
  Pointer<SdlGpuRenderPass> renderPass,
  int firstSlot,
  Pointer<SdlGpuTextureSamplerBinding> textureSamplerBindings,
  int numBindings,
) {
  final sdlBindGpuFragmentSamplersLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlBindGpuFragmentStorageTextures(
  Pointer<SdlGpuRenderPass> renderPass,
  int firstSlot,
  Pointer<Pointer<SdlGpuTexture>> storageTextures,
  int numBindings,
) {
  final sdlBindGpuFragmentStorageTexturesLookupFunction = _libSdl
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
/// {@category gpu}
void sdlBindGpuFragmentStorageBuffers(
  Pointer<SdlGpuRenderPass> renderPass,
  int firstSlot,
  Pointer<Pointer<SdlGpuBuffer>> storageBuffers,
  int numBindings,
) {
  final sdlBindGpuFragmentStorageBuffersLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlDrawGpuIndexedPrimitives(
  Pointer<SdlGpuRenderPass> renderPass,
  int numIndices,
  int numInstances,
  int firstIndex,
  int vertexOffset,
  int firstInstance,
) {
  final sdlDrawGpuIndexedPrimitivesLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlDrawGpuPrimitives(
  Pointer<SdlGpuRenderPass> renderPass,
  int numVertices,
  int numInstances,
  int firstVertex,
  int firstInstance,
) {
  final sdlDrawGpuPrimitivesLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlDrawGpuPrimitivesIndirect(
  Pointer<SdlGpuRenderPass> renderPass,
  Pointer<SdlGpuBuffer> buffer,
  int offset,
  int drawCount,
) {
  final sdlDrawGpuPrimitivesIndirectLookupFunction = _libSdl
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
/// {@category gpu}
void sdlDrawGpuIndexedPrimitivesIndirect(
  Pointer<SdlGpuRenderPass> renderPass,
  Pointer<SdlGpuBuffer> buffer,
  int offset,
  int drawCount,
) {
  final sdlDrawGpuIndexedPrimitivesIndirectLookupFunction = _libSdl
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
/// {@category gpu}
void sdlEndGpuRenderPass(Pointer<SdlGpuRenderPass> renderPass) {
  final sdlEndGpuRenderPassLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
Pointer<SdlGpuComputePass> sdlBeginGpuComputePass(
  Pointer<SdlGpuCommandBuffer> commandBuffer,
  Pointer<SdlGpuStorageTextureReadWriteBinding> storageTextureBindings,
  int numStorageTextureBindings,
  Pointer<SdlGpuStorageBufferReadWriteBinding> storageBufferBindings,
  int numStorageBufferBindings,
) {
  final sdlBeginGpuComputePassLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlBindGpuComputePipeline(
  Pointer<SdlGpuComputePass> computePass,
  Pointer<SdlGpuComputePipeline> computePipeline,
) {
  final sdlBindGpuComputePipelineLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlBindGpuComputeSamplers(
  Pointer<SdlGpuComputePass> computePass,
  int firstSlot,
  Pointer<SdlGpuTextureSamplerBinding> textureSamplerBindings,
  int numBindings,
) {
  final sdlBindGpuComputeSamplersLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlBindGpuComputeStorageTextures(
  Pointer<SdlGpuComputePass> computePass,
  int firstSlot,
  Pointer<Pointer<SdlGpuTexture>> storageTextures,
  int numBindings,
) {
  final sdlBindGpuComputeStorageTexturesLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlBindGpuComputeStorageBuffers(
  Pointer<SdlGpuComputePass> computePass,
  int firstSlot,
  Pointer<Pointer<SdlGpuBuffer>> storageBuffers,
  int numBindings,
) {
  final sdlBindGpuComputeStorageBuffersLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlDispatchGpuCompute(
  Pointer<SdlGpuComputePass> computePass,
  int groupcountX,
  int groupcountY,
  int groupcountZ,
) {
  final sdlDispatchGpuComputeLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlDispatchGpuComputeIndirect(
  Pointer<SdlGpuComputePass> computePass,
  Pointer<SdlGpuBuffer> buffer,
  int offset,
) {
  final sdlDispatchGpuComputeIndirectLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlEndGpuComputePass(Pointer<SdlGpuComputePass> computePass) {
  final sdlEndGpuComputePassLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
Pointer<NativeType> sdlMapGpuTransferBuffer(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuTransferBuffer> transferBuffer,
  bool cycle,
) {
  final sdlMapGpuTransferBufferLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlUnmapGpuTransferBuffer(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuTransferBuffer> transferBuffer,
) {
  final sdlUnmapGpuTransferBufferLookupFunction = _libSdl
      .lookupFunction<
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
/// \sa SDL_EndGPUCopyPass
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUCopyPass * SDLCALL SDL_BeginGPUCopyPass( SDL_GPUCommandBuffer *command_buffer)
/// ```
/// {@category gpu}
Pointer<SdlGpuCopyPass> sdlBeginGpuCopyPass(
  Pointer<SdlGpuCommandBuffer> commandBuffer,
) {
  final sdlBeginGpuCopyPassLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlGpuCopyPass> Function(
          Pointer<SdlGpuCommandBuffer> commandBuffer,
        ),
        Pointer<SdlGpuCopyPass> Function(
          Pointer<SdlGpuCommandBuffer> commandBuffer,
        )
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
/// {@category gpu}
void sdlUploadToGpuTexture(
  Pointer<SdlGpuCopyPass> copyPass,
  Pointer<SdlGpuTextureTransferInfo> source,
  Pointer<SdlGpuTextureRegion> destination,
  bool cycle,
) {
  final sdlUploadToGpuTextureLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlUploadToGpuBuffer(
  Pointer<SdlGpuCopyPass> copyPass,
  Pointer<SdlGpuTransferBufferLocation> source,
  Pointer<SdlGpuBufferRegion> destination,
  bool cycle,
) {
  final sdlUploadToGpuBufferLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlCopyGpuTextureToTexture(
  Pointer<SdlGpuCopyPass> copyPass,
  Pointer<SdlGpuTextureLocation> source,
  Pointer<SdlGpuTextureLocation> destination,
  int w,
  int h,
  int d,
  bool cycle,
) {
  final sdlCopyGpuTextureToTextureLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlCopyGpuBufferToBuffer(
  Pointer<SdlGpuCopyPass> copyPass,
  Pointer<SdlGpuBufferLocation> source,
  Pointer<SdlGpuBufferLocation> destination,
  int size,
  bool cycle,
) {
  final sdlCopyGpuBufferToBufferLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlDownloadFromGpuTexture(
  Pointer<SdlGpuCopyPass> copyPass,
  Pointer<SdlGpuTextureRegion> source,
  Pointer<SdlGpuTextureTransferInfo> destination,
) {
  final sdlDownloadFromGpuTextureLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlDownloadFromGpuBuffer(
  Pointer<SdlGpuCopyPass> copyPass,
  Pointer<SdlGpuBufferRegion> source,
  Pointer<SdlGpuTransferBufferLocation> destination,
) {
  final sdlDownloadFromGpuBufferLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlEndGpuCopyPass(Pointer<SdlGpuCopyPass> copyPass) {
  final sdlEndGpuCopyPassLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlGenerateMipmapsForGpuTexture(
  Pointer<SdlGpuCommandBuffer> commandBuffer,
  Pointer<SdlGpuTexture> texture,
) {
  final sdlGenerateMipmapsForGpuTextureLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlBlitGpuTexture(
  Pointer<SdlGpuCommandBuffer> commandBuffer,
  Pointer<SdlGpuBlitInfo> info,
) {
  final sdlBlitGpuTextureLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
bool sdlWindowSupportsGpuSwapchainComposition(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlWindow> window,
  int swapchainComposition,
) {
  final sdlWindowSupportsGpuSwapchainCompositionLookupFunction = _libSdl
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
/// {@category gpu}
bool sdlWindowSupportsGpuPresentMode(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlWindow> window,
  int presentMode,
) {
  final sdlWindowSupportsGpuPresentModeLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
bool sdlClaimWindowForGpuDevice(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlWindow> window,
) {
  final sdlClaimWindowForGpuDeviceLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlReleaseWindowFromGpuDevice(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlWindow> window,
) {
  final sdlReleaseWindowFromGpuDeviceLookupFunction = _libSdl
      .lookupFunction<
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
bool sdlSetGpuSwapchainParameters(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlWindow> window,
  int swapchainComposition,
  int presentMode,
) {
  final sdlSetGpuSwapchainParametersLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
bool sdlSetGpuAllowedFramesInFlight(
  Pointer<SdlGpuDevice> device,
  int allowedFramesInFlight,
) {
  final sdlSetGpuAllowedFramesInFlightLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlGpuDevice> device,
          Uint32 allowedFramesInFlight,
        ),
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
/// {@category gpu}
int sdlGetGpuSwapchainTextureFormat(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlWindow> window,
) {
  final sdlGetGpuSwapchainTextureFormatLookupFunction = _libSdl
      .lookupFunction<
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
/// frames are in flight. This is not an error. This NULL pointer should not be
/// passed back into SDL. Instead, it should be considered as an indication to
/// wait until the swapchain is available.
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
bool sdlAcquireGpuSwapchainTexture(
  Pointer<SdlGpuCommandBuffer> commandBuffer,
  Pointer<SdlWindow> window,
  Pointer<Pointer<SdlGpuTexture>> swapchainTexture,
  Pointer<Uint32> swapchainTextureWidth,
  Pointer<Uint32> swapchainTextureHeight,
) {
  final sdlAcquireGpuSwapchainTextureLookupFunction = _libSdl
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
/// {@category gpu}
bool sdlWaitForGpuSwapchain(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlWindow> window,
) {
  final sdlWaitForGpuSwapchainLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
bool sdlWaitAndAcquireGpuSwapchainTexture(
  Pointer<SdlGpuCommandBuffer> commandBuffer,
  Pointer<SdlWindow> window,
  Pointer<Pointer<SdlGpuTexture>> swapchainTexture,
  Pointer<Uint32> swapchainTextureWidth,
  Pointer<Uint32> swapchainTextureHeight,
) {
  final sdlWaitAndAcquireGpuSwapchainTextureLookupFunction = _libSdl
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
/// {@category gpu}
bool sdlSubmitGpuCommandBuffer(Pointer<SdlGpuCommandBuffer> commandBuffer) {
  final sdlSubmitGpuCommandBufferLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
Pointer<SdlGpuFence> sdlSubmitGpuCommandBufferAndAcquireFence(
  Pointer<SdlGpuCommandBuffer> commandBuffer,
) {
  final sdlSubmitGpuCommandBufferAndAcquireFenceLookupFunction = _libSdl
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
/// {@category gpu}
bool sdlCancelGpuCommandBuffer(Pointer<SdlGpuCommandBuffer> commandBuffer) {
  final sdlCancelGpuCommandBufferLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
bool sdlWaitForGpuIdle(Pointer<SdlGpuDevice> device) {
  final sdlWaitForGpuIdleLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
bool sdlWaitForGpuFences(
  Pointer<SdlGpuDevice> device,
  bool waitAll,
  Pointer<Pointer<SdlGpuFence>> fences,
  int numFences,
) {
  final sdlWaitForGpuFencesLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
bool sdlQueryGpuFence(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuFence> fence,
) {
  final sdlQueryGpuFenceLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlGpuDevice> device,
          Pointer<SdlGpuFence> fence,
        ),
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
/// {@category gpu}
void sdlReleaseGpuFence(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuFence> fence,
) {
  final sdlReleaseGpuFenceLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
int sdlGpuTextureFormatTexelBlockSize(int format) {
  final sdlGpuTextureFormatTexelBlockSizeLookupFunction = _libSdl
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
/// {@category gpu}
bool sdlGpuTextureSupportsFormat(
  Pointer<SdlGpuDevice> device,
  int format,
  int type,
  int usage,
) {
  final sdlGpuTextureSupportsFormatLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlGpuDevice> device,
          Int32 format,
          Int32 type,
          Uint32 usage,
        ),
        int Function(
          Pointer<SdlGpuDevice> device,
          int format,
          int type,
          int usage,
        )
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
/// {@category gpu}
bool sdlGpuTextureSupportsSampleCount(
  Pointer<SdlGpuDevice> device,
  int format,
  int sampleCount,
) {
  final sdlGpuTextureSupportsSampleCountLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
int sdlCalculateGpuTextureFormatSize(
  int format,
  int width,
  int height,
  int depthOrLayerCount,
) {
  final sdlCalculateGpuTextureFormatSizeLookupFunction = _libSdl
      .lookupFunction<
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
/// Get the SDL pixel format corresponding to a GPU texture format.
///
/// \param format a texture format.
/// \returns the corresponding pixel format, or SDL_PIXELFORMAT_UNKNOWN if
/// there is no corresponding pixel format.
///
/// \since This function is available since SDL 3.4.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_PixelFormat SDLCALL SDL_GetPixelFormatFromGPUTextureFormat(SDL_GPUTextureFormat format)
/// ```
/// {@category gpu}
int sdlGetPixelFormatFromGpuTextureFormat(int format) {
  final sdlGetPixelFormatFromGpuTextureFormatLookupFunction = _libSdl
      .lookupFunction<Int32 Function(Int32 format), int Function(int format)>(
        'SDL_GetPixelFormatFromGPUTextureFormat',
      );
  return sdlGetPixelFormatFromGpuTextureFormatLookupFunction(format);
}

///
/// Get the GPU texture format corresponding to an SDL pixel format.
///
/// \param format a pixel format.
/// \returns the corresponding GPU texture format, or
/// SDL_GPU_TEXTUREFORMAT_INVALID if there is no corresponding GPU
/// texture format.
///
/// \since This function is available since SDL 3.4.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUTextureFormat SDLCALL SDL_GetGPUTextureFormatFromPixelFormat(SDL_PixelFormat format)
/// ```
/// {@category gpu}
int sdlGetGpuTextureFormatFromPixelFormat(int format) {
  final sdlGetGpuTextureFormatFromPixelFormatLookupFunction = _libSdl
      .lookupFunction<Int32 Function(Int32 format), int Function(int format)>(
        'SDL_GetGPUTextureFormatFromPixelFormat',
      );
  return sdlGetGpuTextureFormatFromPixelFormatLookupFunction(format);
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
/// {@category gpu}
void sdlGdkSuspendGpu(Pointer<SdlGpuDevice> device) {
  final sdlGdkSuspendGpuLookupFunction = _libSdl
      .lookupFunction<
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
/// {@category gpu}
void sdlGdkResumeGpu(Pointer<SdlGpuDevice> device) {
  final sdlGdkResumeGpuLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<SdlGpuDevice> device),
        void Function(Pointer<SdlGpuDevice> device)
      >('SDL_GDKResumeGPU');
  return sdlGdkResumeGpuLookupFunction(device);
}
