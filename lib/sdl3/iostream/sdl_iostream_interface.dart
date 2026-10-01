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
  }) {
    this.version = version ?? sizeOf<SdlIoStreamInterface>();
    this.size = size ?? nullptr;
    this.seek = seek ?? nullptr;
    this.read = read ?? nullptr;
    this.write = write ?? nullptr;
    this.flush = flush ?? nullptr;
    this.close = close ?? nullptr;
  }

  late int version;
  late Pointer<NativeFunction<SdlIoStreamInterfaceSize>> size;
  late Pointer<NativeFunction<SdlIoStreamInterfaceSeek>> seek;
  late Pointer<NativeFunction<SdlIoStreamInterfaceRead>> read;
  late Pointer<NativeFunction<SdlIoStreamInterfaceWrite>> write;
  late Pointer<NativeFunction<SdlIoStreamInterfaceFlush>> flush;
  late Pointer<NativeFunction<SdlIoStreamInterfaceClose>> close;

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

  void loadFromPointer(Pointer<SdlIoStreamInterface> pointer) {
    version = pointer.ref.version;
    size = pointer.ref.size;
    seek = pointer.ref.seek;
    read = pointer.ref.read;
    write = pointer.ref.write;
    flush = pointer.ref.flush;
    close = pointer.ref.close;
  }
}
