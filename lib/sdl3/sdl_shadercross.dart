import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';
import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';

part 'ex/shadercross/lib_sdl_shadercross.dart';
part 'ex/shadercross/sdl_shader_cross_compute_pipeline_metadata.dart';
part 'ex/shadercross/sdl_shader_cross_graphics_shader_metadata.dart';
part 'ex/shadercross/sdl_shader_cross_graphics_shader_resource_info.dart';
part 'ex/shadercross/sdl_shader_cross_hlsl_info.dart';
part 'ex/shadercross/sdl_shader_cross_spirv_info.dart';

part 'generated/const_sdl_shadercross.dart';
part 'generated/lib_sdl_shadercross.dart';
part 'generated/struct_sdl_shadercross.dart';

final DynamicLibrary _libShadercross = dylib.SdlDynamicLibraryService().open(
  'shadercross',
);
