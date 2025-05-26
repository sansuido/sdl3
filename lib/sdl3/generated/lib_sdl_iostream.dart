// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Use this function to create a new SDL_IOStream structure for reading from
/// and/or writing to a named file.
///
/// The `mode` string is treated roughly the same as in a call to the C
/// library's fopen(), even if SDL doesn't happen to use fopen() behind the
/// scenes.
///
/// Available `mode` strings:
///
/// - "r": Open a file for reading. The file must exist.
/// - "w": Create an empty file for writing. If a file with the same name
/// already exists its content is erased and the file is treated as a new
/// empty file.
/// - "a": Append to a file. Writing operations append data at the end of the
/// file. The file is created if it does not exist.
/// - "r+": Open a file for update both reading and writing. The file must
/// exist.
/// - "w+": Create an empty file for both reading and writing. If a file with
/// the same name already exists its content is erased and the file is
/// treated as a new empty file.
/// - "a+": Open a file for reading and appending. All writing operations are
/// performed at the end of the file, protecting the previous content to be
/// overwritten. You can reposition (fseek, rewind) the internal pointer to
/// anywhere in the file for reading, but writing operations will move it
/// back to the end of file. The file is created if it does not exist.
///
/// **NOTE**: In order to open a file as a binary file, a "b" character has to
/// be included in the `mode` string. This additional "b" character can either
/// be appended at the end of the string (thus making the following compound
/// modes: "rb", "wb", "ab", "r+b", "w+b", "a+b") or be inserted between the
/// letter and the "+" sign for the mixed modes ("rb+", "wb+", "ab+").
/// Additional characters may follow the sequence, although they should have no
/// effect. For example, "t" is sometimes appended to make explicit the file is
/// a text file.
///
/// This function supports Unicode filenames, but they must be encoded in UTF-8
/// format, regardless of the underlying operating system.
///
/// In Android, SDL_IOFromFile() can be used to open content:// URIs. As a
/// fallback, SDL_IOFromFile() will transparently open a matching filename in
/// the app's `assets`.
///
/// Closing the SDL_IOStream will close SDL's internal file handle.
///
/// The following properties may be set at creation time by SDL:
///
/// - `SDL_PROP_IOSTREAM_WINDOWS_HANDLE_POINTER`: a pointer, that can be cast
/// to a win32 `HANDLE`, that this SDL_IOStream is using to access the
/// filesystem. If the program isn't running on Windows, or SDL used some
/// other method to access the filesystem, this property will not be set.
/// - `SDL_PROP_IOSTREAM_STDIO_FILE_POINTER`: a pointer, that can be cast to a
/// stdio `FILE *`, that this SDL_IOStream is using to access the filesystem.
/// If SDL used some other method to access the filesystem, this property
/// will not be set. PLEASE NOTE that if SDL is using a different C runtime
/// than your app, trying to use this pointer will almost certainly result in
/// a crash! This is mostly a problem on Windows; make sure you build SDL and
/// your app with the same compiler and settings to avoid it.
/// - `SDL_PROP_IOSTREAM_FILE_DESCRIPTOR_NUMBER`: a file descriptor that this
/// SDL_IOStream is using to access the filesystem.
/// - `SDL_PROP_IOSTREAM_ANDROID_AASSET_POINTER`: a pointer, that can be cast
/// to an Android NDK `AAsset *`, that this SDL_IOStream is using to access
/// the filesystem. If SDL used some other method to access the filesystem,
/// this property will not be set.
///
/// \param file a UTF-8 string representing the filename to open.
/// \param mode an ASCII string representing the mode to be used for opening
/// the file.
/// \returns a pointer to the SDL_IOStream structure that is created or NULL on
/// failure; call SDL_GetError() for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CloseIO
/// \sa SDL_FlushIO
/// \sa SDL_ReadIO
/// \sa SDL_SeekIO
/// \sa SDL_TellIO
/// \sa SDL_WriteIO
///
/// ```c
/// extern SDL_DECLSPEC SDL_IOStream * SDLCALL SDL_IOFromFile(const char *file, const char *mode)
/// ```
Pointer<SdlIoStream> sdlIoFromFile(String? file, String? mode) {
  final sdlIoFromFileLookupFunction = libSdl3
      .lookupFunction<
        Pointer<SdlIoStream> Function(Pointer<Utf8> file, Pointer<Utf8> mode),
        Pointer<SdlIoStream> Function(Pointer<Utf8> file, Pointer<Utf8> mode)
      >('SDL_IOFromFile');
  final filePointer = file != null ? file.toNativeUtf8() : nullptr;
  final modePointer = mode != null ? mode.toNativeUtf8() : nullptr;
  final result = sdlIoFromFileLookupFunction(filePointer, modePointer);
  calloc.free(filePointer);
  calloc.free(modePointer);
  return result;
}

///
/// Use this function to prepare a read-write memory buffer for use with
/// SDL_IOStream.
///
/// This function sets up an SDL_IOStream struct based on a memory area of a
/// certain size, for both read and write access.
///
/// This memory buffer is not copied by the SDL_IOStream; the pointer you
/// provide must remain valid until you close the stream. Closing the stream
/// will not free the original buffer.
///
/// If you need to make sure the SDL_IOStream never writes to the memory
/// buffer, you should use SDL_IOFromConstMem() with a read-only buffer of
/// memory instead.
///
/// The following properties will be set at creation time by SDL:
///
/// - `SDL_PROP_IOSTREAM_MEMORY_POINTER`: this will be the `mem` parameter that
/// was passed to this function.
/// - `SDL_PROP_IOSTREAM_MEMORY_SIZE_NUMBER`: this will be the `size` parameter
/// that was passed to this function.
///
/// \param mem a pointer to a buffer to feed an SDL_IOStream stream.
/// \param size the buffer size, in bytes.
/// \returns a pointer to a new SDL_IOStream structure or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_IOFromConstMem
/// \sa SDL_CloseIO
/// \sa SDL_FlushIO
/// \sa SDL_ReadIO
/// \sa SDL_SeekIO
/// \sa SDL_TellIO
/// \sa SDL_WriteIO
///
/// ```c
/// extern SDL_DECLSPEC SDL_IOStream * SDLCALL SDL_IOFromMem(void *mem, size_t size)
/// ```
Pointer<SdlIoStream> sdlIoFromMem(Pointer<NativeType> mem, int size) {
  final sdlIoFromMemLookupFunction = libSdl3
      .lookupFunction<
        Pointer<SdlIoStream> Function(Pointer<NativeType> mem, Uint32 size),
        Pointer<SdlIoStream> Function(Pointer<NativeType> mem, int size)
      >('SDL_IOFromMem');
  return sdlIoFromMemLookupFunction(mem, size);
}

///
/// Use this function to prepare a read-only memory buffer for use with
/// SDL_IOStream.
///
/// This function sets up an SDL_IOStream struct based on a memory area of a
/// certain size. It assumes the memory area is not writable.
///
/// Attempting to write to this SDL_IOStream stream will report an error
/// without writing to the memory buffer.
///
/// This memory buffer is not copied by the SDL_IOStream; the pointer you
/// provide must remain valid until you close the stream. Closing the stream
/// will not free the original buffer.
///
/// If you need to write to a memory buffer, you should use SDL_IOFromMem()
/// with a writable buffer of memory instead.
///
/// The following properties will be set at creation time by SDL:
///
/// - `SDL_PROP_IOSTREAM_MEMORY_POINTER`: this will be the `mem` parameter that
/// was passed to this function.
/// - `SDL_PROP_IOSTREAM_MEMORY_SIZE_NUMBER`: this will be the `size` parameter
/// that was passed to this function.
///
/// \param mem a pointer to a read-only buffer to feed an SDL_IOStream stream.
/// \param size the buffer size, in bytes.
/// \returns a pointer to a new SDL_IOStream structure or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_IOFromMem
/// \sa SDL_CloseIO
/// \sa SDL_ReadIO
/// \sa SDL_SeekIO
/// \sa SDL_TellIO
///
/// ```c
/// extern SDL_DECLSPEC SDL_IOStream * SDLCALL SDL_IOFromConstMem(const void *mem, size_t size)
/// ```
Pointer<SdlIoStream> sdlIoFromConstMem(Pointer<NativeType> mem, int size) {
  final sdlIoFromConstMemLookupFunction = libSdl3
      .lookupFunction<
        Pointer<SdlIoStream> Function(Pointer<NativeType> mem, Uint32 size),
        Pointer<SdlIoStream> Function(Pointer<NativeType> mem, int size)
      >('SDL_IOFromConstMem');
  return sdlIoFromConstMemLookupFunction(mem, size);
}

///
/// Use this function to create an SDL_IOStream that is backed by dynamically
/// allocated memory.
///
/// This supports the following properties to provide access to the memory and
/// control over allocations:
///
/// - `SDL_PROP_IOSTREAM_DYNAMIC_MEMORY_POINTER`: a pointer to the internal
/// memory of the stream. This can be set to NULL to transfer ownership of
/// the memory to the application, which should free the memory with
/// SDL_free(). If this is done, the next operation on the stream must be
/// SDL_CloseIO().
/// - `SDL_PROP_IOSTREAM_DYNAMIC_CHUNKSIZE_NUMBER`: memory will be allocated in
/// multiples of this size, defaulting to 1024.
///
/// \returns a pointer to a new SDL_IOStream structure or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CloseIO
/// \sa SDL_ReadIO
/// \sa SDL_SeekIO
/// \sa SDL_TellIO
/// \sa SDL_WriteIO
///
/// ```c
/// extern SDL_DECLSPEC SDL_IOStream * SDLCALL SDL_IOFromDynamicMem(void)
/// ```
Pointer<SdlIoStream> sdlIoFromDynamicMem() {
  final sdlIoFromDynamicMemLookupFunction = libSdl3
      .lookupFunction<
        Pointer<SdlIoStream> Function(),
        Pointer<SdlIoStream> Function()
      >('SDL_IOFromDynamicMem');
  return sdlIoFromDynamicMemLookupFunction();
}

///
/// Create a custom SDL_IOStream.
///
/// Applications do not need to use this function unless they are providing
/// their own SDL_IOStream implementation. If you just need an SDL_IOStream to
/// read/write a common data source, you should use the built-in
/// implementations in SDL, like SDL_IOFromFile() or SDL_IOFromMem(), etc.
///
/// This function makes a copy of `iface` and the caller does not need to keep
/// it around after this call.
///
/// \param iface the interface that implements this SDL_IOStream, initialized
/// using SDL_INIT_INTERFACE().
/// \param userdata the pointer that will be passed to the interface functions.
/// \returns a pointer to the allocated memory on success or NULL on failure;
/// call SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CloseIO
/// \sa SDL_INIT_INTERFACE
/// \sa SDL_IOFromConstMem
/// \sa SDL_IOFromFile
/// \sa SDL_IOFromMem
///
/// ```c
/// extern SDL_DECLSPEC SDL_IOStream * SDLCALL SDL_OpenIO(const SDL_IOStreamInterface *iface, void *userdata)
/// ```
Pointer<SdlIoStream> sdlOpenIo(
  Pointer<SdlIoStreamInterface> iface,
  Pointer<NativeType> userdata,
) {
  final sdlOpenIoLookupFunction = libSdl3
      .lookupFunction<
        Pointer<SdlIoStream> Function(
          Pointer<SdlIoStreamInterface> iface,
          Pointer<NativeType> userdata,
        ),
        Pointer<SdlIoStream> Function(
          Pointer<SdlIoStreamInterface> iface,
          Pointer<NativeType> userdata,
        )
      >('SDL_OpenIO');
  return sdlOpenIoLookupFunction(iface, userdata);
}

///
/// Close and free an allocated SDL_IOStream structure.
///
/// SDL_CloseIO() closes and cleans up the SDL_IOStream stream. It releases any
/// resources used by the stream and frees the SDL_IOStream itself. This
/// returns true on success, or false if the stream failed to flush to its
/// output (e.g. to disk).
///
/// Note that if this fails to flush the stream for any reason, this function
/// reports an error, but the SDL_IOStream is still invalid once this function
/// returns.
///
/// This call flushes any buffered writes to the operating system, but there
/// are no guarantees that those writes have gone to physical media; they might
/// be in the OS's file cache, waiting to go to disk later. If it's absolutely
/// crucial that writes go to disk immediately, so they are definitely stored
/// even if the power fails before the file cache would have caught up, one
/// should call SDL_FlushIO() before closing. Note that flushing takes time and
/// makes the system and your app operate less efficiently, so do so sparingly.
///
/// \param context SDL_IOStream structure to close.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_OpenIO
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_CloseIO(SDL_IOStream *context)
/// ```
bool sdlCloseIo(Pointer<SdlIoStream> context) {
  final sdlCloseIoLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> context),
        int Function(Pointer<SdlIoStream> context)
      >('SDL_CloseIO');
  return sdlCloseIoLookupFunction(context) == 1;
}

///
/// Get the properties associated with an SDL_IOStream.
///
/// \param context a pointer to an SDL_IOStream structure.
/// \returns a valid property ID on success or 0 on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_PropertiesID SDLCALL SDL_GetIOProperties(SDL_IOStream *context)
/// ```
int sdlGetIoProperties(Pointer<SdlIoStream> context) {
  final sdlGetIoPropertiesLookupFunction = libSdl3
      .lookupFunction<
        Uint32 Function(Pointer<SdlIoStream> context),
        int Function(Pointer<SdlIoStream> context)
      >('SDL_GetIOProperties');
  return sdlGetIoPropertiesLookupFunction(context);
}

///
/// Query the stream status of an SDL_IOStream.
///
/// This information can be useful to decide if a short read or write was due
/// to an error, an EOF, or a non-blocking operation that isn't yet ready to
/// complete.
///
/// An SDL_IOStream's status is only expected to change after a SDL_ReadIO or
/// SDL_WriteIO call; don't expect it to change if you just call this query
/// function in a tight loop.
///
/// \param context the SDL_IOStream to query.
/// \returns an SDL_IOStatus enum with the current state.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_IOStatus SDLCALL SDL_GetIOStatus(SDL_IOStream *context)
/// ```
int sdlGetIoStatus(Pointer<SdlIoStream> context) {
  final sdlGetIoStatusLookupFunction = libSdl3
      .lookupFunction<
        Int32 Function(Pointer<SdlIoStream> context),
        int Function(Pointer<SdlIoStream> context)
      >('SDL_GetIOStatus');
  return sdlGetIoStatusLookupFunction(context);
}

///
/// Use this function to get the size of the data stream in an SDL_IOStream.
///
/// \param context the SDL_IOStream to get the size of the data stream from.
/// \returns the size of the data stream in the SDL_IOStream on success or a
/// negative error code on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC Sint64 SDLCALL SDL_GetIOSize(SDL_IOStream *context)
/// ```
int sdlGetIoSize(Pointer<SdlIoStream> context) {
  final sdlGetIoSizeLookupFunction = libSdl3
      .lookupFunction<
        Int64 Function(Pointer<SdlIoStream> context),
        int Function(Pointer<SdlIoStream> context)
      >('SDL_GetIOSize');
  return sdlGetIoSizeLookupFunction(context);
}

///
/// Seek within an SDL_IOStream data stream.
///
/// This function seeks to byte `offset`, relative to `whence`.
///
/// `whence` may be any of the following values:
///
/// - `SDL_IO_SEEK_SET`: seek from the beginning of data
/// - `SDL_IO_SEEK_CUR`: seek relative to current read point
/// - `SDL_IO_SEEK_END`: seek relative to the end of data
///
/// If this stream can not seek, it will return -1.
///
/// \param context a pointer to an SDL_IOStream structure.
/// \param offset an offset in bytes, relative to `whence` location; can be
/// negative.
/// \param whence any of `SDL_IO_SEEK_SET`, `SDL_IO_SEEK_CUR`,
/// `SDL_IO_SEEK_END`.
/// \returns the final offset in the data stream after the seek or -1 on
/// failure; call SDL_GetError() for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_TellIO
///
/// ```c
/// extern SDL_DECLSPEC Sint64 SDLCALL SDL_SeekIO(SDL_IOStream *context, Sint64 offset, SDL_IOWhence whence)
/// ```
int sdlSeekIo(Pointer<SdlIoStream> context, int offset, int whence) {
  final sdlSeekIoLookupFunction = libSdl3
      .lookupFunction<
        Int64 Function(
          Pointer<SdlIoStream> context,
          Int64 offset,
          Int32 whence,
        ),
        int Function(Pointer<SdlIoStream> context, int offset, int whence)
      >('SDL_SeekIO');
  return sdlSeekIoLookupFunction(context, offset, whence);
}

///
/// Determine the current read/write offset in an SDL_IOStream data stream.
///
/// SDL_TellIO is actually a wrapper function that calls the SDL_IOStream's
/// `seek` method, with an offset of 0 bytes from `SDL_IO_SEEK_CUR`, to
/// simplify application development.
///
/// \param context an SDL_IOStream data stream object from which to get the
/// current offset.
/// \returns the current offset in the stream, or -1 if the information can not
/// be determined.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SeekIO
///
/// ```c
/// extern SDL_DECLSPEC Sint64 SDLCALL SDL_TellIO(SDL_IOStream *context)
/// ```
int sdlTellIo(Pointer<SdlIoStream> context) {
  final sdlTellIoLookupFunction = libSdl3
      .lookupFunction<
        Int64 Function(Pointer<SdlIoStream> context),
        int Function(Pointer<SdlIoStream> context)
      >('SDL_TellIO');
  return sdlTellIoLookupFunction(context);
}

///
/// Read from a data source.
///
/// This function reads up `size` bytes from the data source to the area
/// pointed at by `ptr`. This function may read less bytes than requested.
///
/// This function will return zero when the data stream is completely read, and
/// SDL_GetIOStatus() will return SDL_IO_STATUS_EOF. If zero is returned and
/// the stream is not at EOF, SDL_GetIOStatus() will return a different error
/// value and SDL_GetError() will offer a human-readable message.
///
/// \param context a pointer to an SDL_IOStream structure.
/// \param ptr a pointer to a buffer to read data into.
/// \param size the number of bytes to read from the data source.
/// \returns the number of bytes read, or 0 on end of file or other failure;
/// call SDL_GetError() for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_WriteIO
/// \sa SDL_GetIOStatus
///
/// ```c
/// extern SDL_DECLSPEC size_t SDLCALL SDL_ReadIO(SDL_IOStream *context, void *ptr, size_t size)
/// ```
int sdlReadIo(Pointer<SdlIoStream> context, Pointer<NativeType> ptr, int size) {
  final sdlReadIoLookupFunction = libSdl3
      .lookupFunction<
        Uint32 Function(
          Pointer<SdlIoStream> context,
          Pointer<NativeType> ptr,
          Uint32 size,
        ),
        int Function(
          Pointer<SdlIoStream> context,
          Pointer<NativeType> ptr,
          int size,
        )
      >('SDL_ReadIO');
  return sdlReadIoLookupFunction(context, ptr, size);
}

///
/// Write to an SDL_IOStream data stream.
///
/// This function writes exactly `size` bytes from the area pointed at by `ptr`
/// to the stream. If this fails for any reason, it'll return less than `size`
/// to demonstrate how far the write progressed. On success, it returns `size`.
///
/// On error, this function still attempts to write as much as possible, so it
/// might return a positive value less than the requested write size.
///
/// The caller can use SDL_GetIOStatus() to determine if the problem is
/// recoverable, such as a non-blocking write that can simply be retried later,
/// or a fatal error.
///
/// \param context a pointer to an SDL_IOStream structure.
/// \param ptr a pointer to a buffer containing data to write.
/// \param size the number of bytes to write.
/// \returns the number of bytes written, which will be less than `size` on
/// failure; call SDL_GetError() for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_IOprintf
/// \sa SDL_ReadIO
/// \sa SDL_SeekIO
/// \sa SDL_FlushIO
/// \sa SDL_GetIOStatus
///
/// ```c
/// extern SDL_DECLSPEC size_t SDLCALL SDL_WriteIO(SDL_IOStream *context, const void *ptr, size_t size)
/// ```
int sdlWriteIo(
  Pointer<SdlIoStream> context,
  Pointer<NativeType> ptr,
  int size,
) {
  final sdlWriteIoLookupFunction = libSdl3
      .lookupFunction<
        Uint32 Function(
          Pointer<SdlIoStream> context,
          Pointer<NativeType> ptr,
          Uint32 size,
        ),
        int Function(
          Pointer<SdlIoStream> context,
          Pointer<NativeType> ptr,
          int size,
        )
      >('SDL_WriteIO');
  return sdlWriteIoLookupFunction(context, ptr, size);
}

///
/// Print to an SDL_IOStream data stream.
///
/// This function does formatted printing to the stream.
///
/// \param context a pointer to an SDL_IOStream structure.
/// \param fmt a printf() style format string.
/// \param ... additional parameters matching % tokens in the `fmt` string, if
/// any.
/// \returns the number of bytes written or 0 on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_IOvprintf
/// \sa SDL_WriteIO
///
/// ```c
/// extern SDL_DECLSPEC size_t SDLCALL SDL_IOprintf(SDL_IOStream *context, SDL_PRINTF_FORMAT_STRING const char *fmt, ...) SDL_PRINTF_VARARG_FUNC(2)
/// ```
int sdlIOprintf(Pointer<SdlIoStream> context, String? fmt) {
  final sdlIOprintfLookupFunction = libSdl3
      .lookupFunction<
        Uint32 Function(Pointer<SdlIoStream> context, Pointer<Utf8> fmt),
        int Function(Pointer<SdlIoStream> context, Pointer<Utf8> fmt)
      >('SDL_IOprintf');
  final fmtPointer = fmt != null ? fmt.toNativeUtf8() : nullptr;
  final result = sdlIOprintfLookupFunction(context, fmtPointer);
  calloc.free(fmtPointer);
  return result;
}

///
/// Print to an SDL_IOStream data stream.
///
/// This function does formatted printing to the stream.
///
/// \param context a pointer to an SDL_IOStream structure.
/// \param fmt a printf() style format string.
/// \param ap a variable argument list.
/// \returns the number of bytes written or 0 on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_IOprintf
/// \sa SDL_WriteIO
///
/// ```c
/// extern SDL_DECLSPEC size_t SDLCALL SDL_IOvprintf(SDL_IOStream *context, SDL_PRINTF_FORMAT_STRING const char *fmt, va_list ap) SDL_PRINTF_VARARG_FUNCV(2)
/// ```
int sdlIOvprintf(Pointer<SdlIoStream> context, String? fmt) {
  final sdlIOvprintfLookupFunction = libSdl3
      .lookupFunction<
        Uint32 Function(Pointer<SdlIoStream> context, Pointer<Utf8> fmt),
        int Function(Pointer<SdlIoStream> context, Pointer<Utf8> fmt)
      >('SDL_IOvprintf');
  final fmtPointer = fmt != null ? fmt.toNativeUtf8() : nullptr;
  final result = sdlIOvprintfLookupFunction(context, fmtPointer);
  calloc.free(fmtPointer);
  return result;
}

///
/// Flush any buffered data in the stream.
///
/// This function makes sure that any buffered data is written to the stream.
/// Normally this isn't necessary but if the stream is a pipe or socket it
/// guarantees that any pending data is sent.
///
/// \param context SDL_IOStream structure to flush.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_OpenIO
/// \sa SDL_WriteIO
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_FlushIO(SDL_IOStream *context)
/// ```
bool sdlFlushIo(Pointer<SdlIoStream> context) {
  final sdlFlushIoLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> context),
        int Function(Pointer<SdlIoStream> context)
      >('SDL_FlushIO');
  return sdlFlushIoLookupFunction(context) == 1;
}

///
/// Load all the data from an SDL data stream.
///
/// The data is allocated with a zero byte at the end (null terminated) for
/// convenience. This extra byte is not included in the value reported via
/// `datasize`.
///
/// The data should be freed with SDL_free().
///
/// \param src the SDL_IOStream to read all available data from.
/// \param datasize a pointer filled in with the number of bytes read, may be
/// NULL.
/// \param closeio if true, calls SDL_CloseIO() on `src` before returning, even
/// in the case of an error.
/// \returns the data or NULL on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_LoadFile
/// \sa SDL_SaveFile_IO
///
/// ```c
/// extern SDL_DECLSPEC void * SDLCALL SDL_LoadFile_IO(SDL_IOStream *src, size_t *datasize, bool closeio)
/// ```
Pointer<NativeType> sdlLoadFileIo(
  Pointer<SdlIoStream> src,
  Pointer<Uint32> datasize,
  bool closeio,
) {
  final sdlLoadFileIoLookupFunction = libSdl3
      .lookupFunction<
        Pointer<NativeType> Function(
          Pointer<SdlIoStream> src,
          Pointer<Uint32> datasize,
          Uint8 closeio,
        ),
        Pointer<NativeType> Function(
          Pointer<SdlIoStream> src,
          Pointer<Uint32> datasize,
          int closeio,
        )
      >('SDL_LoadFile_IO');
  return sdlLoadFileIoLookupFunction(src, datasize, closeio ? 1 : 0);
}

///
/// Load all the data from a file path.
///
/// The data is allocated with a zero byte at the end (null terminated) for
/// convenience. This extra byte is not included in the value reported via
/// `datasize`.
///
/// The data should be freed with SDL_free().
///
/// \param file the path to read all available data from.
/// \param datasize if not NULL, will store the number of bytes read.
/// \returns the data or NULL on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_LoadFile_IO
/// \sa SDL_SaveFile
///
/// ```c
/// extern SDL_DECLSPEC void * SDLCALL SDL_LoadFile(const char *file, size_t *datasize)
/// ```
Pointer<NativeType> sdlLoadFile(String? file, Pointer<Uint32> datasize) {
  final sdlLoadFileLookupFunction = libSdl3
      .lookupFunction<
        Pointer<NativeType> Function(
          Pointer<Utf8> file,
          Pointer<Uint32> datasize,
        ),
        Pointer<NativeType> Function(
          Pointer<Utf8> file,
          Pointer<Uint32> datasize,
        )
      >('SDL_LoadFile');
  final filePointer = file != null ? file.toNativeUtf8() : nullptr;
  final result = sdlLoadFileLookupFunction(filePointer, datasize);
  calloc.free(filePointer);
  return result;
}

///
/// Save all the data into an SDL data stream.
///
/// \param src the SDL_IOStream to write all data to.
/// \param data the data to be written. If datasize is 0, may be NULL or a
/// invalid pointer.
/// \param datasize the number of bytes to be written.
/// \param closeio if true, calls SDL_CloseIO() on `src` before returning, even
/// in the case of an error.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SaveFile
/// \sa SDL_LoadFile_IO
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SaveFile_IO(SDL_IOStream *src, const void *data, size_t datasize, bool closeio)
/// ```
bool sdlSaveFileIo(
  Pointer<SdlIoStream> src,
  Pointer<NativeType> data,
  int datasize,
  bool closeio,
) {
  final sdlSaveFileIoLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlIoStream> src,
          Pointer<NativeType> data,
          Uint32 datasize,
          Uint8 closeio,
        ),
        int Function(
          Pointer<SdlIoStream> src,
          Pointer<NativeType> data,
          int datasize,
          int closeio,
        )
      >('SDL_SaveFile_IO');
  return sdlSaveFileIoLookupFunction(src, data, datasize, closeio ? 1 : 0) == 1;
}

///
/// Save all the data into a file path.
///
/// \param file the path to write all available data into.
/// \param data the data to be written. If datasize is 0, may be NULL or a
/// invalid pointer.
/// \param datasize the number of bytes to be written.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SaveFile_IO
/// \sa SDL_LoadFile
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SaveFile(const char *file, const void *data, size_t datasize)
/// ```
bool sdlSaveFile(String? file, Pointer<NativeType> data, int datasize) {
  final sdlSaveFileLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(
          Pointer<Utf8> file,
          Pointer<NativeType> data,
          Uint32 datasize,
        ),
        int Function(Pointer<Utf8> file, Pointer<NativeType> data, int datasize)
      >('SDL_SaveFile');
  final filePointer = file != null ? file.toNativeUtf8() : nullptr;
  final result = sdlSaveFileLookupFunction(filePointer, data, datasize) == 1;
  calloc.free(filePointer);
  return result;
}

///
/// Use this function to read a byte from an SDL_IOStream.
///
/// This function will return false when the data stream is completely read,
/// and SDL_GetIOStatus() will return SDL_IO_STATUS_EOF. If false is returned
/// and the stream is not at EOF, SDL_GetIOStatus() will return a different
/// error value and SDL_GetError() will offer a human-readable message.
///
/// \param src the SDL_IOStream to read from.
/// \param value a pointer filled in with the data read.
/// \returns true on success or false on failure or EOF; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReadU8(SDL_IOStream *src, Uint8 *value)
/// ```
bool sdlReadU8(Pointer<SdlIoStream> src, Pointer<Uint8> value) {
  final sdlReadU8LookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src, Pointer<Uint8> value),
        int Function(Pointer<SdlIoStream> src, Pointer<Uint8> value)
      >('SDL_ReadU8');
  return sdlReadU8LookupFunction(src, value) == 1;
}

///
/// Use this function to read a signed byte from an SDL_IOStream.
///
/// This function will return false when the data stream is completely read,
/// and SDL_GetIOStatus() will return SDL_IO_STATUS_EOF. If false is returned
/// and the stream is not at EOF, SDL_GetIOStatus() will return a different
/// error value and SDL_GetError() will offer a human-readable message.
///
/// \param src the SDL_IOStream to read from.
/// \param value a pointer filled in with the data read.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReadS8(SDL_IOStream *src, Sint8 *value)
/// ```
bool sdlReadS8(Pointer<SdlIoStream> src, Pointer<Int8> value) {
  final sdlReadS8LookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src, Pointer<Int8> value),
        int Function(Pointer<SdlIoStream> src, Pointer<Int8> value)
      >('SDL_ReadS8');
  return sdlReadS8LookupFunction(src, value) == 1;
}

///
/// Use this function to read 16 bits of little-endian data from an
/// SDL_IOStream and return in native format.
///
/// SDL byteswaps the data only if necessary, so the data returned will be in
/// the native byte order.
///
/// This function will return false when the data stream is completely read,
/// and SDL_GetIOStatus() will return SDL_IO_STATUS_EOF. If false is returned
/// and the stream is not at EOF, SDL_GetIOStatus() will return a different
/// error value and SDL_GetError() will offer a human-readable message.
///
/// \param src the stream from which to read data.
/// \param value a pointer filled in with the data read.
/// \returns true on successful write or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReadU16LE(SDL_IOStream *src, Uint16 *value)
/// ```
bool sdlReadU16Le(Pointer<SdlIoStream> src, Pointer<Uint16> value) {
  final sdlReadU16LeLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src, Pointer<Uint16> value),
        int Function(Pointer<SdlIoStream> src, Pointer<Uint16> value)
      >('SDL_ReadU16LE');
  return sdlReadU16LeLookupFunction(src, value) == 1;
}

///
/// Use this function to read 16 bits of little-endian data from an
/// SDL_IOStream and return in native format.
///
/// SDL byteswaps the data only if necessary, so the data returned will be in
/// the native byte order.
///
/// This function will return false when the data stream is completely read,
/// and SDL_GetIOStatus() will return SDL_IO_STATUS_EOF. If false is returned
/// and the stream is not at EOF, SDL_GetIOStatus() will return a different
/// error value and SDL_GetError() will offer a human-readable message.
///
/// \param src the stream from which to read data.
/// \param value a pointer filled in with the data read.
/// \returns true on successful write or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReadS16LE(SDL_IOStream *src, Sint16 *value)
/// ```
bool sdlReadS16Le(Pointer<SdlIoStream> src, Pointer<Int16> value) {
  final sdlReadS16LeLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src, Pointer<Int16> value),
        int Function(Pointer<SdlIoStream> src, Pointer<Int16> value)
      >('SDL_ReadS16LE');
  return sdlReadS16LeLookupFunction(src, value) == 1;
}

///
/// Use this function to read 16 bits of big-endian data from an SDL_IOStream
/// and return in native format.
///
/// SDL byteswaps the data only if necessary, so the data returned will be in
/// the native byte order.
///
/// This function will return false when the data stream is completely read,
/// and SDL_GetIOStatus() will return SDL_IO_STATUS_EOF. If false is returned
/// and the stream is not at EOF, SDL_GetIOStatus() will return a different
/// error value and SDL_GetError() will offer a human-readable message.
///
/// \param src the stream from which to read data.
/// \param value a pointer filled in with the data read.
/// \returns true on successful write or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReadU16BE(SDL_IOStream *src, Uint16 *value)
/// ```
bool sdlReadU16Be(Pointer<SdlIoStream> src, Pointer<Uint16> value) {
  final sdlReadU16BeLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src, Pointer<Uint16> value),
        int Function(Pointer<SdlIoStream> src, Pointer<Uint16> value)
      >('SDL_ReadU16BE');
  return sdlReadU16BeLookupFunction(src, value) == 1;
}

///
/// Use this function to read 16 bits of big-endian data from an SDL_IOStream
/// and return in native format.
///
/// SDL byteswaps the data only if necessary, so the data returned will be in
/// the native byte order.
///
/// This function will return false when the data stream is completely read,
/// and SDL_GetIOStatus() will return SDL_IO_STATUS_EOF. If false is returned
/// and the stream is not at EOF, SDL_GetIOStatus() will return a different
/// error value and SDL_GetError() will offer a human-readable message.
///
/// \param src the stream from which to read data.
/// \param value a pointer filled in with the data read.
/// \returns true on successful write or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReadS16BE(SDL_IOStream *src, Sint16 *value)
/// ```
bool sdlReadS16Be(Pointer<SdlIoStream> src, Pointer<Int16> value) {
  final sdlReadS16BeLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src, Pointer<Int16> value),
        int Function(Pointer<SdlIoStream> src, Pointer<Int16> value)
      >('SDL_ReadS16BE');
  return sdlReadS16BeLookupFunction(src, value) == 1;
}

///
/// Use this function to read 32 bits of little-endian data from an
/// SDL_IOStream and return in native format.
///
/// SDL byteswaps the data only if necessary, so the data returned will be in
/// the native byte order.
///
/// This function will return false when the data stream is completely read,
/// and SDL_GetIOStatus() will return SDL_IO_STATUS_EOF. If false is returned
/// and the stream is not at EOF, SDL_GetIOStatus() will return a different
/// error value and SDL_GetError() will offer a human-readable message.
///
/// \param src the stream from which to read data.
/// \param value a pointer filled in with the data read.
/// \returns true on successful write or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReadU32LE(SDL_IOStream *src, Uint32 *value)
/// ```
bool sdlReadU32Le(Pointer<SdlIoStream> src, Pointer<Uint32> value) {
  final sdlReadU32LeLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src, Pointer<Uint32> value),
        int Function(Pointer<SdlIoStream> src, Pointer<Uint32> value)
      >('SDL_ReadU32LE');
  return sdlReadU32LeLookupFunction(src, value) == 1;
}

///
/// Use this function to read 32 bits of little-endian data from an
/// SDL_IOStream and return in native format.
///
/// SDL byteswaps the data only if necessary, so the data returned will be in
/// the native byte order.
///
/// This function will return false when the data stream is completely read,
/// and SDL_GetIOStatus() will return SDL_IO_STATUS_EOF. If false is returned
/// and the stream is not at EOF, SDL_GetIOStatus() will return a different
/// error value and SDL_GetError() will offer a human-readable message.
///
/// \param src the stream from which to read data.
/// \param value a pointer filled in with the data read.
/// \returns true on successful write or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReadS32LE(SDL_IOStream *src, Sint32 *value)
/// ```
bool sdlReadS32Le(Pointer<SdlIoStream> src, Pointer<Int32> value) {
  final sdlReadS32LeLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src, Pointer<Int32> value),
        int Function(Pointer<SdlIoStream> src, Pointer<Int32> value)
      >('SDL_ReadS32LE');
  return sdlReadS32LeLookupFunction(src, value) == 1;
}

///
/// Use this function to read 32 bits of big-endian data from an SDL_IOStream
/// and return in native format.
///
/// SDL byteswaps the data only if necessary, so the data returned will be in
/// the native byte order.
///
/// This function will return false when the data stream is completely read,
/// and SDL_GetIOStatus() will return SDL_IO_STATUS_EOF. If false is returned
/// and the stream is not at EOF, SDL_GetIOStatus() will return a different
/// error value and SDL_GetError() will offer a human-readable message.
///
/// \param src the stream from which to read data.
/// \param value a pointer filled in with the data read.
/// \returns true on successful write or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReadU32BE(SDL_IOStream *src, Uint32 *value)
/// ```
bool sdlReadU32Be(Pointer<SdlIoStream> src, Pointer<Uint32> value) {
  final sdlReadU32BeLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src, Pointer<Uint32> value),
        int Function(Pointer<SdlIoStream> src, Pointer<Uint32> value)
      >('SDL_ReadU32BE');
  return sdlReadU32BeLookupFunction(src, value) == 1;
}

///
/// Use this function to read 32 bits of big-endian data from an SDL_IOStream
/// and return in native format.
///
/// SDL byteswaps the data only if necessary, so the data returned will be in
/// the native byte order.
///
/// This function will return false when the data stream is completely read,
/// and SDL_GetIOStatus() will return SDL_IO_STATUS_EOF. If false is returned
/// and the stream is not at EOF, SDL_GetIOStatus() will return a different
/// error value and SDL_GetError() will offer a human-readable message.
///
/// \param src the stream from which to read data.
/// \param value a pointer filled in with the data read.
/// \returns true on successful write or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReadS32BE(SDL_IOStream *src, Sint32 *value)
/// ```
bool sdlReadS32Be(Pointer<SdlIoStream> src, Pointer<Int32> value) {
  final sdlReadS32BeLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src, Pointer<Int32> value),
        int Function(Pointer<SdlIoStream> src, Pointer<Int32> value)
      >('SDL_ReadS32BE');
  return sdlReadS32BeLookupFunction(src, value) == 1;
}

///
/// Use this function to read 64 bits of little-endian data from an
/// SDL_IOStream and return in native format.
///
/// SDL byteswaps the data only if necessary, so the data returned will be in
/// the native byte order.
///
/// This function will return false when the data stream is completely read,
/// and SDL_GetIOStatus() will return SDL_IO_STATUS_EOF. If false is returned
/// and the stream is not at EOF, SDL_GetIOStatus() will return a different
/// error value and SDL_GetError() will offer a human-readable message.
///
/// \param src the stream from which to read data.
/// \param value a pointer filled in with the data read.
/// \returns true on successful write or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReadU64LE(SDL_IOStream *src, Uint64 *value)
/// ```
bool sdlReadU64Le(Pointer<SdlIoStream> src, Pointer<Uint64> value) {
  final sdlReadU64LeLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src, Pointer<Uint64> value),
        int Function(Pointer<SdlIoStream> src, Pointer<Uint64> value)
      >('SDL_ReadU64LE');
  return sdlReadU64LeLookupFunction(src, value) == 1;
}

///
/// Use this function to read 64 bits of little-endian data from an
/// SDL_IOStream and return in native format.
///
/// SDL byteswaps the data only if necessary, so the data returned will be in
/// the native byte order.
///
/// This function will return false when the data stream is completely read,
/// and SDL_GetIOStatus() will return SDL_IO_STATUS_EOF. If false is returned
/// and the stream is not at EOF, SDL_GetIOStatus() will return a different
/// error value and SDL_GetError() will offer a human-readable message.
///
/// \param src the stream from which to read data.
/// \param value a pointer filled in with the data read.
/// \returns true on successful write or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReadS64LE(SDL_IOStream *src, Sint64 *value)
/// ```
bool sdlReadS64Le(Pointer<SdlIoStream> src, Pointer<Int64> value) {
  final sdlReadS64LeLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src, Pointer<Int64> value),
        int Function(Pointer<SdlIoStream> src, Pointer<Int64> value)
      >('SDL_ReadS64LE');
  return sdlReadS64LeLookupFunction(src, value) == 1;
}

///
/// Use this function to read 64 bits of big-endian data from an SDL_IOStream
/// and return in native format.
///
/// SDL byteswaps the data only if necessary, so the data returned will be in
/// the native byte order.
///
/// This function will return false when the data stream is completely read,
/// and SDL_GetIOStatus() will return SDL_IO_STATUS_EOF. If false is returned
/// and the stream is not at EOF, SDL_GetIOStatus() will return a different
/// error value and SDL_GetError() will offer a human-readable message.
///
/// \param src the stream from which to read data.
/// \param value a pointer filled in with the data read.
/// \returns true on successful write or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReadU64BE(SDL_IOStream *src, Uint64 *value)
/// ```
bool sdlReadU64Be(Pointer<SdlIoStream> src, Pointer<Uint64> value) {
  final sdlReadU64BeLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src, Pointer<Uint64> value),
        int Function(Pointer<SdlIoStream> src, Pointer<Uint64> value)
      >('SDL_ReadU64BE');
  return sdlReadU64BeLookupFunction(src, value) == 1;
}

///
/// Use this function to read 64 bits of big-endian data from an SDL_IOStream
/// and return in native format.
///
/// SDL byteswaps the data only if necessary, so the data returned will be in
/// the native byte order.
///
/// This function will return false when the data stream is completely read,
/// and SDL_GetIOStatus() will return SDL_IO_STATUS_EOF. If false is returned
/// and the stream is not at EOF, SDL_GetIOStatus() will return a different
/// error value and SDL_GetError() will offer a human-readable message.
///
/// \param src the stream from which to read data.
/// \param value a pointer filled in with the data read.
/// \returns true on successful write or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReadS64BE(SDL_IOStream *src, Sint64 *value)
/// ```
bool sdlReadS64Be(Pointer<SdlIoStream> src, Pointer<Int64> value) {
  final sdlReadS64BeLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src, Pointer<Int64> value),
        int Function(Pointer<SdlIoStream> src, Pointer<Int64> value)
      >('SDL_ReadS64BE');
  return sdlReadS64BeLookupFunction(src, value) == 1;
}

///
/// Use this function to write a byte to an SDL_IOStream.
///
/// \param dst the SDL_IOStream to write to.
/// \param value the byte value to write.
/// \returns true on successful write or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_WriteU8(SDL_IOStream *dst, Uint8 value)
/// ```
bool sdlWriteU8(Pointer<SdlIoStream> dst, int value) {
  final sdlWriteU8LookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> dst, Uint8 value),
        int Function(Pointer<SdlIoStream> dst, int value)
      >('SDL_WriteU8');
  return sdlWriteU8LookupFunction(dst, value) == 1;
}

///
/// Use this function to write a signed byte to an SDL_IOStream.
///
/// \param dst the SDL_IOStream to write to.
/// \param value the byte value to write.
/// \returns true on successful write or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_WriteS8(SDL_IOStream *dst, Sint8 value)
/// ```
bool sdlWriteS8(Pointer<SdlIoStream> dst, int value) {
  final sdlWriteS8LookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> dst, Int8 value),
        int Function(Pointer<SdlIoStream> dst, int value)
      >('SDL_WriteS8');
  return sdlWriteS8LookupFunction(dst, value) == 1;
}

///
/// Use this function to write 16 bits in native format to an SDL_IOStream as
/// little-endian data.
///
/// SDL byteswaps the data only if necessary, so the application always
/// specifies native format, and the data written will be in little-endian
/// format.
///
/// \param dst the stream to which data will be written.
/// \param value the data to be written, in native format.
/// \returns true on successful write or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_WriteU16LE(SDL_IOStream *dst, Uint16 value)
/// ```
bool sdlWriteU16Le(Pointer<SdlIoStream> dst, int value) {
  final sdlWriteU16LeLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> dst, Uint16 value),
        int Function(Pointer<SdlIoStream> dst, int value)
      >('SDL_WriteU16LE');
  return sdlWriteU16LeLookupFunction(dst, value) == 1;
}

///
/// Use this function to write 16 bits in native format to an SDL_IOStream as
/// little-endian data.
///
/// SDL byteswaps the data only if necessary, so the application always
/// specifies native format, and the data written will be in little-endian
/// format.
///
/// \param dst the stream to which data will be written.
/// \param value the data to be written, in native format.
/// \returns true on successful write or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_WriteS16LE(SDL_IOStream *dst, Sint16 value)
/// ```
bool sdlWriteS16Le(Pointer<SdlIoStream> dst, int value) {
  final sdlWriteS16LeLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> dst, Int16 value),
        int Function(Pointer<SdlIoStream> dst, int value)
      >('SDL_WriteS16LE');
  return sdlWriteS16LeLookupFunction(dst, value) == 1;
}

///
/// Use this function to write 16 bits in native format to an SDL_IOStream as
/// big-endian data.
///
/// SDL byteswaps the data only if necessary, so the application always
/// specifies native format, and the data written will be in big-endian format.
///
/// \param dst the stream to which data will be written.
/// \param value the data to be written, in native format.
/// \returns true on successful write or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_WriteU16BE(SDL_IOStream *dst, Uint16 value)
/// ```
bool sdlWriteU16Be(Pointer<SdlIoStream> dst, int value) {
  final sdlWriteU16BeLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> dst, Uint16 value),
        int Function(Pointer<SdlIoStream> dst, int value)
      >('SDL_WriteU16BE');
  return sdlWriteU16BeLookupFunction(dst, value) == 1;
}

///
/// Use this function to write 16 bits in native format to an SDL_IOStream as
/// big-endian data.
///
/// SDL byteswaps the data only if necessary, so the application always
/// specifies native format, and the data written will be in big-endian format.
///
/// \param dst the stream to which data will be written.
/// \param value the data to be written, in native format.
/// \returns true on successful write or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_WriteS16BE(SDL_IOStream *dst, Sint16 value)
/// ```
bool sdlWriteS16Be(Pointer<SdlIoStream> dst, int value) {
  final sdlWriteS16BeLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> dst, Int16 value),
        int Function(Pointer<SdlIoStream> dst, int value)
      >('SDL_WriteS16BE');
  return sdlWriteS16BeLookupFunction(dst, value) == 1;
}

///
/// Use this function to write 32 bits in native format to an SDL_IOStream as
/// little-endian data.
///
/// SDL byteswaps the data only if necessary, so the application always
/// specifies native format, and the data written will be in little-endian
/// format.
///
/// \param dst the stream to which data will be written.
/// \param value the data to be written, in native format.
/// \returns true on successful write or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_WriteU32LE(SDL_IOStream *dst, Uint32 value)
/// ```
bool sdlWriteU32Le(Pointer<SdlIoStream> dst, int value) {
  final sdlWriteU32LeLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> dst, Uint32 value),
        int Function(Pointer<SdlIoStream> dst, int value)
      >('SDL_WriteU32LE');
  return sdlWriteU32LeLookupFunction(dst, value) == 1;
}

///
/// Use this function to write 32 bits in native format to an SDL_IOStream as
/// little-endian data.
///
/// SDL byteswaps the data only if necessary, so the application always
/// specifies native format, and the data written will be in little-endian
/// format.
///
/// \param dst the stream to which data will be written.
/// \param value the data to be written, in native format.
/// \returns true on successful write or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_WriteS32LE(SDL_IOStream *dst, Sint32 value)
/// ```
bool sdlWriteS32Le(Pointer<SdlIoStream> dst, int value) {
  final sdlWriteS32LeLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> dst, Int32 value),
        int Function(Pointer<SdlIoStream> dst, int value)
      >('SDL_WriteS32LE');
  return sdlWriteS32LeLookupFunction(dst, value) == 1;
}

///
/// Use this function to write 32 bits in native format to an SDL_IOStream as
/// big-endian data.
///
/// SDL byteswaps the data only if necessary, so the application always
/// specifies native format, and the data written will be in big-endian format.
///
/// \param dst the stream to which data will be written.
/// \param value the data to be written, in native format.
/// \returns true on successful write or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_WriteU32BE(SDL_IOStream *dst, Uint32 value)
/// ```
bool sdlWriteU32Be(Pointer<SdlIoStream> dst, int value) {
  final sdlWriteU32BeLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> dst, Uint32 value),
        int Function(Pointer<SdlIoStream> dst, int value)
      >('SDL_WriteU32BE');
  return sdlWriteU32BeLookupFunction(dst, value) == 1;
}

///
/// Use this function to write 32 bits in native format to an SDL_IOStream as
/// big-endian data.
///
/// SDL byteswaps the data only if necessary, so the application always
/// specifies native format, and the data written will be in big-endian format.
///
/// \param dst the stream to which data will be written.
/// \param value the data to be written, in native format.
/// \returns true on successful write or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_WriteS32BE(SDL_IOStream *dst, Sint32 value)
/// ```
bool sdlWriteS32Be(Pointer<SdlIoStream> dst, int value) {
  final sdlWriteS32BeLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> dst, Int32 value),
        int Function(Pointer<SdlIoStream> dst, int value)
      >('SDL_WriteS32BE');
  return sdlWriteS32BeLookupFunction(dst, value) == 1;
}

///
/// Use this function to write 64 bits in native format to an SDL_IOStream as
/// little-endian data.
///
/// SDL byteswaps the data only if necessary, so the application always
/// specifies native format, and the data written will be in little-endian
/// format.
///
/// \param dst the stream to which data will be written.
/// \param value the data to be written, in native format.
/// \returns true on successful write or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_WriteU64LE(SDL_IOStream *dst, Uint64 value)
/// ```
bool sdlWriteU64Le(Pointer<SdlIoStream> dst, int value) {
  final sdlWriteU64LeLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> dst, Uint64 value),
        int Function(Pointer<SdlIoStream> dst, int value)
      >('SDL_WriteU64LE');
  return sdlWriteU64LeLookupFunction(dst, value) == 1;
}

///
/// Use this function to write 64 bits in native format to an SDL_IOStream as
/// little-endian data.
///
/// SDL byteswaps the data only if necessary, so the application always
/// specifies native format, and the data written will be in little-endian
/// format.
///
/// \param dst the stream to which data will be written.
/// \param value the data to be written, in native format.
/// \returns true on successful write or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_WriteS64LE(SDL_IOStream *dst, Sint64 value)
/// ```
bool sdlWriteS64Le(Pointer<SdlIoStream> dst, int value) {
  final sdlWriteS64LeLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> dst, Int64 value),
        int Function(Pointer<SdlIoStream> dst, int value)
      >('SDL_WriteS64LE');
  return sdlWriteS64LeLookupFunction(dst, value) == 1;
}

///
/// Use this function to write 64 bits in native format to an SDL_IOStream as
/// big-endian data.
///
/// SDL byteswaps the data only if necessary, so the application always
/// specifies native format, and the data written will be in big-endian format.
///
/// \param dst the stream to which data will be written.
/// \param value the data to be written, in native format.
/// \returns true on successful write or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_WriteU64BE(SDL_IOStream *dst, Uint64 value)
/// ```
bool sdlWriteU64Be(Pointer<SdlIoStream> dst, int value) {
  final sdlWriteU64BeLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> dst, Uint64 value),
        int Function(Pointer<SdlIoStream> dst, int value)
      >('SDL_WriteU64BE');
  return sdlWriteU64BeLookupFunction(dst, value) == 1;
}

///
/// Use this function to write 64 bits in native format to an SDL_IOStream as
/// big-endian data.
///
/// SDL byteswaps the data only if necessary, so the application always
/// specifies native format, and the data written will be in big-endian format.
///
/// \param dst the stream to which data will be written.
/// \param value the data to be written, in native format.
/// \returns true on successful write or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_WriteS64BE(SDL_IOStream *dst, Sint64 value)
/// ```
bool sdlWriteS64Be(Pointer<SdlIoStream> dst, int value) {
  final sdlWriteS64BeLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> dst, Int64 value),
        int Function(Pointer<SdlIoStream> dst, int value)
      >('SDL_WriteS64BE');
  return sdlWriteS64BeLookupFunction(dst, value) == 1;
}
