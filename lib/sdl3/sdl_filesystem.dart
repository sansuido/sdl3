import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';
import 'sdl_stdinc.dart';

part 'filesystem/lib_sdl_filesystem.dart';
part 'filesystem/sdl_path_info.dart';

part 'generated/lib_sdl_filesystem.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
