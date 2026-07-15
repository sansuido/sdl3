part of '../../../sdl.dart';

extension SdlGpuCopyPassPointerEx on Pointer<SdlGpuCopyPass> {
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
  void uploadToTexture(
    SdlxGpuTextureTransferInfo source,
    SdlxGpuTextureRegion destination, {
    bool cycle = false,
  }) => sdlxUploadToGpuTexture(this, source, destination, cycle: cycle);

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
  void uploadToBuffer(
    SdlxGpuTransferBufferLocation source,
    SdlxGpuBufferRegion destination, {
    bool cycle = false,
  }) => sdlxUploadToGpuBuffer(this, source, destination, cycle: cycle);

  ///
  /// Performs a texture-to-texture copy.
  ///
  /// This copy occurs on the GPU timeline. You may assume the copy has finished
  /// in subsequent commands.
  ///
  /// This function does not support copying between depth and color textures.
  /// For those, copy the texture to a buffer and then to the destination
  /// texture.
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
  void copyTextureToTexture(
    SdlxGpuTextureLocation source,
    SdlxGpuTextureLocation destination,
    int w,
    int h,
    int d, {
    bool cycle = false,
  }) => sdlxCopyGpuTextureToTexture(
    this,
    source,
    destination,
    w,
    h,
    d,
    cycle: cycle,
  );

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
  void copyBufferToBuffer(
    SdlxGpuBufferLocation source,
    SdlxGpuBufferLocation destination,
    int size, {
    bool cycle = false,
  }) =>
      sdlxCopyGpuBufferToBuffer(this, source, destination, size, cycle: cycle);

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
  void downloadFromTexture(
    SdlxGpuTextureRegion source,
    SdlxGpuTextureTransferInfo destination,
  ) => sdlxDownloadFromGpuTexture(this, source, destination);

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
  void downloadFromBuffer(
    SdlxGpuBufferRegion source,
    SdlxGpuTransferBufferLocation destination,
  ) => sdlxDownloadFromGpuBuffer(this, source, destination);

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
  void end() => sdlEndGpuCopyPass(this);
}
