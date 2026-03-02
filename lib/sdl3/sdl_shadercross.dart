import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'dylib.dart' as dylib;
import 'sdl.dart';

part 'generated/const_sdl_shadercross.dart';
part 'generated/lib_sdl_shadercross.dart';
part 'generated/struct_sdl_shadercross.dart';

final DynamicLibrary _libShadercross = dylib.SdlDynamicLibraryService().open(
  'shadercross',
);
