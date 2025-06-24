import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'dylib.dart' as dylib;
import 'sdl.dart';

part 'generated/const_sdl_net.dart';
part 'generated/lib_sdl_net.dart';
part 'generated/struct_sdl_net.dart';
part 'ex/lib_sdl_net_ex.dart';

final DynamicLibrary _libNet = dylib.SdlDynamicLibraryService().open('net');
