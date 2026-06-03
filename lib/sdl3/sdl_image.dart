import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:ffi/ffi.dart' as ffi;
import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';

part 'ex/image/lib_sdl_image.dart';
part 'ex/image/struct_img_animation_decoder_frame.dart';
part 'ex/image/img_animation.dart';
part 'ex/image/img_animation_decoder.dart';
part 'ex/image/img_animation_encoder.dart';
part 'generated/const_sdl_image.dart';
part 'generated/lib_sdl_image.dart';
part 'generated/struct_sdl_image.dart';
part 'ex/lib_sdl_image_ex.dart';

final DynamicLibrary _libImage = dylib.SdlDynamicLibraryService().open('image');
