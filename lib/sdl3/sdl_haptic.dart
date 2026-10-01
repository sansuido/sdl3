import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';
import 'sdl_stdinc.dart';

part 'haptic/lib_sdl_haptic.dart';
part 'haptic/sdl_haptic.dart';
part 'haptic/sdl_haptic_effect.dart';

part 'generated/lib_sdl_haptic.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
