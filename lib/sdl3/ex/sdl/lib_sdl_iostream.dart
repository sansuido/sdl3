part of '../../sdl.dart';

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
/// A request for zero bytes on a valid stream will return zero immediately
/// without accessing the stream, so the stream status (EOF, err, etc) will not
/// change.
///
/// \param context a pointer to an SDL_IOStream structure.
/// \param ptr a pointer to a buffer to read data into.
/// \param size the number of bytes to read from the data source.
/// \returns the number of bytes read, or 0 on end of file or other failure;
/// call SDL_GetError() for more information.
///
/// \threadsafety Do not use the same SDL_IOStream from two threads at once.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_WriteIO
/// \sa SDL_GetIOStatus
///
/// ```c
/// extern SDL_DECLSPEC size_t SDLCALL SDL_ReadIO(SDL_IOStream *context, void *ptr, size_t size)
/// ```
/// {@category iostream}
Uint8List? sdlxReadUint8List(Pointer<SdlIoStream> context, int size) {
  Uint8List? result;
  final buffer = ffi.calloc<Uint8>(size);
  final bufferSize = sdlReadIo(context, buffer.cast<Void>(), size);
  if (bufferSize > 0) {
    result = Uint8List.fromList(buffer.asTypedList(bufferSize));
  }
  buffer.callocFree();
  return result;
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
/// A request for zero bytes on a valid stream will return zero immediately
/// without accessing the stream, so the stream status (EOF, err, etc) will not
/// change.
///
/// \param context a pointer to an SDL_IOStream structure.
/// \param ptr a pointer to a buffer to read data into.
/// \param size the number of bytes to read from the data source.
/// \returns the number of bytes read, or 0 on end of file or other failure;
/// call SDL_GetError() for more information.
///
/// \threadsafety Do not use the same SDL_IOStream from two threads at once.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_WriteIO
/// \sa SDL_GetIOStatus
///
/// ```c
/// extern SDL_DECLSPEC size_t SDLCALL SDL_ReadIO(SDL_IOStream *context, void *ptr, size_t size)
/// ```
/// {@category iostream}
String? sdlxReadString(Pointer<SdlIoStream> context, int size) {
  final uint8List = sdlxReadUint8List(context, size);
  if (uint8List != null) {
    return String.fromCharCodes(uint8List);
  }
  return null;
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
/// A request for zero bytes on a valid stream will return zero immediately
/// without accessing the stream, so the stream status (EOF, err, etc) will not
/// change.
///
/// \param context a pointer to an SDL_IOStream structure.
/// \param ptr a pointer to a buffer containing data to write.
/// \param size the number of bytes to write.
/// \returns the number of bytes written, which will be less than `size` on
/// failure; call SDL_GetError() for more information.
///
/// \threadsafety Do not use the same SDL_IOStream from two threads at once.
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
/// {@category iostream}
int sdlxWriteUint8List(Pointer<SdlIoStream> context, Uint8List data) {
  final bufferPointer = ffi.calloc<Uint8>(data.length);
  bufferPointer.asTypedList(data.length).setAll(0, data);
  final result = sdlWriteIo(context, bufferPointer.cast<Void>(), data.length);
  bufferPointer.callocFree();
  return result;
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
/// A request for zero bytes on a valid stream will return zero immediately
/// without accessing the stream, so the stream status (EOF, err, etc) will not
/// change.
///
/// \param context a pointer to an SDL_IOStream structure.
/// \param ptr a pointer to a buffer containing data to write.
/// \param size the number of bytes to write.
/// \returns the number of bytes written, which will be less than `size` on
/// failure; call SDL_GetError() for more information.
///
/// \threadsafety Do not use the same SDL_IOStream from two threads at once.
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
/// {@category iostream}
int sdlxWriteString(Pointer<SdlIoStream> context, String str) =>
    sdlxWriteUint8List(context, Uint8List.fromList(utf8.encode(str)));

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
/// \threadsafety Do not use the same SDL_IOStream from two threads at once.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_LoadFile
/// \sa SDL_SaveFile_IO
///
/// ```c
/// extern SDL_DECLSPEC void * SDLCALL SDL_LoadFile_IO(SDL_IOStream *src, size_t *datasize, bool closeio)
/// ```
/// {@category iostream}
bool sdlxLoadFileIo(
  Pointer<SdlIoStream> src,
  SdlxDataResult result, {
  bool closeio = false,
}) {
  var bl = false;
  final datasizePointer = ffi.calloc<Size>();
  final dataPointer = sdlLoadFileIo(src, datasizePointer, closeio);
  if (dataPointer != nullptr) {
    bl = true;
    result
      ..data = Uint8List.fromList(
        dataPointer.cast<Uint8>().asTypedList(datasizePointer.value),
      )
      ..datasize = datasizePointer.value;
    sdlFree(dataPointer);
  }
  datasizePointer.callocFree();
  return bl;
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
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_LoadFile_IO
/// \sa SDL_SaveFile
///
/// ```c
/// extern SDL_DECLSPEC void * SDLCALL SDL_LoadFile(const char *file, size_t *datasize)
/// ```
/// {@category iostream}
bool sdlxLoadFile(String file, SdlxDataResult result) {
  var bl = false;
  final datasizePointer = ffi.calloc<Size>();
  final dataPointer = sdlLoadFile(file, datasizePointer);
  if (dataPointer != nullptr) {
    bl = true;
    result
      ..data = Uint8List.fromList(
        dataPointer.cast<Uint8>().asTypedList(datasizePointer.value),
      )
      ..datasize = datasizePointer.value;
    sdlFree(dataPointer);
  }
  datasizePointer.callocFree();
  return bl;
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
/// \threadsafety Do not use the same SDL_IOStream from two threads at once.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SaveFile
/// \sa SDL_LoadFile_IO
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SaveFile_IO(SDL_IOStream *src, const void *data, size_t datasize, bool closeio)
/// ```
/// {@category iostream}
bool sdlxSaveFileIo(
  Pointer<SdlIoStream> src,
  Uint8List data, {
  bool closeio = false,
}) {
  final dataPointer = ffi.calloc<Uint8>(data.length);
  dataPointer.asTypedList(data.length).setAll(0, data);
  final result = sdlSaveFileIo(
    src,
    dataPointer.cast<Void>(),
    data.length,
    closeio,
  );
  dataPointer.callocFree();
  return result;
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
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SaveFile_IO
/// \sa SDL_LoadFile
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SaveFile(const char *file, const void *data, size_t datasize)
/// ```
/// {@category iostream}
bool sdlxSaveFile(String file, Uint8List data, {bool closeio = false}) {
  final dataPointer = ffi.calloc<Uint8>(data.length);
  dataPointer.asTypedList(data.length).setAll(0, data);
  final result = sdlSaveFile(file, dataPointer.cast<Void>(), data.length);
  dataPointer.callocFree();
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
/// \threadsafety Do not use the same SDL_IOStream from two threads at once.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReadU8(SDL_IOStream *src, Uint8 *value)
/// ```
/// {@category iostream}
int? sdlxReadU8(Pointer<SdlIoStream> src) {
  int? result;
  final pointer = ffi.calloc<Uint8>();
  final bl = sdlReadU8(src, pointer);
  if (bl) {
    result = pointer.value;
  }
  pointer.callocFree();
  return result;
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
/// \threadsafety Do not use the same SDL_IOStream from two threads at once.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReadS8(SDL_IOStream *src, Sint8 *value)
/// ```
/// {@category iostream}
int? sdlxReadS8(Pointer<SdlIoStream> src) {
  int? result;
  final pointer = ffi.calloc<Int8>();
  final bl = sdlReadS8(src, pointer);
  if (bl) {
    result = pointer.value;
  }
  pointer.callocFree();
  return result;
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
/// \returns true on successful read or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety Do not use the same SDL_IOStream from two threads at once.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReadU16LE(SDL_IOStream *src, Uint16 *value)
/// ```
/// {@category iostream}
int? sdlxReadU16Le(Pointer<SdlIoStream> src) {
  int? result;
  final pointer = ffi.calloc<Uint16>();
  final bl = sdlReadU16Le(src, pointer);
  if (bl) {
    result = pointer.value;
  }
  pointer.callocFree();
  return result;
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
/// \returns true on successful read or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety Do not use the same SDL_IOStream from two threads at once.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReadS16LE(SDL_IOStream *src, Sint16 *value)
/// ```
/// {@category iostream}
int? sdlxReadS16Le(Pointer<SdlIoStream> src) {
  int? result;
  final pointer = ffi.calloc<Int16>();
  final bl = sdlReadS16Le(src, pointer);
  if (bl) {
    result = pointer.value;
  }
  pointer.callocFree();
  return result;
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
/// \returns true on successful read or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety Do not use the same SDL_IOStream from two threads at once.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReadU16BE(SDL_IOStream *src, Uint16 *value)
/// ```
/// {@category iostream}
int? sdlxReadU16Be(Pointer<SdlIoStream> src) {
  int? result;
  final pointer = ffi.calloc<Uint16>();
  final bl = sdlReadU16Be(src, pointer);
  if (bl) {
    result = pointer.value;
  }
  pointer.callocFree();
  return result;
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
/// \returns true on successful read or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety Do not use the same SDL_IOStream from two threads at once.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReadS16BE(SDL_IOStream *src, Sint16 *value)
/// ```
/// {@category iostream}
int? sdlxReadS16Be(Pointer<SdlIoStream> src) {
  int? result;
  final pointer = ffi.calloc<Int16>();
  final bl = sdlReadS16Be(src, pointer);
  if (bl) {
    result = pointer.value;
  }
  pointer.callocFree();
  return result;
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
/// \returns true on successful read or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety Do not use the same SDL_IOStream from two threads at once.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReadU32LE(SDL_IOStream *src, Uint32 *value)
/// ```
/// {@category iostream}
int? sdlxReadU32Le(Pointer<SdlIoStream> src) {
  int? result;
  final pointer = ffi.calloc<Uint32>();
  final bl = sdlReadU32Le(src, pointer);
  if (bl) {
    result = pointer.value;
  }
  pointer.callocFree();
  return result;
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
/// \returns true on successful read or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety Do not use the same SDL_IOStream from two threads at once.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReadS32LE(SDL_IOStream *src, Sint32 *value)
/// ```
/// {@category iostream}
int? sdlxReadS32Le(Pointer<SdlIoStream> src) {
  int? result;
  final pointer = ffi.calloc<Int32>();
  final bl = sdlReadS32Le(src, pointer);
  if (bl) {
    result = pointer.value;
  }
  pointer.callocFree();
  return result;
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
/// \returns true on successful read or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety Do not use the same SDL_IOStream from two threads at once.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReadU32BE(SDL_IOStream *src, Uint32 *value)
/// ```
/// {@category iostream}
int? sdlxReadU32Be(Pointer<SdlIoStream> src) {
  int? result;
  final pointer = ffi.calloc<Uint32>();
  final bl = sdlReadU32Be(src, pointer);
  if (bl) {
    result = pointer.value;
  }
  pointer.callocFree();
  return result;
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
/// \returns true on successful read or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety Do not use the same SDL_IOStream from two threads at once.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReadS32BE(SDL_IOStream *src, Sint32 *value)
/// ```
/// {@category iostream}
int? sdlxReadS32Be(Pointer<SdlIoStream> src) {
  int? result;
  final pointer = ffi.calloc<Int32>();
  final bl = sdlReadS32Be(src, pointer);
  if (bl) {
    result = pointer.value;
  }
  pointer.callocFree();
  return result;
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
/// \returns true on successful read or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety Do not use the same SDL_IOStream from two threads at once.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReadU64LE(SDL_IOStream *src, Uint64 *value)
/// ```
/// {@category iostream}
int? sdlxReadU64Le(Pointer<SdlIoStream> src) {
  int? result;
  final pointer = ffi.calloc<Uint64>();
  final bl = sdlReadU64Le(src, pointer);
  if (bl) {
    result = pointer.value;
  }
  pointer.callocFree();
  return result;
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
/// \returns true on successful read or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety Do not use the same SDL_IOStream from two threads at once.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReadS64LE(SDL_IOStream *src, Sint64 *value)
/// ```
/// {@category iostream}
int? sdlxReadS64Le(Pointer<SdlIoStream> src) {
  int? result;
  final pointer = ffi.calloc<Int64>();
  final bl = sdlReadS64Le(src, pointer);
  if (bl) {
    result = pointer.value;
  }
  pointer.callocFree();
  return result;
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
/// \returns true on successful read or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety Do not use the same SDL_IOStream from two threads at once.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReadU64BE(SDL_IOStream *src, Uint64 *value)
/// ```
/// {@category iostream}
int? sdlxReadU64Be(Pointer<SdlIoStream> src) {
  int? result;
  final pointer = ffi.calloc<Uint64>();
  final bl = sdlReadU64Be(src, pointer);
  if (bl) {
    result = pointer.value;
  }
  pointer.callocFree();
  return result;
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
/// \returns true on successful read or false on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety Do not use the same SDL_IOStream from two threads at once.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReadS64BE(SDL_IOStream *src, Sint64 *value)
/// ```
/// {@category iostream}
int? sdlxReadS64Be(Pointer<SdlIoStream> src) {
  int? result;
  final pointer = ffi.calloc<Int64>();
  final bl = sdlReadS64Be(src, pointer);
  if (bl) {
    result = pointer.value;
  }
  pointer.callocFree();
  return result;
}
