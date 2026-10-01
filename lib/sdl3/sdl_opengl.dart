import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart' as ffi;

import 'sdl.dart';
import 'sdl_dart.dart';
import 'sdl_video.dart';

part 'generated/const_sdl_opengl.dart';
part 'generated/lib_sdl_opengl.dart';
part 'generated/lib_sdl_opengl_glext.dart';
part 'opengl/lib_sdl_opengl.dart';

void sdlGlLoader() {
  _sdlOpenglLoader();
  _sdlOpenglGlextLoader();
}
