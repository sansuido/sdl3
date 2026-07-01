import 'dart:convert';
import 'dart:ffi';
import 'dart:math' as math;
import 'dart:typed_data';
import 'package:ffi/ffi.dart';
import 'package:ffi/ffi.dart' as ffi;
import 'dylib.dart' as dylib;
import 'sdl_dart.dart';
import 'sdl_gfx.dart' as gfx;
import 'sdl_image.dart';

part 'ex/sdl/asyncio/lib_sdl_asyncio.dart';
part 'ex/sdl/asyncio/sdl_async_io.dart';
part 'ex/sdl/asyncio/sdl_async_io_queue.dart';
part 'ex/sdl/asyncio/struct_sdl_async_io_outcome.dart';

part 'ex/sdl/audio/lib_sdl_audio.dart';
part 'ex/sdl/audio/sdl_audio_stream.dart';
part 'ex/sdl/audio/struct_sdl_audio_spec.dart';

part 'ex/sdl/camera/lib_sdl_camera.dart';
part 'ex/sdl/camera/sdl_camera.dart';
part 'ex/sdl/camera/struct_sdl_camera_spec.dart';

part 'ex/sdl/clipboard/lib_sdl_clipboard.dart';

part 'ex/sdl/dialog/lib_sdl_dialog.dart';
part 'ex/sdl/dialog/struct_sdl_dialog_file_filter.dart';

part 'ex/sdl/events/lib_sdl_events.dart';
part 'ex/sdl/events/sdl_event.dart';
part 'ex/sdl/events/struct_sdl_event.dart';

part 'ex/sdl/filesystem/lib_sdl_filesystem.dart';
part 'ex/sdl/filesystem/struct_sdl_path_info.dart';

part 'ex/sdl/gamepad/lib_sdl_gamepad.dart';
part 'ex/sdl/gamepad/sdl_gamepad.dart';
part 'ex/sdl/gamepad/struct_sdl_gamepad_binding.dart';
part 'ex/sdl/gamepad/struct_sdl_gamepad_touchpad_finger.dart';

part 'ex/sdl/gpu/lib_sdl_gpu.dart';
part 'ex/sdl/gpu/struct_sdl_gpu_blit_info.dart';
part 'ex/sdl/gpu/struct_sdl_gpu_color_target_info.dart';
part 'ex/sdl/gpu/struct_sdl_gpu_transfer_buffer_location.dart';
part 'ex/sdl/gpu/struct_sdl_gpu_buffer_binding.dart';
part 'ex/sdl/gpu/struct_sdl_gpu_buffer_create_info.dart';
part 'ex/sdl/gpu/struct_sdl_gpu_buffer_location.dart';
part 'ex/sdl/gpu/struct_sdl_gpu_buffer_region.dart';
part 'ex/sdl/gpu/struct_sdl_gpu_compute_pipeline_create_info.dart';
part 'ex/sdl/gpu/struct_sdl_gpu_depth_stencil_target_info.dart';
part 'ex/sdl/gpu/struct_sdl_gpu_graphics_pipeline_create_info.dart';
part 'ex/sdl/gpu/struct_sdl_gpu_sampler_create_info.dart';
part 'ex/sdl/gpu/struct_sdl_gpu_shader_create_info.dart';
part 'ex/sdl/gpu/struct_sdl_gpu_storage_buffer_read_write_binding.dart';
part 'ex/sdl/gpu/struct_sdl_gpu_storage_texture_read_write_binding.dart';
part 'ex/sdl/gpu/struct_sdl_gpu_swapchain_texture_info.dart';
part 'ex/sdl/gpu/struct_sdl_gpu_texture_create_info.dart';
part 'ex/sdl/gpu/struct_sdl_gpu_texture_location.dart';
part 'ex/sdl/gpu/struct_sdl_gpu_texture_region.dart';
part 'ex/sdl/gpu/struct_sdl_gpu_texture_sampler_binding.dart';
part 'ex/sdl/gpu/struct_sdl_gpu_texture_transfer_info.dart';
part 'ex/sdl/gpu/struct_sdl_gpu_transfer_buffer_create_info.dart';
part 'ex/sdl/gpu/struct_sdl_gpu_viewport.dart';

part 'ex/sdl/guid/lib_sdl_guid.dart';

part 'ex/sdl/iostream/lib_sdl_iostream.dart';
part 'ex/sdl/iostream/sdl_iostream.dart';

part 'ex/sdl/joystick/lib_sdl_joystick.dart';
part 'ex/sdl/joystick/sdl_joystick.dart';
part 'ex/sdl/joystick/struct_sdl_joystick_guid_info.dart';
part 'ex/sdl/joystick/struct_sdl_virtual_joystick_desc.dart';

part 'ex/sdl/keyboard/lib_sdl_keyboard.dart';
part 'ex/sdl/keyboard/struct_sdl_text_input_area.dart';

part 'ex/sdl/locale/lib_sdl_locale.dart';
part 'ex/sdl/locale/struct_sdl_locale.dart';

part 'ex/sdl/messagebox/lib_sdl_messagebox.dart';
part 'ex/sdl/messagebox/struct_sdl_message_box_data.dart';

part 'ex/sdl/mouse/lib_sdl_mouse.dart';
part 'ex/sdl/mouse/sdl_cursor.dart';
part 'ex/sdl/mouse/struct_sdl_cursor_frame_info.dart';

part 'ex/sdl/pixels/lib_sdl_pixels.dart';
part 'ex/sdl/pixels/struct_sdl_color.dart';
part 'ex/sdl/pixels/struct_sdl_fcolor.dart';
part 'ex/sdl/pixels/struct_sdl_masks.dart';

part 'ex/sdl/power/lib_sdl_power.dart';

part 'ex/sdl/process/lib_sdl_process.dart';
part 'ex/sdl/process/sdl_process.dart';

part 'ex/sdl/properties/lib_sdl_properties.dart';

part 'ex/sdl/rect/lib_sdl_rect.dart';
part 'ex/sdl/rect/struct_sdl_fpoint.dart';
part 'ex/sdl/rect/struct_sdl_frect.dart';
part 'ex/sdl/rect/struct_sdl_point.dart';
part 'ex/sdl/rect/struct_sdl_rect.dart';

part 'ex/sdl/render/lib_sdl_render.dart';
part 'ex/sdl/render/sdl_renderer.dart';
part 'ex/sdl/render/sdl_renderer_from_gfx.dart';
part 'ex/sdl/render/sdl_renderer_from_image.dart';
part 'ex/sdl/render/sdl_texture.dart';
part 'ex/sdl/render/struct_sdl_render_logical_presentation.dart';
part 'ex/sdl/render/struct_sdl_vertex.dart';

part 'ex/sdl/sensor/lib_sdl_sensor.dart';
part 'ex/sdl/sensor/sdl_sensor.dart';
part 'ex/sdl/sensor/struct_sdl_sensor_data.dart';

part 'ex/sdl/stdinc/lib_sdl_stdinc.dart';
part 'ex/sdl/stdinc/sdl_environment.dart';

part 'ex/sdl/storage/lib_sdl_storage.dart';
part 'ex/sdl/storage/sdl_storage.dart';
part 'ex/sdl/storage/struct_sdl_storage_interface.dart';

part 'ex/sdl/surface/lib_sdl_surface.dart';
part 'ex/sdl/surface/sdl_surface.dart';

part 'ex/sdl/system/lib_sdl_system.dart';

part 'ex/sdl/time/lib_sdl_time.dart';
part 'ex/sdl/time/struct_sdl_date_time.dart';
part 'ex/sdl/time/struct_sdl_date_time_locale.dart';
part 'ex/sdl/time/struct_sdl_date_time_windows.dart';

part 'ex/sdl/touch/lib_sdl_touch.dart';

part 'ex/sdl/tray/lib_sdl_tray.dart';
part 'ex/sdl/tray/sdl_tray.dart';
part 'ex/sdl/tray/sdl_tray_entry.dart';
part 'ex/sdl/tray/sdl_tray_menu.dart';

part 'ex/sdl/video/lib_sdl_video.dart';
part 'ex/sdl/video/sdl_window.dart';
part 'ex/sdl/video/struct_sdl_display_mode.dart';

part 'ex/sdl/vulkan/lib_sdl_vulkan.dart';

part 'generated/const_sdl.dart';
part 'generated/lib_sdl.dart';
part 'generated/lib_sdl_assert.dart';
part 'generated/lib_sdl_asyncio.dart';
part 'generated/lib_sdl_atomic.dart';
part 'generated/lib_sdl_audio.dart';
part 'generated/lib_sdl_blendmode.dart';
part 'generated/lib_sdl_camera.dart';
part 'generated/lib_sdl_clipboard.dart';
part 'generated/lib_sdl_cpuinfo.dart';
part 'generated/lib_sdl_dialog.dart';
part 'generated/lib_sdl_error.dart';
part 'generated/lib_sdl_events.dart';
part 'generated/lib_sdl_filesystem.dart';
part 'generated/lib_sdl_gamepad.dart';
part 'generated/lib_sdl_gpu.dart';
part 'generated/lib_sdl_guid.dart';
part 'generated/lib_sdl_haptic.dart';
part 'generated/lib_sdl_hidapi.dart';
part 'generated/lib_sdl_hints.dart';
part 'generated/lib_sdl_init.dart';
part 'generated/lib_sdl_iostream.dart';
part 'generated/lib_sdl_joystick.dart';
part 'generated/lib_sdl_keyboard.dart';
part 'generated/lib_sdl_loadso.dart';
part 'generated/lib_sdl_locale.dart';
part 'generated/lib_sdl_log.dart';
part 'generated/lib_sdl_main.dart';
part 'generated/lib_sdl_messagebox.dart';
part 'generated/lib_sdl_metal.dart';
part 'generated/lib_sdl_misc.dart';
part 'generated/lib_sdl_mouse.dart';
part 'generated/lib_sdl_mutex.dart';
part 'generated/lib_sdl_notification.dart';
part 'generated/lib_sdl_openxr.dart';
part 'generated/lib_sdl_pen.dart';
part 'generated/lib_sdl_pixels.dart';
part 'generated/lib_sdl_platform.dart';
part 'generated/lib_sdl_power.dart';
part 'generated/lib_sdl_process.dart';
part 'generated/lib_sdl_properties.dart';
part 'generated/lib_sdl_rect.dart';
part 'generated/lib_sdl_render.dart';
part 'generated/lib_sdl_sensor.dart';
part 'generated/lib_sdl_stdinc.dart';
part 'generated/lib_sdl_storage.dart';
part 'generated/lib_sdl_surface.dart';
part 'generated/lib_sdl_system.dart';
part 'generated/lib_sdl_thread.dart';
part 'generated/lib_sdl_time.dart';
part 'generated/lib_sdl_timer.dart';
part 'generated/lib_sdl_touch.dart';
part 'generated/lib_sdl_tray.dart';
part 'generated/lib_sdl_version.dart';
part 'generated/lib_sdl_video.dart';
part 'generated/lib_sdl_vulkan.dart';
part 'generated/struct_sdl.dart';
part 'ex/lib_sdl_ex.dart';
part 'ex/lib_sdl_video_ex.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');

// lib_sdl_opengl.dart
final class ClContext extends Opaque {}

final class ClEvent extends Opaque {}

// lib_sdl_metal.dart
typedef SdlMetalView = Pointer<Void>;

// lib_sdl_openxr.dart
typedef PfnXrGetInstanceProcAddr = Pointer<NativeFunction<SdlFunctionPointer>>;

// lib_sdl_thread.dart
typedef SdlTlsDeorCallback = Pointer<NativeFunction<SdlFunctionPointer>>;

// lib_sdl_video.dart
typedef SdlEglSurface = Pointer<Void>;

// lib_sdl_vulkan.dart
final class VkInstanceT extends Opaque {}

final class VkPhysicalDeviceT extends Opaque {}

final class VkSurfaceKHRT extends Opaque {}

final class VkAllocationCallbacks extends Opaque {}

typedef VkInstance = Pointer<VkInstanceT>;
typedef VkSurfaceKHR = Pointer<VkSurfaceKHRT>;
typedef VkPhysicalDevice = Pointer<VkPhysicalDeviceT>;
