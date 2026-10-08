part of '../sdl_iostream.dart';

class SdlxIoStreamInterface {
  SdlxIoStreamInterface({
    int? version,
    Pointer<NativeFunction<SdlIoStreamInterfaceSize>>? size,
    Pointer<NativeFunction<SdlIoStreamInterfaceSeek>>? seek,
    Pointer<NativeFunction<SdlIoStreamInterfaceRead>>? read,
    Pointer<NativeFunction<SdlIoStreamInterfaceWrite>>? write,
    Pointer<NativeFunction<SdlIoStreamInterfaceFlush>>? flush,
    Pointer<NativeFunction<SdlIoStreamInterfaceClose>>? close,
  }) : version = version ?? sizeOf<SdlIoStreamInterface>(),
       size = size ?? nullptr,
       seek = seek ?? nullptr,
       read = read ?? nullptr,
       write = write ?? nullptr,
       flush = flush ?? nullptr,
       close = close ?? nullptr;

  factory SdlxIoStreamInterface.fromPointer(
    Pointer<SdlIoStreamInterface> pointer,
  ) => SdlxIoStreamInterface(
    version: pointer.ref.version,
    size: pointer.ref.size,
    seek: pointer.ref.seek,
    read: pointer.ref.read,
    write: pointer.ref.write,
    flush: pointer.ref.flush,
    close: pointer.ref.close,
  );

  final int version;
  final Pointer<NativeFunction<SdlIoStreamInterfaceSize>> size;
  final Pointer<NativeFunction<SdlIoStreamInterfaceSeek>> seek;
  final Pointer<NativeFunction<SdlIoStreamInterfaceRead>> read;
  final Pointer<NativeFunction<SdlIoStreamInterfaceWrite>> write;
  final Pointer<NativeFunction<SdlIoStreamInterfaceFlush>> flush;
  final Pointer<NativeFunction<SdlIoStreamInterfaceClose>> close;

  Pointer<SdlIoStreamInterface> calloc() {
    final pointer = ffi.calloc<SdlIoStreamInterface>();
    pointer.ref.version = version;
    pointer.ref.size = size;
    pointer.ref.seek = seek;
    pointer.ref.read = read;
    pointer.ref.write = write;
    pointer.ref.flush = flush;
    pointer.ref.close = close;
    return pointer;
  }
}
