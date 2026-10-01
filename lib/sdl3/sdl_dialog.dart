import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;

import 'sdl.dart';
import 'sdl_dart.dart';

part 'dialog/lib_sdl_dialog.dart';
part 'dialog/sdl_dialog_file_filter.dart';

part 'generated/lib_sdl_dialog.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
