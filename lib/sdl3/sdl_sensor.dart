import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';
import 'sdl_stdinc.dart';

part 'sensor/lib_sdl_sensor.dart';
part 'sensor/sdl_sensor.dart';
part 'sensor/sdl_sensor_data.dart';

part 'generated/lib_sdl_sensor.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
