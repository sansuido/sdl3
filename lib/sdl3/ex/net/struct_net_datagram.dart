part of '../../sdl_net.dart';

class NetxDatagram {
  NetxDatagram({Pointer<NetAddress>? addr, this.port = 0, this.buf}) {
    this.addr = addr ?? nullptr;
  }
  late Pointer<NetAddress> addr;
  int port;
  Uint8List? buf;
  var hasRefed = false;

  void loadFromPointer(Pointer<NetDatagram> pointer, {bool refAddress = true}) {
    addr = pointer.ref.addr;
    port = pointer.ref.port;
    buf = Uint8List.fromList(
      pointer.ref.buf.cast<Uint8>().asTypedList(pointer.ref.buflen),
    );
    if (refAddress) {
      hasRefed = refAddress;
      netRefAddress(addr);
    }
  }

  void destroy() {
    if (hasRefed && addr != nullptr) {
      netUnrefAddress(addr);
      addr = nullptr;
    }
  }
}
