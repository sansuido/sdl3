import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';
import 'sdl_events.dart';
import 'sdl_gfx.dart' as gfx;
import 'sdl_gpu.dart';
import 'sdl_image.dart';
import 'sdl_pixels.dart';
import 'sdl_rect.dart';
import 'sdl_ttf.dart' as ttf;

part 'render/sdl_gpu_render_state_create_info.dart';
part 'render/sdl_gpu_render_state.dart';
part 'render/lib_sdl_render.dart';
part 'render/sdl_renderer.dart';
part 'render/sdl_renderer_from_gfx.dart';
part 'render/sdl_renderer_from_image.dart';
part 'render/sdl_renderer_from_ttf.dart';
part 'render/sdl_texture.dart';
part 'render/sdl_vertex.dart';

part 'generated/lib_sdl_render.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
