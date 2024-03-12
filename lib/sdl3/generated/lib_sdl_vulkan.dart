// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Dynamically load the Vulkan loader library.
///
/// This should be called after initializing the video driver, but before
/// creating any Vulkan windows. If no Vulkan loader library is loaded, the
/// default library will be loaded upon creation of the first Vulkan window.
///
/// It is fairly common for Vulkan applications to link with libvulkan instead
/// of explicitly loading it at run time. This will work with SDL provided the
/// application links to a dynamic library and both it and SDL use the same
/// search path.
///
/// If you specify a non-NULL `path`, an application should retrieve all of the
/// Vulkan functions it uses from the dynamic library using
/// SDL_Vulkan_GetVkGetInstanceProcAddr unless you can guarantee `path` points
/// to the same vulkan loader library the application linked to.
///
/// On Apple devices, if `path` is NULL, SDL will attempt to find the
/// `vkGetInstanceProcAddr` address within all the Mach-O images of the current
/// process. This is because it is fairly common for Vulkan applications to
/// link with libvulkan (and historically MoltenVK was provided as a static
/// library). If it is not found, on macOS, SDL will attempt to load
/// `vulkan.framework/vulkan`, `libvulkan.1.dylib`,
/// `MoltenVK.framework/MoltenVK`, and `libMoltenVK.dylib`, in that order. On
/// iOS, SDL will attempt to load `libMoltenVK.dylib`. Applications using a
/// dynamic framework or .dylib must ensure it is included in its application
/// bundle.
///
/// On non-Apple devices, application linking with a static libvulkan is not
/// supported. Either do not link to the Vulkan loader or link to a dynamic
/// library version.
///
/// \param path The platform dependent Vulkan loader library name or NULL
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_Vulkan_GetVkInstanceProcAddr
/// \sa SDL_Vulkan_UnloadLibrary
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_Vulkan_LoadLibrary(const char *path)
/// ```
int sdlVulkanLoadLibrary(String? path) {
  final sdlVulkanLoadLibraryLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Utf8> path),
      int Function(Pointer<Utf8> path)>('SDL_Vulkan_LoadLibrary');
  final pathPointer = path != null ? path.toNativeUtf8() : nullptr;
  final result = sdlVulkanLoadLibraryLookupFunction(pathPointer);
  calloc.free(pathPointer);
  return result;
}

///
/// Get the address of the `vkGetInstanceProcAddr` function.
///
/// This should be called after either calling SDL_Vulkan_LoadLibrary() or
/// creating an SDL_Window with the `SDL_WINDOW_VULKAN` flag.
///
/// The actual type of the returned function pointer is
/// PFN_vkGetInstanceProcAddr, but that isn't available because the Vulkan
/// headers are not included here. You should cast the return value of this
/// function to that type, e.g.
///
/// `vkGetInstanceProcAddr =
/// (PFN_vkGetInstanceProcAddr)SDL_Vulkan_GetVkGetInstanceProcAddr();`
///
/// \returns the function pointer for `vkGetInstanceProcAddr` or NULL on error.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_FunctionPointer SDLCALL SDL_Vulkan_GetVkGetInstanceProcAddr(void)
/// ```
Pointer<NativeType> sdlVulkanGetVkGetInstanceProcAddr() {
  final sdlVulkanGetVkGetInstanceProcAddrLookupFunction =
      libSdl3.lookupFunction<
          Pointer<NativeType> Function(),
          Pointer<NativeType>
              Function()>('SDL_Vulkan_GetVkGetInstanceProcAddr');
  return sdlVulkanGetVkGetInstanceProcAddrLookupFunction();
}

///
/// Unload the Vulkan library previously loaded by SDL_Vulkan_LoadLibrary()
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_Vulkan_LoadLibrary
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_Vulkan_UnloadLibrary(void)
/// ```
void sdlVulkanUnloadLibrary() {
  final sdlVulkanUnloadLibraryLookupFunction =
      libSdl3.lookupFunction<Void Function(), void Function()>(
          'SDL_Vulkan_UnloadLibrary');
  return sdlVulkanUnloadLibraryLookupFunction();
}

///
/// Get the Vulkan instance extensions needed for vkCreateInstance.
///
/// This should be called after either calling SDL_Vulkan_LoadLibrary() or
/// creating an SDL_Window with the `SDL_WINDOW_VULKAN` flag.
///
/// On return, the variable pointed to by `count` will be set to the number of
/// elements returned, suitable for using with
/// VkInstanceCreateInfo::enabledExtensionCount, and the returned array can be
/// used with VkInstanceCreateInfo::ppEnabledExtensionNames, for calling
/// Vulkan's vkCreateInstance API.
///
/// You should not free the returned array; it is owned by SDL.
///
/// \param count a pointer filled in with the number of extensions returned.
/// \returns An array of extension name strings on success, NULL on error.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_Vulkan_CreateSurface
///
/// ```c
/// extern DECLSPEC char const* const* SDLCALL SDL_Vulkan_GetInstanceExtensions(Uint32 *count)
/// ```
Pointer<Pointer<Int8>> sdlVulkanGetInstanceExtensions(Pointer<Uint32> count) {
  final sdlVulkanGetInstanceExtensionsLookupFunction = libSdl3.lookupFunction<
      Pointer<Pointer<Int8>> Function(Pointer<Uint32> count),
      Pointer<Pointer<Int8>> Function(
          Pointer<Uint32> count)>('SDL_Vulkan_GetInstanceExtensions');
  return sdlVulkanGetInstanceExtensionsLookupFunction(count);
}

///
/// Create a Vulkan rendering surface for a window.
///
/// The `window` must have been created with the `SDL_WINDOW_VULKAN` flag and
/// `instance` must have been created with extensions returned by
/// SDL_Vulkan_GetInstanceExtensions() enabled.
///
/// If `allocator` is NULL, Vulkan will use the system default allocator. This
/// argument is passed directly to Vulkan and isn't used by SDL itself.
///
/// \param window The window to which to attach the Vulkan surface
/// \param instance The Vulkan instance handle
/// \param allocator A VkAllocationCallbacks struct, which lets the app set the
/// allocator that creates the surface. Can be NULL.
/// \param surface A pointer to a VkSurfaceKHR handle to output the newly
/// created surface
/// \returns SDL_TRUE on success, SDL_FALSE on error.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_Vulkan_GetInstanceExtensions
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_Vulkan_CreateSurface(SDL_Window *window, VkInstance instance, const struct VkAllocationCallbacks *allocator, VkSurfaceKHR* surface)
/// ```
bool sdlVulkanCreateSurface(
    Pointer<SdlWindow> window,
    Pointer<NativeType> instance,
    Pointer<Void> allocator,
    Pointer<NativeType> surface) {
  final sdlVulkanCreateSurfaceLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window, Pointer<NativeType> instance,
          Pointer<Void> allocator, Pointer<NativeType> surface),
      int Function(
          Pointer<SdlWindow> window,
          Pointer<NativeType> instance,
          Pointer<Void> allocator,
          Pointer<NativeType> surface)>('SDL_Vulkan_CreateSurface');
  return sdlVulkanCreateSurfaceLookupFunction(
          window, instance, allocator, surface) ==
      1;
}
