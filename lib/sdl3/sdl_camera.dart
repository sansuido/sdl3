import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;

import 'sdl.dart';
import 'sdl_dart.dart';
import 'sdl_stdinc.dart';

part 'camera/lib_sdl_camera.dart';
part 'camera/sdl_camera.dart';
part 'camera/sdl_camera_spec.dart';

part 'generated/lib_sdl_camera.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
