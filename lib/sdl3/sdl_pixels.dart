import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';

part 'pixels/lib_sdl_pixels.dart';
part 'pixels/sdl_color.dart';
part 'pixels/sdl_fcolor.dart';
part 'pixels/sdl_masks.dart';

part 'generated/lib_sdl_pixels.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
