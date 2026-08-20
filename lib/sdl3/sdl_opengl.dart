import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';

//import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';

part 'ex/opengl/lib_sdl_opengl.dart';
part 'generated/const_sdl_opengl.dart';
part 'generated/lib_sdl_opengl.dart';
part 'generated/lib_sdl_opengl_glext.dart';

void sdlGlLoader() {
  _sdlOpenglLoader();
  _sdlOpenglGlextLoader();
}
