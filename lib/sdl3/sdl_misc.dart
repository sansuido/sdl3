import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl_stdinc.dart';

part 'generated/lib_sdl_misc.dart';
part 'misc/lib_sdl_misc.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
