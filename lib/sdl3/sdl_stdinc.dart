import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';

part 'stdinc/lib_sdl_stdinc.dart';
part 'stdinc/sdl_environment.dart';

part 'generated/lib_sdl_stdinc.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
