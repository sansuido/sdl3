import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;

import 'sdl.dart';
import 'sdl_dart.dart';
import 'sdl_stdinc.dart';

part 'clipboard/lib_sdl_clipboard.dart';
part 'generated/lib_sdl_clipboard.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
