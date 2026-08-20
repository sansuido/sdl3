part of '../../../sdl.dart';

extension SdlWindowPointerFromVulkanEx on Pointer<SdlWindow> {
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
  /// \param window the window to which to attach the Vulkan surface.
  /// \param instance the Vulkan instance handle.
  /// \param allocator a VkAllocationCallbacks struct, which lets the app set the
  /// allocator that creates the surface. Can be NULL.
  /// \param surface a pointer to a VkSurfaceKHR handle to output the newly
  /// created surface.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_Vulkan_GetInstanceExtensions
  /// \sa SDL_Vulkan_DestroySurface
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_Vulkan_CreateSurface(SDL_Window *window, VkInstance instance, const struct VkAllocationCallbacks *allocator, VkSurfaceKHR *surface)
  /// ```
  ///
  /// See also:
  /// - [SDL_Vulkan_CreateSurface - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_Vulkan_CreateSurface)
  ///
  /// {@category vulkan}
  bool createSurface(
    VkInstance instance,
    Pointer<VkAllocationCallbacks> allocator,
    Pointer<VkSurfaceKHR> surface,
  ) => sdlVulkanCreateSurface(this, instance, allocator, surface);
}
