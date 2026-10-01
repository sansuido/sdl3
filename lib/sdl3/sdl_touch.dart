import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';
import 'sdl_stdinc.dart';

part 'touch/sdl_finger.dart';
part 'touch/lib_sdl_touch.dart';

part 'generated/lib_sdl_touch.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
