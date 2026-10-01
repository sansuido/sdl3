import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';

part 'time/lib_sdl_time.dart';
part 'time/sdl_date_time.dart';

part 'generated/lib_sdl_time.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
