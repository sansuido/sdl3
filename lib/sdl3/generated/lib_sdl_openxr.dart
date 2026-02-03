// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
part of '../sdl.dart';

///
/// Creates an OpenXR session.
///
/// The OpenXR system ID is pulled from the passed GPU context.
///
/// \param device a GPU context.
/// \param createinfo the create info for the OpenXR session, sans the system
/// ID.
/// \param session a pointer filled in with an OpenXR session created for the
/// given device.
/// \returns the result of the call.
///
/// \since This function is available since SDL 3.6.0.
///
/// \sa SDL_CreateGPUDeviceWithProperties
///
/// ```c
/// extern SDL_DECLSPEC XrResult SDLCALL SDL_CreateGPUXRSession(SDL_GPUDevice *device, const XrSessionCreateInfo *createinfo, XrSession *session)
/// ```
/// {@category openxr}
int sdlCreateGpuxrSession(
  Pointer<SdlGpuDevice> device,
  Pointer<XrSessionCreateInfo> createinfo,
  Pointer<Uint64> session,
) {
  final sdlCreateGpuxrSessionLookupFunction = _libSdl
      .lookupFunction<
        Int32 Function(
          Pointer<SdlGpuDevice> device,
          Pointer<XrSessionCreateInfo> createinfo,
          Pointer<Uint64> session,
        ),
        int Function(
          Pointer<SdlGpuDevice> device,
          Pointer<XrSessionCreateInfo> createinfo,
          Pointer<Uint64> session,
        )
      >('SDL_CreateGPUXRSession');
  return sdlCreateGpuxrSessionLookupFunction(device, createinfo, session);
}

///
/// Queries the GPU device for supported XR swapchain image formats.
///
/// The returned pointer should be allocated with SDL_malloc() and will be
/// passed to SDL_free().
///
/// \param device a GPU context.
/// \param session an OpenXR session created for the given device.
/// \param num_formats a pointer filled with the number of supported XR
/// swapchain formats.
/// \returns a 0 terminated array of supported formats or NULL on failure; call
/// SDL_GetError() for more information. This should be freed with
/// SDL_free() when it is no longer needed.
///
/// \since This function is available since SDL 3.6.0.
///
/// \sa SDL_CreateGPUXRSwapchain
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUTextureFormat * SDLCALL SDL_GetGPUXRSwapchainFormats(SDL_GPUDevice *device, XrSession session, int *num_formats)
/// ```
/// {@category openxr}
Pointer<Int32> sdlGetGpuxrSwapchainFormats(
  Pointer<SdlGpuDevice> device,
  int session,
  Pointer<Int32> numFormats,
) {
  final sdlGetGpuxrSwapchainFormatsLookupFunction = _libSdl
      .lookupFunction<
        Pointer<Int32> Function(
          Pointer<SdlGpuDevice> device,
          Uint64 session,
          Pointer<Int32> numFormats,
        ),
        Pointer<Int32> Function(
          Pointer<SdlGpuDevice> device,
          int session,
          Pointer<Int32> numFormats,
        )
      >('SDL_GetGPUXRSwapchainFormats');
  return sdlGetGpuxrSwapchainFormatsLookupFunction(device, session, numFormats);
}

///
/// Creates an OpenXR swapchain.
///
/// The array returned via `textures` is sized according to
/// `xrEnumerateSwapchainImages`, and thus should only be accessed via index
/// values returned from `xrAcquireSwapchainImage`.
///
/// Applications are still allowed to call `xrEnumerateSwapchainImages` on the
/// returned XrSwapchain if they need to get the exact size of the array.
///
/// \param device a GPU context.
/// \param session an OpenXR session created for the given device.
/// \param createinfo the create info for the OpenXR swapchain, sans the
/// format.
/// \param format a supported format for the OpenXR swapchain.
/// \param swapchain a pointer filled in with the created OpenXR swapchain.
/// \param textures a pointer filled in with the array of created swapchain
/// images.
/// \returns the result of the call.
///
/// \since This function is available since SDL 3.6.0.
///
/// \sa SDL_CreateGPUDeviceWithProperties
/// \sa SDL_CreateGPUXRSession
/// \sa SDL_GetGPUXRSwapchainFormats
/// \sa SDL_DestroyGPUXRSwapchain
///
/// ```c
/// extern SDL_DECLSPEC XrResult SDLCALL SDL_CreateGPUXRSwapchain( SDL_GPUDevice *device, XrSession session, const XrSwapchainCreateInfo *createinfo, SDL_GPUTextureFormat format, XrSwapchain *swapchain, SDL_GPUTexture ***textures)
/// ```
/// {@category openxr}
int sdlCreateGpuxrSwapchain(
  Pointer<SdlGpuDevice> device,
  int session,
  Pointer<XrSwapchainCreateInfo> createinfo,
  int format,
  Pointer<Uint64> swapchain,
  Pointer<Pointer<Pointer<SdlGpuTexture>>> textures,
) {
  final sdlCreateGpuxrSwapchainLookupFunction = _libSdl
      .lookupFunction<
        Int32 Function(
          Pointer<SdlGpuDevice> device,
          Uint64 session,
          Pointer<XrSwapchainCreateInfo> createinfo,
          Int32 format,
          Pointer<Uint64> swapchain,
          Pointer<Pointer<Pointer<SdlGpuTexture>>> textures,
        ),
        int Function(
          Pointer<SdlGpuDevice> device,
          int session,
          Pointer<XrSwapchainCreateInfo> createinfo,
          int format,
          Pointer<Uint64> swapchain,
          Pointer<Pointer<Pointer<SdlGpuTexture>>> textures,
        )
      >('SDL_CreateGPUXRSwapchain');
  return sdlCreateGpuxrSwapchainLookupFunction(
    device,
    session,
    createinfo,
    format,
    swapchain,
    textures,
  );
}

///
/// Destroys and OpenXR swapchain previously returned by
/// SDL_CreateGPUXRSwapchain.
///
/// \param device a GPU context.
/// \param swapchain a swapchain previously returned by
/// SDL_CreateGPUXRSwapchain.
/// \param swapchainImages an array of swapchain images returned by the same
/// call to SDL_CreateGPUXRSwapchain.
/// \returns the result of the call.
///
/// \since This function is available since SDL 3.6.0.
///
/// \sa SDL_CreateGPUDeviceWithProperties
/// \sa SDL_CreateGPUXRSession
/// \sa SDL_CreateGPUXRSwapchain
///
/// ```c
/// extern SDL_DECLSPEC XrResult SDLCALL SDL_DestroyGPUXRSwapchain(SDL_GPUDevice *device, XrSwapchain swapchain, SDL_GPUTexture **swapchainImages)
/// ```
/// {@category openxr}
int sdlDestroyGpuxrSwapchain(
  Pointer<SdlGpuDevice> device,
  int swapchain,
  Pointer<Pointer<SdlGpuTexture>> swapchainImages,
) {
  final sdlDestroyGpuxrSwapchainLookupFunction = _libSdl
      .lookupFunction<
        Int32 Function(
          Pointer<SdlGpuDevice> device,
          Uint64 swapchain,
          Pointer<Pointer<SdlGpuTexture>> swapchainImages,
        ),
        int Function(
          Pointer<SdlGpuDevice> device,
          int swapchain,
          Pointer<Pointer<SdlGpuTexture>> swapchainImages,
        )
      >('SDL_DestroyGPUXRSwapchain');
  return sdlDestroyGpuxrSwapchainLookupFunction(
    device,
    swapchain,
    swapchainImages,
  );
}

///
/// Dynamically load the OpenXR loader.
///
/// This can be called at any time.
///
/// SDL keeps a reference count of the OpenXR loader, calling this function
/// multiple times will increment that count, rather than loading the library
/// multiple times.
///
/// If not called, this will be implicitly called when creating a GPU device
/// with OpenXR.
///
/// This function will use the platform default OpenXR loader name, unless the
/// `SDL_HINT_OPENXR_LIBRARY` hint is set.
///
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.6.0.
///
/// \sa SDL_HINT_OPENXR_LIBRARY
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_OpenXR_LoadLibrary(void)
/// ```
/// {@category openxr}
bool sdlOpenXrLoadLibrary() {
  final sdlOpenXrLoadLibraryLookupFunction = _libSdl
      .lookupFunction<Uint8 Function(), int Function()>(
        'SDL_OpenXR_LoadLibrary',
      );
  return sdlOpenXrLoadLibraryLookupFunction() == 1;
}

///
/// Unload the OpenXR loader previously loaded by SDL_OpenXR_LoadLibrary.
///
/// SDL keeps a reference count of the OpenXR loader, calling this function
/// will decrement that count. Once the reference count reaches zero, the
/// library is unloaded.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.6.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_OpenXR_UnloadLibrary(void)
/// ```
/// {@category openxr}
void sdlOpenXrUnloadLibrary() {
  final sdlOpenXrUnloadLibraryLookupFunction = _libSdl
      .lookupFunction<Void Function(), void Function()>(
        'SDL_OpenXR_UnloadLibrary',
      );
  return sdlOpenXrUnloadLibraryLookupFunction();
}

///
/// Get the address of the `xrGetInstanceProcAddr` function.
///
/// This should be called after either calling SDL_OpenXR_LoadLibrary() or
/// creating an OpenXR SDL_GPUDevice.
///
/// The actual type of the returned function pointer is
/// PFN_xrGetInstanceProcAddr, but that isn't always available. You should
/// include the OpenXR headers before this header, or cast the return value of
/// this function to the correct type.
///
/// \returns the function pointer for `xrGetInstanceProcAddr` or NULL on
/// failure; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.6.0.
///
/// ```c
/// extern SDL_DECLSPEC PFN_xrGetInstanceProcAddr SDLCALL SDL_OpenXR_GetXrGetInstanceProcAddr(void)
/// ```
/// {@category openxr}
Pointer<NativeType> sdlOpenXrGetXrGetInstanceProcAddr() {
  final sdlOpenXrGetXrGetInstanceProcAddrLookupFunction = _libSdl
      .lookupFunction<
        Pointer<NativeType> Function(),
        Pointer<NativeType> Function()
      >('SDL_OpenXR_GetXrGetInstanceProcAddr');
  return sdlOpenXrGetXrGetInstanceProcAddrLookupFunction();
}
