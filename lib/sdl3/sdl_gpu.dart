import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;
import 'sdl.dart';
import 'sdl_dart.dart';
import 'sdl_pixels.dart';
import 'sdl_rect.dart';

part 'gpu/lib_sdl_gpu.dart';
part 'gpu/sdl_gpu_command_buffer.dart';
part 'gpu/sdl_gpu_compute_pass.dart';
part 'gpu/sdl_gpu_copy_pass.dart';
part 'gpu/sdl_gpu_device.dart';
part 'gpu/sdl_gpu_render_pass.dart';
part 'gpu/sdl_gpu_blit_info.dart';
part 'gpu/sdl_gpu_color_target_info.dart';
part 'gpu/sdl_gpu_transfer_buffer_location.dart';
part 'gpu/sdl_gpu_buffer_binding.dart';
part 'gpu/sdl_gpu_buffer_create_info.dart';
part 'gpu/sdl_gpu_buffer_location.dart';
part 'gpu/sdl_gpu_buffer_region.dart';
part 'gpu/sdl_gpu_compute_pipeline_create_info.dart';
part 'gpu/sdl_gpu_depth_stencil_target_info.dart';
part 'gpu/sdl_gpu_graphics_pipeline_create_info.dart';
part 'gpu/sdl_gpu_sampler_create_info.dart';
part 'gpu/sdl_gpu_shader_create_info.dart';
part 'gpu/sdl_gpu_storage_buffer_read_write_binding.dart';
part 'gpu/sdl_gpu_storage_texture_read_write_binding.dart';
part 'gpu/sdl_gpu_texture_create_info.dart';
part 'gpu/sdl_gpu_texture_location.dart';
part 'gpu/sdl_gpu_texture_region.dart';
part 'gpu/sdl_gpu_texture_sampler_binding.dart';
part 'gpu/sdl_gpu_texture_transfer_info.dart';
part 'gpu/sdl_gpu_transfer_buffer_create_info.dart';
part 'gpu/sdl_gpu_viewport.dart';

part 'generated/lib_sdl_gpu.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
