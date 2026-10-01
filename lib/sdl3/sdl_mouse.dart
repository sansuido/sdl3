import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';
import 'sdl_rect.dart';
import 'sdl_stdinc.dart';

part 'mouse/lib_sdl_mouse.dart';
part 'mouse/sdl_cursor.dart';
part 'mouse/sdl_cursor_frame_info.dart';

part 'generated/lib_sdl_mouse.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
