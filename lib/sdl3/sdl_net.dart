import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';

part 'generated/const_sdl_net.dart';
part 'generated/lib_sdl_net.dart';
part 'generated/struct_sdl_net.dart';
part 'net/lib_sdl_net.dart';
part 'net/lib_sdl_net_ex.dart';
part 'net/net_address.dart';
part 'net/net_datagram_socket.dart';
part 'net/net_server.dart';
part 'net/net_stream_socket.dart';
part 'net/net_datagram.dart';

final DynamicLibrary _libNet = dylib.SdlDynamicLibraryService().open('net');
