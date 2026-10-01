import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';
import 'sdl_haptic.dart';
import 'sdl_stdinc.dart';

part 'joystick/lib_sdl_joystick.dart';
part 'joystick/sdl_joystick.dart';
part 'joystick/sdl_joystick_from_haptic.dart';
part 'joystick/sdl_virtual_joystick_desc.dart';

part 'generated/lib_sdl_joystick.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
