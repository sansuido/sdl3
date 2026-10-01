import 'dart:ffi';

import 'dylib.dart' as dylib;
import 'sdl.dart';

part 'generated/lib_sdl_metal.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
