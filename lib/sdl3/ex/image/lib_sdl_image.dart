part of '../../sdl_image.dart';

///
/// Load an image from a filesystem path into a GPU texture.
///
/// An SDL_GPUTexture represents an image in GPU memory, usable by SDL's GPU
/// API. Regardless of the source format of the image, this function will
/// create a GPU texture with the format SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM
/// with no mip levels. It can be bound as a sampled texture from a graphics or
/// compute pipeline and as a a readonly storage texture in a compute pipeline.
///
/// There is a separate function to read files from an SDL_IOStream, if you
/// need an i/o abstraction to provide data from anywhere instead of a simple
/// filesystem read; that function is IMG_LoadGPUTexture_IO().
///
/// When done with the returned texture, the app should dispose of it with a
/// call to SDL_ReleaseGPUTexture().
///
/// \param device the SDL_GPUDevice to use to create the GPU texture.
/// \param copy_pass the SDL_GPUCopyPass to use to upload the loaded image to
/// the GPU texture.
/// \param file a path on the filesystem to load an image from.
/// \param width a pointer filled in with the width of the GPU texture. may be
/// NULL.
/// \param height a pointer filled in with the width of the GPU texture. may be
/// NULL.
/// \returns a new GPU texture, or NULL on error.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_LoadGPUTextureTyped_IO
/// \sa IMG_LoadGPUTexture_IO
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUTexture * SDLCALL IMG_LoadGPUTexture(SDL_GPUDevice *device, SDL_GPUCopyPass *copy_pass, const char *file, int *width, int *height)
/// ```
/// {@category image}
Pointer<SdlGpuTexture> imgxLoadGpuTexture(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuCopyPass> copyPass,
  String file, {
  SdlxPoint? size,
}) {
  final widthPointer = ffi.calloc<Int32>();
  final heightPointer = ffi.calloc<Int32>();
  final result = imgLoadGpuTexture(
    device,
    copyPass,
    file,
    widthPointer,
    heightPointer,
  );
  if (result != nullptr && size != null) {
    size
      ..x = widthPointer.value
      ..y = heightPointer.value;
  }
  widthPointer.callocFree();
  heightPointer.callocFree();
  return result;
}

///
/// Load an image from an SDL data source into a GPU texture.
///
/// An SDL_GPUTexture represents an image in GPU memory, usable by SDL's GPU
/// API. Regardless of the source format of the image, this function will
/// create a GPU texture with the format SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM
/// with no mip levels. It can be bound as a sampled texture from a graphics or
/// compute pipeline and as a a readonly storage texture in a compute pipeline.
///
/// If `closeio` is true, `src` will be closed before returning, whether this
/// function succeeds or not. SDL_image reads everything it needs from `src`
/// during this call in any case.
///
/// There is a separate function to read files from disk without having to deal
/// with SDL_IOStream: `IMG_LoadGPUTexture(device, copy_pass, "filename.jpg",
/// width, height) will call this function and manage those details for you,
/// determining the file type from the filename's extension.
///
/// There is also IMG_LoadGPUTextureTyped_IO(), which is equivalent to this
/// function except a file extension (like "BMP", "JPG", etc) can be specified,
/// in case SDL_image cannot autodetect the file format.
///
/// When done with the returned texture, the app should dispose of it with a
/// call to SDL_ReleaseGPUTexture().
///
/// \param device the SDL_GPUDevice to use to create the GPU texture.
/// \param copy_pass the SDL_GPUCopyPass to use to upload the loaded image to
/// the GPU texture.
/// \param src an SDL_IOStream that data will be read from.
/// \param closeio true to close/free the SDL_IOStream before returning, false
/// to leave it open.
/// \param width a pointer filled in with the width of the GPU texture. may be
/// NULL.
/// \param height a pointer filled in with the width of the GPU texture. may be
/// NULL.
/// \returns a new GPU texture, or NULL on error.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_LoadGPUTexture
/// \sa IMG_LoadGPUTextureTyped_IO
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUTexture * SDLCALL IMG_LoadGPUTexture_IO(SDL_GPUDevice *device, SDL_GPUCopyPass *copy_pass, SDL_IOStream *src, bool closeio, int *width, int *height)
/// ```
/// {@category image}
Pointer<SdlGpuTexture> imgxLoadGpuTextureIo(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuCopyPass> copyPass,
  Pointer<SdlIoStream> src, {
  bool closeio = false,
  SdlxPoint? size,
}) {
  final widthPointer = ffi.calloc<Int32>();
  final heightPointer = ffi.calloc<Int32>();
  final result = imgLoadGpuTextureIo(
    device,
    copyPass,
    src,
    closeio,
    widthPointer,
    heightPointer,
  );
  if (result != nullptr && size != null) {
    size
      ..x = widthPointer.value
      ..y = heightPointer.value;
  }
  widthPointer.callocFree();
  heightPointer.callocFree();
  return result;
}

///
/// Load an image from an SDL data source into a GPU texture.
///
/// An SDL_GPUTexture represents an image in GPU memory, usable by SDL's GPU
/// API. Regardless of the source format of the image, this function will
/// create a GPU texture with the format SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM
/// with no mip levels. It can be bound as a sampled texture from a graphics or
/// compute pipeline and as a a readonly storage texture in a compute pipeline.
///
/// If `closeio` is true, `src` will be closed before returning, whether this
/// function succeeds or not. SDL_image reads everything it needs from `src`
/// during this call in any case.
///
/// Even though this function accepts a file type, SDL_image may still try
/// other decoders that are capable of detecting file type from the contents of
/// the image data, but may rely on the caller-provided type string for formats
/// that it cannot autodetect. If `type` is NULL, SDL_image will rely solely on
/// its ability to guess the format.
///
/// There is a separate function to read files from disk without having to deal
/// with SDL_IOStream: `IMG_LoadGPUTexture(device, copy_pass, "filename.jpg",
/// width, height) will call this function and manage those details for you,
/// determining the file type from the filename's extension.
///
/// There is also IMG_LoadGPUTexture_IO(), which is equivalent to this function
/// except that it will rely on SDL_image to determine what type of data it is
/// loading, much like passing a NULL for type.
///
/// When done with the returned texture, the app should dispose of it with a
/// call to SDL_ReleaseGPUTexture().
///
/// \param device the SDL_GPUDevice to use to create the GPU texture.
/// \param copy_pass the SDL_GPUCopyPass to use to upload the loaded image to
/// the GPU texture.
/// \param src an SDL_IOStream that data will be read from.
/// \param closeio true to close/free the SDL_IOStream before returning, false
/// to leave it open.
/// \param type a filename extension that represent this data ("BMP", "GIF",
/// "PNG", etc).
/// \param width a pointer filled in with the width of the GPU texture. may be
/// NULL.
/// \param height a pointer filled in with the width of the GPU texture. may be
/// NULL.
/// \returns a new GPU texture, or NULL on error.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_LoadGPUTexture
/// \sa IMG_LoadGPUTexture_IO
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPUTexture * SDLCALL IMG_LoadGPUTextureTyped_IO(SDL_GPUDevice *device, SDL_GPUCopyPass *copy_pass, SDL_IOStream *src, bool closeio, const char *type, int *width, int *height)
/// ```
/// {@category image}
Pointer<SdlGpuTexture> imgxLoadGpuTextureTypedIo(
  Pointer<SdlGpuDevice> device,
  Pointer<SdlGpuCopyPass> copyPass,
  Pointer<SdlIoStream> src,
  String type, {
  bool closeio = false,
  SdlxPoint? size,
}) {
  final widthPointer = ffi.calloc<Int32>();
  final heightPointer = ffi.calloc<Int32>();
  final result = imgLoadGpuTextureTypedIo(
    device,
    copyPass,
    src,
    closeio,
    type,
    widthPointer,
    heightPointer,
  );
  if (result != nullptr && size != null) {
    size
      ..x = widthPointer.value
      ..y = heightPointer.value;
  }
  widthPointer.callocFree();
  heightPointer.callocFree();
  return result;
}

///
/// Get the next frame in an animation decoder.
///
/// This function decodes the next frame in the animation decoder, returning it
/// as an SDL_Surface. The returned surface should be freed with
/// SDL_FreeSurface() when no longer needed.
///
/// If the animation decoder has no more frames or an error occurred while
/// decoding the frame, this function returns false. In that case, please call
/// SDL_GetError() for more information. If SDL_GetError() returns an empty
/// string, that means there are no more available frames. If SDL_GetError()
/// returns a valid string, that means the decoding failed.
///
/// \param decoder the animation decoder.
/// \param frame a pointer filled in with the SDL_Surface for the next frame in
/// the animation.
/// \param duration the duration of the frame, usually in milliseconds but can
/// be other units if the
/// `IMG_PROP_ANIMATION_DECODER_CREATE_TIMEBASE_DENOMINATOR_NUMBER`
/// property is set when creating the decoder.
/// \returns true on success or false on failure and when no more frames are
/// available; call IMG_GetAnimationDecoderStatus() or SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_CreateAnimationDecoder
/// \sa IMG_CreateAnimationDecoder_IO
/// \sa IMG_CreateAnimationDecoderWithProperties
/// \sa IMG_GetAnimationDecoderStatus
/// \sa IMG_ResetAnimationDecoder
/// \sa IMG_CloseAnimationDecoder
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_GetAnimationDecoderFrame(IMG_AnimationDecoder *decoder, SDL_Surface **frame, Uint64 *duration)
/// ```
/// {@category image}
bool imgxGetAnimationDecoderFrame(
  Pointer<ImgAnimationDecoder> decoder,
  ImgxAnimationDecoderFrame frame,
) {
  final framePointer = calloc<Pointer<SdlSurface>>();
  final durationPointer = calloc<Uint64>();
  final result = imgGetAnimationDecoderFrame(
    decoder,
    framePointer,
    durationPointer,
  );
  if (result) {
    frame
      ..frame = framePointer.value
      ..duration = durationPointer.value;
  }
  framePointer.callocFree();
  durationPointer.callocFree();
  return result;
}
