import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';

part 'hidapi/lib_sdl_hidapi.dart';
part 'hidapi/sdl_hid_device_info.dart';
part 'hidapi/sdl_hid_device.dart';

part 'generated/lib_sdl_hidapi.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
