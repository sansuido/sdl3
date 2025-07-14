// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
part of '../sdl_net.dart';

// NET_Address
/// {@category net}
final class NetAddress extends Opaque {}

// NET_StreamSocket
/// {@category net}
final class NetStreamSocket extends Opaque {}

// NET_Server
/// {@category net}
final class NetServer extends Opaque {}

// NET_DatagramSocket
/// {@category net}
final class NetDatagramSocket extends Opaque {}

// NET_Datagram
/// {@category net}
final class NetDatagram extends Struct {
  // [0]+(8)
  external Pointer<NetAddress> addr;
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
