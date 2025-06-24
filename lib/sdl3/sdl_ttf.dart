import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'dylib.dart' as dylib;
import 'sdl.dart';

part 'ex/ttf/ttf_font.dart';
part 'generated/const_sdl_ttf.dart';
part 'generated/lib_sdl_ttf.dart';
part 'generated/struct_sdl_ttf.dart';
part 'ex/lib_sdl_ttf_ex.dart';

final DynamicLibrary _libTtf = dylib.SdlDynamicLibraryService().open('ttf');
