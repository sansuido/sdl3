import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';
import 'sdl_pixels.dart';

part 'messagebox/lib_sdl_messagebox.dart';
part 'messagebox/sdl_message_box_data.dart';

part 'generated/lib_sdl_messagebox.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
