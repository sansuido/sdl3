import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';

part 'guid/lib_sdl_guid.dart';

part 'generated/lib_sdl_guid.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
