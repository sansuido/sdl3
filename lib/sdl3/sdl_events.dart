import 'dart:ffi';

import 'package:ffi/ffi.dart' as ffi;

import 'dylib.dart' as dylib;

import 'sdl.dart';
import 'sdl_dart.dart';

part 'events/lib_sdl_events.dart';
part 'events/sdl_00_common_event.dart';
part 'events/sdl_01_display_event.dart';
part 'events/sdl_02_window_event.dart';
part 'events/sdl_03_keyboard_device_event.dart';
part 'events/sdl_04_keyboard_event.dart';
part 'events/sdl_05_text_editing_event.dart';
part 'events/sdl_06_text_editing_candidates_event.dart';
part 'events/sdl_07_text_input_event.dart';
part 'events/sdl_08_mouse_device_event.dart';
part 'events/sdl_09_mouse_motion_event.dart';
part 'events/sdl_10_mouse_button_event.dart';
part 'events/sdl_11_mouse_wheel_event.dart';
part 'events/sdl_12_joy_device_event.dart';
part 'events/sdl_13_joy_axis_event.dart';
part 'events/sdl_14_joy_ball_event.dart';
part 'events/sdl_15_joy_hat_event.dart';
part 'events/sdl_16_joy_button_event.dart';
part 'events/sdl_17_joy_battery_event.dart';
part 'events/sdl_18_gamepad_device_event.dart';
part 'events/sdl_19_gamepad_axis_event.dart';
part 'events/sdl_20_gamepad_button_event.dart';
part 'events/sdl_21_gamepad_touchpad_event.dart';
part 'events/sdl_22_gamepad_sensor_event.dart';
part 'events/sdl_23_gamepad_can_sense_event.dart';
part 'events/sdl_24_audio_device_event.dart';
part 'events/sdl_25_camera_device_event.dart';
part 'events/sdl_26_sensor_event.dart';
part 'events/sdl_27_quit_event.dart';
part 'events/sdl_28_user_event.dart';
part 'events/sdl_29_touch_finger_event.dart';
part 'events/sdl_30_pinch_finger_event.dart';
part 'events/sdl_31_pen_proximity_event.dart';
part 'events/sdl_32_pen_touch_event.dart';
part 'events/sdl_33_pen_motion_event.dart';
part 'events/sdl_34_pen_button_event.dart';
part 'events/sdl_35_pen_axis_event.dart';
part 'events/sdl_36_render_event.dart';
part 'events/sdl_37_drop_event.dart';
part 'events/sdl_38_clipboard_event.dart';
part 'events/sdl_39_notification_event.dart';
part 'events/sdl_event.dart';

part 'generated/lib_sdl_events.dart';

final DynamicLibrary _libSdl = dylib.SdlDynamicLibraryService().open('sdl');
