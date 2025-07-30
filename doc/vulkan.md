
# CategoryVulkan

Functions for creating Vulkan surfaces on SDL windows.

For the most part, Vulkan operates independent of SDL, but it benefits from
a little support during setup.

Use SDL_Vulkan_GetInstanceExtensions() to get platform-specific bits for
creating a VkInstance, then SDL_Vulkan_GetVkGetInstanceProcAddr() to get
the appropriate function for querying Vulkan entry points. Then
SDL_Vulkan_CreateSurface() will get you the final pieces you need to
prepare for rendering into an SDL_Window with Vulkan.

Unlike OpenGL, most of the details of "context" creation and window buffer
swapping are handled by the Vulkan API directly, so SDL doesn't provide
Vulkan equivalents of SDL_GL_SwapWindow(), etc; they aren't necessary.
