// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';

// SDLNet_Address
final class SdlNetAddress extends Opaque {}

// SDLNet_StreamSocket
final class SdlNetStreamSocket extends Opaque {}

// SDLNet_Server
final class SdlNetServer extends Opaque {}

// SDLNet_DatagramSocket
final class SdlNetDatagramSocket extends Opaque {}

// SDLNet_Datagram
final class SdlNetDatagram extends Struct {
  // [0]+(8)
  external Pointer<SdlNetAddress> addr;
  // [8]+(2)
  @Uint16()
  external int port;
  // [] +(6)
  @Uint32()
  external int blank_1;
  @Uint16()
  external int blank_2;
  // [16]+(8)
  external Pointer<Uint8> buf;
  // [24]+(4)
  @Int32()
  external int buflen;
  // [] +(4)
  @Uint32()
  external int blank_3;
}
