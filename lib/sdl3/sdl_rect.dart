import 'dart:ffi';
import 'dart:math' as math;

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';

part 'rect/lib_sdl_rect.dart';
part 'rect/sdl_fpoint.dart';
part 'rect/sdl_frect.dart';
part 'rect/sdl_point.dart';
part 'rect/sdl_rect.dart';

part 'generated/lib_sdl_rect.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
