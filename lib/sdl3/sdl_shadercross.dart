import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:ffi/ffi.dart' as ffi;
import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';

part 'ex/shadercross/lib_sdl_shadercross.dart';
part 'ex/shadercross/struct_sdl_shadercross.dart';
part 'generated/const_sdl_shadercross.dart';
part 'generated/lib_sdl_shadercross.dart';
part 'generated/struct_sdl_shadercross.dart';

final DynamicLibrary _libShadercross = dylib.SdlDynamicLibraryService().open(
  'shadercross',
);
