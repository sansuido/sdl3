import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';
import 'sdl_stdinc.dart';

part 'process/lib_sdl_process.dart';
part 'process/sdl_process.dart';

part 'generated/lib_sdl_process.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
