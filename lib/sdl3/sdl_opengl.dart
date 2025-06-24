import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'dylib.dart' as dylib;
import 'sdl.dart';

part 'generated/const_sdl_opengl.dart';
part 'generated/lib_sdl_opengl.dart';
part 'generated/lib_sdl_opengl_glext.dart';

final DynamicLibrary _libOpengl = dylib.SdlDynamicLibraryService().open(
  'opengl',
);
