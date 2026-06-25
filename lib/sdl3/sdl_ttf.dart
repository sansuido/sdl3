import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:ffi/ffi.dart' as ffi;
import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';

part 'ex/ttf/lib_sdl_ttf.dart';
part 'ex/ttf/struct_ttf_sub_string.dart';
part 'ex/ttf/ttf_text_engine.dart';
part 'ex/ttf/ttf_font.dart';
part 'ex/ttf/ttf_text.dart';
part 'generated/const_sdl_ttf.dart';
part 'generated/lib_sdl_ttf.dart';
part 'generated/struct_sdl_ttf.dart';
part 'ex/lib_sdl_ttf_ex.dart';

final DynamicLibrary _libTtf = dylib.SdlDynamicLibraryService().open('ttf');
