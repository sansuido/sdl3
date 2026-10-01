import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';

part 'properties/lib_sdl_properties.dart';

part 'generated/lib_sdl_properties.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
