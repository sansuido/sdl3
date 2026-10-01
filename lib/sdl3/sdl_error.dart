import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;

part 'generated/lib_sdl_error.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
