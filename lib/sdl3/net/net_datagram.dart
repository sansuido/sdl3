part of '../sdl_net.dart';

class NetxDatagram {
  const NetxDatagram({
    required this.addr,
    required this.port,
    required this.buf,
  });

  factory NetxDatagram.fromPointer(
    Pointer<NetDatagram> pointer, {
    bool refAddress = true,
  }) {
    final ref = pointer.ref;
    final addrPtr = ref.addr;

    if (refAddress && addrPtr != nullptr) {
      netRefAddress(addrPtr);
    }

    final bufData = addrPtr != nullptr && ref.buf != nullptr && ref.buflen > 0
        ? Uint8List.fromList(ref.buf.cast<Uint8>().asTypedList(ref.buflen))
        : Uint8List(0);

    return NetxDatagram(addr: addrPtr, port: ref.port, buf: bufData);
  }

  final Pointer<NetAddress> addr;
  final int port;
  final Uint8List buf;
}
