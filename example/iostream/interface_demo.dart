import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:sdl3/sdl3.dart';

final class MemoryStream extends Struct {
  external Pointer<Uint8> data;
  @Size()
  external int size;
  @Int64()
  external int position;
}

int memorySizeCallback(Pointer<Void> vmem) {
  final mem = vmem.cast<MemoryStream>();
  return mem.ref.size;
}

int memorySeekCallback(Pointer<Void> vmem, int offset, int whence) {
  final mem = vmem.cast<MemoryStream>();
  var position = -1;
  switch (whence) {
    case SdlkIoSeek.set:
      position = offset;
    case SdlkIoSeek.cur:
      position = mem.ref.position + offset;
    case SdlkIoSeek.end:
      position = mem.ref.size + offset;
  }
  if (position < 0 || position > mem.ref.size) {
    return -1;
  }
  mem.ref.position = position;
  return position;
}

int memoryReadCallback(
  Pointer<Void> vmem,
  Pointer<Void> ptr,
  int size,
  Pointer<Int32> status,
) {
  final mem = vmem.cast<MemoryStream>();
  if (mem.ref.position >= mem.ref.size) {
    return 0;
  }
  var result = size;
  if (mem.ref.position + size > mem.ref.size) {
    result = mem.ref.size - mem.ref.position;
  }
  sdlMemcpy(ptr, (mem.ref.data + mem.ref.position).cast<Void>(), result);
  status.value = SdlkIoStatus.ready;
  mem.ref.position += result;
  return result;
}

bool memoryCloseCallback(Pointer<Void> vmem) {
  final mem = vmem.cast<MemoryStream>();
  mem.ref.data.callocFree();
  mem.callocFree();
  return true;
}

class MemoryStreamCallbacks {
  factory MemoryStreamCallbacks() => _instance;

  MemoryStreamCallbacks._internal() {
    sizeCall = NativeCallable<SdlIoStreamInterfaceSize>.isolateLocal(
      memorySizeCallback,
      exceptionalReturn: -1,
    );
    seekCall = NativeCallable<SdlIoStreamInterfaceSeek>.isolateLocal(
      memorySeekCallback,
      exceptionalReturn: -1,
    );
    readCall = NativeCallable<SdlIoStreamInterfaceRead>.isolateLocal(
      memoryReadCallback,
      exceptionalReturn: 0,
    );
    closeCall = NativeCallable<SdlIoStreamInterfaceClose>.isolateLocal(
      memoryCloseCallback,
      exceptionalReturn: false,
    );
  }
  static final _instance = MemoryStreamCallbacks._internal();

  late final NativeCallable<SdlIoStreamInterfaceSize> sizeCall;
  late final NativeCallable<SdlIoStreamInterfaceSeek> seekCall;
  late final NativeCallable<SdlIoStreamInterfaceRead> readCall;
  late final NativeCallable<SdlIoStreamInterfaceClose> closeCall;

  void dispose() {
    sizeCall.close();
    seekCall.close();
    readCall.close();
    closeCall.close();
  }
}

Pointer<SdlIoStream> createMemoryId(String textData) {
  final mem = calloc<MemoryStream>();
  if (mem == nullptr) {
    return nullptr;
  }
  final textDataPointer = textData.toNativeUtf8();
  mem.ref.data = textDataPointer.cast<Uint8>();
  mem.ref.size = textDataPointer.length;
  mem.ref.position = 0;

  final callbacks = MemoryStreamCallbacks();
  final iface = SdlxIoStreamInterface(
    size: callbacks.sizeCall.nativeFunction,
    seek: callbacks.seekCall.nativeFunction,
    read: callbacks.readCall.nativeFunction,
    close: callbacks.closeCall.nativeFunction,
  );
  return sdlxOpenIo(iface, mem.cast<Void>());
}

void main() {
  if (!sdlInit(0)) {
    return;
  }

  final io1 = createMemoryId('Hello, SDL3 Custom IOStream!');
  final io2 = createMemoryId(
    'H e l l o ,   S D L 3   C u s t o m   I O S t r e a m ! ',
  );
  if (io1 != nullptr && io2 != nullptr) {
    var c1 = io1.readString(1);
    var c2 = io2.readString(2);
    while (c1 != null || c2 != null) {
      if (c1 != null) {
        print(c1);
      }
      if (c2 != null) {
        print(c2);
      }
      c1 = io1.readString(1);
      c2 = io2.readString(2);
    }
    io1.close();
    io2.close();
  }
  MemoryStreamCallbacks().dispose();
  sdlQuit();
}
