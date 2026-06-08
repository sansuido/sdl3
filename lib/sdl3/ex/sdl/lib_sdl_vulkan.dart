part of '../../sdl.dart';

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
/// \returns an array of extension name strings on success, NULL on failure;
/// call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_Vulkan_CreateSurface
///
/// ```c
/// extern SDL_DECLSPEC char const * const * SDLCALL SDL_Vulkan_GetInstanceExtensions(Uint32 *count)
/// ```
/// {@category vulkan}
List<String> sdlxVulkanGetInstanceExtensions() {
  final result = <String>[];
  final countPointer = ffi.calloc<Uint32>();
  final rowsPointer = sdlVulkanGetInstanceExtensions(countPointer);
  for (var i = 0; i < countPointer.value; i++) {
    final rowPointer = rowsPointer[i];
    result.add(rowPointer.cast<Utf8>().toDartString());
  }
  countPointer.callocFree();
  return result;
}
