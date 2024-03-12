// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Use this function to create a new SDL_RWops structure for reading from
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
/// As a fallback, SDL_RWFromFile() will transparently open a matching filename
/// in an Android app's `assets`.
///
/// Closing the SDL_RWops will close the file handle SDL is holding internally.
///
/// \param file a UTF-8 string representing the filename to open
/// \param mode an ASCII string representing the mode to be used for opening
/// the file.
/// \returns a pointer to the SDL_RWops structure that is created, or NULL on
/// failure; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_RWclose
/// \sa SDL_RWFromConstMem
/// \sa SDL_RWFromMem
/// \sa SDL_RWread
/// \sa SDL_RWseek
/// \sa SDL_RWtell
/// \sa SDL_RWwrite
///
/// ```c
/// extern DECLSPEC SDL_RWops *SDLCALL SDL_RWFromFile(const char *file, const char *mode)
/// ```
Pointer<SdlRWops> sdlRwFromFile(String? file, String? mode) {
  final sdlRwFromFileLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlRWops> Function(Pointer<Utf8> file, Pointer<Utf8> mode),
      Pointer<SdlRWops> Function(
          Pointer<Utf8> file, Pointer<Utf8> mode)>('SDL_RWFromFile');
  final filePointer = file != null ? file.toNativeUtf8() : nullptr;
  final modePointer = mode != null ? mode.toNativeUtf8() : nullptr;
  final result = sdlRwFromFileLookupFunction(filePointer, modePointer);
  calloc.free(filePointer);
  calloc.free(modePointer);
  return result;
}

///
/// Use this function to prepare a read-write memory buffer for use with
/// SDL_RWops.
///
/// This function sets up an SDL_RWops struct based on a memory area of a
/// certain size, for both read and write access.
///
/// This memory buffer is not copied by the RWops; the pointer you provide must
/// remain valid until you close the stream. Closing the stream will not free
/// the original buffer.
///
/// If you need to make sure the RWops never writes to the memory buffer, you
/// should use SDL_RWFromConstMem() with a read-only buffer of memory instead.
///
/// \param mem a pointer to a buffer to feed an SDL_RWops stream
/// \param size the buffer size, in bytes
/// \returns a pointer to a new SDL_RWops structure, or NULL if it fails; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_RWclose
/// \sa SDL_RWFromConstMem
/// \sa SDL_RWFromFile
/// \sa SDL_RWFromMem
/// \sa SDL_RWread
/// \sa SDL_RWseek
/// \sa SDL_RWtell
/// \sa SDL_RWwrite
///
/// ```c
/// extern DECLSPEC SDL_RWops *SDLCALL SDL_RWFromMem(void *mem, size_t size)
/// ```
Pointer<SdlRWops> sdlRwFromMem(Pointer<NativeType> mem, int size) {
  final sdlRwFromMemLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlRWops> Function(Pointer<NativeType> mem, Uint32 size),
      Pointer<SdlRWops> Function(
          Pointer<NativeType> mem, int size)>('SDL_RWFromMem');
  return sdlRwFromMemLookupFunction(mem, size);
}

///
/// Use this function to prepare a read-only memory buffer for use with RWops.
///
/// This function sets up an SDL_RWops struct based on a memory area of a
/// certain size. It assumes the memory area is not writable.
///
/// Attempting to write to this RWops stream will report an error without
/// writing to the memory buffer.
///
/// This memory buffer is not copied by the RWops; the pointer you provide must
/// remain valid until you close the stream. Closing the stream will not free
/// the original buffer.
///
/// If you need to write to a memory buffer, you should use SDL_RWFromMem()
/// with a writable buffer of memory instead.
///
/// \param mem a pointer to a read-only buffer to feed an SDL_RWops stream
/// \param size the buffer size, in bytes
/// \returns a pointer to a new SDL_RWops structure, or NULL if it fails; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_RWclose
/// \sa SDL_RWFromConstMem
/// \sa SDL_RWFromFile
/// \sa SDL_RWFromMem
/// \sa SDL_RWread
/// \sa SDL_RWseek
/// \sa SDL_RWtell
///
/// ```c
/// extern DECLSPEC SDL_RWops *SDLCALL SDL_RWFromConstMem(const void *mem, size_t size)
/// ```
Pointer<SdlRWops> sdlRwFromConstMem(Pointer<NativeType> mem, int size) {
  final sdlRwFromConstMemLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlRWops> Function(Pointer<NativeType> mem, Uint32 size),
      Pointer<SdlRWops> Function(
          Pointer<NativeType> mem, int size)>('SDL_RWFromConstMem');
  return sdlRwFromConstMemLookupFunction(mem, size);
}

///
/// Use this function to allocate an empty, unpopulated SDL_RWops structure.
///
/// Applications do not need to use this function unless they are providing
/// their own SDL_RWops implementation. If you just need an SDL_RWops to
/// read/write a common data source, you should use the built-in
/// implementations in SDL, like SDL_RWFromFile() or SDL_RWFromMem(), etc.
///
/// You must free the returned pointer with SDL_DestroyRW(). Depending on your
/// operating system and compiler, there may be a difference between the
/// malloc() and free() your program uses and the versions SDL calls
/// internally. Trying to mix the two can cause crashing such as segmentation
/// faults. Since all SDL_RWops must free themselves when their **close**
/// method is called, all SDL_RWops must be allocated through this function, so
/// they can all be freed correctly with SDL_DestroyRW().
///
/// \returns a pointer to the allocated memory on success, or NULL on failure;
/// call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_DestroyRW
///
/// ```c
/// extern DECLSPEC SDL_RWops *SDLCALL SDL_CreateRW(void)
/// ```
Pointer<SdlRWops> sdlCreateRw() {
  final sdlCreateRwLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlRWops> Function(),
      Pointer<SdlRWops> Function()>('SDL_CreateRW');
  return sdlCreateRwLookupFunction();
}

///
/// Use this function to free an SDL_RWops structure allocated by
/// SDL_CreateRW().
///
/// Applications do not need to use this function unless they are providing
/// their own SDL_RWops implementation. If you just need an SDL_RWops to
/// read/write a common data source, you should use the built-in
/// implementations in SDL, like SDL_RWFromFile() or SDL_RWFromMem(), etc, and
/// call the **close** method on those SDL_RWops pointers when you are done
/// with them.
///
/// Only use SDL_DestroyRW() on pointers returned by SDL_CreateRW(). The
/// pointer is invalid as soon as this function returns. Any extra memory
/// allocated during creation of the SDL_RWops is not freed by SDL_DestroyRW();
/// the programmer must be responsible for managing that memory in their
/// **close** method.
///
/// \param context the SDL_RWops structure to be freed
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_CreateRW
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_DestroyRW(SDL_RWops *context)
/// ```
void sdlDestroyRw(Pointer<SdlRWops> context) {
  final sdlDestroyRwLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlRWops> context),
      void Function(Pointer<SdlRWops> context)>('SDL_DestroyRW');
  return sdlDestroyRwLookupFunction(context);
}

///
/// Get the properties associated with an SDL_RWops.
///
/// \param context a pointer to an SDL_RWops structure
/// \returns a valid property ID on success or 0 on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetProperty
/// \sa SDL_SetProperty
///
/// ```c
/// extern DECLSPEC SDL_PropertiesID SDLCALL SDL_GetRWProperties(SDL_RWops *context)
/// ```
int sdlGetRwProperties(Pointer<SdlRWops> context) {
  final sdlGetRwPropertiesLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<SdlRWops> context),
      int Function(Pointer<SdlRWops> context)>('SDL_GetRWProperties');
  return sdlGetRwPropertiesLookupFunction(context);
}

///
/// Use this function to get the size of the data stream in an SDL_RWops.
///
/// \param context the SDL_RWops to get the size of the data stream from
/// \returns the size of the data stream in the SDL_RWops on success or a
/// negative error code on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC Sint64 SDLCALL SDL_RWsize(SDL_RWops *context)
/// ```
int sdlRWsize(Pointer<SdlRWops> context) {
  final sdlRWsizeLookupFunction = libSdl3.lookupFunction<
      Int64 Function(Pointer<SdlRWops> context),
      int Function(Pointer<SdlRWops> context)>('SDL_RWsize');
  return sdlRWsizeLookupFunction(context);
}

///
/// Seek within an SDL_RWops data stream.
///
/// This function seeks to byte `offset`, relative to `whence`.
///
/// `whence` may be any of the following values:
///
/// - `SDL_RW_SEEK_SET`: seek from the beginning of data
/// - `SDL_RW_SEEK_CUR`: seek relative to current read point
/// - `SDL_RW_SEEK_END`: seek relative to the end of data
///
/// If this stream can not seek, it will return -1.
///
/// SDL_RWseek() is actually a wrapper function that calls the SDL_RWops's
/// `seek` method appropriately, to simplify application development.
///
/// \param context a pointer to an SDL_RWops structure
/// \param offset an offset in bytes, relative to **whence** location; can be
/// negative
/// \param whence any of `SDL_RW_SEEK_SET`, `SDL_RW_SEEK_CUR`,
/// `SDL_RW_SEEK_END`
/// \returns the final offset in the data stream after the seek or a negative
/// error code on failure; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_RWclose
/// \sa SDL_RWFromConstMem
/// \sa SDL_RWFromFile
/// \sa SDL_RWFromMem
/// \sa SDL_RWread
/// \sa SDL_RWtell
/// \sa SDL_RWwrite
///
/// ```c
/// extern DECLSPEC Sint64 SDLCALL SDL_RWseek(SDL_RWops *context, Sint64 offset, int whence)
/// ```
int sdlRWseek(Pointer<SdlRWops> context, int offset, int whence) {
  final sdlRWseekLookupFunction = libSdl3.lookupFunction<
      Int64 Function(Pointer<SdlRWops> context, Int64 offset, Int32 whence),
      int Function(
          Pointer<SdlRWops> context, int offset, int whence)>('SDL_RWseek');
  return sdlRWseekLookupFunction(context, offset, whence);
}

///
/// Determine the current read/write offset in an SDL_RWops data stream.
///
/// SDL_RWtell is actually a wrapper function that calls the SDL_RWops's `seek`
/// method, with an offset of 0 bytes from `SDL_RW_SEEK_CUR`, to simplify
/// application development.
///
/// \param context an SDL_RWops data stream object from which to get the
/// current offset
/// \returns the current offset in the stream, or -1 if the information can not
/// be determined.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_RWclose
/// \sa SDL_RWFromConstMem
/// \sa SDL_RWFromFile
/// \sa SDL_RWFromMem
/// \sa SDL_RWread
/// \sa SDL_RWseek
/// \sa SDL_RWwrite
///
/// ```c
/// extern DECLSPEC Sint64 SDLCALL SDL_RWtell(SDL_RWops *context)
/// ```
int sdlRWtell(Pointer<SdlRWops> context) {
  final sdlRWtellLookupFunction = libSdl3.lookupFunction<
      Int64 Function(Pointer<SdlRWops> context),
      int Function(Pointer<SdlRWops> context)>('SDL_RWtell');
  return sdlRWtellLookupFunction(context);
}

///
/// Read from a data source.
///
/// This function reads up `size` bytes from the data source to the area
/// pointed at by `ptr`. This function may read less bytes than requested. It
/// will return zero when the data stream is completely read, or -1 on error.
/// For streams that support non-blocking operation, if nothing was read
/// because it would require blocking, this function returns -2 to distinguish
/// that this is not an error or end-of-file, and the caller can try again
/// later.
///
/// SDL_RWread() is actually a function wrapper that calls the SDL_RWops's
/// `read` method appropriately, to simplify application development.
///
/// \param context a pointer to an SDL_RWops structure
/// \param ptr a pointer to a buffer to read data into
/// \param size the number of bytes to read from the data source.
/// \returns the number of bytes read, or 0 on end of file or other error.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_RWclose
/// \sa SDL_RWFromConstMem
/// \sa SDL_RWFromFile
/// \sa SDL_RWFromMem
/// \sa SDL_RWseek
/// \sa SDL_RWwrite
///
/// ```c
/// extern DECLSPEC size_t SDLCALL SDL_RWread(SDL_RWops *context, void *ptr, size_t size)
/// ```
int sdlRWread(Pointer<SdlRWops> context, Pointer<NativeType> ptr, int size) {
  final sdlRWreadLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(
          Pointer<SdlRWops> context, Pointer<NativeType> ptr, Uint32 size),
      int Function(Pointer<SdlRWops> context, Pointer<NativeType> ptr,
          int size)>('SDL_RWread');
  return sdlRWreadLookupFunction(context, ptr, size);
}

///
/// Write to an SDL_RWops data stream.
///
/// This function writes exactly `size` bytes from the area pointed at by `ptr`
/// to the stream. If this fails for any reason, it'll return less than `size`
/// to demonstrate how far the write progressed. On success, it returns `num`.
///
/// On error, this function still attempts to write as much as possible, so it
/// might return a positive value less than the requested write size. If the
/// function failed to write anything and there was an actual error, it will
/// return -1. For streams that support non-blocking operation, if nothing was
/// written because it would require blocking, this function returns -2 to
/// distinguish that this is not an error and the caller can try again later.
///
/// SDL_RWwrite is actually a function wrapper that calls the SDL_RWops's
/// `write` method appropriately, to simplify application development.
///
/// It is an error to specify a negative `size`, but this parameter is signed
/// so you definitely cannot overflow the return value on a successful run with
/// enormous amounts of data.
///
/// \param context a pointer to an SDL_RWops structure
/// \param ptr a pointer to a buffer containing data to write
/// \param size the number of bytes to write
/// \returns the number of bytes written, which will be less than `num` on
/// error; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_RWclose
/// \sa SDL_RWFromConstMem
/// \sa SDL_RWFromFile
/// \sa SDL_RWFromMem
/// \sa SDL_RWprint
/// \sa SDL_RWread
/// \sa SDL_RWseek
///
/// ```c
/// extern DECLSPEC size_t SDLCALL SDL_RWwrite(SDL_RWops *context, const void *ptr, size_t size)
/// ```
int sdlRWwrite(Pointer<SdlRWops> context, Pointer<NativeType> ptr, int size) {
  final sdlRWwriteLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(
          Pointer<SdlRWops> context, Pointer<NativeType> ptr, Uint32 size),
      int Function(Pointer<SdlRWops> context, Pointer<NativeType> ptr,
          int size)>('SDL_RWwrite');
  return sdlRWwriteLookupFunction(context, ptr, size);
}

///
/// Print to an SDL_RWops data stream.
///
/// This function does formatted printing to the stream.
///
/// \param context a pointer to an SDL_RWops structure
/// \param fmt a printf() style format string
/// \param ... additional parameters matching % tokens in the `fmt` string, if
/// any
/// \returns the number of bytes written, or 0 on error; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_RWclose
/// \sa SDL_RWFromConstMem
/// \sa SDL_RWFromFile
/// \sa SDL_RWFromMem
/// \sa SDL_RWread
/// \sa SDL_RWseek
/// \sa SDL_RWwrite
///
/// ```c
/// extern DECLSPEC size_t SDLCALL SDL_RWprintf(SDL_RWops *context, SDL_PRINTF_FORMAT_STRING const char *fmt, ...) SDL_PRINTF_VARARG_FUNC(2)
/// ```
int sdlRWprintf(
    Pointer<SdlRWops> context, String? fmt, Pointer<NativeType> arg2) {
  final sdlRWprintfLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<SdlRWops> context, Pointer<Utf8> fmt,
          Pointer<NativeType> arg2),
      int Function(Pointer<SdlRWops> context, Pointer<Utf8> fmt,
          Pointer<NativeType> arg2)>('SDL_RWprintf');
  final fmtPointer = fmt != null ? fmt.toNativeUtf8() : nullptr;
  final result = sdlRWprintfLookupFunction(context, fmtPointer, arg2);
  calloc.free(fmtPointer);
  return result;
}

///
/// Print to an SDL_RWops data stream.
///
/// This function does formatted printing to the stream.
///
/// \param context a pointer to an SDL_RWops structure
/// \param fmt a printf() style format string
/// \param ap a variable argument list
/// \returns the number of bytes written, or 0 on error; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_RWclose
/// \sa SDL_RWFromConstMem
/// \sa SDL_RWFromFile
/// \sa SDL_RWFromMem
/// \sa SDL_RWread
/// \sa SDL_RWseek
/// \sa SDL_RWwrite
///
/// ```c
/// extern DECLSPEC size_t SDLCALL SDL_RWvprintf(SDL_RWops *context, SDL_PRINTF_FORMAT_STRING const char *fmt, va_list ap) SDL_PRINTF_VARARG_FUNCV(2)
/// ```
int sdlRWvprintf(
    Pointer<SdlRWops> context, String? fmt, Pointer<NativeType> arg2) {
  final sdlRWvprintfLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<SdlRWops> context, Pointer<Utf8> fmt,
          Pointer<NativeType> arg2),
      int Function(Pointer<SdlRWops> context, Pointer<Utf8> fmt,
          Pointer<NativeType> arg2)>('SDL_RWvprintf');
  final fmtPointer = fmt != null ? fmt.toNativeUtf8() : nullptr;
  final result = sdlRWvprintfLookupFunction(context, fmtPointer, arg2);
  calloc.free(fmtPointer);
  return result;
}

///
/// Close and free an allocated SDL_RWops structure.
///
/// SDL_RWclose() closes and cleans up the SDL_RWops stream. It releases any
/// resources used by the stream and frees the SDL_RWops itself with
/// SDL_DestroyRW(). This returns 0 on success, or -1 if the stream failed to
/// flush to its output (e.g. to disk).
///
/// Note that if this fails to flush the stream to disk, this function reports
/// an error, but the SDL_RWops is still invalid once this function returns.
///
/// \param context SDL_RWops structure to close
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_RWFromConstMem
/// \sa SDL_RWFromFile
/// \sa SDL_RWFromMem
/// \sa SDL_RWread
/// \sa SDL_RWseek
/// \sa SDL_RWwrite
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_RWclose(SDL_RWops *context)
/// ```
int sdlRWclose(Pointer<SdlRWops> context) {
  final sdlRWcloseLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlRWops> context),
      int Function(Pointer<SdlRWops> context)>('SDL_RWclose');
  return sdlRWcloseLookupFunction(context);
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
/// \param src the SDL_RWops to read all available data from
/// \param datasize if not NULL, will store the number of bytes read
/// \param freesrc if SDL_TRUE, calls SDL_RWclose() on `src` before returning,
/// even in the case of an error
/// \returns the data, or NULL if there was an error.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC void *SDLCALL SDL_LoadFile_RW(SDL_RWops *src, size_t *datasize, SDL_bool freesrc)
/// ```
Pointer<NativeType> sdlLoadFileRw(
    Pointer<SdlRWops> src, Pointer<Uint32> datasize, bool freesrc) {
  final sdlLoadFileRwLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(
          Pointer<SdlRWops> src, Pointer<Uint32> datasize, Int32 freesrc),
      Pointer<NativeType> Function(Pointer<SdlRWops> src,
          Pointer<Uint32> datasize, int freesrc)>('SDL_LoadFile_RW');
  return sdlLoadFileRwLookupFunction(src, datasize, freesrc ? 1 : 0);
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
/// \param file the path to read all available data from
/// \param datasize if not NULL, will store the number of bytes read
/// \returns the data, or NULL if there was an error.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC void *SDLCALL SDL_LoadFile(const char *file, size_t *datasize)
/// ```
Pointer<NativeType> sdlLoadFile(String? file, Pointer<Uint32> datasize) {
  final sdlLoadFileLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(
          Pointer<Utf8> file, Pointer<Uint32> datasize),
      Pointer<NativeType> Function(
          Pointer<Utf8> file, Pointer<Uint32> datasize)>('SDL_LoadFile');
  final filePointer = file != null ? file.toNativeUtf8() : nullptr;
  final result = sdlLoadFileLookupFunction(filePointer, datasize);
  calloc.free(filePointer);
  return result;
}

///
/// Use this function to read a byte from an SDL_RWops.
///
/// \param src the SDL_RWops to read from
/// \param value a pointer filled in with the data read
/// \returns SDL_TRUE on success or SDL_FALSE on failure; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_ReadU8(SDL_RWops *src, Uint8 *value)
/// ```
bool sdlReadU8(Pointer<SdlRWops> src, Pointer<Uint8> value) {
  final sdlReadU8LookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlRWops> src, Pointer<Uint8> value),
      int Function(Pointer<SdlRWops> src, Pointer<Uint8> value)>('SDL_ReadU8');
  return sdlReadU8LookupFunction(src, value) == 1;
}

///
/// Use this function to read 16 bits of little-endian data from an SDL_RWops
/// and return in native format.
///
/// SDL byteswaps the data only if necessary, so the data returned will be in
/// the native byte order.
///
/// \param src the stream from which to read data
/// \param value a pointer filled in with the data read
/// \returns SDL_TRUE on successful write, SDL_FALSE on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_ReadU16LE(SDL_RWops *src, Uint16 *value)
/// ```
bool sdlReadU16Le(Pointer<SdlRWops> src, Pointer<Uint16> value) {
  final sdlReadU16LeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlRWops> src, Pointer<Uint16> value),
      int Function(
          Pointer<SdlRWops> src, Pointer<Uint16> value)>('SDL_ReadU16LE');
  return sdlReadU16LeLookupFunction(src, value) == 1;
}

///
/// Use this function to read 16 bits of little-endian data from an SDL_RWops
/// and return in native format.
///
/// SDL byteswaps the data only if necessary, so the data returned will be in
/// the native byte order.
///
/// \param src the stream from which to read data
/// \param value a pointer filled in with the data read
/// \returns SDL_TRUE on successful write, SDL_FALSE on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_ReadS16LE(SDL_RWops *src, Sint16 *value)
/// ```
bool sdlReadS16Le(Pointer<SdlRWops> src, Pointer<Int16> value) {
  final sdlReadS16LeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlRWops> src, Pointer<Int16> value),
      int Function(
          Pointer<SdlRWops> src, Pointer<Int16> value)>('SDL_ReadS16LE');
  return sdlReadS16LeLookupFunction(src, value) == 1;
}

///
/// Use this function to read 16 bits of big-endian data from an SDL_RWops and
/// return in native format.
///
/// SDL byteswaps the data only if necessary, so the data returned will be in
/// the native byte order.
///
/// \param src the stream from which to read data
/// \param value a pointer filled in with the data read
/// \returns SDL_TRUE on successful write, SDL_FALSE on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_ReadU16BE(SDL_RWops *src, Uint16 *value)
/// ```
bool sdlReadU16Be(Pointer<SdlRWops> src, Pointer<Uint16> value) {
  final sdlReadU16BeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlRWops> src, Pointer<Uint16> value),
      int Function(
          Pointer<SdlRWops> src, Pointer<Uint16> value)>('SDL_ReadU16BE');
  return sdlReadU16BeLookupFunction(src, value) == 1;
}

///
/// Use this function to read 16 bits of big-endian data from an SDL_RWops and
/// return in native format.
///
/// SDL byteswaps the data only if necessary, so the data returned will be in
/// the native byte order.
///
/// \param src the stream from which to read data
/// \param value a pointer filled in with the data read
/// \returns SDL_TRUE on successful write, SDL_FALSE on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_ReadS16BE(SDL_RWops *src, Sint16 *value)
/// ```
bool sdlReadS16Be(Pointer<SdlRWops> src, Pointer<Int16> value) {
  final sdlReadS16BeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlRWops> src, Pointer<Int16> value),
      int Function(
          Pointer<SdlRWops> src, Pointer<Int16> value)>('SDL_ReadS16BE');
  return sdlReadS16BeLookupFunction(src, value) == 1;
}

///
/// Use this function to read 32 bits of little-endian data from an SDL_RWops
/// and return in native format.
///
/// SDL byteswaps the data only if necessary, so the data returned will be in
/// the native byte order.
///
/// \param src the stream from which to read data
/// \param value a pointer filled in with the data read
/// \returns SDL_TRUE on successful write, SDL_FALSE on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_ReadU32LE(SDL_RWops *src, Uint32 *value)
/// ```
bool sdlReadU32Le(Pointer<SdlRWops> src, Pointer<Uint32> value) {
  final sdlReadU32LeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlRWops> src, Pointer<Uint32> value),
      int Function(
          Pointer<SdlRWops> src, Pointer<Uint32> value)>('SDL_ReadU32LE');
  return sdlReadU32LeLookupFunction(src, value) == 1;
}

///
/// Use this function to read 32 bits of little-endian data from an SDL_RWops
/// and return in native format.
///
/// SDL byteswaps the data only if necessary, so the data returned will be in
/// the native byte order.
///
/// \param src the stream from which to read data
/// \param value a pointer filled in with the data read
/// \returns SDL_TRUE on successful write, SDL_FALSE on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_ReadS32LE(SDL_RWops *src, Sint32 *value)
/// ```
bool sdlReadS32Le(Pointer<SdlRWops> src, Pointer<Int32> value) {
  final sdlReadS32LeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlRWops> src, Pointer<Int32> value),
      int Function(
          Pointer<SdlRWops> src, Pointer<Int32> value)>('SDL_ReadS32LE');
  return sdlReadS32LeLookupFunction(src, value) == 1;
}

///
/// Use this function to read 32 bits of big-endian data from an SDL_RWops and
/// return in native format.
///
/// SDL byteswaps the data only if necessary, so the data returned will be in
/// the native byte order.
///
/// \param src the stream from which to read data
/// \param value a pointer filled in with the data read
/// \returns SDL_TRUE on successful write, SDL_FALSE on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_ReadU32BE(SDL_RWops *src, Uint32 *value)
/// ```
bool sdlReadU32Be(Pointer<SdlRWops> src, Pointer<Uint32> value) {
  final sdlReadU32BeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlRWops> src, Pointer<Uint32> value),
      int Function(
          Pointer<SdlRWops> src, Pointer<Uint32> value)>('SDL_ReadU32BE');
  return sdlReadU32BeLookupFunction(src, value) == 1;
}

///
/// Use this function to read 32 bits of big-endian data from an SDL_RWops and
/// return in native format.
///
/// SDL byteswaps the data only if necessary, so the data returned will be in
/// the native byte order.
///
/// \param src the stream from which to read data
/// \param value a pointer filled in with the data read
/// \returns SDL_TRUE on successful write, SDL_FALSE on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_ReadS32BE(SDL_RWops *src, Sint32 *value)
/// ```
bool sdlReadS32Be(Pointer<SdlRWops> src, Pointer<Int32> value) {
  final sdlReadS32BeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlRWops> src, Pointer<Int32> value),
      int Function(
          Pointer<SdlRWops> src, Pointer<Int32> value)>('SDL_ReadS32BE');
  return sdlReadS32BeLookupFunction(src, value) == 1;
}

///
/// Use this function to read 64 bits of little-endian data from an SDL_RWops
/// and return in native format.
///
/// SDL byteswaps the data only if necessary, so the data returned will be in
/// the native byte order.
///
/// \param src the stream from which to read data
/// \param value a pointer filled in with the data read
/// \returns SDL_TRUE on successful write, SDL_FALSE on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_ReadU64LE(SDL_RWops *src, Uint64 *value)
/// ```
bool sdlReadU64Le(Pointer<SdlRWops> src, Pointer<Uint64> value) {
  final sdlReadU64LeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlRWops> src, Pointer<Uint64> value),
      int Function(
          Pointer<SdlRWops> src, Pointer<Uint64> value)>('SDL_ReadU64LE');
  return sdlReadU64LeLookupFunction(src, value) == 1;
}

///
/// Use this function to read 64 bits of little-endian data from an SDL_RWops
/// and return in native format.
///
/// SDL byteswaps the data only if necessary, so the data returned will be in
/// the native byte order.
///
/// \param src the stream from which to read data
/// \param value a pointer filled in with the data read
/// \returns SDL_TRUE on successful write, SDL_FALSE on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_ReadS64LE(SDL_RWops *src, Sint64 *value)
/// ```
bool sdlReadS64Le(Pointer<SdlRWops> src, Pointer<Int64> value) {
  final sdlReadS64LeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlRWops> src, Pointer<Int64> value),
      int Function(
          Pointer<SdlRWops> src, Pointer<Int64> value)>('SDL_ReadS64LE');
  return sdlReadS64LeLookupFunction(src, value) == 1;
}

///
/// Use this function to read 64 bits of big-endian data from an SDL_RWops and
/// return in native format.
///
/// SDL byteswaps the data only if necessary, so the data returned will be in
/// the native byte order.
///
/// \param src the stream from which to read data
/// \param value a pointer filled in with the data read
/// \returns SDL_TRUE on successful write, SDL_FALSE on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_ReadU64BE(SDL_RWops *src, Uint64 *value)
/// ```
bool sdlReadU64Be(Pointer<SdlRWops> src, Pointer<Uint64> value) {
  final sdlReadU64BeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlRWops> src, Pointer<Uint64> value),
      int Function(
          Pointer<SdlRWops> src, Pointer<Uint64> value)>('SDL_ReadU64BE');
  return sdlReadU64BeLookupFunction(src, value) == 1;
}

///
/// Use this function to read 64 bits of big-endian data from an SDL_RWops and
/// return in native format.
///
/// SDL byteswaps the data only if necessary, so the data returned will be in
/// the native byte order.
///
/// \param src the stream from which to read data
/// \param value a pointer filled in with the data read
/// \returns SDL_TRUE on successful write, SDL_FALSE on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_ReadS64BE(SDL_RWops *src, Sint64 *value)
/// ```
bool sdlReadS64Be(Pointer<SdlRWops> src, Pointer<Int64> value) {
  final sdlReadS64BeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlRWops> src, Pointer<Int64> value),
      int Function(
          Pointer<SdlRWops> src, Pointer<Int64> value)>('SDL_ReadS64BE');
  return sdlReadS64BeLookupFunction(src, value) == 1;
}

///
/// Use this function to write a byte to an SDL_RWops.
///
/// \param dst the SDL_RWops to write to
/// \param value the byte value to write
/// \returns SDL_TRUE on successful write, SDL_FALSE on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_WriteU8(SDL_RWops *dst, Uint8 value)
/// ```
bool sdlWriteU8(Pointer<SdlRWops> dst, int value) {
  final sdlWriteU8LookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlRWops> dst, Uint8 value),
      int Function(Pointer<SdlRWops> dst, int value)>('SDL_WriteU8');
  return sdlWriteU8LookupFunction(dst, value) == 1;
}

///
/// Use this function to write 16 bits in native format to an SDL_RWops as
/// little-endian data.
///
/// SDL byteswaps the data only if necessary, so the application always
/// specifies native format, and the data written will be in little-endian
/// format.
///
/// \param dst the stream to which data will be written
/// \param value the data to be written, in native format
/// \returns SDL_TRUE on successful write, SDL_FALSE on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_WriteU16LE(SDL_RWops *dst, Uint16 value)
/// ```
bool sdlWriteU16Le(Pointer<SdlRWops> dst, int value) {
  final sdlWriteU16LeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlRWops> dst, Uint16 value),
      int Function(Pointer<SdlRWops> dst, int value)>('SDL_WriteU16LE');
  return sdlWriteU16LeLookupFunction(dst, value) == 1;
}

///
/// Use this function to write 16 bits in native format to an SDL_RWops as
/// little-endian data.
///
/// SDL byteswaps the data only if necessary, so the application always
/// specifies native format, and the data written will be in little-endian
/// format.
///
/// \param dst the stream to which data will be written
/// \param value the data to be written, in native format
/// \returns SDL_TRUE on successful write, SDL_FALSE on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_WriteS16LE(SDL_RWops *dst, Sint16 value)
/// ```
bool sdlWriteS16Le(Pointer<SdlRWops> dst, int value) {
  final sdlWriteS16LeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlRWops> dst, Int16 value),
      int Function(Pointer<SdlRWops> dst, int value)>('SDL_WriteS16LE');
  return sdlWriteS16LeLookupFunction(dst, value) == 1;
}

///
/// Use this function to write 16 bits in native format to an SDL_RWops as
/// big-endian data.
///
/// SDL byteswaps the data only if necessary, so the application always
/// specifies native format, and the data written will be in big-endian format.
///
/// \param dst the stream to which data will be written
/// \param value the data to be written, in native format
/// \returns SDL_TRUE on successful write, SDL_FALSE on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_WriteU16BE(SDL_RWops *dst, Uint16 value)
/// ```
bool sdlWriteU16Be(Pointer<SdlRWops> dst, int value) {
  final sdlWriteU16BeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlRWops> dst, Uint16 value),
      int Function(Pointer<SdlRWops> dst, int value)>('SDL_WriteU16BE');
  return sdlWriteU16BeLookupFunction(dst, value) == 1;
}

///
/// Use this function to write 16 bits in native format to an SDL_RWops as
/// big-endian data.
///
/// SDL byteswaps the data only if necessary, so the application always
/// specifies native format, and the data written will be in big-endian format.
///
/// \param dst the stream to which data will be written
/// \param value the data to be written, in native format
/// \returns SDL_TRUE on successful write, SDL_FALSE on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_WriteS16BE(SDL_RWops *dst, Sint16 value)
/// ```
bool sdlWriteS16Be(Pointer<SdlRWops> dst, int value) {
  final sdlWriteS16BeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlRWops> dst, Int16 value),
      int Function(Pointer<SdlRWops> dst, int value)>('SDL_WriteS16BE');
  return sdlWriteS16BeLookupFunction(dst, value) == 1;
}

///
/// Use this function to write 32 bits in native format to an SDL_RWops as
/// little-endian data.
///
/// SDL byteswaps the data only if necessary, so the application always
/// specifies native format, and the data written will be in little-endian
/// format.
///
/// \param dst the stream to which data will be written
/// \param value the data to be written, in native format
/// \returns SDL_TRUE on successful write, SDL_FALSE on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_WriteU32LE(SDL_RWops *dst, Uint32 value)
/// ```
bool sdlWriteU32Le(Pointer<SdlRWops> dst, int value) {
  final sdlWriteU32LeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlRWops> dst, Uint32 value),
      int Function(Pointer<SdlRWops> dst, int value)>('SDL_WriteU32LE');
  return sdlWriteU32LeLookupFunction(dst, value) == 1;
}

///
/// Use this function to write 32 bits in native format to an SDL_RWops as
/// little-endian data.
///
/// SDL byteswaps the data only if necessary, so the application always
/// specifies native format, and the data written will be in little-endian
/// format.
///
/// \param dst the stream to which data will be written
/// \param value the data to be written, in native format
/// \returns SDL_TRUE on successful write, SDL_FALSE on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_WriteS32LE(SDL_RWops *dst, Sint32 value)
/// ```
bool sdlWriteS32Le(Pointer<SdlRWops> dst, int value) {
  final sdlWriteS32LeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlRWops> dst, Int32 value),
      int Function(Pointer<SdlRWops> dst, int value)>('SDL_WriteS32LE');
  return sdlWriteS32LeLookupFunction(dst, value) == 1;
}

///
/// Use this function to write 32 bits in native format to an SDL_RWops as
/// big-endian data.
///
/// SDL byteswaps the data only if necessary, so the application always
/// specifies native format, and the data written will be in big-endian format.
///
/// \param dst the stream to which data will be written
/// \param value the data to be written, in native format
/// \returns SDL_TRUE on successful write, SDL_FALSE on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_WriteU32BE(SDL_RWops *dst, Uint32 value)
/// ```
bool sdlWriteU32Be(Pointer<SdlRWops> dst, int value) {
  final sdlWriteU32BeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlRWops> dst, Uint32 value),
      int Function(Pointer<SdlRWops> dst, int value)>('SDL_WriteU32BE');
  return sdlWriteU32BeLookupFunction(dst, value) == 1;
}

///
/// Use this function to write 32 bits in native format to an SDL_RWops as
/// big-endian data.
///
/// SDL byteswaps the data only if necessary, so the application always
/// specifies native format, and the data written will be in big-endian format.
///
/// \param dst the stream to which data will be written
/// \param value the data to be written, in native format
/// \returns SDL_TRUE on successful write, SDL_FALSE on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_WriteS32BE(SDL_RWops *dst, Sint32 value)
/// ```
bool sdlWriteS32Be(Pointer<SdlRWops> dst, int value) {
  final sdlWriteS32BeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlRWops> dst, Int32 value),
      int Function(Pointer<SdlRWops> dst, int value)>('SDL_WriteS32BE');
  return sdlWriteS32BeLookupFunction(dst, value) == 1;
}

///
/// Use this function to write 64 bits in native format to an SDL_RWops as
/// little-endian data.
///
/// SDL byteswaps the data only if necessary, so the application always
/// specifies native format, and the data written will be in little-endian
/// format.
///
/// \param dst the stream to which data will be written
/// \param value the data to be written, in native format
/// \returns SDL_TRUE on successful write, SDL_FALSE on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_WriteU64LE(SDL_RWops *dst, Uint64 value)
/// ```
bool sdlWriteU64Le(Pointer<SdlRWops> dst, int value) {
  final sdlWriteU64LeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlRWops> dst, Uint64 value),
      int Function(Pointer<SdlRWops> dst, int value)>('SDL_WriteU64LE');
  return sdlWriteU64LeLookupFunction(dst, value) == 1;
}

///
/// Use this function to write 64 bits in native format to an SDL_RWops as
/// little-endian data.
///
/// SDL byteswaps the data only if necessary, so the application always
/// specifies native format, and the data written will be in little-endian
/// format.
///
/// \param dst the stream to which data will be written
/// \param value the data to be written, in native format
/// \returns SDL_TRUE on successful write, SDL_FALSE on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_WriteS64LE(SDL_RWops *dst, Sint64 value)
/// ```
bool sdlWriteS64Le(Pointer<SdlRWops> dst, int value) {
  final sdlWriteS64LeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlRWops> dst, Int64 value),
      int Function(Pointer<SdlRWops> dst, int value)>('SDL_WriteS64LE');
  return sdlWriteS64LeLookupFunction(dst, value) == 1;
}

///
/// Use this function to write 64 bits in native format to an SDL_RWops as
/// big-endian data.
///
/// SDL byteswaps the data only if necessary, so the application always
/// specifies native format, and the data written will be in big-endian format.
///
/// \param dst the stream to which data will be written
/// \param value the data to be written, in native format
/// \returns SDL_TRUE on successful write, SDL_FALSE on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_WriteU64BE(SDL_RWops *dst, Uint64 value)
/// ```
bool sdlWriteU64Be(Pointer<SdlRWops> dst, int value) {
  final sdlWriteU64BeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlRWops> dst, Uint64 value),
      int Function(Pointer<SdlRWops> dst, int value)>('SDL_WriteU64BE');
  return sdlWriteU64BeLookupFunction(dst, value) == 1;
}

///
/// Use this function to write 64 bits in native format to an SDL_RWops as
/// big-endian data.
///
/// SDL byteswaps the data only if necessary, so the application always
/// specifies native format, and the data written will be in big-endian format.
///
/// \param dst the stream to which data will be written
/// \param value the data to be written, in native format
/// \returns SDL_TRUE on successful write, SDL_FALSE on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_WriteS64BE(SDL_RWops *dst, Sint64 value)
/// ```
bool sdlWriteS64Be(Pointer<SdlRWops> dst, int value) {
  final sdlWriteS64BeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlRWops> dst, Int64 value),
      int Function(Pointer<SdlRWops> dst, int value)>('SDL_WriteS64BE');
  return sdlWriteS64BeLookupFunction(dst, value) == 1;
}
