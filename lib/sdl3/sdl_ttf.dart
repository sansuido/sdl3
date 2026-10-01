import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';
import 'sdl_error.dart';
import 'sdl_pixels.dart';
import 'sdl_rect.dart';
import 'sdl_stdinc.dart';

part 'generated/const_sdl_ttf.dart';
part 'generated/lib_sdl_ttf.dart';
part 'generated/struct_sdl_ttf.dart';
part 'ttf/lib_sdl_ttf.dart';
part 'ttf/lib_sdl_ttf_ex.dart';
part 'ttf/ttf_sub_string.dart';
part 'ttf/ttf_text_engine.dart';
part 'ttf/ttf_font.dart';
part 'ttf/ttf_text.dart';

final DynamicLibrary _libTtf = dylib.SdlDynamicLibraryService().open('ttf');
