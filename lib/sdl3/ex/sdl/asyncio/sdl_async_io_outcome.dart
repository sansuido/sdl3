part of '../../../sdl.dart';

class SdlxAsyncIoOutcome {
  SdlxAsyncIoOutcome({
    Pointer<SdlAsyncIo>? asyncio,
    this.type = 0,
    this.result = 0,
    Pointer<Void>? buffer,
    this.offset = 0,
    this.bytesRequested = 0,
    this.bytesTransferred = 0,
    Pointer<Void>? userdata,
  }) {
    this.asyncio = asyncio ?? nullptr;
    this.buffer = buffer ?? nullptr;
    this.userdata = userdata ?? nullptr;
  }
  late Pointer<SdlAsyncIo> asyncio;
  int type;
  int result;
  late Pointer<Void> buffer;
  int offset;
  int bytesRequested;
  int bytesTransferred;
  late Pointer<Void> userdata;

  void loadFromPointer(Pointer<SdlAsyncIoOutcome> pointer) {
    asyncio = pointer.ref.asyncio;
    type = pointer.ref.type;
    result = pointer.ref.result;
    buffer = pointer.ref.buffer;
    offset = pointer.ref.offset;
    bytesRequested = pointer.ref.bytesRequested;
    bytesTransferred = pointer.ref.bytesTransferred;
    userdata = pointer.ref.userdata;
  }

  Pointer<SdlAsyncIoOutcome> calloc() {
    final pointer = ffi.calloc<SdlAsyncIoOutcome>();
    pointer.ref.asyncio = asyncio;
    pointer.ref.type = type;
    pointer.ref.result = result;
    pointer.ref.buffer = buffer;
    pointer.ref.offset = offset;
    pointer.ref.bytesRequested = bytesRequested;
    pointer.ref.bytesTransferred = bytesTransferred;
    pointer.ref.userdata = userdata;
    return pointer;
  }
}
