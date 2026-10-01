import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';

part 'system/lib_sdl_system.dart';

part 'generated/lib_sdl_system.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
