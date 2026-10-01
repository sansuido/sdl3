import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';
import 'sdl_error.dart';
import 'sdl_rect.dart';

part 'image/lib_sdl_image.dart';
part 'image/lib_sdl_image_ex.dart';
part 'image/img_animation.dart';
part 'image/img_animation_decoder.dart';
part 'image/img_animation_encoder.dart';
part 'generated/const_sdl_image.dart';
part 'generated/lib_sdl_image.dart';
part 'generated/struct_sdl_image.dart';

final DynamicLibrary _libImage = dylib.SdlDynamicLibraryService().open('image');
