import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'dylib.dart' as dylib;
import 'sdl.dart';

part 'ex/image/img_animation.dart';
part 'generated/const_sdl_image.dart';
part 'generated/lib_sdl_image.dart';
part 'generated/struct_sdl_image.dart';
part 'ex/lib_sdl_image_ex.dart';

final DynamicLibrary _libImage = dylib.SdlDynamicLibraryService().open('image');
