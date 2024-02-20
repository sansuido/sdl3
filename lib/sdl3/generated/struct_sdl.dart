// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';

// SDL_AssertData
final class SdlAssertData extends Struct {
  // [0]+(4)
  @Int32()
  external int alwaysIgnore;
  // [4]+(4)
  @Uint32()
  external int triggerCount;
  // [8]+(8)
  external Pointer<Utf8> condition;
  // [16]+(8)
  external Pointer<Utf8> filename;
  // [24]+(4)
  @Int32()
  external int linenum;
  // [] +(4)
  @Uint32()
  external int blank_1;
  // [32]+(8)
  external Pointer<Utf8> function;
  // [40]+(8)
  external Pointer<SdlAssertData> next;
}

// SDL_AtomicInt
final class SdlAtomicInt extends Struct {
  // [0]+(4)
  @Int32()
  external int value;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_AudioSpec
final class SdlAudioSpec extends Struct {
  // [0]+(2)
  @Uint16()
  external int format;
  // [] +(2)
  @Uint16()
  external int blank_1;
  // [4]+(4)
  @Int32()
  external int channels;
  // [8]+(4)
  @Int32()
  external int freq;
  // [] +(4)
  @Uint32()
  external int blank_2;
}

// SDL_AudioStream
final class SdlAudioStream extends Opaque {}

// SDL_CommonEvent
final class SdlCommonEvent extends Struct {
  // [0]+(4)
  @Uint32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
}

// SDL_DisplayEvent
final class SdlDisplayEvent extends Struct {
  // [0]+(4)
  @Uint32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
  // [16]+(4)
  @Uint32()
  external int displayId;
  // [20]+(4)
  @Int32()
  external int data1;
}

// SDL_WindowEvent
final class SdlWindowEvent extends Struct {
  // [0]+(4)
  @Uint32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
  // [16]+(4)
  @Uint32()
  external int windowId;
  // [20]+(4)
  @Int32()
  external int data1;
  // [24]+(4)
  @Int32()
  external int data2;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_KeyboardEvent
final class SdlKeyboardEvent extends Struct {
  // [0]+(4)
  @Uint32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
  // [16]+(4)
  @Uint32()
  external int windowId;
  // [20]+(1)
  @Uint8()
  external int state;
  // [21]+(1)
  @Uint8()
  external int repeat;
  // [22]+(1)
  @Uint8()
  external int padding2;
  // [23]+(1)
  @Uint8()
  external int padding3;
  // [24]+(16)
  @Uint64()
  external int keysym_1;
  @Uint64()
  external int keysym_2;
}

extension SdlKeyboardEventExtension on Pointer<SdlKeyboardEvent> {
  Pointer<SdlKeysym> get keysym => (cast<Uint8>() + 24).cast<SdlKeysym>();
}

// SDL_TextEditingEvent
final class SdlTextEditingEvent extends Struct {
  // [0]+(4)
  @Uint32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
  // [16]+(4)
  @Uint32()
  external int windowId;
  // [] +(4)
  @Uint32()
  external int blank_1;
  // [24]+(8)
  external Pointer<Int8> text;
  // [32]+(4)
  @Int32()
  external int start;
  // [36]+(4)
  @Int32()
  external int length;
}

// SDL_TextInputEvent
final class SdlTextInputEvent extends Struct {
  // [0]+(4)
  @Uint32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
  // [16]+(4)
  @Uint32()
  external int windowId;
  // [] +(4)
  @Uint32()
  external int blank_1;
  // [24]+(8)
  external Pointer<Int8> text;
}

// SDL_MouseMotionEvent
final class SdlMouseMotionEvent extends Struct {
  // [0]+(4)
  @Uint32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
  // [16]+(4)
  @Uint32()
  external int windowId;
  // [20]+(4)
  @Uint32()
  external int which;
  // [24]+(4)
  @Uint32()
  external int state;
  // [28]+(4)
  @Float()
  external double x;
  // [32]+(4)
  @Float()
  external double y;
  // [36]+(4)
  @Float()
  external double xrel;
  // [40]+(4)
  @Float()
  external double yrel;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_MouseButtonEvent
final class SdlMouseButtonEvent extends Struct {
  // [0]+(4)
  @Uint32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
  // [16]+(4)
  @Uint32()
  external int windowId;
  // [20]+(4)
  @Uint32()
  external int which;
  // [24]+(1)
  @Uint8()
  external int button;
  // [25]+(1)
  @Uint8()
  external int state;
  // [26]+(1)
  @Uint8()
  external int clicks;
  // [27]+(1)
  @Uint8()
  external int padding;
  // [28]+(4)
  @Float()
  external double x;
  // [32]+(4)
  @Float()
  external double y;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_MouseWheelEvent
final class SdlMouseWheelEvent extends Struct {
  // [0]+(4)
  @Uint32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
  // [16]+(4)
  @Uint32()
  external int windowId;
  // [20]+(4)
  @Uint32()
  external int which;
  // [24]+(4)
  @Float()
  external double x;
  // [28]+(4)
  @Float()
  external double y;
  // [32]+(4)
  @Uint32()
  external int direction;
  // [36]+(4)
  @Float()
  external double mouseX;
  // [40]+(4)
  @Float()
  external double mouseY;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_JoyAxisEvent
final class SdlJoyAxisEvent extends Struct {
  // [0]+(4)
  @Uint32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
  // [16]+(4)
  @Uint32()
  external int which;
  // [20]+(1)
  @Uint8()
  external int axis;
  // [21]+(1)
  @Uint8()
  external int padding1;
  // [22]+(1)
  @Uint8()
  external int padding2;
  // [23]+(1)
  @Uint8()
  external int padding3;
  // [24]+(2)
  @Int16()
  external int value;
  // [26]+(2)
  @Uint16()
  external int padding4;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_JoyHatEvent
final class SdlJoyHatEvent extends Struct {
  // [0]+(4)
  @Uint32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
  // [16]+(4)
  @Uint32()
  external int which;
  // [20]+(1)
  @Uint8()
  external int hat;
  // [21]+(1)
  @Uint8()
  external int value;
  // [22]+(1)
  @Uint8()
  external int padding1;
  // [23]+(1)
  @Uint8()
  external int padding2;
}

// SDL_JoyButtonEvent
final class SdlJoyButtonEvent extends Struct {
  // [0]+(4)
  @Uint32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
  // [16]+(4)
  @Uint32()
  external int which;
  // [20]+(1)
  @Uint8()
  external int button;
  // [21]+(1)
  @Uint8()
  external int state;
  // [22]+(1)
  @Uint8()
  external int padding1;
  // [23]+(1)
  @Uint8()
  external int padding2;
}

// SDL_JoyDeviceEvent
final class SdlJoyDeviceEvent extends Struct {
  // [0]+(4)
  @Uint32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
  // [16]+(4)
  @Uint32()
  external int which;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_JoyBatteryEvent
final class SdlJoyBatteryEvent extends Struct {
  // [0]+(4)
  @Uint32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
  // [16]+(4)
  @Uint32()
  external int which;
  // [20]+(4)
  @Int32()
  external int level;
}

// SDL_GamepadAxisEvent
final class SdlGamepadAxisEvent extends Struct {
  // [0]+(4)
  @Uint32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
  // [16]+(4)
  @Uint32()
  external int which;
  // [20]+(1)
  @Uint8()
  external int axis;
  // [21]+(1)
  @Uint8()
  external int padding1;
  // [22]+(1)
  @Uint8()
  external int padding2;
  // [23]+(1)
  @Uint8()
  external int padding3;
  // [24]+(2)
  @Int16()
  external int value;
  // [26]+(2)
  @Uint16()
  external int padding4;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_GamepadButtonEvent
final class SdlGamepadButtonEvent extends Struct {
  // [0]+(4)
  @Uint32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
  // [16]+(4)
  @Uint32()
  external int which;
  // [20]+(1)
  @Uint8()
  external int button;
  // [21]+(1)
  @Uint8()
  external int state;
  // [22]+(1)
  @Uint8()
  external int padding1;
  // [23]+(1)
  @Uint8()
  external int padding2;
}

// SDL_GamepadDeviceEvent
final class SdlGamepadDeviceEvent extends Struct {
  // [0]+(4)
  @Uint32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
  // [16]+(4)
  @Uint32()
  external int which;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_GamepadTouchpadEvent
final class SdlGamepadTouchpadEvent extends Struct {
  // [0]+(4)
  @Uint32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
  // [16]+(4)
  @Uint32()
  external int which;
  // [20]+(4)
  @Int32()
  external int touchpad;
  // [24]+(4)
  @Int32()
  external int finger;
  // [28]+(4)
  @Float()
  external double x;
  // [32]+(4)
  @Float()
  external double y;
  // [36]+(4)
  @Float()
  external double pressure;
}

// SDL_GamepadSensorEvent
final class SdlGamepadSensorEvent extends Struct {
  // [0]+(4)
  @Uint32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
  // [16]+(4)
  @Uint32()
  external int which;
  // [20]+(4)
  @Int32()
  external int sensor;
  // [24]+(4*3)
  @Float()
  external double data_1;
  @Float()
  external double data_2;
  @Float()
  external double data_3;
  // [] +(4)
  @Uint32()
  external int blank_1;
  // [40]+(8)
  @Uint64()
  external int sensorTimestamp;
}

// SDL_AudioDeviceEvent
final class SdlAudioDeviceEvent extends Struct {
  // [0]+(4)
  @Uint32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
  // [16]+(4)
  @Uint32()
  external int which;
  // [20]+(1)
  @Uint8()
  external int iscapture;
  // [21]+(1)
  @Uint8()
  external int padding1;
  // [22]+(1)
  @Uint8()
  external int padding2;
  // [23]+(1)
  @Uint8()
  external int padding3;
}

// SDL_TouchFingerEvent
final class SdlTouchFingerEvent extends Struct {
  // [0]+(4)
  @Uint32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
  // [16]+(8)
  @Uint64()
  external int touchId;
  // [24]+(8)
  @Uint64()
  external int fingerId;
  // [32]+(4)
  @Float()
  external double x;
  // [36]+(4)
  @Float()
  external double y;
  // [40]+(4)
  @Float()
  external double dx;
  // [44]+(4)
  @Float()
  external double dy;
  // [48]+(4)
  @Float()
  external double pressure;
  // [52]+(4)
  @Uint32()
  external int windowId;
}

// SDL_PenTipEvent
final class SdlPenTipEvent extends Struct {
  // [0]+(4)
  @Uint32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
  // [16]+(4)
  @Uint32()
  external int windowId;
  // [20]+(4)
  @Uint32()
  external int which;
  // [24]+(1)
  @Uint8()
  external int tip;
  // [25]+(1)
  @Uint8()
  external int state;
  // [26]+(2)
  @Uint16()
  external int penState;
  // [28]+(4)
  @Float()
  external double x;
  // [32]+(4)
  @Float()
  external double y;
  // [36]+(4*6)
  @Float()
  external double axes_1;
  @Float()
  external double axes_2;
  @Float()
  external double axes_3;
  @Float()
  external double axes_4;
  @Float()
  external double axes_5;
  @Float()
  external double axes_6;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_PenMotionEvent
final class SdlPenMotionEvent extends Struct {
  // [0]+(4)
  @Uint32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
  // [16]+(4)
  @Uint32()
  external int windowId;
  // [20]+(4)
  @Uint32()
  external int which;
  // [24]+(1)
  @Uint8()
  external int padding1;
  // [25]+(1)
  @Uint8()
  external int padding2;
  // [26]+(2)
  @Uint16()
  external int penState;
  // [28]+(4)
  @Float()
  external double x;
  // [32]+(4)
  @Float()
  external double y;
  // [36]+(4*6)
  @Float()
  external double axes_1;
  @Float()
  external double axes_2;
  @Float()
  external double axes_3;
  @Float()
  external double axes_4;
  @Float()
  external double axes_5;
  @Float()
  external double axes_6;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_PenButtonEvent
final class SdlPenButtonEvent extends Struct {
  // [0]+(4)
  @Uint32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
  // [16]+(4)
  @Uint32()
  external int windowId;
  // [20]+(4)
  @Uint32()
  external int which;
  // [24]+(1)
  @Uint8()
  external int button;
  // [25]+(1)
  @Uint8()
  external int state;
  // [26]+(2)
  @Uint16()
  external int penState;
  // [28]+(4)
  @Float()
  external double x;
  // [32]+(4)
  @Float()
  external double y;
  // [36]+(4*6)
  @Float()
  external double axes_1;
  @Float()
  external double axes_2;
  @Float()
  external double axes_3;
  @Float()
  external double axes_4;
  @Float()
  external double axes_5;
  @Float()
  external double axes_6;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_DropEvent
final class SdlDropEvent extends Struct {
  // [0]+(4)
  @Uint32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
  // [16]+(4)
  @Uint32()
  external int windowId;
  // [20]+(4)
  @Float()
  external double x;
  // [24]+(4)
  @Float()
  external double y;
  // [] +(4)
  @Uint32()
  external int blank_1;
  // [32]+(8)
  external Pointer<Int8> source;
  // [40]+(8)
  external Pointer<Int8> data;
}

// SDL_ClipboardEvent
final class SdlClipboardEvent extends Struct {
  // [0]+(4)
  @Uint32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
}

// SDL_SensorEvent
final class SdlSensorEvent extends Struct {
  // [0]+(4)
  @Uint32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
  // [16]+(4)
  @Uint32()
  external int which;
  // [20]+(4*6)
  @Float()
  external double data_1;
  @Float()
  external double data_2;
  @Float()
  external double data_3;
  @Float()
  external double data_4;
  @Float()
  external double data_5;
  @Float()
  external double data_6;
  // [] +(4)
  @Uint32()
  external int blank_1;
  // [48]+(8)
  @Uint64()
  external int sensorTimestamp;
}

// SDL_QuitEvent
final class SdlQuitEvent extends Struct {
  // [0]+(4)
  @Uint32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
}

// SDL_UserEvent
final class SdlUserEvent extends Struct {
  // [0]+(4)
  @Uint32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
  // [16]+(4)
  @Uint32()
  external int windowId;
  // [20]+(4)
  @Int32()
  external int code;
  // [24]+(8)
  external Pointer<NativeType> data1;
  // [32]+(8)
  external Pointer<NativeType> data2;
}

// SDL_Event
final class SdlEvent extends Struct {
  // [0]+(128)
  @Uint64()
  external int union_1;
  @Uint64()
  external int union_2;
  @Uint64()
  external int union_3;
  @Uint64()
  external int union_4;
  @Uint64()
  external int union_5;
  @Uint64()
  external int union_6;
  @Uint64()
  external int union_7;
  @Uint64()
  external int union_8;
  @Uint64()
  external int union_9;
  @Uint64()
  external int union_10;
  @Uint64()
  external int union_11;
  @Uint64()
  external int union_12;
  @Uint64()
  external int union_13;
  @Uint64()
  external int union_14;
  @Uint64()
  external int union_15;
  @Uint64()
  external int union_16;
}

extension SdlEventExtension on Pointer<SdlEvent> {
  int get type => (cast<Uint8>() + 0).cast<Uint32>().value;
  Pointer<SdlCommonEvent> get common =>
      (cast<Uint8>() + 0).cast<SdlCommonEvent>();
  Pointer<SdlDisplayEvent> get display =>
      (cast<Uint8>() + 0).cast<SdlDisplayEvent>();
  Pointer<SdlWindowEvent> get window =>
      (cast<Uint8>() + 0).cast<SdlWindowEvent>();
  Pointer<SdlKeyboardEvent> get key =>
      (cast<Uint8>() + 0).cast<SdlKeyboardEvent>();
  Pointer<SdlTextEditingEvent> get edit =>
      (cast<Uint8>() + 0).cast<SdlTextEditingEvent>();
  Pointer<SdlTextInputEvent> get text =>
      (cast<Uint8>() + 0).cast<SdlTextInputEvent>();
  Pointer<SdlMouseMotionEvent> get motion =>
      (cast<Uint8>() + 0).cast<SdlMouseMotionEvent>();
  Pointer<SdlMouseButtonEvent> get button =>
      (cast<Uint8>() + 0).cast<SdlMouseButtonEvent>();
  Pointer<SdlMouseWheelEvent> get wheel =>
      (cast<Uint8>() + 0).cast<SdlMouseWheelEvent>();
  Pointer<SdlJoyAxisEvent> get jaxis =>
      (cast<Uint8>() + 0).cast<SdlJoyAxisEvent>();
  Pointer<SdlJoyHatEvent> get jhat =>
      (cast<Uint8>() + 0).cast<SdlJoyHatEvent>();
  Pointer<SdlJoyButtonEvent> get jbutton =>
      (cast<Uint8>() + 0).cast<SdlJoyButtonEvent>();
  Pointer<SdlJoyDeviceEvent> get jdevice =>
      (cast<Uint8>() + 0).cast<SdlJoyDeviceEvent>();
  Pointer<SdlJoyBatteryEvent> get jbattery =>
      (cast<Uint8>() + 0).cast<SdlJoyBatteryEvent>();
  Pointer<SdlGamepadAxisEvent> get gaxis =>
      (cast<Uint8>() + 0).cast<SdlGamepadAxisEvent>();
  Pointer<SdlGamepadButtonEvent> get gbutton =>
      (cast<Uint8>() + 0).cast<SdlGamepadButtonEvent>();
  Pointer<SdlGamepadDeviceEvent> get gdevice =>
      (cast<Uint8>() + 0).cast<SdlGamepadDeviceEvent>();
  Pointer<SdlGamepadTouchpadEvent> get gtouchpad =>
      (cast<Uint8>() + 0).cast<SdlGamepadTouchpadEvent>();
  Pointer<SdlGamepadSensorEvent> get gsensor =>
      (cast<Uint8>() + 0).cast<SdlGamepadSensorEvent>();
  Pointer<SdlAudioDeviceEvent> get adevice =>
      (cast<Uint8>() + 0).cast<SdlAudioDeviceEvent>();
  Pointer<SdlSensorEvent> get sensor =>
      (cast<Uint8>() + 0).cast<SdlSensorEvent>();
  Pointer<SdlQuitEvent> get quit => (cast<Uint8>() + 0).cast<SdlQuitEvent>();
  Pointer<SdlUserEvent> get user => (cast<Uint8>() + 0).cast<SdlUserEvent>();
  Pointer<SdlTouchFingerEvent> get tfinger =>
      (cast<Uint8>() + 0).cast<SdlTouchFingerEvent>();
  Pointer<SdlPenTipEvent> get ptip =>
      (cast<Uint8>() + 0).cast<SdlPenTipEvent>();
  Pointer<SdlPenMotionEvent> get pmotion =>
      (cast<Uint8>() + 0).cast<SdlPenMotionEvent>();
  Pointer<SdlPenButtonEvent> get pbutton =>
      (cast<Uint8>() + 0).cast<SdlPenButtonEvent>();
  Pointer<SdlDropEvent> get drop => (cast<Uint8>() + 0).cast<SdlDropEvent>();
  Pointer<SdlClipboardEvent> get clipboard =>
      (cast<Uint8>() + 0).cast<SdlClipboardEvent>();
  int get padding => (cast<Uint8>() + 0).cast<Uint8>().value;
}

// SDL_Gamepad
final class SdlGamepad extends Opaque {}

// SDL_GamepadBinding
final class SdlGamepadBinding extends Struct {
  // [0]+(4)
  @Int32()
  external int inputType;
  // [] +(4)
  @Uint32()
  external int blank_1;
  // [8]+(8)
  external Pointer<NativeType> input;
  // [16]+(4)
  @Int32()
  external int outputType;
  // [] +(4)
  @Uint32()
  external int blank_2;
  // [24]+(8)
  external Pointer<NativeType> output;
}

// SDL_GUID
final class SdlGuid extends Struct {
  // [0]+(1*16)
  @Uint8()
  external int data_1;
  @Uint8()
  external int data_2;
  @Uint8()
  external int data_3;
  @Uint8()
  external int data_4;
  @Uint8()
  external int data_5;
  @Uint8()
  external int data_6;
  @Uint8()
  external int data_7;
  @Uint8()
  external int data_8;
  @Uint8()
  external int data_9;
  @Uint8()
  external int data_10;
  @Uint8()
  external int data_11;
  @Uint8()
  external int data_12;
  @Uint8()
  external int data_13;
  @Uint8()
  external int data_14;
  @Uint8()
  external int data_15;
  @Uint8()
  external int data_16;
}

// SDL_Haptic
final class SdlHaptic extends Opaque {}

// SDL_HapticDirection
final class SdlHapticDirection extends Struct {
  // [0]+(1)
  @Uint8()
  external int type;
  // [] +(3)
  @Uint16()
  external int blank_1;
  @Uint8()
  external int blank_2;
  // [4]+(4*3)
  @Int32()
  external int dir_1;
  @Int32()
  external int dir_2;
  @Int32()
  external int dir_3;
}

// SDL_HapticConstant
final class SdlHapticConstant extends Struct {
  // [0]+(2)
  @Uint16()
  external int type;
  // [] +(6)
  @Uint32()
  external int blank_1;
  @Uint16()
  external int blank_2;
  // [8]+(16)
  @Uint64()
  external int direction_1;
  @Uint64()
  external int direction_2;
  // [24]+(4)
  @Uint32()
  external int length;
  // [28]+(2)
  @Uint16()
  external int delay;
  // [30]+(2)
  @Uint16()
  external int button;
  // [32]+(2)
  @Uint16()
  external int interval;
  // [34]+(2)
  @Int16()
  external int level;
  // [36]+(2)
  @Uint16()
  external int attackLength;
  // [38]+(2)
  @Uint16()
  external int attackLevel;
  // [40]+(2)
  @Uint16()
  external int fadeLength;
  // [42]+(2)
  @Uint16()
  external int fadeLevel;
  // [] +(4)
  @Uint32()
  external int blank_3;
}

extension SdlHapticConstantExtension on Pointer<SdlHapticConstant> {
  Pointer<SdlHapticDirection> get direction =>
      (cast<Uint8>() + 8).cast<SdlHapticDirection>();
}

// SDL_HapticPeriodic
final class SdlHapticPeriodic extends Struct {
  // [0]+(2)
  @Uint16()
  external int type;
  // [] +(6)
  @Uint32()
  external int blank_1;
  @Uint16()
  external int blank_2;
  // [8]+(16)
  @Uint64()
  external int direction_1;
  @Uint64()
  external int direction_2;
  // [24]+(4)
  @Uint32()
  external int length;
  // [28]+(2)
  @Uint16()
  external int delay;
  // [30]+(2)
  @Uint16()
  external int button;
  // [32]+(2)
  @Uint16()
  external int interval;
  // [34]+(2)
  @Uint16()
  external int period;
  // [36]+(2)
  @Int16()
  external int magnitude;
  // [38]+(2)
  @Int16()
  external int offset;
  // [40]+(2)
  @Uint16()
  external int phase;
  // [42]+(2)
  @Uint16()
  external int attackLength;
  // [44]+(2)
  @Uint16()
  external int attackLevel;
  // [46]+(2)
  @Uint16()
  external int fadeLength;
  // [48]+(2)
  @Uint16()
  external int fadeLevel;
  // [] +(6)
  @Uint32()
  external int blank_3;
  @Uint16()
  external int blank_4;
}

extension SdlHapticPeriodicExtension on Pointer<SdlHapticPeriodic> {
  Pointer<SdlHapticDirection> get direction =>
      (cast<Uint8>() + 8).cast<SdlHapticDirection>();
}

// SDL_HapticCondition
final class SdlHapticCondition extends Struct {
  // [0]+(2)
  @Uint16()
  external int type;
  // [] +(6)
  @Uint32()
  external int blank_1;
  @Uint16()
  external int blank_2;
  // [8]+(16)
  @Uint64()
  external int direction_1;
  @Uint64()
  external int direction_2;
  // [24]+(4)
  @Uint32()
  external int length;
  // [28]+(2)
  @Uint16()
  external int delay;
  // [30]+(2)
  @Uint16()
  external int button;
  // [32]+(2)
  @Uint16()
  external int interval;
  // [34]+(2*3)
  @Uint16()
  external int rightSat_1;
  @Uint16()
  external int rightSat_2;
  @Uint16()
  external int rightSat_3;
  // [40]+(2*3)
  @Uint16()
  external int leftSat_1;
  @Uint16()
  external int leftSat_2;
  @Uint16()
  external int leftSat_3;
  // [46]+(2*3)
  @Int16()
  external int rightCoeff_1;
  @Int16()
  external int rightCoeff_2;
  @Int16()
  external int rightCoeff_3;
  // [52]+(2*3)
  @Int16()
  external int leftCoeff_1;
  @Int16()
  external int leftCoeff_2;
  @Int16()
  external int leftCoeff_3;
  // [58]+(2*3)
  @Uint16()
  external int deadband_1;
  @Uint16()
  external int deadband_2;
  @Uint16()
  external int deadband_3;
  // [64]+(2*3)
  @Int16()
  external int center_1;
  @Int16()
  external int center_2;
  @Int16()
  external int center_3;
  // [] +(2)
  @Uint16()
  external int blank_3;
}

extension SdlHapticConditionExtension on Pointer<SdlHapticCondition> {
  Pointer<SdlHapticDirection> get direction =>
      (cast<Uint8>() + 8).cast<SdlHapticDirection>();
}

// SDL_HapticRamp
final class SdlHapticRamp extends Struct {
  // [0]+(2)
  @Uint16()
  external int type;
  // [] +(6)
  @Uint32()
  external int blank_1;
  @Uint16()
  external int blank_2;
  // [8]+(16)
  @Uint64()
  external int direction_1;
  @Uint64()
  external int direction_2;
  // [24]+(4)
  @Uint32()
  external int length;
  // [28]+(2)
  @Uint16()
  external int delay;
  // [30]+(2)
  @Uint16()
  external int button;
  // [32]+(2)
  @Uint16()
  external int interval;
  // [34]+(2)
  @Int16()
  external int start;
  // [36]+(2)
  @Int16()
  external int end;
  // [38]+(2)
  @Uint16()
  external int attackLength;
  // [40]+(2)
  @Uint16()
  external int attackLevel;
  // [42]+(2)
  @Uint16()
  external int fadeLength;
  // [44]+(2)
  @Uint16()
  external int fadeLevel;
  // [] +(2)
  @Uint16()
  external int blank_3;
}

extension SdlHapticRampExtension on Pointer<SdlHapticRamp> {
  Pointer<SdlHapticDirection> get direction =>
      (cast<Uint8>() + 8).cast<SdlHapticDirection>();
}

// SDL_HapticLeftRight
final class SdlHapticLeftRight extends Struct {
  // [0]+(2)
  @Uint16()
  external int type;
  // [] +(2)
  @Uint16()
  external int blank_1;
  // [4]+(4)
  @Uint32()
  external int length;
  // [8]+(2)
  @Uint16()
  external int largeMagnitude;
  // [10]+(2)
  @Uint16()
  external int smallMagnitude;
  // [] +(4)
  @Uint32()
  external int blank_2;
}

// SDL_HapticCustom
final class SdlHapticCustom extends Struct {
  // [0]+(2)
  @Uint16()
  external int type;
  // [] +(6)
  @Uint32()
  external int blank_1;
  @Uint16()
  external int blank_2;
  // [8]+(16)
  @Uint64()
  external int direction_1;
  @Uint64()
  external int direction_2;
  // [24]+(4)
  @Uint32()
  external int length;
  // [28]+(2)
  @Uint16()
  external int delay;
  // [30]+(2)
  @Uint16()
  external int button;
  // [32]+(2)
  @Uint16()
  external int interval;
  // [34]+(1)
  @Uint8()
  external int channels;
  // [] +(1)
  @Uint8()
  external int blank_3;
  // [36]+(2)
  @Uint16()
  external int period;
  // [38]+(2)
  @Uint16()
  external int samples;
  // [40]+(8)
  external Pointer<Uint16> data;
  // [48]+(2)
  @Uint16()
  external int attackLength;
  // [50]+(2)
  @Uint16()
  external int attackLevel;
  // [52]+(2)
  @Uint16()
  external int fadeLength;
  // [54]+(2)
  @Uint16()
  external int fadeLevel;
}

extension SdlHapticCustomExtension on Pointer<SdlHapticCustom> {
  Pointer<SdlHapticDirection> get direction =>
      (cast<Uint8>() + 8).cast<SdlHapticDirection>();
}

// SDL_HapticEffect
final class SdlHapticEffect extends Struct {
  // [0]+(72)
  @Uint64()
  external int union_1;
  @Uint64()
  external int union_2;
  @Uint64()
  external int union_3;
  @Uint64()
  external int union_4;
  @Uint64()
  external int union_5;
  @Uint64()
  external int union_6;
  @Uint64()
  external int union_7;
  @Uint64()
  external int union_8;
  @Uint64()
  external int union_9;
}

extension SdlHapticEffectExtension on Pointer<SdlHapticEffect> {
  int get type => (cast<Uint8>() + 0).cast<Uint16>().value;
  Pointer<SdlHapticConstant> get ant =>
      (cast<Uint8>() + 0).cast<SdlHapticConstant>();
  Pointer<SdlHapticPeriodic> get periodic =>
      (cast<Uint8>() + 0).cast<SdlHapticPeriodic>();
  Pointer<SdlHapticCondition> get condition =>
      (cast<Uint8>() + 0).cast<SdlHapticCondition>();
  Pointer<SdlHapticRamp> get ramp => (cast<Uint8>() + 0).cast<SdlHapticRamp>();
  Pointer<SdlHapticLeftRight> get leftright =>
      (cast<Uint8>() + 0).cast<SdlHapticLeftRight>();
  Pointer<SdlHapticCustom> get custom =>
      (cast<Uint8>() + 0).cast<SdlHapticCustom>();
}

// SDL_hid_device
final class SdlHidDevice extends Opaque {}

// SDL_hid_device_info
final class SdlHidDeviceInfo extends Struct {
  // [0]+(8)
  external Pointer<Int8> path;
  // [8]+(2)
  @Uint16()
  external int vendorId;
  // [10]+(2)
  @Uint16()
  external int productId;
  // [] +(4)
  @Uint32()
  external int blank_1;
  // [16]+(8)
  external Pointer<Int16> serialNumber;
  // [24]+(2)
  @Uint16()
  external int releaseNumber;
  // [] +(6)
  @Uint32()
  external int blank_2;
  @Uint16()
  external int blank_3;
  // [32]+(8)
  external Pointer<Int16> manufacturerString;
  // [40]+(8)
  external Pointer<Int16> productString;
  // [48]+(2)
  @Uint16()
  external int usagePage;
  // [50]+(2)
  @Uint16()
  external int usage;
  // [52]+(4)
  @Int32()
  external int interfaceNumber;
  // [56]+(4)
  @Int32()
  external int interfaceClass;
  // [60]+(4)
  @Int32()
  external int interfaceSubclass;
  // [64]+(4)
  @Int32()
  external int interfaceProtocol;
  // [68]+(4)
  @Int32()
  external int busType;
  // [72]+(8)
  external Pointer<SdlHidDeviceInfo> next;
}

// SDL_Joystick
final class SdlJoystick extends Opaque {}

// SDL_VirtualJoystickDesc
final class SdlVirtualJoystickDesc extends Struct {
  // [0]+(2)
  @Uint16()
  external int version;
  // [2]+(2)
  @Uint16()
  external int type;
  // [4]+(2)
  @Uint16()
  external int naxes;
  // [6]+(2)
  @Uint16()
  external int nbuttons;
  // [8]+(2)
  @Uint16()
  external int nhats;
  // [10]+(2)
  @Uint16()
  external int vendorId;
  // [12]+(2)
  @Uint16()
  external int productId;
  // [14]+(2)
  @Uint16()
  external int padding;
  // [16]+(4)
  @Uint32()
  external int buttonMask;
  // [20]+(4)
  @Uint32()
  external int axisMask;
  // [24]+(8)
  external Pointer<Utf8> name;
  // [32]+(8)
  external Pointer<NativeType> userdata;
  // [40]+(8)
  external Pointer<NativeType> update;
  // [48]+(8)
  external Pointer<NativeType> setPlayerIndex;
  // [56]+(8)
  external Pointer<NativeType> rumble;
  // [64]+(8)
  external Pointer<NativeType> rumbleTriggers;
  // [72]+(8)
  external Pointer<NativeType> setLed;
  // [80]+(8)
  external Pointer<NativeType> sendEffect;
}

// SDL_Keysym
final class SdlKeysym extends Struct {
  // [0]+(4)
  @Int32()
  external int scancode;
  // [4]+(4)
  @Int32()
  external int sym;
  // [8]+(2)
  @Uint16()
  external int mod;
  // [] +(2)
  @Uint16()
  external int blank_1;
  // [12]+(4)
  @Uint32()
  external int unused;
}

// SDL_Locale
final class SdlLocale extends Struct {
  // [0]+(8)
  external Pointer<Utf8> language;
  // [8]+(8)
  external Pointer<Utf8> country;
}

// HINSTANCE
final class HINSTANCE extends Opaque {}

// SDL_MessageBoxButtonData
final class SdlMessageBoxButtonData extends Struct {
  // [0]+(4)
  @Uint32()
  external int flags;
  // [4]+(4)
  @Int32()
  external int buttonId;
  // [8]+(8)
  external Pointer<Utf8> text;
}

// SDL_MessageBoxColor
final class SdlMessageBoxColor extends Struct {
  // [0]+(1)
  @Uint8()
  external int r;
  // [1]+(1)
  @Uint8()
  external int g;
  // [2]+(1)
  @Uint8()
  external int b;
  // [] +(5)
  @Uint32()
  external int blank_1;
  @Uint8()
  external int blank_2;
}

// SDL_MessageBoxColorScheme
final class SdlMessageBoxColorScheme extends Struct {
  // [0]+(8*5)
  @Uint64()
  external int colors_1;
  @Uint64()
  external int colors_2;
  @Uint64()
  external int colors_3;
  @Uint64()
  external int colors_4;
  @Uint64()
  external int colors_5;
}

extension SdlMessageBoxColorSchemeExtension
    on Pointer<SdlMessageBoxColorScheme> {
  List<SdlMessageBoxColor> get colors {
    var list = <SdlMessageBoxColor>[];
    for (var i = 0; i < 5; i++) {
      list.add((cast<Uint8>() + 0 + i * 8).cast<SdlMessageBoxColor>().ref);
    }
    return list;
  }
}

// SDL_MessageBoxData
final class SdlMessageBoxData extends Struct {
  // [0]+(4)
  @Uint32()
  external int flags;
  // [] +(4)
  @Uint32()
  external int blank_1;
  // [8]+(8)
  external Pointer<SdlWindow> window;
  // [16]+(8)
  external Pointer<Utf8> title;
  // [24]+(8)
  external Pointer<Utf8> message;
  // [32]+(4)
  @Int32()
  external int numbuttons;
  // [] +(4)
  @Uint32()
  external int blank_2;
  // [40]+(8)
  external Pointer<SdlMessageBoxButtonData> buttons;
  // [48]+(8)
  external Pointer<SdlMessageBoxColorScheme> colorScheme;
}

// SDL_Cursor
final class SdlCursor extends Opaque {}

// SDL_Mutex
final class SdlMutex extends Opaque {}

// SDL_RWLock
final class SdlRwLock extends Opaque {}

// SDL_Semaphore
final class SdlSemaphore extends Opaque {}

// SDL_Condition
final class SdlCondition extends Opaque {}

// SDL_PenCapabilityInfo
final class SdlPenCapabilityInfo extends Struct {
  // [0]+(4)
  @Float()
  external double maxTilt;
  // [4]+(4)
  @Uint32()
  external int wacomId;
  // [8]+(1)
  @Int8()
  external int numButtons;
  // [] +(7)
  @Uint32()
  external int blank_1;
  @Uint16()
  external int blank_2;
  @Uint8()
  external int blank_3;
}

// SDL_Color
final class SdlColor extends Struct {
  // [0]+(1)
  @Uint8()
  external int r;
  // [1]+(1)
  @Uint8()
  external int g;
  // [2]+(1)
  @Uint8()
  external int b;
  // [3]+(1)
  @Uint8()
  external int a;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_FColor
final class SdlFColor extends Struct {
  // [0]+(4)
  @Float()
  external double r;
  // [4]+(4)
  @Float()
  external double g;
  // [8]+(4)
  @Float()
  external double b;
  // [12]+(4)
  @Float()
  external double a;
}

// SDL_Palette
final class SdlPalette extends Struct {
  // [0]+(4)
  @Int32()
  external int ncolors;
  // [] +(4)
  @Uint32()
  external int blank_1;
  // [8]+(8)
  external Pointer<SdlColor> colors;
  // [16]+(4)
  @Uint32()
  external int version;
  // [20]+(4)
  @Int32()
  external int refcount;
}

// SDL_PixelFormat
final class SdlPixelFormat extends Struct {
  // [0]+(4)
  @Uint32()
  external int format;
  // [] +(4)
  @Uint32()
  external int blank_1;
  // [8]+(8)
  external Pointer<SdlPalette> palette;
  // [16]+(1)
  @Uint8()
  external int bitsPerPixel;
  // [17]+(1)
  @Uint8()
  external int bytesPerPixel;
  // [18]+(1*2)
  @Uint8()
  external int padding_1;
  @Uint8()
  external int padding_2;
  // [20]+(4)
  @Uint32()
  external int rmask;
  // [24]+(4)
  @Uint32()
  external int gmask;
  // [28]+(4)
  @Uint32()
  external int bmask;
  // [32]+(4)
  @Uint32()
  external int amask;
  // [36]+(1)
  @Uint8()
  external int rloss;
  // [37]+(1)
  @Uint8()
  external int gloss;
  // [38]+(1)
  @Uint8()
  external int bloss;
  // [39]+(1)
  @Uint8()
  external int aloss;
  // [40]+(1)
  @Uint8()
  external int rshift;
  // [41]+(1)
  @Uint8()
  external int gshift;
  // [42]+(1)
  @Uint8()
  external int bshift;
  // [43]+(1)
  @Uint8()
  external int ashift;
  // [44]+(4)
  @Int32()
  external int refcount;
  // [48]+(8)
  external Pointer<SdlPixelFormat> next;
}

// SDL_Point
final class SdlPoint extends Struct {
  // [0]+(4)
  @Int32()
  external int x;
  // [4]+(4)
  @Int32()
  external int y;
}

// SDL_FPoint
final class SdlFPoint extends Struct {
  // [0]+(4)
  @Float()
  external double x;
  // [4]+(4)
  @Float()
  external double y;
}

// SDL_Rect
final class SdlRect extends Struct {
  // [0]+(4)
  @Int32()
  external int x;
  // [4]+(4)
  @Int32()
  external int y;
  // [8]+(4)
  @Int32()
  external int w;
  // [12]+(4)
  @Int32()
  external int h;
}

// SDL_FRect
final class SdlFRect extends Struct {
  // [0]+(4)
  @Float()
  external double x;
  // [4]+(4)
  @Float()
  external double y;
  // [8]+(4)
  @Float()
  external double w;
  // [12]+(4)
  @Float()
  external double h;
}

// SDL_RendererInfo
final class SdlRendererInfo extends Struct {
  // [0]+(8)
  external Pointer<Utf8> name;
  // [8]+(4)
  @Uint32()
  external int flags;
  // [12]+(4)
  @Uint32()
  external int numTextureFormats;
  // [16]+(4*16)
  @Uint32()
  external int textureFormats_1;
  @Uint32()
  external int textureFormats_2;
  @Uint32()
  external int textureFormats_3;
  @Uint32()
  external int textureFormats_4;
  @Uint32()
  external int textureFormats_5;
  @Uint32()
  external int textureFormats_6;
  @Uint32()
  external int textureFormats_7;
  @Uint32()
  external int textureFormats_8;
  @Uint32()
  external int textureFormats_9;
  @Uint32()
  external int textureFormats_10;
  @Uint32()
  external int textureFormats_11;
  @Uint32()
  external int textureFormats_12;
  @Uint32()
  external int textureFormats_13;
  @Uint32()
  external int textureFormats_14;
  @Uint32()
  external int textureFormats_15;
  @Uint32()
  external int textureFormats_16;
  // [80]+(4)
  @Int32()
  external int maxTextureWidth;
  // [84]+(4)
  @Int32()
  external int maxTextureHeight;
}

// SDL_Vertex
final class SdlVertex extends Struct {
  // [0]+(8)
  @Uint64()
  external int position_1;
  // [8]+(16)
  @Uint64()
  external int color_1;
  @Uint64()
  external int color_2;
  // [24]+(8)
  @Uint64()
  external int texCoord_1;
}

extension SdlVertexExtension on Pointer<SdlVertex> {
  Pointer<SdlFPoint> get position => (cast<Uint8>() + 0).cast<SdlFPoint>();
  Pointer<SdlFColor> get color => (cast<Uint8>() + 8).cast<SdlFColor>();
  Pointer<SdlFPoint> get texCoord => (cast<Uint8>() + 24).cast<SdlFPoint>();
}

// SDL_Renderer
final class SdlRenderer extends Opaque {}

// SDL_Texture
final class SdlTexture extends Opaque {}

// SDL_RWops
final class SdlRWops extends Struct {
  // [0]+(8)
  external Pointer<NativeType> size;
  // [8]+(8)
  external Pointer<NativeType> seek;
  // [16]+(8)
  external Pointer<NativeType> read;
  // [24]+(8)
  external Pointer<NativeType> write;
  // [32]+(8)
  external Pointer<NativeType> close;
  // [40]+(4)
  @Uint32()
  external int type;
  // [44]+(4)
  @Uint32()
  external int status;
  // [48]+(4)
  @Uint32()
  external int props;
  // [] +(4)
  @Uint32()
  external int blank_1;
  // [56]+(8)
  external Pointer<NativeType> hidden;
}

// SDL_Sensor
final class SdlSensor extends Opaque {}

// SDL_iconv_t
final class SdlIconvT extends Opaque {}

// SDL_BlitMap
final class SdlBlitMap extends Opaque {}

// SDL_Surface
final class SdlSurface extends Struct {
  // [0]+(4)
  @Uint32()
  external int flags;
  // [] +(4)
  @Uint32()
  external int blank_1;
  // [8]+(8)
  external Pointer<SdlPixelFormat> format;
  // [16]+(4)
  @Int32()
  external int w;
  // [20]+(4)
  @Int32()
  external int h;
  // [24]+(4)
  @Int32()
  external int pitch;
  // [] +(4)
  @Uint32()
  external int blank_2;
  // [32]+(8)
  external Pointer<NativeType> pixels;
  // [40]+(8)
  external Pointer<NativeType> reserved;
  // [48]+(4)
  @Int32()
  external int locked;
  // [] +(4)
  @Uint32()
  external int blank_3;
  // [56]+(8)
  external Pointer<NativeType> listBlitmap;
  // [64]+(16)
  @Uint64()
  external int clipRect_1;
  @Uint64()
  external int clipRect_2;
  // [80]+(8)
  external Pointer<Void> map;
  // [88]+(4)
  @Int32()
  external int refcount;
  // [] +(4)
  @Uint32()
  external int blank_4;
}

extension SdlSurfaceExtension on Pointer<SdlSurface> {
  Pointer<SdlRect> get clipRect => (cast<Uint8>() + 64).cast<SdlRect>();
}

// MSG
final class MSG extends Opaque {}

// XEvent
final class XEvent extends Opaque {}

// XTaskQueueHandle
final class XTaskQueueHandle extends Opaque {}

// XUserHandle
final class XUserHandle extends Opaque {}

// SDL_Thread
final class SdlThread extends Opaque {}

// SDL_Finger
final class SdlFinger extends Struct {
  // [0]+(8)
  @Uint64()
  external int id;
  // [8]+(4)
  @Float()
  external double x;
  // [12]+(4)
  @Float()
  external double y;
  // [16]+(4)
  @Float()
  external double pressure;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_Version
final class SdlVersion extends Struct {
  // [0]+(1)
  @Uint8()
  external int major;
  // [1]+(1)
  @Uint8()
  external int minor;
  // [2]+(1)
  @Uint8()
  external int patch;
  // [] +(5)
  @Uint32()
  external int blank_1;
  @Uint8()
  external int blank_2;
}

// SDL_DisplayMode
final class SdlDisplayMode extends Struct {
  // [0]+(4)
  @Uint32()
  external int displayId;
  // [4]+(4)
  @Uint32()
  external int format;
  // [8]+(4)
  @Int32()
  external int w;
  // [12]+(4)
  @Int32()
  external int h;
  // [16]+(4)
  @Float()
  external double pixelDensity;
  // [20]+(4)
  @Float()
  external double refreshRate;
  // [24]+(8)
  external Pointer<NativeType> driverdata;
}

// SDL_Window
final class SdlWindow extends Opaque {}

// SDL_VideoCaptureDevice
final class SdlVideoCaptureDevice extends Opaque {}

// SDL_VideoCaptureSpec
final class SdlVideoCaptureSpec extends Struct {
  // [0]+(4)
  @Uint32()
  external int format;
  // [4]+(4)
  @Int32()
  external int width;
  // [8]+(4)
  @Int32()
  external int height;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_VideoCaptureFrame
final class SdlVideoCaptureFrame extends Struct {
  // [0]+(8)
  @Uint64()
  external int timestampNs;
  // [8]+(4)
  @Int32()
  external int numPlanes;
  // [] +(4)
  @Uint32()
  external int blank_1;
  // [16]+(8*3)
  external Pointer<Uint8> data_1;
  external Pointer<Uint8> data_2;
  external Pointer<Uint8> data_3;
  // [40]+(4*3)
  @Int32()
  external int pitch_1;
  @Int32()
  external int pitch_2;
  @Int32()
  external int pitch_3;
  // [] +(4)
  @Uint32()
  external int blank_2;
  // [56]+(8)
  external Pointer<NativeType> internal;
}
