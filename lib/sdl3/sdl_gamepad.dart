import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';
import 'sdl_sensor.dart';
import 'sdl_stdinc.dart';

part 'gamepad/lib_sdl_gamepad.dart';
part 'gamepad/sdl_gamepad.dart';
part 'gamepad/sdl_gamepad_binding.dart';

part 'generated/lib_sdl_gamepad.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
