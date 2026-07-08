import 'dart:ffi';
import 'dart:typed_data';
import 'package:ffi/ffi.dart';
import 'package:ffi/ffi.dart' as ffi;
import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';

part 'ex/lib_sdl_net_ex.dart';
part 'ex/net/lib_sdl_net.dart';
part 'ex/net/net_address.dart';
part 'ex/net/net_datagram_socket.dart';
part 'ex/net/net_server.dart';
part 'ex/net/net_stream_socket.dart';
part 'ex/net/struct_net_datagram.dart';
part 'generated/const_sdl_net.dart';
part 'generated/lib_sdl_net.dart';
part 'generated/struct_sdl_net.dart';

final DynamicLibrary _libNet = dylib.SdlDynamicLibraryService().open('net');
