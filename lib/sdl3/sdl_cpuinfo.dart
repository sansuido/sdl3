import 'dart:ffi';

import 'dylib.dart' as dylib;

part 'generated/lib_sdl_cpuinfo.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
