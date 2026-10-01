import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';
import 'sdl_keyboard.dart';
import 'sdl_metal.dart';
import 'sdl_mouse.dart';
import 'sdl_rect.dart';
import 'sdl_render.dart';
import 'sdl_stdinc.dart';
import 'sdl_system.dart';
import 'sdl_vulkan.dart';

part 'video/lib_sdl_video.dart';
part 'video/lib_sdl_video_ex.dart';
part 'video/sdl_gl_context.dart';
part 'video/sdl_window.dart';
part 'video/sdl_window_from_keyboard.dart';
part 'video/sdl_window_from_metal.dart';
part 'video/sdl_window_from_mouse.dart';
part 'video/sdl_window_from_render.dart';
part 'video/sdl_window_from_system.dart';
part 'video/sdl_window_from_vulkan.dart';
part 'video/sdl_display_mode.dart';

part 'generated/lib_sdl_video.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
