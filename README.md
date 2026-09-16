SDL3 for Dart
====

# Requirement

* ffi ^2.2.0

This library is limited to 64bit.  
Since ffi is used, a dynamic library suitable for various environments is required.  
image, mixer, net, and ttf are optional. Please include it if necessary.  
Since sdl3gfx is included in the source, a dynamic library is not required.  
For OpenGL, call require separately.  

```dart
import 'package:sdl3/sdl3.dart'; // SDL3, SDL3_image, SDL3_mixer, SDL3_net, SDL3_ttf, SDL3_shadercross
import 'package:sdl3/sdl3gfx.dart'; // SDL3_gfx
import 'package:sdl3/sdl3opengl.dart'; // OpenGL
```

## Windows requires dll files.

SDL3.dll  
SDL3_image.dll  
SDL3_mixer.dll  
SDL3_net.dll  
SDL3_ttf.dll  
SDL3_shadercross.dll  

## Linux requires so files.

libSDL3.so.0  
libSDL3_image.so.0  
libSDL3_mixer.so.0  
libSDL3_net.so.0  
libSDL3_ttf.so.0  
libSDL3_shadercross.so.0

## Android, Fuchsia requires so files.

libSDL3.so  
libSDL3_image.so  
libSDL3_mixer.so  
libSDL3_net.so  
libSDL3_ttf.so  
libSDL3_shadercross.so

## MacOS (or iOS) requires dylib files.

libSDL3.dylib  
libSDL3_image.dylib  
libSDL3_mixer.dylib  
libSDL3_net.dylib  
libSDL3_ttf.dylib  
libSDL3_shadercross.dylib  

## And more.

If you want to set a library under special circumstances (example: dylib), do the following:  

```dart
SdlDynamicLibraryService().set('sdl', 'YOUR_SDL3_ENVIONMENT.dylib');
SdlDynamicLibraryService().set('image', 'YOUR_SDL3_image_ENVIONMENT.dylib');
SdlDynamicLibraryService().set('mixer', 'YOUR_SDL3_mixer_ENVIONMENT.dylib');
SdlDynamicLibraryService().set('net', 'YOUR_SDL3_net_ENVIONMENT.dylib');
SdlDynamicLibraryService().set('ttf', 'YOUR_SDL3_ttf_ENVIONMENT.dylib');
SdlDynamicLibraryService().set('shadercross', 'YOUR_SDL3_shadercross_ENVIONMENT.dylib');
if (sdlInit(SDL_INIT_VIDEO)) {
  // success
}
```

# Note

A Dart library for accessing SDL 3 APIs using, FFI.

https://www.libsdl.org/

Windows 64bit & Linux (Tested under Windows 11 WSL2 environment)

Currently, we are providing it on an experimental basis using the dll compiled below.

https://github.com/sansuido/build-sdl3

# Examples

## learnopengl.com for Dart
https://github.com/sansuido/sdl3_learnopengl/

## SDL_gpu_examples for Dart
https://github.com/sansuido/sdl3_gpu_examples/

## SDL_projects for Dart
https://github.com/sansuido/sdl3_projects/


# Author

yamahara

# Tast List (for struct)

## sdl
### assert
- [ ] SdlAssertData
### asyncio
- [x] [SdlAsyncIo](./lib/sdl3/ex/sdl/asyncio/sdl_async_io.dart)
- [x] [SdlAsyncIoOutcome](./lib/sdl3/ex/sdl/asyncio/sdl_async_io_outcome.dart)
- [x] [SdlAsyncIoQueue](./lib/sdl3/ex/sdl/asyncio/sdl_async_io_queue.dart)
### atomic
- [ ] SdlAtomicInt
- [ ] SdlAtomicU32
### audio
- [x] [SdlAudioSpec](./lib/sdl3/ex/sdl/audio/sdl_audio_spec.dart)
- [x] [SdlAudioStream](./lib/sdl3/ex/sdl/audio/sdl_audio_stream.dart)
### camera
- [x] [SdlCamera](./lib/sdl3/ex/sdl/camera/sdl_camera.dart)
- [x] [SdlCameraSpec](./lib/sdl3/ex/sdl/camera/sdl_camera_spec.dart)
### dialog
- [x] [SdlDialogFileFilter](./lib/sdl3/ex/sdl/dialog/sdl_dialog_file_filter.dart)
### events
- [x] [SdlCommonEvent](./lib/sdl3/ex/sdl/events/sdl_00_common_event.dart)
- [x] [SdlDisplayEvent](./lib/sdl3/ex/sdl/events/sdl_01_display_event.dart)
- [x] [SdlWindowEvent](./lib/sdl3/ex/sdl/events/sdl_02_window_event.dart)
- [x] [SdlKeyboardDeviceEvent](./lib/sdl3/ex/sdl/events/sdl_03_keyboard_device_event.dart)
- [x] [SdlKeyboardEvent](./lib/sdl3/ex/sdl/events/sdl_04_keyboard_event.dart)
- [x] [SdlTextEditingEvent](./lib/sdl3/ex/sdl/events/sdl_05_text_editing_event.dart)
- [x] [SdlTextEditingCandidatesEvent](./lib/sdl3/ex/sdl/events/sdl_06_text_editing_candidates_event.dart)
- [x] [SdlTextInputEvent](./lib/sdl3/ex/sdl/events/sdl_07_text_input_event.dart)
- [x] [SdlMouseDeviceEvent](./lib/sdl3/ex/sdl/events/sdl_08_mouse_device_event.dart)
- [x] [SdlMouseMotionEvent](./lib/sdl3/ex/sdl/events/sdl_09_mouse_motion_event.dart)
- [x] [SdlMouseButtonEvent](./lib/sdl3/ex/sdl/events/sdl_10_mouse_button_event.dart)
- [x] [SdlMouseWheelEvent](./lib/sdl3/ex/sdl/events/sdl_11_mouse_wheel_event.dart)
- [x] [SdlJoyDeviceEvent](./lib/sdl3/ex/sdl/events/sdl_12_joy_device_event.dart)
- [x] [SdlJoyAxisEvent](./lib/sdl3/ex/sdl/events/sdl_13_joy_axis_event.dart)
- [x] [SdlJoyBallEvent](./lib/sdl3/ex/sdl/events/sdl_14_joy_ball_event.dart)
- [x] [SdlJoyHatEvent](./lib/sdl3/ex/sdl/events/sdl_15_joy_hat_event.dart)
- [x] [SdlJoyButtonEvent](./lib/sdl3/ex/sdl/events/sdl_16_joy_button_event.dart)
- [x] [SdlJoyBatteryEvent](./lib/sdl3/ex/sdl/events/sdl_17_joy_battery_event.dart)
- [x] [SdlGamepadDeviceEvent](./lib/sdl3/ex/sdl/events/sdl_18_gamepad_device_event.dart)
- [x] [SdlGamepadAxisEvent](./lib/sdl3/ex/sdl/events/sdl_19_gamepad_axis_event.dart)
- [x] [SdlGamepadButtonEvent](./lib/sdl3/ex/sdl/events/sdl_20_gamepad_button_event.dart)
- [x] [SdlGamepadTouchpadEvent](./lib/sdl3/ex/sdl/events/sdl_21_gamepad_touchpad_event.dart)
- [x] [SdlGamepadSensorEvent](./lib/sdl3/ex/sdl/events/sdl_22_gamepad_sensor_event.dart)
- [x] [SdlGamepadCapSenseEvent](./lib/sdl3/ex/sdl/events/sdl_23_gamepad_can_sense_event.dart)
- [x] [SdlAudioDeviceEvent](./lib/sdl3/ex/sdl/events/sdl_24_audio_device_event.dart)
- [x] [SdlCameraDeviceEvent](./lib/sdl3/ex/sdl/events/sdl_25_camera_device_event.dart)
- [x] [SdlSensorEvent](./lib/sdl3/ex/sdl/events/sdl_26_sensor_event.dart)
- [x] [SdlQuitEvent](./lib/sdl3/ex/sdl/events/sdl_27_quit_event.dart)
- [x] [SdlUserEvent](./lib/sdl3/ex/sdl/events/sdl_28_user_event.dart)
- [x] [SdlTouchFingerEvent](./lib/sdl3/ex/sdl/events/sdl_29_touch_finger_event.dart)
- [x] [SdlPinchFingerEvent](./lib/sdl3/ex/sdl/events/sdl_30_pinch_finger_event.dart)
- [x] [SdlPenProximityEvent](./lib/sdl3/ex/sdl/events/sdl_31_pen_proximity_event.dart)
- [x] [SdlPenTouchEvent](./lib/sdl3/ex/sdl/events/sdl_32_pen_touch_event.dart)
- [x] [SdlPenMotionEvent](./lib/sdl3/ex/sdl/events/sdl_33_pen_motion_event.dart)
- [x] [SdlPenButtonEvent](./lib/sdl3/ex/sdl/events/sdl_34_pen_button_event.dart)
- [x] [SdlPenAxisEvent](./lib/sdl3/ex/sdl/events/sdl_35_pen_axis_event.dart)
- [x] [SdlRenderEvent](./lib/sdl3/ex/sdl/events/sdl_36_render_event.dart)
- [x] [SdlDropEvent](./lib/sdl3/ex/sdl/events/sdl_37_drop_event.dart)
- [x] [SdlClipboardEvent](./lib/sdl3/ex/sdl/events/sdl_38_clipboard_event.dart)
- [x] [SdlNotificationEvent](./lib/sdl3/ex/sdl/events/sdl_39_notification_event.dart)
- [x] [SdlEvent](./lib/sdl3/ex/sdl/events/sdl_event.dart)
### filesystem
- [x] [SdlPathInfo](./lib/sdl3/ex/sdl/filesystem/sdl_path_info.dart)
### gamepad
- [x] [SdlGamepad](./lib/sdl3/ex/sdl/gamepad/sdl_gamepad.dart)
- [x] [SdlGamepadBindingInputAxis](./lib/sdl3/ex/sdl/gamepad/sdl_gamepad_binding.dart)
- [x] [SdlGamepadBindingInputHat](./lib/sdl3/ex/sdl/gamepad/sdl_gamepad_binding.dart)
- [x] [SdlGamepadBindingInput](./lib/sdl3/ex/sdl/gamepad/sdl_gamepad_binding.dart)
- [x] [SdlGamepadBindingOutputAxis](./lib/sdl3/ex/sdl/gamepad/sdl_gamepad_binding.dart)
- [x] [SdlGamepadBindingOutput](./lib/sdl3/ex/sdl/gamepad/sdl_gamepad_binding.dart)
- [x] [SdlGamepadBinding](./lib/sdl3/ex/sdl/gamepad/sdl_gamepad_binding.dart)
### gpu
- [x] [SdlGpuDevice](./lib/sdl3/ex/sdl/gpu/sdl_gpu_device.dart)
- [x] ~~SdlGpuBuffer~~ Opaque.
- [x] ~~SdlGpuTransferBuffer~~ Opaque.
- [x] ~~SdlGpuTexture~~ Opaque.
- [x] ~~SdlGpuSampler~~ Opaque.
- [x] ~~SdlGpuShader~~ Opaque.
- [x] ~~SdlGpuComputePipeline~~ Opaque.
- [x] ~~SdlGpuGraphicsPipeline~~ Opaque.
- [x] [SdlGpuCommandBuffer](./lib/sdl3/ex/sdl/gpu/sdl_gpu_command_buffer.dart)
- [x] [SdlGpuRenderPass](./lib/sdl3/ex/sdl/gpu/sdl_gpu_render_pass.dart)
- [x] [SdlGpuComputePass](./lib/sdl3/ex/sdl/gpu/sdl_gpu_compute_pass.dart)
- [x] [SdlGpuCopyPass](./lib/sdl3/ex/sdl/gpu/sdl_gpu_copy_pass.dart)
- [x] ~~SdlGpuFence~~ Opaque.
- [x] [SdlGpuViewport](./lib/sdl3/ex/sdl/gpu/sdl_gpu_viewport.dart)
- [x] [SdlGpuTextureTransferInfo](./lib/sdl3/ex/sdl/gpu/sdl_gpu_texture_transfer_info.dart)
- [x] [SdlGpuTransferBufferLocation](./lib/sdl3/ex/sdl/gpu/sdl_gpu_transfer_buffer_location.dart)
- [x] [SdlGpuTextureLocation](./lib/sdl3/ex/sdl/gpu/sdl_gpu_texture_location.dart)
- [x] [SdlGpuTextureRegion](./lib/sdl3/ex/sdl/gpu/sdl_gpu_texture_region.dart)
- [x] [SdlGpuBlitRegion](./lib/sdl3/ex/sdl/gpu/sdl_gpu_blit_info.dart)
- [x] [SdlGpuBufferLocation](./lib/sdl3/ex/sdl/gpu/sdl_gpu_buffer_location.dart)
- [x] [SdlGpuBufferRegion](./lib/sdl3/ex/sdl/gpu/sdl_gpu_buffer_region.dart)
- [ ] SdlGpuIndirectDrawCommand
- [ ] SdlGpuIndexedIndirectDrawCommand
- [ ] SdlGpuIndirectDispatchCommand
- [x] [SdlGpuSamplerCreateInfo](./lib/sdl3/ex/sdl/gpu/sdl_gpu_sampler_create_info.dart)
- [x] [SdlGpuVertexBufferDescription](./lib/sdl3/ex/sdl/gpu/sdl_gpu_graphics_pipeline_create_info.dart)
- [x] [SdlGpuVertexAttribute](./lib/sdl3/ex/sdl/gpu/sdl_gpu_graphics_pipeline_create_info.dart)
- [x] [SdlGpuVertexInputState](./lib/sdl3/ex/sdl/gpu/sdl_gpu_graphics_pipeline_create_info.dart)
- [x] [SdlGpuStencilOpState](./lib/sdl3/ex/sdl/gpu/sdl_gpu_graphics_pipeline_create_info.dart)
- [x] [SdlGpuColorTargetBlendState](./lib/sdl3/ex/sdl/gpu/sdl_gpu_graphics_pipeline_create_info.dart)
- [x] [SdlGpuShaderCreateInfo](./lib/sdl3/ex/sdl/gpu/sdl_gpu_shader_create_info.dart)
- [x] [SdlGpuTextureCreateInfo](./lib/sdl3/ex/sdl/gpu/sdl_gpu_texture_create_info.dart)
- [x] [SdlGpuBufferCreateInfo](./lib/sdl3/ex/sdl/gpu/sdl_gpu_buffer_create_info.dart)
- [x] [SdlGpuTransferBufferCreateInfo](./lib/sdl3/ex/sdl/gpu/sdl_gpu_transfer_buffer_create_info.dart)
- [x] [SdlGpuRasterizerState](./lib/sdl3/ex/sdl/gpu/sdl_gpu_graphics_pipeline_create_info.dart)
- [x] [SdlGpuMultisampleState](./lib/sdl3/ex/sdl/gpu/sdl_gpu_graphics_pipeline_create_info.dart)
- [x] [SdlGpuDepthStencilState](./lib/sdl3/ex/sdl/gpu/sdl_gpu_graphics_pipeline_create_info.dart)
- [x] [SdlGpuColorTargetDescription](./lib/sdl3/ex/sdl/gpu/sdl_gpu_graphics_pipeline_create_info.dart)
- [x] [SdlGpuGraphicsPipelineTargetInfo](./lib/sdl3/ex/sdl/gpu/sdl_gpu_graphics_pipeline_create_info.dart)
- [x] [SdlGpuGraphicsPipelineCreateInfo](./lib/sdl3/ex/sdl/gpu/sdl_gpu_graphics_pipeline_create_info.dart)
- [x] [SdlGpuComputePipelineCreateInfo](./lib/sdl3/ex/sdl/gpu/sdl_gpu_compute_pipeline_create_info.dart)
- [x] [SdlGpuColorTargetInfo](./lib/sdl3/ex/sdl/gpu/sdl_gpu_color_target_info.dart)
- [x] [SdlGpuDepthStencilTargetInfo](./lib/sdl3/ex/sdl/gpu/sdl_gpu_depth_stencil_target_info.dart)
- [x] [SdlGpuBlitInfo](./lib/sdl3/ex/sdl/gpu/sdl_gpu_blit_info.dart)
- [x] [SdlGpuBufferBinding](./lib/sdl3/ex/sdl/gpu/sdl_gpu_buffer_binding.dart)
- [x] [SdlGpuTextureSamplerBinding](./lib/sdl3/ex/sdl/gpu/sdl_gpu_texture_sampler_binding.dart)
- [x] [SdlGpuStorageBufferReadWriteBinding](./lib/sdl3/ex/sdl/gpu/sdl_gpu_storage_buffer_read_write_binding.dart)
- [x] [SdlGpuStorageTextureReadWriteBinding](./lib/sdl3/ex/sdl/gpu/sdl_gpu_storage_texture_read_write_binding.dart)
- [ ] SdlGpuVulkanOptions
### guid
- [ ] SdlGuid
### haptic
- [ ] SdlHaptic
- [ ] SdlHapticDirection
- [ ] SdlHapticConstant
- [ ] SdlHapticPeriodic
- [ ] SdlHapticCondition
- [ ] SdlHapticRamp
- [ ] SdlHapticLeftRight
- [ ] SdlHapticCustom
- [ ] SdlHapticEffect
### hidapi
- [x] [SdlHidDevice](./lib/sdl3/ex/sdl/hidapi/sdl_hid_device.dart)
- [x] [SdlHidDeviceInfo](./lib/sdl3/ex/sdl/hidapi/sdl_hid_device_info.dart)
### iostream
- [x] [SdlIoStreamInterface](./lib/sdl3/ex/sdl/iostream/sdl_iostream_interface.dart)
- [x] [SdlIoStream](./lib/sdl3/ex/sdl/iostream/sdl_iostream.dart)
### joystick
- [x] [SdlJoystick](./lib/sdl3/ex/sdl/joystick/sdl_joystick.dart) \([haptic](./lib/sdl3/ex/sdl/joystick/sdl_joystick_from_haptic.dart)\)
- [x] [SdlVirtualJoystickTouchpadDesc](./lib/sdl3/ex/sdl/joystick/sdl_virtual_joystick_desc.dart)
- [x] [SdlVirtualJoystickSensorDesc](./lib/sdl3/ex/sdl/joystick/sdl_virtual_joystick_desc.dart)
- [x] [SdlVirtualJoystickDesc](./lib/sdl3/ex/sdl/joystick/sdl_virtual_joystick_desc.dart)
### loadso
- [ ] SdlSharedObject
### locate
- [x] [SdlLocale](./lib/sdl3/ex/sdl/locale/sdl_locale.dart)
### main_impl
- [ ] HINSTANCE
### messagebox
- [x] [SdlMessageBoxButtonData](./lib/sdl3/ex/sdl/messagebox/sdl_message_box_data.dart)
- [x] [SdlMessageBoxColor](./lib/sdl3/ex/sdl/messagebox/sdl_message_box_data.dart)
- [x] [SdlMessageBoxColorScheme](./lib/sdl3/ex/sdl/messagebox/sdl_message_box_data.dart)
- [x] [SdlMessageBoxData](./lib/sdl3/ex/sdl/messagebox/sdl_message_box_data.dart)
### mouse
- [x] [SdlCursor](./lib/sdl3/ex/sdl/mouse/sdl_cursor.dart)
- [x] [SdlCursorFrameInfo](./lib/sdl3/ex/sdl/mouse/sdl_cursor_frame_info.dart)
### mutex
- [ ] SdlMutex
- [ ] SdlRwLock
- [ ] SdlSemaphore
- [ ] SdlCondition
- [ ] SdlInitState
### notification
- [x] [SdlNotificationActionButton](./lib/sdl3/ex/sdl/notification/sdl_notification_action_button.dart)
- [x] [SdlNotificationAction](./lib/sdl3/ex/sdl/notification/sdl_notification_action.dart)
### openxr
- [ ] XrSessionCreateInfo
- [ ] XrSwapchainCreateInfo
### pixels
- [ ] SdlColor
- [ ] SdlFColor
- [ ] SdlPalette
- [ ] SdlPixelFormatDetails
### process
- [x] [SdlProcess](./lib/sdl3/ex/sdl/process/sdl_process.dart)
### rect
- [x] [SdlPoint](./lib/sdl3/ex/sdl/rect/sdl_point.dart)
- [x] [SdlFPoint](./lib/sdl3/ex/sdl/rect/sdl_fpoint.dart)
- [x] [SdlRect](./lib/sdl3/ex/sdl/rect/sdl_rect.dart)
- [x] [SdlFRect](./lib/sdl3/ex/sdl/rect/sdl_frect.dart)
### render
- [x] [SdlVertex](./lib/sdl3/ex/sdl/render/sdl_vertex.dart)
- [x] [SdlRenderer](./lib/sdl3/ex/sdl/render/sdl_renderer.dart) \([gfx](./lib/sdl3/ex/sdl/render/sdl_renderer_from_gfx.dart) / [image](./lib/sdl3/ex/sdl/render/sdl_renderer_from_image.dart) / [ttf](./lib/sdl3/ex/sdl/render/sdl_renderer_from_ttf.dart)\)
- [x] [SdlTexture](./lib/sdl3/ex/sdl/render/sdl_texture.dart)
- [x] [SdlGpuRenderStateCreateInfo](./lib/sdl3/ex/sdl/render/sdl_gpu_render_state_create_info.dart)
- [x] [SdlGpuRenderState](./lib/sdl3/ex/sdl/render/sdl_gpu_render_state.dart)
### sensor
- [x] [SdlSensor](./lib/sdl3/ex/sdl/sensor/sdl_sensor.dart)
### stdinc
- [ ] SdlAlignmentTest
- [ ] SdlEnvironment
- [ ] SdlIconvT
### storage
- [x] [SdlStorageInterface](./lib/sdl3/ex/sdl/storage/sdl_storage_interface.dart)
- [x] [SdlStorage](./lib/sdl3/ex/sdl/storage/sdl_storage.dart)
### surface
- [x] [SdlSurface](./lib/sdl3/ex/sdl/surface/sdl_surface.dart)
### system
- [ ] MSG
- [ ] XEvent
- [ ] XTaskQueueHandle
- [ ] XUserHandle
### thread
- [ ] SdlThread
### time
- [x] [SdlDateTime](./lib/sdl3/ex/sdl/time/sdl_date_time.dart)
### touch
- [x] [SdlFinger](./lib/sdl3/ex/sdl/touch/sdl_finger.dart)
### tray
- [x] [SdlTray](./lib/sdl3/ex/sdl/tray/sdl_tray.dart)
- [x] [SdlTrayMenu](./lib/sdl3/ex/sdl/tray/sdl_tray_menu.dart)
- [x] [SdlTrayEntry](./lib/sdl3/ex/sdl/tray/sdl_tray_entry.dart)
### video
- [x] ~~SdlDisplayModeData~~ Internal.
- [x] [SdlDisplayMode](./lib/sdl3/ex/sdl/video/sdl_display_mode.dart)
- [x] [SdlWindow](./lib/sdl3/ex/sdl/video/sdl_window.dart) \([keyboard](./lib/sdl3/ex/sdl/video/sdl_window_from_keyboard.dart) / [metal](./lib/sdl3/ex/sdl/video/sdl_window_from_metal.dart) / [mouse](./lib/sdl3/ex/sdl/video/sdl_window_from_mouse.dart) / [render](./lib/sdl3/ex/sdl/video/sdl_window_from_render.dart) / [system](./lib/sdl3/ex/sdl/video/sdl_window_from_system.dart) / [vulkan](./lib/sdl3/ex/sdl/video/sdl_window_from_vulkan.dart)\)
- [x] [SdlGlContext](./lib/sdl3/ex/sdl/video/sdl_gl_context.dart)
## sdl_image
- [x] [ImgAnimation](./lib/sdl3/ex/image/img_animation.dart)
- [x] [ImgAnimationEncoder](./lib/sdl3/ex/image/img_animation_encoder.dart)
- [x] [ImgAnimationDecoder](./lib/sdl3/ex/image/img_animation_decoder.dart)
## sdl_mixer
- [x] [MixMixer](./lib/sdl3/ex/mixer/mix_mixer.dart)
- [x] [MixAudio](./lib/sdl3/ex/mixer/mix_audio.dart)
- [x] [MixTrack](./lib/sdl3/ex/mixer/mix_track.dart)
- [x] [MixGroup](./lib/sdl3/ex/mixer/mix_group.dart)
- [x] [MixStereoGains](./lib/sdl3/ex/mixer/mix_stereo_gains.dart)
- [x] [MixPoint3D](./lib/sdl3/ex/mixer/mix_point_3d.dart)
- [x] [MixAudioDecoder](./lib/sdl3/ex/mixer/mix_audio_decoder.dart)
## sdl_net
- [x] [NetAddress](./lib/sdl3/ex/net/net_address.dart)
- [x] [NetStreamSocket](./lib/sdl3/ex/net/net_stream_socket.dart)
- [x] [NetServer](./lib/sdl3/ex/net/net_server.dart)
- [x] [NetDatagramSocket](./lib/sdl3/ex/net/net_datagram_socket.dart)
- [x] [NetDatagram](./lib/sdl3/ex/net/net_datagram.dart)
## sdl_shadercross
- [x] [SdlShaderCrossIoVarMetadata](./lib/sdl3/ex/shadercross/sdl_shader_cross_graphics_shader_metadata.dart)
- [x] [SdlShaderCrossGraphicsShaderResourceInfo](./lib/sdl3/ex/shadercross/sdl_shader_cross_graphics_shader_resource_info.dart)
- [x] [SdlShaderCrossGraphicsShaderMetadata](./lib/sdl3/ex/shadercross/sdl_shader_cross_graphics_shader_metadata.dart)
- [x] [SdlShaderCrossComputePipelineMetadata](./lib/sdl3/ex/shadercross/sdl_shader_cross_compute_pipeline_metadata.dart)
- [x] [SdlShaderCrossSpirvInfo](./lib/sdl3/ex/shadercross/sdl_shader_cross_spirv_info.dart)
- [x] [SdlShaderCrossHlslDefine](./lib/sdl3/ex/shadercross/sdl_shader_cross_hlsl_info.dart)
- [x] [SdlShaderCrossHlslInfo](./lib/sdl3/ex/shadercross/sdl_shader_cross_hlsl_info.dart)
## sdl_ttf
- [ ] TtfFillOperation
- [ ] TtfCopyOperation
- [ ] TtfDrawOperation
- [ ] TtfTextLayout
- [ ] TtfTextData
- [ ] TtfTextEngine
- [ ] TtfFont
- [ ] TtfText
- [ ] TtfGpuAtlasDrawSequence
- [ ] TtfGlAtlasDrawVertex
- [ ] TtfGlAtlasDrawSequence
- [ ] TtfSubString

# Task List (for lib)
- [x] ~~lib_sdl.dart~~
- [x] ~~lib_sdl_assert.dart~~ Please use Dart assert.
- [x] [lib_sdl_asyncio.dart](./lib/sdl3/ex/sdl/asyncio/lib_sdl_asyncio.dart)
- [x] ~~lib_sdl_atomic.dart~~ Not needed. Dart uses an isolate-based concurrency model.
- [x] [lib_sdl_audio.dart](./lib/sdl3/ex/sdl/audio/lib_sdl_audio.dart)
- [x] ~~lib_sdl_blendmode.dart~~
- [x] [lib_sdl_camera.dart](./lib/sdl3/ex/sdl/camera/lib_sdl_camera.dart)
- [x] [lib_sdl_clipboard.dart](./lib/sdl3/ex/sdl/clipboard/lib_sdl_clipboard.dart)
- [x] ~~lib_sdl_cpuinfo.dart~~
- [x] [lib_sdl_dialog.dart](./lib/sdl3/ex/sdl/dialog/lib_sdl_dialog.dart)
- [x] ~~lib_sdl_error.dart~~
- [x] [lib_sdl_events.dart](./lib/sdl3/ex/sdl/events/lib_sdl_events.dart)
- [x] [lib_sdl_filesystem.dart](./lib/sdl3/ex/sdl/filesystem/lib_sdl_filesystem.dart)
- [x] [lib_sdl_gamepad.dart](./lib/sdl3/ex/sdl/gamepad/lib_sdl_gamepad.dart)
- [x] [lib_sdl_gpu.dart](./lib/sdl3/ex/sdl/gpu/lib_sdl_gpu.dart)
- [x] [lib_sdl_guid.dart](./lib/sdl3/ex/sdl/guid/lib_sdl_guid.dart)
- [x] [lib_sdl_haptic.dart](./lib/sdl3/ex/sdl/haptic/lib_sdl_haptic.dart)
- [x] [lib_sdl_hidapi.dart](./lib/sdl3/ex/sdl/hidapi/lib_sdl_hidapi.dart)
- [x] ~~lib_sdl_hints.dart~~
- [x] [lib_sdl_image.dart](./lib/sdl3/ex/image/lib_sdl_image.dart)
- [x] ~~lib_sdl_init.dart~~
- [x] [lib_sdl_iostream.dart](./lib/sdl3/ex/sdl/iostream/lib_sdl_iostream.dart)
- [x] [lib_sdl_joystick.dart](./lib/sdl3/ex/sdl/joystick/lib_sdl_joystick.dart)
- [x] [lib_sdl_keyboard.dart](./lib/sdl3/ex/sdl/keyboard/lib_sdl_keyboard.dart)
- [x] ~~lib_sdl_loadso.dart~~ Please use dart:ffi.
- [x] [lib_sdl_locale.dart](./lib/sdl3/ex/sdl/locale/lib_sdl_locale.dart)
- [x] ~~lib_sdl_log.dart~~
- [x] ~~lib_sdl_main.dart~~ Not supported. SDL3 main callbacks (SDL_AppInit) require compiling a C-level entry point.
- [x] [lib_sdl_messagebox.dart](./lib/sdl3/ex/sdl/messagebox/lib_sdl_messagebox.dart)
- [x] ~~lib_sdl_metal.dart~~
- [x] ~~lib_sdl_misc.dart~~
- [x] [lib_sdl_mixer.dart](./lib/sdl3/ex/mixer/lib_sdl_mixer.dart)
- [x] [lib_sdl_mouse.dart](./lib/sdl3/ex/sdl/mouse/lib_sdl_mouse.dart)
- [x] ~~lib_sdl_mutex.dart~~ Please use Dart async utilities or Mutex packages.
- [x] [lib_sdl_net.dart](./lib/sdl3/ex/net/lib_sdl_net.dart)
- [x] [lib_sdl_notification.dart](./lib/sdl3/ex/sdl/notification/lib_sdl_notification.dart)
- [x] ~~lib_sdl_opengl.dart~~
- [x] ~~lib_sdl_opengl_glext.dart~~
- [x] ~~lib_sdl_openxr.dart~~ Not supported. XR rendering pipelines should be handled directly in native C/C++.
- [x] ~~lib_sdl_pen.dart~~
- [x] [lib_sdl_pixels.dart](./lib/sdl3/ex/sdl/pixels/lib_sdl_pixels.dart)
- [x] ~~lib_sdl_platform.dart~~
- [x] [lib_sdl_power.dart](./lib/sdl3/ex/sdl/power/lib_sdl_power.dart)
- [x] [lib_sdl_process.dart](./lib/sdl3/ex/sdl/process/lib_sdl_process.dart)
- [x] [lib_sdl_properties.dart](./lib/sdl3/ex/sdl/properties/lib_sdl_properties.dart)
- [x] [lib_sdl_rect.dart](./lib/sdl3/ex/sdl/rect/lib_sdl_rect.dart)
- [x] [lib_sdl_render.dart](./lib/sdl3/ex/sdl/render/lib_sdl_render.dart)
- [x] [lib_sdl_sensor.dart](./lib/sdl3/ex/sdl/sensor/lib_sdl_sensor.dart)
- [x] [lib_sdl_shadercross.dart](./lib/sdl3/ex/shadercross/lib_sdl_shadercross.dart)
- [x] [lib_sdl_stdinc.dart](./lib/sdl3/ex/sdl/stdinc/lib_sdl_stdinc.dart)
- [x] [lib_sdl_storage.dart](./lib/sdl3/ex/sdl/storage/lib_sdl_storage.dart)
- [x] [lib_sdl_surface.dart](./lib/sdl3/ex/sdl/surface/lib_sdl_surface.dart)
- [x] [lib_sdl_system.dart](./lib/sdl3/ex/sdl/system/lib_sdl_system.dart)
- [x] ~~lib_sdl_thread.dart~~ Please use Dart Isolates.
- [x] [lib_sdl_time.dart](./lib/sdl3/ex/sdl/time/lib_sdl_time.dart)
- [x] ~~lib_sdl_timer.dart~~
- [x] [lib_sdl_touch.dart](./lib/sdl3/ex/sdl/touch/lib_sdl_touch.dart)
- [x] [lib_sdl_tray.dart](./lib/sdl3/ex/sdl/tray/lib_sdl_tray.dart)
- [x] [lib_sdl_ttf.dart](./lib/sdl3/ex/ttf/lib_sdl_ttf.dart)
- [x] ~~lib_sdl_version.dart~~
- [x] [lib_sdl_video.dart](./lib/sdl3/ex/sdl/video/lib_sdl_video.dart)
- [x] [lib_sdl_vulkan.dart](./lib/sdl3/ex/sdl/vulkan/lib_sdl_vulkan.dart)
