import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';

part 'vulkan/lib_sdl_vulkan.dart';

part 'generated/lib_sdl_vulkan.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
