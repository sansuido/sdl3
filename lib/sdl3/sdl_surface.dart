import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';
import 'sdl_mouse.dart';
import 'sdl_pixels.dart';
import 'sdl_rect.dart';

part 'surface/lib_sdl_surface.dart';
part 'surface/sdl_surface.dart';
part 'surface/sdl_surface_from_mouse.dart';

part 'generated/lib_sdl_surface.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
