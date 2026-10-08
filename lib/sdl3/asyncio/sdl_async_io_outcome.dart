part of '../sdl_asyncio.dart';

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
  }) : asyncio = asyncio ?? nullptr,
       buffer = buffer ?? nullptr,
       userdata = userdata ?? nullptr;

  factory SdlxAsyncIoOutcome.fromPointer(Pointer<SdlAsyncIoOutcome> pointer) =>
      SdlxAsyncIoOutcome(
        asyncio: pointer.ref.asyncio,
        type: pointer.ref.type,
        result: pointer.ref.result,
        buffer: pointer.ref.buffer,
        offset: pointer.ref.offset,
        bytesRequested: pointer.ref.bytesRequested,
        bytesTransferred: pointer.ref.bytesTransferred,
        userdata: pointer.ref.userdata,
      );

  final Pointer<SdlAsyncIo> asyncio;
  final int type;
  final int result;
  final Pointer<Void> buffer;
  final int offset;
  final int bytesRequested;
  final int bytesTransferred;
  final Pointer<Void> userdata;

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
