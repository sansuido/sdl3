import 'dart:ffi';
import 'dart:math' as math show Point, Rectangle;
import 'package:ffi/ffi.dart';
import '../../generated/const_sdl.dart';
import '../../generated/struct_sdl.dart';
import '../../generated/lib_sdl_render.dart';
import '../dart/rectangle.dart';
import '../dart/point.dart';
import 'sdl_rect.dart';

extension SdlRendererPointerEx on Pointer<SdlRenderer> {
  // lib_sdl_renderer.dart

  ///
  /// Get the window associated with a renderer.
  ///
  /// \param renderer the renderer to query.
  /// \returns the window on success or NULL on failure; call SDL_GetError() for
  /// more information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Window * SDLCALL SDL_GetRenderWindow(SDL_Renderer *renderer)
  /// ```
  Pointer<SdlWindow> getWindow() {
    return sdlGetRenderWindow(this);
  }

  ///
  /// Get the properties associated with a renderer.
  ///
  /// The following read-only properties are provided by SDL:
  ///
  /// - `SDL_PROP_RENDERER_NAME_STRING`: the name of the rendering driver
  /// - `SDL_PROP_RENDERER_WINDOW_POINTER`: the window where rendering is
  /// displayed, if any
  /// - `SDL_PROP_RENDERER_SURFACE_POINTER`: the surface where rendering is
  /// displayed, if this is a software renderer without a window
  /// - `SDL_PROP_RENDERER_VSYNC_NUMBER`: the current vsync setting
  /// - `SDL_PROP_RENDERER_MAX_TEXTURE_SIZE_NUMBER`: the maximum texture width
  /// and height
  /// - `SDL_PROP_RENDERER_TEXTURE_FORMATS_POINTER`: a (const SDL_PixelFormat *)
  /// array of pixel formats, terminated with SDL_PIXELFORMAT_UNKNOWN,
  /// representing the available texture formats for this renderer.
  /// - `SDL_PROP_RENDERER_OUTPUT_COLORSPACE_NUMBER`: an SDL_Colorspace value
  /// describing the colorspace for output to the display, defaults to
  /// SDL_COLORSPACE_SRGB.
  /// - `SDL_PROP_RENDERER_HDR_ENABLED_BOOLEAN`: true if the output colorspace is
  /// SDL_COLORSPACE_SRGB_LINEAR and the renderer is showing on a display with
  /// HDR enabled. This property can change dynamically when
  /// SDL_EVENT_WINDOW_HDR_STATE_CHANGED is sent.
  /// - `SDL_PROP_RENDERER_SDR_WHITE_POINT_FLOAT`: the value of SDR white in the
  /// SDL_COLORSPACE_SRGB_LINEAR colorspace. When HDR is enabled, this value is
  /// automatically multiplied into the color scale. This property can change
  /// dynamically when SDL_EVENT_WINDOW_HDR_STATE_CHANGED is sent.
  /// - `SDL_PROP_RENDERER_HDR_HEADROOM_FLOAT`: the additional high dynamic range
  /// that can be displayed, in terms of the SDR white point. When HDR is not
  /// enabled, this will be 1.0. This property can change dynamically when
  /// SDL_EVENT_WINDOW_HDR_STATE_CHANGED is sent.
  ///
  /// With the direct3d renderer:
  ///
  /// - `SDL_PROP_RENDERER_D3D9_DEVICE_POINTER`: the IDirect3DDevice9 associated
  /// with the renderer
  ///
  /// With the direct3d11 renderer:
  ///
  /// - `SDL_PROP_RENDERER_D3D11_DEVICE_POINTER`: the ID3D11Device associated
  /// with the renderer
  /// - `SDL_PROP_RENDERER_D3D11_SWAPCHAIN_POINTER`: the IDXGISwapChain1
  /// associated with the renderer. This may change when the window is resized.
  ///
  /// With the direct3d12 renderer:
  ///
  /// - `SDL_PROP_RENDERER_D3D12_DEVICE_POINTER`: the ID3D12Device associated
  /// with the renderer
  /// - `SDL_PROP_RENDERER_D3D12_SWAPCHAIN_POINTER`: the IDXGISwapChain4
  /// associated with the renderer.
  /// - `SDL_PROP_RENDERER_D3D12_COMMAND_QUEUE_POINTER`: the ID3D12CommandQueue
  /// associated with the renderer
  ///
  /// With the vulkan renderer:
  ///
  /// - `SDL_PROP_RENDERER_VULKAN_INSTANCE_POINTER`: the VkInstance associated
  /// with the renderer
  /// - `SDL_PROP_RENDERER_VULKAN_SURFACE_NUMBER`: the VkSurfaceKHR associated
  /// with the renderer
  /// - `SDL_PROP_RENDERER_VULKAN_PHYSICAL_DEVICE_POINTER`: the VkPhysicalDevice
  /// associated with the renderer
  /// - `SDL_PROP_RENDERER_VULKAN_DEVICE_POINTER`: the VkDevice associated with
  /// the renderer
  /// - `SDL_PROP_RENDERER_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER`: the queue
  /// family index used for rendering
  /// - `SDL_PROP_RENDERER_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER`: the queue
  /// family index used for presentation
  /// - `SDL_PROP_RENDERER_VULKAN_SWAPCHAIN_IMAGE_COUNT_NUMBER`: the number of
  /// swapchain images, or potential frames in flight, used by the Vulkan
  /// renderer
  ///
  /// With the gpu renderer:
  ///
  /// - `SDL_PROP_RENDERER_GPU_DEVICE_POINTER`: the SDL_GPUDevice associated with
  /// the renderer
  ///
  /// \param renderer the rendering context.
  /// \returns a valid property ID on success or 0 on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_PropertiesID SDLCALL SDL_GetRendererProperties(SDL_Renderer *renderer)
  /// ```
  int getProperties() {
    return sdlGetRendererProperties(this);
  }

  ///
  /// Get the output size in pixels of a rendering context.
  ///
  /// This returns the true output size in pixels, ignoring any render targets or
  /// logical size and presentation.
  ///
  /// \param renderer the rendering context.
  /// \param w a pointer filled in with the width in pixels.
  /// \param h a pointer filled in with the height in pixels.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_GetCurrentRenderOutputSize
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetRenderOutputSize(SDL_Renderer *renderer, int *w, int *h)
  /// ```
  math.Point<double> getOutputSize() {
    var wPointer = calloc<Int32>();
    var hPointer = calloc<Int32>();
    sdlGetRenderOutputSize(this, wPointer, hPointer);
    var result = math.Point<double>(
        wPointer.value.toDouble(), hPointer.value.toDouble());
    calloc.free(wPointer);
    calloc.free(hPointer);
    return result;
  }

  ///
  /// Get the current output size in pixels of a rendering context.
  ///
  /// If a rendering target is active, this will return the size of the rendering
  /// target in pixels, otherwise if a logical size is set, it will return the
  /// logical size, otherwise it will return the value of
  /// SDL_GetRenderOutputSize().
  ///
  /// \param renderer the rendering context.
  /// \param w a pointer filled in with the current width.
  /// \param h a pointer filled in with the current height.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_GetRenderOutputSize
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetCurrentRenderOutputSize(SDL_Renderer *renderer, int *w, int *h)
  /// ```
  math.Point<double> getCurrentOutputSize() {
    var wPointer = calloc<Int32>();
    var hPointer = calloc<Int32>();
    sdlGetCurrentRenderOutputSize(this, wPointer, hPointer);
    var result = math.Point<double>(
        wPointer.value.toDouble(), hPointer.value.toDouble());
    calloc.free(wPointer);
    calloc.free(hPointer);
    return result;
  }

  ///
  /// Create a texture for a rendering context.
  ///
  /// The contents of a texture when first created are not defined.
  ///
  /// \param renderer the rendering context.
  /// \param format one of the enumerated values in SDL_PixelFormat.
  /// \param access one of the enumerated values in SDL_TextureAccess.
  /// \param w the width of the texture in pixels.
  /// \param h the height of the texture in pixels.
  /// \returns the created texture or NULL on failure; call SDL_GetError() for
  /// more information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_CreateTextureFromSurface
  /// \sa SDL_CreateTextureWithProperties
  /// \sa SDL_DestroyTexture
  /// \sa SDL_GetTextureSize
  /// \sa SDL_UpdateTexture
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Texture * SDLCALL SDL_CreateTexture(SDL_Renderer *renderer, SDL_PixelFormat format, SDL_TextureAccess access, int w, int h)
  /// ```
  Pointer<SdlTexture> createTexture(int format, int access, int w, int h) {
    return sdlCreateTexture(this, format, access, w, h);
  }

  ///
  /// Create a texture from an existing surface.
  ///
  /// The surface is not modified or freed by this function.
  ///
  /// The SDL_TextureAccess hint for the created texture is
  /// `SDL_TEXTUREACCESS_STATIC`.
  ///
  /// The pixel format of the created texture may be different from the pixel
  /// format of the surface, and can be queried using the
  /// SDL_PROP_TEXTURE_FORMAT_NUMBER property.
  ///
  /// \param renderer the rendering context.
  /// \param surface the SDL_Surface structure containing pixel data used to fill
  /// the texture.
  /// \returns the created texture or NULL on failure; call SDL_GetError() for
  /// more information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_CreateTexture
  /// \sa SDL_CreateTextureWithProperties
  /// \sa SDL_DestroyTexture
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Texture * SDLCALL SDL_CreateTextureFromSurface(SDL_Renderer *renderer, SDL_Surface *surface)
  /// ```
  Pointer<SdlTexture> createTextureFromSurface(Pointer<SdlSurface> surface) {
    return sdlCreateTextureFromSurface(this, surface);
  }

  ///
  /// Create a texture for a rendering context with the specified properties.
  ///
  /// These are the supported properties:
  ///
  /// - `SDL_PROP_TEXTURE_CREATE_COLORSPACE_NUMBER`: an SDL_Colorspace value
  /// describing the texture colorspace, defaults to SDL_COLORSPACE_SRGB_LINEAR
  /// for floating point textures, SDL_COLORSPACE_HDR10 for 10-bit textures,
  /// SDL_COLORSPACE_SRGB for other RGB textures and SDL_COLORSPACE_JPEG for
  /// YUV textures.
  /// - `SDL_PROP_TEXTURE_CREATE_FORMAT_NUMBER`: one of the enumerated values in
  /// SDL_PixelFormat, defaults to the best RGBA format for the renderer
  /// - `SDL_PROP_TEXTURE_CREATE_ACCESS_NUMBER`: one of the enumerated values in
  /// SDL_TextureAccess, defaults to SDL_TEXTUREACCESS_STATIC
  /// - `SDL_PROP_TEXTURE_CREATE_WIDTH_NUMBER`: the width of the texture in
  /// pixels, required
  /// - `SDL_PROP_TEXTURE_CREATE_HEIGHT_NUMBER`: the height of the texture in
  /// pixels, required
  /// - `SDL_PROP_TEXTURE_CREATE_SDR_WHITE_POINT_FLOAT`: for HDR10 and floating
  /// point textures, this defines the value of 100% diffuse white, with higher
  /// values being displayed in the High Dynamic Range headroom. This defaults
  /// to 100 for HDR10 textures and 1.0 for floating point textures.
  /// - `SDL_PROP_TEXTURE_CREATE_HDR_HEADROOM_FLOAT`: for HDR10 and floating
  /// point textures, this defines the maximum dynamic range used by the
  /// content, in terms of the SDR white point. This would be equivalent to
  /// maxCLL / SDL_PROP_TEXTURE_CREATE_SDR_WHITE_POINT_FLOAT for HDR10 content.
  /// If this is defined, any values outside the range supported by the display
  /// will be scaled into the available HDR headroom, otherwise they are
  /// clipped.
  ///
  /// With the direct3d11 renderer:
  ///
  /// - `SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_POINTER`: the ID3D11Texture2D
  /// associated with the texture, if you want to wrap an existing texture.
  /// - `SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_U_POINTER`: the ID3D11Texture2D
  /// associated with the U plane of a YUV texture, if you want to wrap an
  /// existing texture.
  /// - `SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_V_POINTER`: the ID3D11Texture2D
  /// associated with the V plane of a YUV texture, if you want to wrap an
  /// existing texture.
  ///
  /// With the direct3d12 renderer:
  ///
  /// - `SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_POINTER`: the ID3D12Resource
  /// associated with the texture, if you want to wrap an existing texture.
  /// - `SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_U_POINTER`: the ID3D12Resource
  /// associated with the U plane of a YUV texture, if you want to wrap an
  /// existing texture.
  /// - `SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_V_POINTER`: the ID3D12Resource
  /// associated with the V plane of a YUV texture, if you want to wrap an
  /// existing texture.
  ///
  /// With the metal renderer:
  ///
  /// - `SDL_PROP_TEXTURE_CREATE_METAL_PIXELBUFFER_POINTER`: the CVPixelBufferRef
  /// associated with the texture, if you want to create a texture from an
  /// existing pixel buffer.
  ///
  /// With the opengl renderer:
  ///
  /// - `SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_NUMBER`: the GLuint texture
  /// associated with the texture, if you want to wrap an existing texture.
  /// - `SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_UV_NUMBER`: the GLuint texture
  /// associated with the UV plane of an NV12 texture, if you want to wrap an
  /// existing texture.
  /// - `SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_U_NUMBER`: the GLuint texture
  /// associated with the U plane of a YUV texture, if you want to wrap an
  /// existing texture.
  /// - `SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_V_NUMBER`: the GLuint texture
  /// associated with the V plane of a YUV texture, if you want to wrap an
  /// existing texture.
  ///
  /// With the opengles2 renderer:
  ///
  /// - `SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_NUMBER`: the GLuint texture
  /// associated with the texture, if you want to wrap an existing texture.
  /// - `SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_NUMBER`: the GLuint texture
  /// associated with the texture, if you want to wrap an existing texture.
  /// - `SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_UV_NUMBER`: the GLuint texture
  /// associated with the UV plane of an NV12 texture, if you want to wrap an
  /// existing texture.
  /// - `SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_U_NUMBER`: the GLuint texture
  /// associated with the U plane of a YUV texture, if you want to wrap an
  /// existing texture.
  /// - `SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_V_NUMBER`: the GLuint texture
  /// associated with the V plane of a YUV texture, if you want to wrap an
  /// existing texture.
  ///
  /// With the vulkan renderer:
  ///
  /// - `SDL_PROP_TEXTURE_CREATE_VULKAN_TEXTURE_NUMBER`: the VkImage with layout
  /// VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL associated with the texture, if
  /// you want to wrap an existing texture.
  ///
  /// \param renderer the rendering context.
  /// \param props the properties to use.
  /// \returns the created texture or NULL on failure; call SDL_GetError() for
  /// more information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_CreateProperties
  /// \sa SDL_CreateTexture
  /// \sa SDL_CreateTextureFromSurface
  /// \sa SDL_DestroyTexture
  /// \sa SDL_GetTextureSize
  /// \sa SDL_UpdateTexture
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Texture * SDLCALL SDL_CreateTextureWithProperties(SDL_Renderer *renderer, SDL_PropertiesID props)
  /// ```
  Pointer<SdlTexture> createTextureWithProperties(int props) {
    return sdlCreateTextureWithProperties(this, props);
  }

  ///
  /// Set a texture as the current rendering target.
  ///
  /// The default render target is the window for which the renderer was created.
  /// To stop rendering to a texture and render to the window again, call this
  /// function with a NULL `texture`.
  ///
  /// \param renderer the rendering context.
  /// \param texture the targeted texture, which must be created with the
  /// `SDL_TEXTUREACCESS_TARGET` flag, or NULL to render to the
  /// window instead of a texture.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_GetRenderTarget
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetRenderTarget(SDL_Renderer *renderer, SDL_Texture *texture)
  /// ```
  bool setTarget(Pointer<SdlTexture> texture) {
    return sdlSetRenderTarget(this, texture);
  }

  ///
  /// Get the current render target.
  ///
  /// The default render target is the window for which the renderer was created,
  /// and is reported a NULL here.
  ///
  /// \param renderer the rendering context.
  /// \returns the current render target or NULL for the default render target.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_SetRenderTarget
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Texture * SDLCALL SDL_GetRenderTarget(SDL_Renderer *renderer)
  /// ```
  Pointer<SdlTexture> getTarget() {
    return sdlGetRenderTarget(this);
  }

  ///
  /// Set a device independent resolution and presentation mode for rendering.
  ///
  /// This function sets the width and height of the logical rendering output.
  /// The renderer will act as if the window is always the requested dimensions,
  /// scaling to the actual window resolution as necessary.
  ///
  /// This can be useful for games that expect a fixed size, but would like to
  /// scale the output to whatever is available, regardless of how a user resizes
  /// a window, or if the display is high DPI.
  ///
  /// You can disable logical coordinates by setting the mode to
  /// SDL_LOGICAL_PRESENTATION_DISABLED, and in that case you get the full pixel
  /// resolution of the output window; it is safe to toggle logical presentation
  /// during the rendering of a frame: perhaps most of the rendering is done to
  /// specific dimensions but to make fonts look sharp, the app turns off logical
  /// presentation while drawing text.
  ///
  /// Letterboxing will only happen if logical presentation is enabled during
  /// SDL_RenderPresent; be sure to reenable it first if you were using it.
  ///
  /// You can convert coordinates in an event into rendering coordinates using
  /// SDL_ConvertEventToRenderCoordinates().
  ///
  /// \param renderer the rendering context.
  /// \param w the width of the logical resolution.
  /// \param h the height of the logical resolution.
  /// \param mode the presentation mode used.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_ConvertEventToRenderCoordinates
  /// \sa SDL_GetRenderLogicalPresentation
  /// \sa SDL_GetRenderLogicalPresentationRect
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetRenderLogicalPresentation(SDL_Renderer *renderer, int w, int h, SDL_RendererLogicalPresentation mode)
  /// ```
  bool setLogicalPresentation(int w, int h, int mode) {
    return sdlSetRenderLogicalPresentation(this, w, h, mode);
  }

  ///
  /// Get device independent resolution and presentation mode for rendering.
  ///
  /// This function gets the width and height of the logical rendering output, or
  /// the output size in pixels if a logical resolution is not enabled.
  ///
  /// \param renderer the rendering context.
  /// \param w an int to be filled with the width.
  /// \param h an int to be filled with the height.
  /// \param mode the presentation mode used.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_SetRenderLogicalPresentation
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetRenderLogicalPresentation(SDL_Renderer *renderer, int *w, int *h, SDL_RendererLogicalPresentation *mode)
  /// ```
  bool getLogicalPresentation(
      Pointer<Int32> w, Pointer<Int32> h, Pointer<Int32> mode) {
    return sdlGetRenderLogicalPresentation(this, w, h, mode);
  }

  ///
  /// Get device independent resolution and presentation mode for rendering.
  ///
  /// This function gets the width and height of the logical rendering output, or
  /// the output size in pixels if a logical resolution is not enabled.
  ///
  /// \param renderer the rendering context.
  /// \param w an int to be filled with the width.
  /// \param h an int to be filled with the height.
  /// \param mode the presentation mode used.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_SetRenderLogicalPresentation
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetRenderLogicalPresentation(SDL_Renderer *renderer, int *w, int *h, SDL_RendererLogicalPresentation *mode)
  /// ```
  math.Point<double> getLogicalSize() {
    var wPointer = calloc<Int32>();
    var hPointer = calloc<Int32>();
    var modePointer = calloc<Int32>();
    sdlGetRenderLogicalPresentation(this, wPointer, hPointer, modePointer);
    var result = math.Point<double>(
        wPointer.value.toDouble(), hPointer.value.toDouble());
    calloc.free(wPointer);
    calloc.free(hPointer);
    calloc.free(modePointer);
    return result;
  }

  ///
  /// Get device independent resolution and presentation mode for rendering.
  ///
  /// This function gets the width and height of the logical rendering output, or
  /// the output size in pixels if a logical resolution is not enabled.
  ///
  /// \param renderer the rendering context.
  /// \param w an int to be filled with the width.
  /// \param h an int to be filled with the height.
  /// \param mode the presentation mode used.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_SetRenderLogicalPresentation
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetRenderLogicalPresentation(SDL_Renderer *renderer, int *w, int *h, SDL_RendererLogicalPresentation *mode)
  /// ```
  int getLogicalMode() {
    var wPointer = calloc<Int32>();
    var hPointer = calloc<Int32>();
    var modePointer = calloc<Int32>();
    sdlGetRenderLogicalPresentation(this, wPointer, hPointer, modePointer);
    var result = modePointer.value;
    calloc.free(wPointer);
    calloc.free(hPointer);
    calloc.free(modePointer);
    return result;
  }

  ///
  /// Get a point in render coordinates when given a point in window coordinates.
  ///
  /// This takes into account several states:
  ///
  /// - The window dimensions.
  /// - The logical presentation settings (SDL_SetRenderLogicalPresentation)
  /// - The scale (SDL_SetRenderScale)
  /// - The viewport (SDL_SetRenderViewport)
  ///
  /// \param renderer the rendering context.
  /// \param window_x the x coordinate in window coordinates.
  /// \param window_y the y coordinate in window coordinates.
  /// \param x a pointer filled with the x coordinate in render coordinates.
  /// \param y a pointer filled with the y coordinate in render coordinates.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_SetRenderLogicalPresentation
  /// \sa SDL_SetRenderScale
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_RenderCoordinatesFromWindow(SDL_Renderer *renderer, float window_x, float window_y, float *x, float *y)
  /// ```
  math.Point<double> coordinatesFromWindow(double windowX, double windowY) {
    var xPointer = calloc<Float>();
    var yPointer = calloc<Float>();
    sdlRenderCoordinatesFromWindow(this, windowX, windowY, xPointer, yPointer);
    var result = math.Point<double>(xPointer.value, yPointer.value);
    calloc.free(xPointer);
    calloc.free(yPointer);
    return result;
  }

  ///
  /// Get a point in window coordinates when given a point in render coordinates.
  ///
  /// This takes into account several states:
  ///
  /// - The window dimensions.
  /// - The logical presentation settings (SDL_SetRenderLogicalPresentation)
  /// - The scale (SDL_SetRenderScale)
  /// - The viewport (SDL_SetRenderViewport)
  ///
  /// \param renderer the rendering context.
  /// \param x the x coordinate in render coordinates.
  /// \param y the y coordinate in render coordinates.
  /// \param window_x a pointer filled with the x coordinate in window
  /// coordinates.
  /// \param window_y a pointer filled with the y coordinate in window
  /// coordinates.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_SetRenderLogicalPresentation
  /// \sa SDL_SetRenderScale
  /// \sa SDL_SetRenderViewport
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_RenderCoordinatesToWindow(SDL_Renderer *renderer, float x, float y, float *window_x, float *window_y)
  /// ```
  math.Point<double> coordinatesToWindow(double x, double y) {
    var windowXPointer = calloc<Float>();
    var windowYPointer = calloc<Float>();
    sdlRenderCoordinatesToWindow(this, x, y, windowXPointer, windowYPointer);
    var result = math.Point<double>(windowXPointer.value, windowYPointer.value);
    calloc.free(windowXPointer);
    calloc.free(windowYPointer);
    return result;
  }

  ///
  /// Convert the coordinates in an event to render coordinates.
  ///
  /// This takes into account several states:
  ///
  /// - The window dimensions.
  /// - The logical presentation settings (SDL_SetRenderLogicalPresentation)
  /// - The scale (SDL_SetRenderScale)
  /// - The viewport (SDL_SetRenderViewport)
  ///
  /// Touch coordinates are converted from normalized coordinates in the window
  /// to non-normalized rendering coordinates.
  ///
  /// Once converted, the coordinates may be outside the rendering area.
  ///
  /// \param renderer the rendering context.
  /// \param event the event to modify.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_RenderCoordinatesFromWindow
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_ConvertEventToRenderCoordinates(SDL_Renderer *renderer, SDL_Event *event)
  /// ```
  bool convertEventToCoordinates(Pointer<SdlEvent> event) {
    return sdlConvertEventToRenderCoordinates(this, event);
  }

  ///
  /// Set the drawing area for rendering on the current target.
  ///
  /// Drawing will clip to this area (separately from any clipping done with
  /// SDL_SetRenderClipRect), and the top left of the area will become coordinate
  /// (0, 0) for future drawing commands.
  ///
  /// The area's width and height must be >= 0.
  ///
  /// \param renderer the rendering context.
  /// \param rect the SDL_Rect structure representing the drawing area, or NULL
  /// to set the viewport to the entire target.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_GetRenderViewport
  /// \sa SDL_RenderViewportSet
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetRenderViewport(SDL_Renderer *renderer, const SDL_Rect *rect)
  /// ```
  bool setViewport([math.Rectangle<double>? rect]) {
    Pointer<SdlRect> rectPointer = nullptr;
    if (rect != null) {
      rectPointer = rect.callocInt();
    }
    var result = sdlSetRenderViewport(this, rectPointer);
    calloc.free(rectPointer);
    return result;
  }

  ///
  /// Get the drawing area for the current target.
  ///
  /// \param renderer the rendering context.
  /// \param rect an SDL_Rect structure filled in with the current drawing area.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_RenderViewportSet
  /// \sa SDL_SetRenderViewport
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetRenderViewport(SDL_Renderer *renderer, SDL_Rect *rect)
  /// ```
  math.Rectangle<double> getViewport() {
    var rectPointer = calloc<SdlRect>();
    sdlGetRenderViewport(this, rectPointer);
    var result = rectPointer.create();
    calloc.free(rectPointer);
    return result;
  }

  ///
  /// Set the clip rectangle for rendering on the specified target.
  ///
  /// \param renderer the rendering context.
  /// \param rect an SDL_Rect structure representing the clip area, relative to
  /// the viewport, or NULL to disable clipping.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_GetRenderClipRect
  /// \sa SDL_RenderClipEnabled
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetRenderClipRect(SDL_Renderer *renderer, const SDL_Rect *rect)
  /// ```
  bool setClipRect([math.Rectangle<double>? rect]) {
    Pointer<SdlRect> rectPointer = nullptr;
    if (rect != null) {
      rectPointer = rect.callocInt();
    }
    var result = sdlSetRenderClipRect(this, rectPointer);
    calloc.free(rectPointer);
    return result;
  }

  ///
  /// Get the clip rectangle for the current target.
  ///
  /// \param renderer the rendering context.
  /// \param rect an SDL_Rect structure filled in with the current clipping area
  /// or an empty rectangle if clipping is disabled.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_RenderClipEnabled
  /// \sa SDL_SetRenderClipRect
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetRenderClipRect(SDL_Renderer *renderer, SDL_Rect *rect)
  /// ```
  math.Rectangle<double> getClipRect() {
    var rectPointer = calloc<SdlRect>();
    sdlGetRenderClipRect(this, rectPointer);
    var result = rectPointer.create();
    calloc.free(rectPointer);
    return result;
  }

  ///
  /// Get whether clipping is enabled on the given renderer.
  ///
  /// \param renderer the rendering context.
  /// \returns true if clipping is enabled or false if not; call SDL_GetError()
  /// for more information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_GetRenderClipRect
  /// \sa SDL_SetRenderClipRect
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_RenderClipEnabled(SDL_Renderer *renderer)
  /// ```
  bool clipEnabled() {
    return sdlRenderClipEnabled(this);
  }

  ///
  /// Set the drawing scale for rendering on the current target.
  ///
  /// The drawing coordinates are scaled by the x/y scaling factors before they
  /// are used by the renderer. This allows resolution independent drawing with a
  /// single coordinate system.
  ///
  /// If this results in scaling or subpixel drawing by the rendering backend, it
  /// will be handled using the appropriate quality hints. For best results use
  /// integer scaling factors.
  ///
  /// \param renderer the rendering context.
  /// \param scaleX the horizontal scaling factor.
  /// \param scaleY the vertical scaling factor.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_GetRenderScale
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetRenderScale(SDL_Renderer *renderer, float scaleX, float scaleY)
  /// ```
  bool setScale(double scaleX, double scaleY) {
    return sdlSetRenderScale(this, scaleX, scaleY);
  }

  ///
  /// Get the drawing scale for the current target.
  ///
  /// \param renderer the rendering context.
  /// \param scaleX a pointer filled in with the horizontal scaling factor.
  /// \param scaleY a pointer filled in with the vertical scaling factor.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_SetRenderScale
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetRenderScale(SDL_Renderer *renderer, float *scaleX, float *scaleY)
  /// ```
  math.Point<double> getScale() {
    var scaleXPointer = calloc<Float>();
    var scaleYPointer = calloc<Float>();
    sdlGetRenderScale(this, scaleXPointer, scaleYPointer);
    var result = math.Point<double>(scaleXPointer.value, scaleYPointer.value);
    calloc.free(scaleXPointer);
    calloc.free(scaleYPointer);
    return result;
  }

  ///
  /// Set the color used for drawing operations.
  ///
  /// Set the color for drawing or filling rectangles, lines, and points, and for
  /// SDL_RenderClear().
  ///
  /// \param renderer the rendering context.
  /// \param r the red value used to draw on the rendering target.
  /// \param g the green value used to draw on the rendering target.
  /// \param b the blue value used to draw on the rendering target.
  /// \param a the alpha value used to draw on the rendering target; usually
  /// `SDL_ALPHA_OPAQUE` (255). Use SDL_SetRenderDrawBlendMode to
  /// specify how the alpha channel is used.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_GetRenderDrawColor
  /// \sa SDL_SetRenderDrawColorFloat
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetRenderDrawColor(SDL_Renderer *renderer, Uint8 r, Uint8 g, Uint8 b, Uint8 a)
  /// ```
  bool setDrawColor(int r, int g, int b, int a) {
    return sdlSetRenderDrawColor(this, r, g, b, a);
  }

  ///
  /// Set the color used for drawing operations (Rect, Line and Clear).
  ///
  /// Set the color for drawing or filling rectangles, lines, and points, and for
  /// SDL_RenderClear().
  ///
  /// \param renderer the rendering context.
  /// \param r the red value used to draw on the rendering target.
  /// \param g the green value used to draw on the rendering target.
  /// \param b the blue value used to draw on the rendering target.
  /// \param a the alpha value used to draw on the rendering target. Use
  /// SDL_SetRenderDrawBlendMode to specify how the alpha channel is
  /// used.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_GetRenderDrawColorFloat
  /// \sa SDL_SetRenderDrawColor
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetRenderDrawColorFloat(SDL_Renderer *renderer, float r, float g, float b, float a)
  /// ```
  bool setDrawColorFloat(double r, double g, double b, double a) {
    return sdlSetRenderDrawColorFloat(this, r, g, b, a);
  }

  ///
  /// Get the color used for drawing operations (Rect, Line and Clear).
  ///
  /// \param renderer the rendering context.
  /// \param r a pointer filled in with the red value used to draw on the
  /// rendering target.
  /// \param g a pointer filled in with the green value used to draw on the
  /// rendering target.
  /// \param b a pointer filled in with the blue value used to draw on the
  /// rendering target.
  /// \param a a pointer filled in with the alpha value used to draw on the
  /// rendering target; usually `SDL_ALPHA_OPAQUE` (255).
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_GetRenderDrawColorFloat
  /// \sa SDL_SetRenderDrawColor
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetRenderDrawColor(SDL_Renderer *renderer, Uint8 *r, Uint8 *g, Uint8 *b, Uint8 *a)
  /// ```
  bool getDrawColor(Pointer<SdlColor> color) {
    var rPointer = calloc<Uint8>();
    var gPointer = calloc<Uint8>();
    var bPointer = calloc<Uint8>();
    var aPointer = calloc<Uint8>();
    var result =
        sdlGetRenderDrawColor(this, rPointer, gPointer, bPointer, aPointer);
    color.ref.r = rPointer.value;
    color.ref.g = gPointer.value;
    color.ref.b = bPointer.value;
    color.ref.a = aPointer.value;
    calloc.free(rPointer);
    calloc.free(gPointer);
    calloc.free(bPointer);
    calloc.free(aPointer);
    return result;
  }

  ///
  /// Get the color used for drawing operations (Rect, Line and Clear).
  ///
  /// \param renderer the rendering context.
  /// \param r a pointer filled in with the red value used to draw on the
  /// rendering target.
  /// \param g a pointer filled in with the green value used to draw on the
  /// rendering target.
  /// \param b a pointer filled in with the blue value used to draw on the
  /// rendering target.
  /// \param a a pointer filled in with the alpha value used to draw on the
  /// rendering target.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_SetRenderDrawColorFloat
  /// \sa SDL_GetRenderDrawColor
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetRenderDrawColorFloat(SDL_Renderer *renderer, float *r, float *g, float *b, float *a)
  /// ```
  bool getDrawColorFloat(Pointer<SdlFColor> color) {
    var rPointer = calloc<Float>();
    var gPointer = calloc<Float>();
    var bPointer = calloc<Float>();
    var aPointer = calloc<Float>();
    var result = sdlGetRenderDrawColorFloat(
        this, rPointer, gPointer, bPointer, aPointer);
    color.ref.r = rPointer.value;
    color.ref.g = gPointer.value;
    color.ref.b = bPointer.value;
    color.ref.a = aPointer.value;
    calloc.free(rPointer);
    calloc.free(gPointer);
    calloc.free(bPointer);
    calloc.free(aPointer);
    return result;
  }

  ///
  /// Set the color scale used for render operations.
  ///
  /// The color scale is an additional scale multiplied into the pixel color
  /// value while rendering. This can be used to adjust the brightness of colors
  /// during HDR rendering, or changing HDR video brightness when playing on an
  /// SDR display.
  ///
  /// The color scale does not affect the alpha channel, only the color
  /// brightness.
  ///
  /// \param renderer the rendering context.
  /// \param scale the color scale value.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_GetRenderColorScale
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetRenderColorScale(SDL_Renderer *renderer, float scale)
  /// ```
  bool setColorScale(double scale) {
    return sdlSetRenderColorScale(this, scale);
  }

  ///
  /// Get the color scale used for render operations.
  ///
  /// \param renderer the rendering context.
  /// \param scale a pointer filled in with the current color scale value.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_SetRenderColorScale
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetRenderColorScale(SDL_Renderer *renderer, float *scale)
  /// ```
  double getColorScale() {
    var scalePointer = calloc<Float>();
    sdlGetRenderColorScale(this, scalePointer);
    var result = scalePointer.value;
    calloc.free(scalePointer);
    return result;
  }

  ///
  /// Set the blend mode used for drawing operations (Fill and Line).
  ///
  /// If the blend mode is not supported, the closest supported mode is chosen.
  ///
  /// \param renderer the rendering context.
  /// \param blendMode the SDL_BlendMode to use for blending.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_GetRenderDrawBlendMode
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetRenderDrawBlendMode(SDL_Renderer *renderer, SDL_BlendMode blendMode)
  /// ```
  bool setDrawBlendMode(int blendMode) {
    return sdlSetRenderDrawBlendMode(this, blendMode);
  }

  ///
  /// Get the blend mode used for drawing operations.
  ///
  /// \param renderer the rendering context.
  /// \param blendMode a pointer filled in with the current SDL_BlendMode.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_SetRenderDrawBlendMode
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetRenderDrawBlendMode(SDL_Renderer *renderer, SDL_BlendMode *blendMode)
  /// ```
  int getDrawBlendMode() {
    var blendModePointer = calloc<Uint32>();
    sdlGetRenderDrawBlendMode(this, blendModePointer);
    var result = blendModePointer.value;
    calloc.free(blendModePointer);
    return result;
  }

  ///
  /// Clear the current rendering target with the drawing color.
  ///
  /// This function clears the entire rendering target, ignoring the viewport and
  /// the clip rectangle. Note, that clearing will also set/fill all pixels of
  /// the rendering target to current renderer draw color, so make sure to invoke
  /// SDL_SetRenderDrawColor() when needed.
  ///
  /// \param renderer the rendering context.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_SetRenderDrawColor
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_RenderClear(SDL_Renderer *renderer)
  /// ```
  bool clear() {
    return sdlRenderClear(this);
  }

  ///
  /// Draw a point on the current rendering target at subpixel precision.
  ///
  /// \param renderer the renderer which should draw a point.
  /// \param x the x coordinate of the point.
  /// \param y the y coordinate of the point.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_RenderPoints
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_RenderPoint(SDL_Renderer *renderer, float x, float y)
  /// ```
  bool point(math.Point<double> point) {
    return sdlRenderPoint(this, point.x, point.y);
  }

  ///
  /// Draw multiple points on the current rendering target at subpixel precision.
  ///
  /// \param renderer the renderer which should draw multiple points.
  /// \param points the points to draw.
  /// \param count the number of points to draw.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_RenderPoint
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_RenderPoints(SDL_Renderer *renderer, const SDL_FPoint *points, int count)
  /// ```
  bool points(List<math.Point<double>> points) {
    var pointsPointer = points.calloc();
    var result = sdlRenderPoints(this, pointsPointer, points.length);
    calloc.free(pointsPointer);
    return result;
  }

  ///
  /// Draw a line on the current rendering target at subpixel precision.
  ///
  /// \param renderer the renderer which should draw a line.
  /// \param x1 the x coordinate of the start point.
  /// \param y1 the y coordinate of the start point.
  /// \param x2 the x coordinate of the end point.
  /// \param y2 the y coordinate of the end point.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_RenderLines
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_RenderLine(SDL_Renderer *renderer, float x1, float y1, float x2, float y2)
  /// ```
  bool line(math.Point<double> p1, math.Point<double> p2) {
    return sdlRenderLine(this, p1.x, p1.y, p2.x, p2.y);
  }

  ///
  /// Draw a series of connected lines on the current rendering target at
  /// subpixel precision.
  ///
  /// \param renderer the renderer which should draw multiple lines.
  /// \param points the points along the lines.
  /// \param count the number of points, drawing count-1 lines.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_RenderLine
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_RenderLines(SDL_Renderer *renderer, const SDL_FPoint *points, int count)
  /// ```
  bool lines(List<math.Point<double>> points) {
    var pointsPointer = points.calloc();
    var result = sdlRenderLines(this, pointsPointer, points.length);
    calloc.free(pointsPointer);
    return result;
  }

  ///
  /// Draw a rectangle on the current rendering target at subpixel precision.
  ///
  /// \param renderer the renderer which should draw a rectangle.
  /// \param rect a pointer to the destination rectangle, or NULL to outline the
  /// entire rendering target.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_RenderRects
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_RenderRect(SDL_Renderer *renderer, const SDL_FRect *rect)
  /// ```
  bool rect(math.Rectangle<double>? rect) {
    Pointer<SdlFRect> rectPointer = nullptr;
    if (rect != null) {
      rectPointer = rect.calloc();
    }
    var result = sdlRenderRect(this, rectPointer);
    calloc.free(rectPointer);
    return result;
  }

  ///
  /// Draw some number of rectangles on the current rendering target at subpixel
  /// precision.
  ///
  /// \param renderer the renderer which should draw multiple rectangles.
  /// \param rects a pointer to an array of destination rectangles.
  /// \param count the number of rectangles.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_RenderRect
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_RenderRects(SDL_Renderer *renderer, const SDL_FRect *rects, int count)
  /// ```
  bool rects(List<math.Rectangle<double>> rects) {
    var rectsPointer = rects.calloc();
    var result = sdlRenderRects(this, rectsPointer, rects.length);
    calloc.free(rectsPointer);
    return result;
  }

  ///
  /// Fill a rectangle on the current rendering target with the drawing color at
  /// subpixel precision.
  ///
  /// \param renderer the renderer which should fill a rectangle.
  /// \param rect a pointer to the destination rectangle, or NULL for the entire
  /// rendering target.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_RenderFillRects
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_RenderFillRect(SDL_Renderer *renderer, const SDL_FRect *rect)
  /// ```
  bool fillRect([math.Rectangle<double>? rect]) {
    Pointer<SdlFRect> rectPointer = nullptr;
    if (rect != null) {
      rectPointer = rect.calloc();
    }
    var result = sdlRenderFillRect(this, rectPointer);
    calloc.free(rectPointer);
    return result;
  }

  ///
  /// Fill some number of rectangles on the current rendering target with the
  /// drawing color at subpixel precision.
  ///
  /// \param renderer the renderer which should fill multiple rectangles.
  /// \param rects a pointer to an array of destination rectangles.
  /// \param count the number of rectangles.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_RenderFillRect
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_RenderFillRects(SDL_Renderer *renderer, const SDL_FRect *rects, int count)
  /// ```
  bool fillRects(List<math.Rectangle<double>> rects) {
    var rectsPointer = rects.calloc();
    var result = sdlRenderFillRects(this, rectsPointer, rects.length);
    calloc.free(rectsPointer);
    return result;
  }

  ///
  /// Copy a portion of the texture to the current rendering target at subpixel
  /// precision.
  ///
  /// \param renderer the renderer which should copy parts of a texture.
  /// \param texture the source texture.
  /// \param srcrect a pointer to the source rectangle, or NULL for the entire
  /// texture.
  /// \param dstrect a pointer to the destination rectangle, or NULL for the
  /// entire rendering target.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_RenderTextureRotated
  /// \sa SDL_RenderTextureTiled
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_RenderTexture(SDL_Renderer *renderer, SDL_Texture *texture, const SDL_FRect *srcrect, const SDL_FRect *dstrect)
  /// ```
  bool texture(Pointer<SdlTexture> texture,
      {math.Rectangle<double>? srcrect, math.Rectangle<double>? dstrect}) {
    Pointer<SdlFRect> srcrectPointer = nullptr;
    Pointer<SdlFRect> dstrectPointer = nullptr;
    if (srcrect != null) {
      srcrectPointer = srcrect.calloc();
    }
    if (dstrect != null) {
      dstrectPointer = dstrect.calloc();
    }
    var result =
        sdlRenderTexture(this, texture, srcrectPointer, dstrectPointer);
    calloc.free(srcrectPointer);
    calloc.free(dstrectPointer);
    return result;
  }

  ///
  /// Copy a portion of the source texture to the current rendering target, with
  /// rotation and flipping, at subpixel precision.
  ///
  /// \param renderer the renderer which should copy parts of a texture.
  /// \param texture the source texture.
  /// \param srcrect a pointer to the source rectangle, or NULL for the entire
  /// texture.
  /// \param dstrect a pointer to the destination rectangle, or NULL for the
  /// entire rendering target.
  /// \param angle an angle in degrees that indicates the rotation that will be
  /// applied to dstrect, rotating it in a clockwise direction.
  /// \param center a pointer to a point indicating the point around which
  /// dstrect will be rotated (if NULL, rotation will be done
  /// around dstrect.w/2, dstrect.h/2).
  /// \param flip an SDL_FlipMode value stating which flipping actions should be
  /// performed on the texture.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_RenderTexture
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_RenderTextureRotated(SDL_Renderer *renderer, SDL_Texture *texture, const SDL_FRect *srcrect, const SDL_FRect *dstrect, double angle, const SDL_FPoint *center, SDL_FlipMode flip)
  /// ```
  bool textureRotated(Pointer<SdlTexture> texture,
      {math.Rectangle<double>? srcrect,
      math.Rectangle<double>? dstrect,
      double angle = 0,
      math.Point<double>? center,
      int flip = SDL_FLIP_NONE}) {
    Pointer<SdlFRect> srcrectPointer = nullptr;
    Pointer<SdlFRect> dstrectPointer = nullptr;
    Pointer<SdlFPoint> centerPointer = nullptr;
    if (srcrect != null) {
      srcrectPointer = srcrect.calloc();
    }
    if (dstrect != null) {
      dstrectPointer = dstrect.calloc();
    }
    if (center != null) {
      centerPointer = center.calloc();
    }
    var result = sdlRenderTextureRotated(this, texture, srcrectPointer,
        dstrectPointer, angle, centerPointer, flip);
    calloc.free(srcrectPointer);
    calloc.free(dstrectPointer);
    calloc.free(centerPointer);
    return result;
  }

  ///
  /// Render a list of triangles, optionally using a texture and indices into the
  /// vertex array Color and alpha modulation is done per vertex
  /// (SDL_SetTextureColorMod and SDL_SetTextureAlphaMod are ignored).
  ///
  /// \param renderer the rendering context.
  /// \param texture (optional) The SDL texture to use.
  /// \param vertices vertices.
  /// \param num_vertices number of vertices.
  /// \param indices (optional) An array of integer indices into the 'vertices'
  /// array, if NULL all vertices will be rendered in sequential
  /// order.
  /// \param num_indices number of indices.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_RenderGeometryRaw
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_RenderGeometry(SDL_Renderer *renderer, SDL_Texture *texture, const SDL_Vertex *vertices, int num_vertices, const int *indices, int num_indices)
  /// ```
  bool geometry(Pointer<SdlVertex> vertices, Pointer<SdlTexture> texture,
      int numVertices, Pointer<Int32> indices, int numIndices) {
    return sdlRenderGeometry(
        this, texture, vertices, numVertices, indices, numIndices);
  }

  ///
  /// Render a list of triangles, optionally using a texture and indices into the
  /// vertex arrays Color and alpha modulation is done per vertex
  /// (SDL_SetTextureColorMod and SDL_SetTextureAlphaMod are ignored).
  ///
  /// \param renderer the rendering context.
  /// \param texture (optional) The SDL texture to use.
  /// \param xy vertex positions.
  /// \param xy_stride byte size to move from one element to the next element.
  /// \param color vertex colors (as SDL_FColor).
  /// \param color_stride byte size to move from one element to the next element.
  /// \param uv vertex normalized texture coordinates.
  /// \param uv_stride byte size to move from one element to the next element.
  /// \param num_vertices number of vertices.
  /// \param indices (optional) An array of indices into the 'vertices' arrays,
  /// if NULL all vertices will be rendered in sequential order.
  /// \param num_indices number of indices.
  /// \param size_indices index size: 1 (byte), 2 (short), 4 (int).
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_RenderGeometry
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_RenderGeometryRaw(SDL_Renderer *renderer, SDL_Texture *texture, const float *xy, int xy_stride, const SDL_FColor *color, int color_stride, const float *uv, int uv_stride, int num_vertices, const void *indices, int num_indices, int size_indices)
  /// ```
  bool geometryRaw(
      Pointer<SdlTexture> texture,
      Pointer<Float> xy,
      int xyStride,
      Pointer<SdlFColor> color,
      int colorStride,
      Pointer<Float> uv,
      int uvStride,
      int numVertices,
      Pointer<NativeType> indices,
      int numIndices,
      int sizeIndices) {
    return sdlRenderGeometryRaw(this, texture, xy, xyStride, color, colorStride,
        uv, uvStride, numVertices, indices, numIndices, sizeIndices);
  }

  Pointer<SdlSurface> readPixels(math.Rectangle<double> rect) {
    var rectPointer = rect.callocInt();
    var result = sdlRenderReadPixels(this, rectPointer);
    calloc.free(rectPointer);
    return result;
  }

  ///
  /// Update the screen with any rendering performed since the previous call.
  ///
  /// SDL's rendering functions operate on a backbuffer; that is, calling a
  /// rendering function such as SDL_RenderLine() does not directly put a line on
  /// the screen, but rather updates the backbuffer. As such, you compose your
  /// entire scene and *present* the composed backbuffer to the screen as a
  /// complete picture.
  ///
  /// Therefore, when using SDL's rendering API, one does all drawing intended
  /// for the frame, and then calls this function once per frame to present the
  /// final drawing to the user.
  ///
  /// The backbuffer should be considered invalidated after each present; do not
  /// assume that previous contents will exist between frames. You are strongly
  /// encouraged to call SDL_RenderClear() to initialize the backbuffer before
  /// starting each new frame's drawing, even if you plan to overwrite every
  /// pixel.
  ///
  /// Please note, that in case of rendering to a texture - there is **no need**
  /// to call `SDL_RenderPresent` after drawing needed objects to a texture, and
  /// should not be done; you are only required to change back the rendering
  /// target to default via `SDL_SetRenderTarget(renderer, NULL)` afterwards, as
  /// textures by themselves do not have a concept of backbuffers. Calling
  /// SDL_RenderPresent while rendering to a texture will still update the screen
  /// with any current drawing that has been done _to the window itself_.
  ///
  /// \param renderer the rendering context.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_CreateRenderer
  /// \sa SDL_RenderClear
  /// \sa SDL_RenderFillRect
  /// \sa SDL_RenderFillRects
  /// \sa SDL_RenderLine
  /// \sa SDL_RenderLines
  /// \sa SDL_RenderPoint
  /// \sa SDL_RenderPoints
  /// \sa SDL_RenderRect
  /// \sa SDL_RenderRects
  /// \sa SDL_SetRenderDrawBlendMode
  /// \sa SDL_SetRenderDrawColor
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_RenderPresent(SDL_Renderer *renderer)
  /// ```
  bool present() {
    return sdlRenderPresent(this);
  }

  ///
  /// Destroy the rendering context for a window and free all associated
  /// textures.
  ///
  /// This should be called before destroying the associated window.
  ///
  /// \param renderer the rendering context.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_CreateRenderer
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_DestroyRenderer(SDL_Renderer *renderer)
  /// ```
  bool destroy() {
    if (this != nullptr) {
      sdlDestroyRenderer(this);
      return true;
    }
    return false;
  }

  ///
  /// Force the rendering context to flush any pending commands and state.
  ///
  /// You do not need to (and in fact, shouldn't) call this function unless you
  /// are planning to call into OpenGL/Direct3D/Metal/whatever directly, in
  /// addition to using an SDL_Renderer.
  ///
  /// This is for a very-specific case: if you are using SDL's render API, and
  /// you plan to make OpenGL/D3D/whatever calls in addition to SDL render API
  /// calls. If this applies, you should call this function between calls to
  /// SDL's render API and the low-level API you're using in cooperation.
  ///
  /// In all other cases, you can ignore this function.
  ///
  /// This call makes SDL flush any pending rendering work it was queueing up to
  /// do later in a single batch, and marks any internal cached state as invalid,
  /// so it'll prepare all its state again later, from scratch.
  ///
  /// This means you do not need to save state in your rendering code to protect
  /// the SDL renderer. However, there lots of arbitrary pieces of Direct3D and
  /// OpenGL state that can confuse things; you should use your best judgment and
  /// be prepared to make changes if specific state needs to be protected.
  ///
  /// \param renderer the rendering context.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_FlushRenderer(SDL_Renderer *renderer)
  /// ```
  bool flush() {
    return sdlFlushRenderer(this);
  }

  ///
  /// Get the CAMetalLayer associated with the given Metal renderer.
  ///
  /// This function returns `void *`, so SDL doesn't have to include Metal's
  /// headers, but it can be safely cast to a `CAMetalLayer *`.
  ///
  /// \param renderer the renderer to query.
  /// \returns a `CAMetalLayer *` on success, or NULL if the renderer isn't a
  /// Metal renderer.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_GetRenderMetalCommandEncoder
  ///
  /// ```c
  /// extern SDL_DECLSPEC void * SDLCALL SDL_GetRenderMetalLayer(SDL_Renderer *renderer)
  /// ```
  Pointer<NativeType> getMetalLayer() {
    return sdlGetRenderMetalLayer(this);
  }

  ///
  /// Get the Metal command encoder for the current frame.
  ///
  /// This function returns `void *`, so SDL doesn't have to include Metal's
  /// headers, but it can be safely cast to an `id<MTLRenderCommandEncoder>`.
  ///
  /// This will return NULL if Metal refuses to give SDL a drawable to render to,
  /// which might happen if the window is hidden/minimized/offscreen. This
  /// doesn't apply to command encoders for render targets, just the window's
  /// backbuffer. Check your return values!
  ///
  /// \param renderer the renderer to query.
  /// \returns an `id<MTLRenderCommandEncoder>` on success, or NULL if the
  /// renderer isn't a Metal renderer or there was an error.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_GetRenderMetalLayer
  ///
  /// ```c
  /// extern SDL_DECLSPEC void * SDLCALL SDL_GetRenderMetalCommandEncoder(SDL_Renderer *renderer)
  /// ```
  Pointer<NativeType> getMetalCommandEncoder() {
    return sdlGetRenderMetalCommandEncoder(this);
  }

  ///
  /// Toggle VSync of the given renderer.
  ///
  /// When a renderer is created, vsync defaults to SDL_RENDERER_VSYNC_DISABLED.
  ///
  /// The `vsync` parameter can be 1 to synchronize present with every vertical
  /// refresh, 2 to synchronize present with every second vertical refresh, etc.,
  /// SDL_RENDERER_VSYNC_ADAPTIVE for late swap tearing (adaptive vsync), or
  /// SDL_RENDERER_VSYNC_DISABLED to disable. Not every value is supported by
  /// every driver, so you should check the return value to see whether the
  /// requested setting is supported.
  ///
  /// \param renderer the renderer to toggle.
  /// \param vsync the vertical refresh sync interval.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_GetRenderVSync
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetRenderVSync(SDL_Renderer *renderer, int vsync)
  /// ```
  bool setVSync(int vsync) {
    return sdlSetRenderVSync(this, vsync);
  }

  ///
  /// Get VSync of the given renderer.
  ///
  /// \param renderer the renderer to toggle.
  /// \param vsync an int filled with the current vertical refresh sync interval.
  /// See SDL_SetRenderVSync() for the meaning of the value.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_SetRenderVSync
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetRenderVSync(SDL_Renderer *renderer, int *vsync)
  /// ```
  int getVSync() {
    var vSyncPointer = calloc<Int32>();
    sdlGetRenderVSync(this, vSyncPointer);
    var result = vSyncPointer.value;
    calloc.free(vSyncPointer);
    return result;
  }
}
