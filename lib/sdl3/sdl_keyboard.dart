import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';
import 'sdl_rect.dart';
import 'sdl_stdinc.dart';

part 'keyboard/lib_sdl_keyboard.dart';

part 'generated/lib_sdl_keyboard.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
