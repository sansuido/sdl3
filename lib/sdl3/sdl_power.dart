import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl_dart.dart';

part 'power/lib_sdl_power.dart';

part 'generated/lib_sdl_power.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
