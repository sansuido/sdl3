import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_stdinc.dart';

part 'locale/lib_sdl_locale.dart';
part 'locale/sdl_locale.dart';

part 'generated/lib_sdl_locale.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
