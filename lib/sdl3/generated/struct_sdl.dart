// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
part of '../sdl.dart';

// SDL_AssertData
/// {@category assert}
final class SdlAssertData extends Struct {
  // [0]+(1)
  @Uint8()
  external int alwaysIgnore;
  // [] +(3)
  @Uint16()
  external int blank_1;
  @Uint8()
  external int blank_2;
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
  external int blank_3;
  // [32]+(8)
  external Pointer<Utf8> function;
  // [40]+(8)
  external Pointer<SdlAssertData> next;
}

// SDL_AsyncIO
/// {@category asyncio}
final class SdlAsyncIo extends Opaque {}

// SDL_AsyncIOOutcome
/// {@category asyncio}
final class SdlAsyncIoOutcome extends Struct {
  // [0]+(8)
  external Pointer<SdlAsyncIo> asyncio;
  // [8]+(4)
  @Int32()
  external int type;
  // [12]+(4)
  @Int32()
  external int result;
  // [16]+(8)
  external Pointer<NativeType> buffer;
  // [24]+(8)
  @Uint64()
  external int offset;
  // [32]+(8)
  @Uint64()
  external int bytesRequested;
  // [40]+(8)
  @Uint64()
  external int bytesTransferred;
  // [48]+(8)
  external Pointer<NativeType> userdata;
}

// SDL_AsyncIOQueue
/// {@category asyncio}
final class SdlAsyncIoQueue extends Opaque {}

// SDL_AtomicInt
/// {@category atomic}
final class SdlAtomicInt extends Struct {
  // [0]+(4)
  @Int32()
  external int value;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_AtomicU32
/// {@category atomic}
final class SdlAtomicU32 extends Struct {
  // [0]+(4)
  @Uint32()
  external int value;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_AudioSpec
/// {@category audio}
final class SdlAudioSpec extends Struct {
  // [0]+(4)
  @Int32()
  external int format;
  // [4]+(4)
  @Int32()
  external int channels;
  // [8]+(4)
  @Int32()
  external int freq;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_AudioStream
/// {@category audio}
final class SdlAudioStream extends Opaque {}

// SDL_Camera
/// {@category camera}
final class SdlCamera extends Opaque {}

// SDL_CameraSpec
/// {@category camera}
final class SdlCameraSpec extends Struct {
  // [0]+(4)
  @Int32()
  external int format;
  // [4]+(4)
  @Int32()
  external int colorspace;
  // [8]+(4)
  @Int32()
  external int width;
  // [12]+(4)
  @Int32()
  external int height;
  // [16]+(4)
  @Int32()
  external int framerateNumerator;
  // [20]+(4)
  @Int32()
  external int framerateDenominator;
}

// SDL_DialogFileFilter
/// {@category dialog}
final class SdlDialogFileFilter extends Struct {
  // [0]+(8)
  external Pointer<Utf8> name;
  // [8]+(8)
  external Pointer<Utf8> pattern;
}

// SDL_CommonEvent
/// {@category events}
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
/// {@category events}
final class SdlDisplayEvent extends Struct {
  // [0]+(4)
  @Int32()
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
  // [24]+(4)
  @Int32()
  external int data2;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_WindowEvent
/// {@category events}
final class SdlWindowEvent extends Struct {
  // [0]+(4)
  @Int32()
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

// SDL_KeyboardDeviceEvent
/// {@category events}
final class SdlKeyboardDeviceEvent extends Struct {
  // [0]+(4)
  @Int32()
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

// SDL_KeyboardEvent
/// {@category events}
final class SdlKeyboardEvent extends Struct {
  // [0]+(4)
  @Int32()
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
  @Int32()
  external int scancode;
  // [28]+(4)
  @Uint32()
  external int key;
  // [32]+(2)
  @Uint16()
  external int mod;
  // [34]+(2)
  @Uint16()
  external int raw;
  // [36]+(1)
  @Uint8()
  external int down;
  // [37]+(1)
  @Uint8()
  external int repeat;
  // [] +(2)
  @Uint16()
  external int blank_1;
}

// SDL_TextEditingEvent
/// {@category events}
final class SdlTextEditingEvent extends Struct {
  // [0]+(4)
  @Int32()
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
  external Pointer<Utf8> text;
  // [32]+(4)
  @Int32()
  external int start;
  // [36]+(4)
  @Int32()
  external int length;
}

// SDL_TextEditingCandidatesEvent
/// {@category events}
final class SdlTextEditingCandidatesEvent extends Struct {
  // [0]+(4)
  @Int32()
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
  external Pointer<Pointer<Int8>> candidates;
  // [32]+(4)
  @Int32()
  external int numCandidates;
  // [36]+(4)
  @Int32()
  external int selectedCandidate;
  // [40]+(1)
  @Uint8()
  external int horizontal;
  // [41]+(1)
  @Uint8()
  external int padding1;
  // [42]+(1)
  @Uint8()
  external int padding2;
  // [43]+(1)
  @Uint8()
  external int padding3;
  // [] +(4)
  @Uint32()
  external int blank_2;
}

// SDL_TextInputEvent
/// {@category events}
final class SdlTextInputEvent extends Struct {
  // [0]+(4)
  @Int32()
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
  external Pointer<Utf8> text;
}

// SDL_MouseDeviceEvent
/// {@category events}
final class SdlMouseDeviceEvent extends Struct {
  // [0]+(4)
  @Int32()
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

// SDL_MouseMotionEvent
/// {@category events}
final class SdlMouseMotionEvent extends Struct {
  // [0]+(4)
  @Int32()
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
/// {@category events}
final class SdlMouseButtonEvent extends Struct {
  // [0]+(4)
  @Int32()
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
  external int down;
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
/// {@category events}
final class SdlMouseWheelEvent extends Struct {
  // [0]+(4)
  @Int32()
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
  @Int32()
  external int direction;
  // [36]+(4)
  @Float()
  external double mouseX;
  // [40]+(4)
  @Float()
  external double mouseY;
  // [44]+(4)
  @Int32()
  external int integerX;
  // [48]+(4)
  @Int32()
  external int integerY;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_JoyAxisEvent
/// {@category events}
final class SdlJoyAxisEvent extends Struct {
  // [0]+(4)
  @Int32()
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

// SDL_JoyBallEvent
/// {@category events}
final class SdlJoyBallEvent extends Struct {
  // [0]+(4)
  @Int32()
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
  external int ball;
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
  external int xrel;
  // [26]+(2)
  @Int16()
  external int yrel;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_JoyHatEvent
/// {@category events}
final class SdlJoyHatEvent extends Struct {
  // [0]+(4)
  @Int32()
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
/// {@category events}
final class SdlJoyButtonEvent extends Struct {
  // [0]+(4)
  @Int32()
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
  external int down;
  // [22]+(1)
  @Uint8()
  external int padding1;
  // [23]+(1)
  @Uint8()
  external int padding2;
}

// SDL_JoyDeviceEvent
/// {@category events}
final class SdlJoyDeviceEvent extends Struct {
  // [0]+(4)
  @Int32()
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
/// {@category events}
final class SdlJoyBatteryEvent extends Struct {
  // [0]+(4)
  @Int32()
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
  external int state;
  // [24]+(4)
  @Int32()
  external int percent;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_GamepadAxisEvent
/// {@category events}
final class SdlGamepadAxisEvent extends Struct {
  // [0]+(4)
  @Int32()
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
/// {@category events}
final class SdlGamepadButtonEvent extends Struct {
  // [0]+(4)
  @Int32()
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
  external int down;
  // [22]+(1)
  @Uint8()
  external int padding1;
  // [23]+(1)
  @Uint8()
  external int padding2;
}

// SDL_GamepadDeviceEvent
/// {@category events}
final class SdlGamepadDeviceEvent extends Struct {
  // [0]+(4)
  @Int32()
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
/// {@category events}
final class SdlGamepadTouchpadEvent extends Struct {
  // [0]+(4)
  @Int32()
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
/// {@category events}
final class SdlGamepadSensorEvent extends Struct {
  // [0]+(4)
  @Int32()
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
/// {@category events}
final class SdlAudioDeviceEvent extends Struct {
  // [0]+(4)
  @Int32()
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
  external int recording;
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

// SDL_CameraDeviceEvent
/// {@category events}
final class SdlCameraDeviceEvent extends Struct {
  // [0]+(4)
  @Int32()
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

// SDL_RenderEvent
/// {@category events}
final class SdlRenderEvent extends Struct {
  // [0]+(4)
  @Int32()
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
}

// SDL_TouchFingerEvent
/// {@category events}
final class SdlTouchFingerEvent extends Struct {
  // [0]+(4)
  @Int32()
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

// SDL_PinchFingerEvent
/// {@category events}
final class SdlPinchFingerEvent extends Struct {
  // [0]+(4)
  @Int32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
  // [16]+(4)
  @Float()
  external double scale;
  // [20]+(4)
  @Uint32()
  external int windowId;
}

// SDL_PenProximityEvent
/// {@category events}
final class SdlPenProximityEvent extends Struct {
  // [0]+(4)
  @Int32()
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
}

// SDL_PenMotionEvent
/// {@category events}
final class SdlPenMotionEvent extends Struct {
  // [0]+(4)
  @Int32()
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
  external int penState;
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

// SDL_PenTouchEvent
/// {@category events}
final class SdlPenTouchEvent extends Struct {
  // [0]+(4)
  @Int32()
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
  external int penState;
  // [28]+(4)
  @Float()
  external double x;
  // [32]+(4)
  @Float()
  external double y;
  // [36]+(1)
  @Uint8()
  external int eraser;
  // [37]+(1)
  @Uint8()
  external int down;
  // [] +(2)
  @Uint16()
  external int blank_1;
}

// SDL_PenButtonEvent
/// {@category events}
final class SdlPenButtonEvent extends Struct {
  // [0]+(4)
  @Int32()
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
  external int penState;
  // [28]+(4)
  @Float()
  external double x;
  // [32]+(4)
  @Float()
  external double y;
  // [36]+(1)
  @Uint8()
  external int button;
  // [37]+(1)
  @Uint8()
  external int down;
  // [] +(2)
  @Uint16()
  external int blank_1;
}

// SDL_PenAxisEvent
/// {@category events}
final class SdlPenAxisEvent extends Struct {
  // [0]+(4)
  @Int32()
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
  external int penState;
  // [28]+(4)
  @Float()
  external double x;
  // [32]+(4)
  @Float()
  external double y;
  // [36]+(4)
  @Int32()
  external int axis;
  // [40]+(4)
  @Float()
  external double value;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_DropEvent
/// {@category events}
final class SdlDropEvent extends Struct {
  // [0]+(4)
  @Int32()
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
  external Pointer<Utf8> source;
  // [40]+(8)
  external Pointer<Utf8> data;
}

// SDL_ClipboardEvent
/// {@category events}
final class SdlClipboardEvent extends Struct {
  // [0]+(4)
  @Int32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
  // [16]+(1)
  @Uint8()
  external int owner;
  // [] +(3)
  @Uint16()
  external int blank_1;
  @Uint8()
  external int blank_2;
  // [20]+(4)
  @Int32()
  external int numMimeTypes;
  // [24]+(8)
  external Pointer<Pointer<Int8>> mimeTypes;
}

// SDL_SensorEvent
/// {@category events}
final class SdlSensorEvent extends Struct {
  // [0]+(4)
  @Int32()
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
/// {@category events}
final class SdlQuitEvent extends Struct {
  // [0]+(4)
  @Int32()
  external int type;
  // [4]+(4)
  @Uint32()
  external int reserved;
  // [8]+(8)
  @Uint64()
  external int timestamp;
}

// SDL_UserEvent
/// {@category events}
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
/// {@category events}
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

/// {@category events}
extension SdlEventExtension on Pointer<SdlEvent> {
  int get type => (cast<Uint8>() + 0).cast<Uint32>().value;
  Pointer<SdlCommonEvent> get common =>
      (cast<Uint8>() + 0).cast<SdlCommonEvent>();
  Pointer<SdlDisplayEvent> get display =>
      (cast<Uint8>() + 0).cast<SdlDisplayEvent>();
  Pointer<SdlWindowEvent> get window =>
      (cast<Uint8>() + 0).cast<SdlWindowEvent>();
  Pointer<SdlKeyboardDeviceEvent> get kdevice =>
      (cast<Uint8>() + 0).cast<SdlKeyboardDeviceEvent>();
  Pointer<SdlKeyboardEvent> get key =>
      (cast<Uint8>() + 0).cast<SdlKeyboardEvent>();
  Pointer<SdlTextEditingEvent> get edit =>
      (cast<Uint8>() + 0).cast<SdlTextEditingEvent>();
  Pointer<SdlTextEditingCandidatesEvent> get editCandidates =>
      (cast<Uint8>() + 0).cast<SdlTextEditingCandidatesEvent>();
  Pointer<SdlTextInputEvent> get text =>
      (cast<Uint8>() + 0).cast<SdlTextInputEvent>();
  Pointer<SdlMouseDeviceEvent> get mdevice =>
      (cast<Uint8>() + 0).cast<SdlMouseDeviceEvent>();
  Pointer<SdlMouseMotionEvent> get motion =>
      (cast<Uint8>() + 0).cast<SdlMouseMotionEvent>();
  Pointer<SdlMouseButtonEvent> get button =>
      (cast<Uint8>() + 0).cast<SdlMouseButtonEvent>();
  Pointer<SdlMouseWheelEvent> get wheel =>
      (cast<Uint8>() + 0).cast<SdlMouseWheelEvent>();
  Pointer<SdlJoyDeviceEvent> get jdevice =>
      (cast<Uint8>() + 0).cast<SdlJoyDeviceEvent>();
  Pointer<SdlJoyAxisEvent> get jaxis =>
      (cast<Uint8>() + 0).cast<SdlJoyAxisEvent>();
  Pointer<SdlJoyBallEvent> get jball =>
      (cast<Uint8>() + 0).cast<SdlJoyBallEvent>();
  Pointer<SdlJoyHatEvent> get jhat =>
      (cast<Uint8>() + 0).cast<SdlJoyHatEvent>();
  Pointer<SdlJoyButtonEvent> get jbutton =>
      (cast<Uint8>() + 0).cast<SdlJoyButtonEvent>();
  Pointer<SdlJoyBatteryEvent> get jbattery =>
      (cast<Uint8>() + 0).cast<SdlJoyBatteryEvent>();
  Pointer<SdlGamepadDeviceEvent> get gdevice =>
      (cast<Uint8>() + 0).cast<SdlGamepadDeviceEvent>();
  Pointer<SdlGamepadAxisEvent> get gaxis =>
      (cast<Uint8>() + 0).cast<SdlGamepadAxisEvent>();
  Pointer<SdlGamepadButtonEvent> get gbutton =>
      (cast<Uint8>() + 0).cast<SdlGamepadButtonEvent>();
  Pointer<SdlGamepadTouchpadEvent> get gtouchpad =>
      (cast<Uint8>() + 0).cast<SdlGamepadTouchpadEvent>();
  Pointer<SdlGamepadSensorEvent> get gsensor =>
      (cast<Uint8>() + 0).cast<SdlGamepadSensorEvent>();
  Pointer<SdlAudioDeviceEvent> get adevice =>
      (cast<Uint8>() + 0).cast<SdlAudioDeviceEvent>();
  Pointer<SdlCameraDeviceEvent> get cdevice =>
      (cast<Uint8>() + 0).cast<SdlCameraDeviceEvent>();
  Pointer<SdlSensorEvent> get sensor =>
      (cast<Uint8>() + 0).cast<SdlSensorEvent>();
  Pointer<SdlQuitEvent> get quit => (cast<Uint8>() + 0).cast<SdlQuitEvent>();
  Pointer<SdlUserEvent> get user => (cast<Uint8>() + 0).cast<SdlUserEvent>();
  Pointer<SdlTouchFingerEvent> get tfinger =>
      (cast<Uint8>() + 0).cast<SdlTouchFingerEvent>();
  Pointer<SdlPinchFingerEvent> get pinch =>
      (cast<Uint8>() + 0).cast<SdlPinchFingerEvent>();
  Pointer<SdlPenProximityEvent> get pproximity =>
      (cast<Uint8>() + 0).cast<SdlPenProximityEvent>();
  Pointer<SdlPenTouchEvent> get ptouch =>
      (cast<Uint8>() + 0).cast<SdlPenTouchEvent>();
  Pointer<SdlPenMotionEvent> get pmotion =>
      (cast<Uint8>() + 0).cast<SdlPenMotionEvent>();
  Pointer<SdlPenButtonEvent> get pbutton =>
      (cast<Uint8>() + 0).cast<SdlPenButtonEvent>();
  Pointer<SdlPenAxisEvent> get paxis =>
      (cast<Uint8>() + 0).cast<SdlPenAxisEvent>();
  Pointer<SdlRenderEvent> get render =>
      (cast<Uint8>() + 0).cast<SdlRenderEvent>();
  Pointer<SdlDropEvent> get drop => (cast<Uint8>() + 0).cast<SdlDropEvent>();
  Pointer<SdlClipboardEvent> get clipboard =>
      (cast<Uint8>() + 0).cast<SdlClipboardEvent>();
  int get padding => (cast<Uint8>() + 0).cast<Uint8>().value;
}

// SDL_PathInfo
/// {@category filesystem}
final class SdlPathInfo extends Struct {
  // [0]+(4)
  @Int32()
  external int type;
  // [] +(4)
  @Uint32()
  external int blank_1;
  // [8]+(8)
  @Uint64()
  external int size;
  // [16]+(8)
  @Int64()
  external int createTime;
  // [24]+(8)
  @Int64()
  external int modifyTime;
  // [32]+(8)
  @Int64()
  external int accessTime;
}

// SDL_Gamepad
/// {@category gamepad}
final class SdlGamepad extends Opaque {}

// SDL_GamepadBinding
/// {@category gamepad}
final class SdlGamepadBinding extends Struct {
  // [0]+(4)
  @Int32()
  external int axis;
  // [4]+(4)
  @Int32()
  external int axisMin;
  // [8]+(4)
  @Int32()
  external int axisMax;
  // [] +(4)
  @Uint32()
  external int blank_1;
  // [16]+(8)
  external Pointer<NativeType> output;
}

// SDL_GPUDevice
/// {@category gpu}
final class SdlGpuDevice extends Opaque {}

// SDL_GPUBuffer
/// {@category gpu}
final class SdlGpuBuffer extends Opaque {}

// SDL_GPUTransferBuffer
/// {@category gpu}
final class SdlGpuTransferBuffer extends Opaque {}

// SDL_GPUTexture
/// {@category gpu}
final class SdlGpuTexture extends Opaque {}

// SDL_GPUSampler
/// {@category gpu}
final class SdlGpuSampler extends Opaque {}

// SDL_GPUShader
/// {@category gpu}
final class SdlGpuShader extends Opaque {}

// SDL_GPUComputePipeline
/// {@category gpu}
final class SdlGpuComputePipeline extends Opaque {}

// SDL_GPUGraphicsPipeline
/// {@category gpu}
final class SdlGpuGraphicsPipeline extends Opaque {}

// SDL_GPUCommandBuffer
/// {@category gpu}
final class SdlGpuCommandBuffer extends Opaque {}

// SDL_GPURenderPass
/// {@category gpu}
final class SdlGpuRenderPass extends Opaque {}

// SDL_GPUComputePass
/// {@category gpu}
final class SdlGpuComputePass extends Opaque {}

// SDL_GPUCopyPass
/// {@category gpu}
final class SdlGpuCopyPass extends Opaque {}

// SDL_GPUFence
/// {@category gpu}
final class SdlGpuFence extends Opaque {}

// SDL_GPUViewport
/// {@category gpu}
final class SdlGpuViewport extends Struct {
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
  // [16]+(4)
  @Float()
  external double minDepth;
  // [20]+(4)
  @Float()
  external double maxDepth;
}

// SDL_GPUTextureTransferInfo
/// {@category gpu}
final class SdlGpuTextureTransferInfo extends Struct {
  // [0]+(8)
  external Pointer<SdlGpuTransferBuffer> transferBuffer;
  // [8]+(4)
  @Uint32()
  external int offset;
  // [12]+(4)
  @Uint32()
  external int pixelsPerRow;
  // [16]+(4)
  @Uint32()
  external int rowsPerLayer;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_GPUTransferBufferLocation
/// {@category gpu}
final class SdlGpuTransferBufferLocation extends Struct {
  // [0]+(8)
  external Pointer<SdlGpuTransferBuffer> transferBuffer;
  // [8]+(4)
  @Uint32()
  external int offset;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_GPUTextureLocation
/// {@category gpu}
final class SdlGpuTextureLocation extends Struct {
  // [0]+(8)
  external Pointer<SdlGpuTexture> texture;
  // [8]+(4)
  @Uint32()
  external int mipLevel;
  // [12]+(4)
  @Uint32()
  external int layer;
  // [16]+(4)
  @Uint32()
  external int x;
  // [20]+(4)
  @Uint32()
  external int y;
  // [24]+(4)
  @Uint32()
  external int z;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_GPUTextureRegion
/// {@category gpu}
final class SdlGpuTextureRegion extends Struct {
  // [0]+(8)
  external Pointer<SdlGpuTexture> texture;
  // [8]+(4)
  @Uint32()
  external int mipLevel;
  // [12]+(4)
  @Uint32()
  external int layer;
  // [16]+(4)
  @Uint32()
  external int x;
  // [20]+(4)
  @Uint32()
  external int y;
  // [24]+(4)
  @Uint32()
  external int z;
  // [28]+(4)
  @Uint32()
  external int w;
  // [32]+(4)
  @Uint32()
  external int h;
  // [36]+(4)
  @Uint32()
  external int d;
}

// SDL_GPUBlitRegion
/// {@category gpu}
final class SdlGpuBlitRegion extends Struct {
  // [0]+(8)
  external Pointer<SdlGpuTexture> texture;
  // [8]+(4)
  @Uint32()
  external int mipLevel;
  // [12]+(4)
  @Uint32()
  external int layerOrDepthPlane;
  // [16]+(4)
  @Uint32()
  external int x;
  // [20]+(4)
  @Uint32()
  external int y;
  // [24]+(4)
  @Uint32()
  external int w;
  // [28]+(4)
  @Uint32()
  external int h;
}

// SDL_GPUBufferLocation
/// {@category gpu}
final class SdlGpuBufferLocation extends Struct {
  // [0]+(8)
  external Pointer<SdlGpuBuffer> buffer;
  // [8]+(4)
  @Uint32()
  external int offset;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_GPUBufferRegion
/// {@category gpu}
final class SdlGpuBufferRegion extends Struct {
  // [0]+(8)
  external Pointer<SdlGpuBuffer> buffer;
  // [8]+(4)
  @Uint32()
  external int offset;
  // [12]+(4)
  @Uint32()
  external int size;
}

// SDL_GPUIndirectDrawCommand
/// {@category gpu}
final class SdlGpuIndirectDrawCommand extends Struct {
  // [0]+(4)
  @Uint32()
  external int numVertices;
  // [4]+(4)
  @Uint32()
  external int numInstances;
  // [8]+(4)
  @Uint32()
  external int firstVertex;
  // [12]+(4)
  @Uint32()
  external int firstInstance;
}

// SDL_GPUIndexedIndirectDrawCommand
/// {@category gpu}
final class SdlGpuIndexedIndirectDrawCommand extends Struct {
  // [0]+(4)
  @Uint32()
  external int numIndices;
  // [4]+(4)
  @Uint32()
  external int numInstances;
  // [8]+(4)
  @Uint32()
  external int firstIndex;
  // [12]+(4)
  @Int32()
  external int vertexOffset;
  // [16]+(4)
  @Uint32()
  external int firstInstance;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_GPUIndirectDispatchCommand
/// {@category gpu}
final class SdlGpuIndirectDispatchCommand extends Struct {
  // [0]+(4)
  @Uint32()
  external int groupcountX;
  // [4]+(4)
  @Uint32()
  external int groupcountY;
  // [8]+(4)
  @Uint32()
  external int groupcountZ;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_GPUSamplerCreateInfo
/// {@category gpu}
final class SdlGpuSamplerCreateInfo extends Struct {
  // [0]+(4)
  @Int32()
  external int minFilter;
  // [4]+(4)
  @Int32()
  external int magFilter;
  // [8]+(4)
  @Int32()
  external int mipmapMode;
  // [12]+(4)
  @Int32()
  external int addressModeU;
  // [16]+(4)
  @Int32()
  external int addressModeV;
  // [20]+(4)
  @Int32()
  external int addressModeW;
  // [24]+(4)
  @Float()
  external double mipLodBias;
  // [28]+(4)
  @Float()
  external double maxAnisotropy;
  // [32]+(4)
  @Int32()
  external int compareOp;
  // [36]+(4)
  @Float()
  external double minLod;
  // [40]+(4)
  @Float()
  external double maxLod;
  // [44]+(1)
  @Uint8()
  external int enableAnisotropy;
  // [45]+(1)
  @Uint8()
  external int enableCompare;
  // [46]+(1)
  @Uint8()
  external int padding1;
  // [47]+(1)
  @Uint8()
  external int padding2;
  // [48]+(4)
  @Uint32()
  external int props;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_GPUVertexBufferDescription
/// {@category gpu}
final class SdlGpuVertexBufferDescription extends Struct {
  // [0]+(4)
  @Uint32()
  external int slot;
  // [4]+(4)
  @Uint32()
  external int pitch;
  // [8]+(4)
  @Int32()
  external int inputRate;
  // [12]+(4)
  @Uint32()
  external int instanceStepRate;
}

// SDL_GPUVertexAttribute
/// {@category gpu}
final class SdlGpuVertexAttribute extends Struct {
  // [0]+(4)
  @Uint32()
  external int location;
  // [4]+(4)
  @Uint32()
  external int bufferSlot;
  // [8]+(4)
  @Int32()
  external int format;
  // [12]+(4)
  @Uint32()
  external int offset;
}

// SDL_GPUVertexInputState
/// {@category gpu}
final class SdlGpuVertexInputState extends Struct {
  // [0]+(8)
  external Pointer<SdlGpuVertexBufferDescription> vertexBufferDescriptions;
  // [8]+(4)
  @Uint32()
  external int numVertexBuffers;
  // [] +(4)
  @Uint32()
  external int blank_1;
  // [16]+(8)
  external Pointer<SdlGpuVertexAttribute> vertexAttributes;
  // [24]+(4)
  @Uint32()
  external int numVertexAttributes;
  // [] +(4)
  @Uint32()
  external int blank_2;
}

// SDL_GPUStencilOpState
/// {@category gpu}
final class SdlGpuStencilOpState extends Struct {
  // [0]+(4)
  @Int32()
  external int failOp;
  // [4]+(4)
  @Int32()
  external int passOp;
  // [8]+(4)
  @Int32()
  external int depthFailOp;
  // [12]+(4)
  @Int32()
  external int compareOp;
}

// SDL_GPUColorTargetBlendState
/// {@category gpu}
final class SdlGpuColorTargetBlendState extends Struct {
  // [0]+(4)
  @Int32()
  external int srcColorBlendfactor;
  // [4]+(4)
  @Int32()
  external int dstColorBlendfactor;
  // [8]+(4)
  @Int32()
  external int colorBlendOp;
  // [12]+(4)
  @Int32()
  external int srcAlphaBlendfactor;
  // [16]+(4)
  @Int32()
  external int dstAlphaBlendfactor;
  // [20]+(4)
  @Int32()
  external int alphaBlendOp;
  // [24]+(1)
  @Uint8()
  external int colorWriteMask;
  // [25]+(1)
  @Uint8()
  external int enableBlend;
  // [26]+(1)
  @Uint8()
  external int enableColorWriteMask;
  // [27]+(1)
  @Uint8()
  external int padding1;
  // [28]+(1)
  @Uint8()
  external int padding2;
  // [] +(3)
  @Uint16()
  external int blank_1;
  @Uint8()
  external int blank_2;
}

// SDL_GPUShaderCreateInfo
/// {@category gpu}
final class SdlGpuShaderCreateInfo extends Struct {
  // [0]+(4)
  @Uint32()
  external int codeSize;
  // [] +(4)
  @Uint32()
  external int blank_1;
  // [8]+(8)
  external Pointer<Uint8> code;
  // [16]+(8)
  external Pointer<Utf8> entrypoint;
  // [24]+(4)
  @Uint32()
  external int format;
  // [28]+(4)
  @Int32()
  external int stage;
  // [32]+(4)
  @Uint32()
  external int numSamplers;
  // [36]+(4)
  @Uint32()
  external int numStorageTextures;
  // [40]+(4)
  @Uint32()
  external int numStorageBuffers;
  // [44]+(4)
  @Uint32()
  external int numUniformBuffers;
  // [48]+(4)
  @Uint32()
  external int props;
  // [] +(4)
  @Uint32()
  external int blank_2;
}

// SDL_GPUTextureCreateInfo
/// {@category gpu}
final class SdlGpuTextureCreateInfo extends Struct {
  // [0]+(4)
  @Int32()
  external int type;
  // [4]+(4)
  @Int32()
  external int format;
  // [8]+(4)
  @Uint32()
  external int usage;
  // [12]+(4)
  @Uint32()
  external int width;
  // [16]+(4)
  @Uint32()
  external int height;
  // [20]+(4)
  @Uint32()
  external int layerCountOrDepth;
  // [24]+(4)
  @Uint32()
  external int numLevels;
  // [28]+(4)
  @Int32()
  external int sampleCount;
  // [32]+(4)
  @Uint32()
  external int props;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_GPUBufferCreateInfo
/// {@category gpu}
final class SdlGpuBufferCreateInfo extends Struct {
  // [0]+(4)
  @Uint32()
  external int usage;
  // [4]+(4)
  @Uint32()
  external int size;
  // [8]+(4)
  @Uint32()
  external int props;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_GPUTransferBufferCreateInfo
/// {@category gpu}
final class SdlGpuTransferBufferCreateInfo extends Struct {
  // [0]+(4)
  @Int32()
  external int usage;
  // [4]+(4)
  @Uint32()
  external int size;
  // [8]+(4)
  @Uint32()
  external int props;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_GPURasterizerState
/// {@category gpu}
final class SdlGpuRasterizerState extends Struct {
  // [0]+(4)
  @Int32()
  external int fillMode;
  // [4]+(4)
  @Int32()
  external int cullMode;
  // [8]+(4)
  @Int32()
  external int frontFace;
  // [12]+(4)
  @Float()
  external double depthBiasAntFactor;
  // [16]+(4)
  @Float()
  external double depthBiasClamp;
  // [20]+(4)
  @Float()
  external double depthBiasSlopeFactor;
  // [24]+(1)
  @Uint8()
  external int enableDepthBias;
  // [25]+(1)
  @Uint8()
  external int enableDepthClip;
  // [26]+(1)
  @Uint8()
  external int padding1;
  // [27]+(1)
  @Uint8()
  external int padding2;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_GPUMultisampleState
/// {@category gpu}
final class SdlGpuMultisampleState extends Struct {
  // [0]+(4)
  @Int32()
  external int sampleCount;
  // [4]+(4)
  @Uint32()
  external int sampleMask;
  // [8]+(1)
  @Uint8()
  external int enableMask;
  // [9]+(1)
  @Uint8()
  external int enableAlphaToCoverage;
  // [10]+(1)
  @Uint8()
  external int padding2;
  // [11]+(1)
  @Uint8()
  external int padding3;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_GPUDepthStencilState
/// {@category gpu}
final class SdlGpuDepthStencilState extends Struct {
  // [0]+(4)
  @Int32()
  external int compareOp;
  // [4]+(16)
  @Uint64()
  external int backStencilState_1;
  @Uint64()
  external int backStencilState_2;
  // [20]+(16)
  @Uint64()
  external int frontStencilState_1;
  @Uint64()
  external int frontStencilState_2;
  // [36]+(1)
  @Uint8()
  external int compareMask;
  // [37]+(1)
  @Uint8()
  external int writeMask;
  // [38]+(1)
  @Uint8()
  external int enableDepthTest;
  // [39]+(1)
  @Uint8()
  external int enableDepthWrite;
  // [40]+(1)
  @Uint8()
  external int enableStencilTest;
  // [41]+(1)
  @Uint8()
  external int padding1;
  // [42]+(1)
  @Uint8()
  external int padding2;
  // [43]+(1)
  @Uint8()
  external int padding3;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

/// {@category gpu}
extension SdlGpuDepthStencilStateExtension on Pointer<SdlGpuDepthStencilState> {
  Pointer<SdlGpuStencilOpState> get backStencilState =>
      (cast<Uint8>() + 4).cast<SdlGpuStencilOpState>();
  Pointer<SdlGpuStencilOpState> get frontStencilState =>
      (cast<Uint8>() + 20).cast<SdlGpuStencilOpState>();
}

// SDL_GPUColorTargetDescription
/// {@category gpu}
final class SdlGpuColorTargetDescription extends Struct {
  // [0]+(4)
  @Int32()
  external int format;
  // [4]+(32)
  @Uint64()
  external int blendState_1;
  @Uint64()
  external int blendState_2;
  @Uint64()
  external int blendState_3;
  @Uint64()
  external int blendState_4;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

/// {@category gpu}
extension SdlGpuColorTargetDescriptionExtension
    on Pointer<SdlGpuColorTargetDescription> {
  Pointer<SdlGpuColorTargetBlendState> get blendState =>
      (cast<Uint8>() + 4).cast<SdlGpuColorTargetBlendState>();
}

// SDL_GPUGraphicsPipelineTargetInfo
/// {@category gpu}
final class SdlGpuGraphicsPipelineTargetInfo extends Struct {
  // [0]+(8)
  external Pointer<SdlGpuColorTargetDescription> colorTargetDescriptions;
  // [8]+(4)
  @Uint32()
  external int numColorTargets;
  // [12]+(4)
  @Int32()
  external int depthStencilFormat;
  // [16]+(1)
  @Uint8()
  external int hasDepthStencilTarget;
  // [17]+(1)
  @Uint8()
  external int padding1;
  // [18]+(1)
  @Uint8()
  external int padding2;
  // [19]+(1)
  @Uint8()
  external int padding3;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_GPUGraphicsPipelineCreateInfo
/// {@category gpu}
final class SdlGpuGraphicsPipelineCreateInfo extends Struct {
  // [0]+(8)
  external Pointer<SdlGpuShader> vertexShader;
  // [8]+(8)
  external Pointer<SdlGpuShader> fragmentShader;
  // [16]+(32)
  @Uint64()
  external int vertexInputState_1;
  @Uint64()
  external int vertexInputState_2;
  @Uint64()
  external int vertexInputState_3;
  @Uint64()
  external int vertexInputState_4;
  // [48]+(4)
  @Int32()
  external int primitiveType;
  // [52]+(32)
  @Uint64()
  external int rasterizerState_1;
  @Uint64()
  external int rasterizerState_2;
  @Uint64()
  external int rasterizerState_3;
  @Uint64()
  external int rasterizerState_4;
  // [84]+(16)
  @Uint64()
  external int multisampleState_1;
  @Uint64()
  external int multisampleState_2;
  // [100]+(48)
  @Uint64()
  external int depthStencilState_1;
  @Uint64()
  external int depthStencilState_2;
  @Uint64()
  external int depthStencilState_3;
  @Uint64()
  external int depthStencilState_4;
  @Uint64()
  external int depthStencilState_5;
  @Uint64()
  external int depthStencilState_6;
  // [148]+(24)
  @Uint64()
  external int targetInfo_1;
  @Uint64()
  external int targetInfo_2;
  @Uint64()
  external int targetInfo_3;
  // [172]+(4)
  @Uint32()
  external int props;
}

/// {@category gpu}
extension SdlGpuGraphicsPipelineCreateInfoExtension
    on Pointer<SdlGpuGraphicsPipelineCreateInfo> {
  Pointer<SdlGpuVertexInputState> get vertexInputState =>
      (cast<Uint8>() + 16).cast<SdlGpuVertexInputState>();
  Pointer<SdlGpuRasterizerState> get rasterizerState =>
      (cast<Uint8>() + 52).cast<SdlGpuRasterizerState>();
  Pointer<SdlGpuMultisampleState> get multisampleState =>
      (cast<Uint8>() + 84).cast<SdlGpuMultisampleState>();
  Pointer<SdlGpuDepthStencilState> get depthStencilState =>
      (cast<Uint8>() + 100).cast<SdlGpuDepthStencilState>();
  Pointer<SdlGpuGraphicsPipelineTargetInfo> get targetInfo =>
      (cast<Uint8>() + 148).cast<SdlGpuGraphicsPipelineTargetInfo>();
}

// SDL_GPUComputePipelineCreateInfo
/// {@category gpu}
final class SdlGpuComputePipelineCreateInfo extends Struct {
  // [0]+(4)
  @Uint32()
  external int codeSize;
  // [] +(4)
  @Uint32()
  external int blank_1;
  // [8]+(8)
  external Pointer<Uint8> code;
  // [16]+(8)
  external Pointer<Utf8> entrypoint;
  // [24]+(4)
  @Uint32()
  external int format;
  // [28]+(4)
  @Uint32()
  external int numSamplers;
  // [32]+(4)
  @Uint32()
  external int numReadonlyStorageTextures;
  // [36]+(4)
  @Uint32()
  external int numReadonlyStorageBuffers;
  // [40]+(4)
  @Uint32()
  external int numReadwriteStorageTextures;
  // [44]+(4)
  @Uint32()
  external int numReadwriteStorageBuffers;
  // [48]+(4)
  @Uint32()
  external int numUniformBuffers;
  // [52]+(4)
  @Uint32()
  external int threadcountX;
  // [56]+(4)
  @Uint32()
  external int threadcountY;
  // [60]+(4)
  @Uint32()
  external int threadcountZ;
  // [64]+(4)
  @Uint32()
  external int props;
  // [] +(4)
  @Uint32()
  external int blank_2;
}

// SDL_GPUColorTargetInfo
/// {@category gpu}
final class SdlGpuColorTargetInfo extends Struct {
  // [0]+(8)
  external Pointer<SdlGpuTexture> texture;
  // [8]+(4)
  @Uint32()
  external int mipLevel;
  // [12]+(4)
  @Uint32()
  external int layerOrDepthPlane;
  // [16]+(16)
  @Uint64()
  external int clearColor_1;
  @Uint64()
  external int clearColor_2;
  // [32]+(4)
  @Int32()
  external int loadOp;
  // [36]+(4)
  @Int32()
  external int storeOp;
  // [40]+(8)
  external Pointer<SdlGpuTexture> resolveTexture;
  // [48]+(4)
  @Uint32()
  external int resolveMipLevel;
  // [52]+(4)
  @Uint32()
  external int resolveLayer;
  // [56]+(1)
  @Uint8()
  external int cycle;
  // [57]+(1)
  @Uint8()
  external int cycleResolveTexture;
  // [58]+(1)
  @Uint8()
  external int padding1;
  // [59]+(1)
  @Uint8()
  external int padding2;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

/// {@category gpu}
extension SdlGpuColorTargetInfoExtension on Pointer<SdlGpuColorTargetInfo> {
  Pointer<SdlFColor> get clearColor => (cast<Uint8>() + 16).cast<SdlFColor>();
}

// SDL_GPUDepthStencilTargetInfo
/// {@category gpu}
final class SdlGpuDepthStencilTargetInfo extends Struct {
  // [0]+(8)
  external Pointer<SdlGpuTexture> texture;
  // [8]+(4)
  @Float()
  external double clearDepth;
  // [12]+(4)
  @Int32()
  external int loadOp;
  // [16]+(4)
  @Int32()
  external int storeOp;
  // [20]+(4)
  @Int32()
  external int stencilLoadOp;
  // [24]+(4)
  @Int32()
  external int stencilStoreOp;
  // [28]+(1)
  @Uint8()
  external int cycle;
  // [29]+(1)
  @Uint8()
  external int clearStencil;
  // [30]+(1)
  @Uint8()
  external int mipLevel;
  // [31]+(1)
  @Uint8()
  external int layer;
}

// SDL_GPUBlitInfo
/// {@category gpu}
final class SdlGpuBlitInfo extends Struct {
  // [0]+(32)
  @Uint64()
  external int source_1;
  @Uint64()
  external int source_2;
  @Uint64()
  external int source_3;
  @Uint64()
  external int source_4;
  // [32]+(32)
  @Uint64()
  external int destination_1;
  @Uint64()
  external int destination_2;
  @Uint64()
  external int destination_3;
  @Uint64()
  external int destination_4;
  // [64]+(4)
  @Int32()
  external int loadOp;
  // [68]+(16)
  @Uint64()
  external int clearColor_1;
  @Uint64()
  external int clearColor_2;
  // [84]+(4)
  @Int32()
  external int flipMode;
  // [88]+(4)
  @Int32()
  external int filter;
  // [92]+(1)
  @Uint8()
  external int cycle;
  // [93]+(1)
  @Uint8()
  external int padding1;
  // [94]+(1)
  @Uint8()
  external int padding2;
  // [95]+(1)
  @Uint8()
  external int padding3;
}

/// {@category gpu}
extension SdlGpuBlitInfoExtension on Pointer<SdlGpuBlitInfo> {
  Pointer<SdlGpuBlitRegion> get source =>
      (cast<Uint8>() + 0).cast<SdlGpuBlitRegion>();
  Pointer<SdlGpuBlitRegion> get destination =>
      (cast<Uint8>() + 32).cast<SdlGpuBlitRegion>();
  Pointer<SdlFColor> get clearColor => (cast<Uint8>() + 68).cast<SdlFColor>();
}

// SDL_GPUBufferBinding
/// {@category gpu}
final class SdlGpuBufferBinding extends Struct {
  // [0]+(8)
  external Pointer<SdlGpuBuffer> buffer;
  // [8]+(4)
  @Uint32()
  external int offset;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_GPUTextureSamplerBinding
/// {@category gpu}
final class SdlGpuTextureSamplerBinding extends Struct {
  // [0]+(8)
  external Pointer<SdlGpuTexture> texture;
  // [8]+(8)
  external Pointer<SdlGpuSampler> sampler;
}

// SDL_GPUStorageBufferReadWriteBinding
/// {@category gpu}
final class SdlGpuStorageBufferReadWriteBinding extends Struct {
  // [0]+(8)
  external Pointer<SdlGpuBuffer> buffer;
  // [8]+(1)
  @Uint8()
  external int cycle;
  // [9]+(1)
  @Uint8()
  external int padding1;
  // [10]+(1)
  @Uint8()
  external int padding2;
  // [11]+(1)
  @Uint8()
  external int padding3;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_GPUStorageTextureReadWriteBinding
/// {@category gpu}
final class SdlGpuStorageTextureReadWriteBinding extends Struct {
  // [0]+(8)
  external Pointer<SdlGpuTexture> texture;
  // [8]+(4)
  @Uint32()
  external int mipLevel;
  // [12]+(4)
  @Uint32()
  external int layer;
  // [16]+(1)
  @Uint8()
  external int cycle;
  // [17]+(1)
  @Uint8()
  external int padding1;
  // [18]+(1)
  @Uint8()
  external int padding2;
  // [19]+(1)
  @Uint8()
  external int padding3;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_GUID
/// {@category guid}
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
/// {@category haptic}
final class SdlHaptic extends Opaque {}

// SDL_HapticDirection
/// {@category haptic}
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
/// {@category haptic}
final class SdlHapticConstant extends Struct {
  // [0]+(2)
  @Uint16()
  external int type;
  // [2]+(16)
  @Uint64()
  external int direction_1;
  @Uint64()
  external int direction_2;
  // [] +(2)
  @Uint16()
  external int blank_1;
  // [20]+(4)
  @Uint32()
  external int length;
  // [24]+(2)
  @Uint16()
  external int delay;
  // [26]+(2)
  @Uint16()
  external int button;
  // [28]+(2)
  @Uint16()
  external int interval;
  // [30]+(2)
  @Int16()
  external int level;
  // [32]+(2)
  @Uint16()
  external int attackLength;
  // [34]+(2)
  @Uint16()
  external int attackLevel;
  // [36]+(2)
  @Uint16()
  external int fadeLength;
  // [38]+(2)
  @Uint16()
  external int fadeLevel;
}

/// {@category haptic}
extension SdlHapticConstantExtension on Pointer<SdlHapticConstant> {
  Pointer<SdlHapticDirection> get direction =>
      (cast<Uint8>() + 2).cast<SdlHapticDirection>();
}

// SDL_HapticPeriodic
/// {@category haptic}
final class SdlHapticPeriodic extends Struct {
  // [0]+(2)
  @Uint16()
  external int type;
  // [2]+(16)
  @Uint64()
  external int direction_1;
  @Uint64()
  external int direction_2;
  // [] +(2)
  @Uint16()
  external int blank_1;
  // [20]+(4)
  @Uint32()
  external int length;
  // [24]+(2)
  @Uint16()
  external int delay;
  // [26]+(2)
  @Uint16()
  external int button;
  // [28]+(2)
  @Uint16()
  external int interval;
  // [30]+(2)
  @Uint16()
  external int period;
  // [32]+(2)
  @Int16()
  external int magnitude;
  // [34]+(2)
  @Int16()
  external int offset;
  // [36]+(2)
  @Uint16()
  external int phase;
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
  external int blank_2;
}

/// {@category haptic}
extension SdlHapticPeriodicExtension on Pointer<SdlHapticPeriodic> {
  Pointer<SdlHapticDirection> get direction =>
      (cast<Uint8>() + 2).cast<SdlHapticDirection>();
}

// SDL_HapticCondition
/// {@category haptic}
final class SdlHapticCondition extends Struct {
  // [0]+(2)
  @Uint16()
  external int type;
  // [2]+(16)
  @Uint64()
  external int direction_1;
  @Uint64()
  external int direction_2;
  // [] +(2)
  @Uint16()
  external int blank_1;
  // [20]+(4)
  @Uint32()
  external int length;
  // [24]+(2)
  @Uint16()
  external int delay;
  // [26]+(2)
  @Uint16()
  external int button;
  // [28]+(2)
  @Uint16()
  external int interval;
  // [30]+(2*3)
  @Uint16()
  external int rightSat_1;
  @Uint16()
  external int rightSat_2;
  @Uint16()
  external int rightSat_3;
  // [36]+(2*3)
  @Uint16()
  external int leftSat_1;
  @Uint16()
  external int leftSat_2;
  @Uint16()
  external int leftSat_3;
  // [42]+(2*3)
  @Int16()
  external int rightCoeff_1;
  @Int16()
  external int rightCoeff_2;
  @Int16()
  external int rightCoeff_3;
  // [48]+(2*3)
  @Int16()
  external int leftCoeff_1;
  @Int16()
  external int leftCoeff_2;
  @Int16()
  external int leftCoeff_3;
  // [54]+(2*3)
  @Uint16()
  external int deadband_1;
  @Uint16()
  external int deadband_2;
  @Uint16()
  external int deadband_3;
  // [60]+(2*3)
  @Int16()
  external int center_1;
  @Int16()
  external int center_2;
  @Int16()
  external int center_3;
  // [] +(6)
  @Uint32()
  external int blank_2;
  @Uint16()
  external int blank_3;
}

/// {@category haptic}
extension SdlHapticConditionExtension on Pointer<SdlHapticCondition> {
  Pointer<SdlHapticDirection> get direction =>
      (cast<Uint8>() + 2).cast<SdlHapticDirection>();
}

// SDL_HapticRamp
/// {@category haptic}
final class SdlHapticRamp extends Struct {
  // [0]+(2)
  @Uint16()
  external int type;
  // [2]+(16)
  @Uint64()
  external int direction_1;
  @Uint64()
  external int direction_2;
  // [] +(2)
  @Uint16()
  external int blank_1;
  // [20]+(4)
  @Uint32()
  external int length;
  // [24]+(2)
  @Uint16()
  external int delay;
  // [26]+(2)
  @Uint16()
  external int button;
  // [28]+(2)
  @Uint16()
  external int interval;
  // [30]+(2)
  @Int16()
  external int start;
  // [32]+(2)
  @Int16()
  external int end;
  // [34]+(2)
  @Uint16()
  external int attackLength;
  // [36]+(2)
  @Uint16()
  external int attackLevel;
  // [38]+(2)
  @Uint16()
  external int fadeLength;
  // [40]+(2)
  @Uint16()
  external int fadeLevel;
  // [] +(6)
  @Uint32()
  external int blank_2;
  @Uint16()
  external int blank_3;
}

/// {@category haptic}
extension SdlHapticRampExtension on Pointer<SdlHapticRamp> {
  Pointer<SdlHapticDirection> get direction =>
      (cast<Uint8>() + 2).cast<SdlHapticDirection>();
}

// SDL_HapticLeftRight
/// {@category haptic}
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
/// {@category haptic}
final class SdlHapticCustom extends Struct {
  // [0]+(2)
  @Uint16()
  external int type;
  // [2]+(16)
  @Uint64()
  external int direction_1;
  @Uint64()
  external int direction_2;
  // [] +(2)
  @Uint16()
  external int blank_1;
  // [20]+(4)
  @Uint32()
  external int length;
  // [24]+(2)
  @Uint16()
  external int delay;
  // [26]+(2)
  @Uint16()
  external int button;
  // [28]+(2)
  @Uint16()
  external int interval;
  // [30]+(1)
  @Uint8()
  external int channels;
  // [] +(1)
  @Uint8()
  external int blank_2;
  // [32]+(2)
  @Uint16()
  external int period;
  // [34]+(2)
  @Uint16()
  external int samples;
  // [] +(4)
  @Uint32()
  external int blank_3;
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

/// {@category haptic}
extension SdlHapticCustomExtension on Pointer<SdlHapticCustom> {
  Pointer<SdlHapticDirection> get direction =>
      (cast<Uint8>() + 2).cast<SdlHapticDirection>();
}

// SDL_HapticEffect
/// {@category haptic}
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

/// {@category haptic}
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
/// {@category hidapi}
final class SdlHidDevice extends Opaque {}

// SDL_hid_device_info
/// {@category hidapi}
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

// SDL_IOStreamInterface
/// {@category iostream}
final class SdlIoStreamInterface extends Struct {
  // [0]+(4)
  @Uint32()
  external int version;
  // [] +(4)
  @Uint32()
  external int blank_1;
  // [8]+(8)
  external Pointer<NativeType> size;
  // [16]+(8)
  external Pointer<NativeType> seek;
  // [24]+(8)
  external Pointer<NativeType> read;
  // [32]+(8)
  external Pointer<NativeType> write;
  // [40]+(8)
  external Pointer<NativeType> flush;
  // [48]+(8)
  external Pointer<NativeType> close;
}

// SDL_IOStream
/// {@category iostream}
final class SdlIoStream extends Opaque {}

// SDL_Joystick
/// {@category joystick}
final class SdlJoystick extends Opaque {}

// SDL_VirtualJoystickTouchpadDesc
/// {@category joystick}
final class SdlVirtualJoystickTouchpadDesc extends Struct {
  // [0]+(2)
  @Uint16()
  external int nfingers;
  // [2]+(2*3)
  @Uint16()
  external int padding_1;
  @Uint16()
  external int padding_2;
  @Uint16()
  external int padding_3;
}

// SDL_VirtualJoystickSensorDesc
/// {@category joystick}
final class SdlVirtualJoystickSensorDesc extends Struct {
  // [0]+(4)
  @Int32()
  external int type;
  // [4]+(4)
  @Float()
  external double rate;
}

// SDL_VirtualJoystickDesc
/// {@category joystick}
final class SdlVirtualJoystickDesc extends Struct {
  // [0]+(4)
  @Uint32()
  external int version;
  // [4]+(2)
  @Uint16()
  external int type;
  // [6]+(2)
  @Uint16()
  external int padding;
  // [8]+(2)
  @Uint16()
  external int vendorId;
  // [10]+(2)
  @Uint16()
  external int productId;
  // [12]+(2)
  @Uint16()
  external int naxes;
  // [14]+(2)
  @Uint16()
  external int nbuttons;
  // [16]+(2)
  @Uint16()
  external int nballs;
  // [18]+(2)
  @Uint16()
  external int nhats;
  // [20]+(2)
  @Uint16()
  external int ntouchpads;
  // [22]+(2)
  @Uint16()
  external int nsensors;
  // [24]+(2*2)
  @Uint16()
  external int padding2_1;
  @Uint16()
  external int padding2_2;
  // [28]+(4)
  @Uint32()
  external int buttonMask;
  // [32]+(4)
  @Uint32()
  external int axisMask;
  // [] +(4)
  @Uint32()
  external int blank_1;
  // [40]+(8)
  external Pointer<Utf8> name;
  // [48]+(8)
  external Pointer<SdlVirtualJoystickTouchpadDesc> touchpads;
  // [56]+(8)
  external Pointer<SdlVirtualJoystickSensorDesc> sensors;
  // [64]+(8)
  external Pointer<NativeType> userdata;
  // [72]+(8)
  external Pointer<NativeType> update;
  // [80]+(8)
  external Pointer<NativeType> setPlayerIndex;
  // [88]+(8)
  external Pointer<NativeType> rumble;
  // [96]+(8)
  external Pointer<NativeType> rumbleTriggers;
  // [104]+(8)
  external Pointer<NativeType> setLed;
  // [112]+(8)
  external Pointer<NativeType> sendEffect;
  // [120]+(8)
  external Pointer<NativeType> setSensorsEnabled;
  // [128]+(8)
  external Pointer<NativeType> cleanup;
}

// SDL_SharedObject
/// {@category loadso}
final class SdlSharedObject extends Opaque {}

// SDL_Locale
/// {@category locale}
final class SdlLocale extends Struct {
  // [0]+(8)
  external Pointer<Utf8> language;
  // [8]+(8)
  external Pointer<Utf8> country;
}

// HINSTANCE
/// {@category main_impl}
final class HINSTANCE extends Opaque {}

// SDL_MessageBoxButtonData
/// {@category messagebox}
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
/// {@category messagebox}
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
/// {@category messagebox}
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

/// {@category messagebox}
extension SdlMessageBoxColorSchemeExtension
    on Pointer<SdlMessageBoxColorScheme> {
  List<SdlMessageBoxColor> get colors {
    final list = <SdlMessageBoxColor>[];
    for (var i = 0; i < 5; i++) {
      list.add((cast<Uint8>() + 0 + i * 8).cast<SdlMessageBoxColor>().ref);
    }
    return list;
  }
}

// SDL_MessageBoxData
/// {@category messagebox}
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
/// {@category mouse}
final class SdlCursor extends Opaque {}

// SDL_CursorFrameInfo
/// {@category mouse}
final class SdlCursorFrameInfo extends Struct {
  // [0]+(8)
  external Pointer<SdlSurface> surface;
  // [8]+(4)
  @Uint32()
  external int duration;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_Mutex
/// {@category mutex}
final class SdlMutex extends Opaque {}

// SDL_RWLock
/// {@category mutex}
final class SdlRwLock extends Opaque {}

// SDL_Semaphore
/// {@category mutex}
final class SdlSemaphore extends Opaque {}

// SDL_Condition
/// {@category mutex}
final class SdlCondition extends Opaque {}

// SDL_InitState
/// {@category mutex}
final class SdlInitState extends Struct {
  // [0]+(8)
  @Uint64()
  external int status_1;
  // [8]+(8)
  @Uint64()
  external int thread;
  // [16]+(8)
  external Pointer<NativeType> reserved;
}

/// {@category mutex}
extension SdlInitStateExtension on Pointer<SdlInitState> {
  Pointer<SdlAtomicInt> get status => (cast<Uint8>() + 0).cast<SdlAtomicInt>();
}

// SDL_Color
/// {@category pixels}
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
/// {@category pixels}
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
/// {@category pixels}
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

// SDL_PixelFormatDetails
/// {@category pixels}
final class SdlPixelFormatDetails extends Struct {
  // [0]+(4)
  @Int32()
  external int format;
  // [4]+(1)
  @Uint8()
  external int bitsPerPixel;
  // [5]+(1)
  @Uint8()
  external int bytesPerPixel;
  // [6]+(1*2)
  @Uint8()
  external int padding_1;
  @Uint8()
  external int padding_2;
  // [8]+(4)
  @Uint32()
  external int rmask;
  // [12]+(4)
  @Uint32()
  external int gmask;
  // [16]+(4)
  @Uint32()
  external int bmask;
  // [20]+(4)
  @Uint32()
  external int amask;
  // [24]+(1)
  @Uint8()
  external int rbits;
  // [25]+(1)
  @Uint8()
  external int gbits;
  // [26]+(1)
  @Uint8()
  external int bbits;
  // [27]+(1)
  @Uint8()
  external int abits;
  // [28]+(1)
  @Uint8()
  external int rshift;
  // [29]+(1)
  @Uint8()
  external int gshift;
  // [30]+(1)
  @Uint8()
  external int bshift;
  // [31]+(1)
  @Uint8()
  external int ashift;
}

// SDL_Process
/// {@category process}
final class SdlProcess extends Opaque {}

// SDL_Point
/// {@category rect}
final class SdlPoint extends Struct {
  // [0]+(4)
  @Int32()
  external int x;
  // [4]+(4)
  @Int32()
  external int y;
}

// SDL_FPoint
/// {@category rect}
final class SdlFPoint extends Struct {
  // [0]+(4)
  @Float()
  external double x;
  // [4]+(4)
  @Float()
  external double y;
}

// SDL_Rect
/// {@category rect}
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
/// {@category rect}
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

// SDL_Vertex
/// {@category render}
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

/// {@category render}
extension SdlVertexExtension on Pointer<SdlVertex> {
  Pointer<SdlFPoint> get position => (cast<Uint8>() + 0).cast<SdlFPoint>();
  Pointer<SdlFColor> get color => (cast<Uint8>() + 8).cast<SdlFColor>();
  Pointer<SdlFPoint> get texCoord => (cast<Uint8>() + 24).cast<SdlFPoint>();
}

// SDL_Renderer
/// {@category render}
final class SdlRenderer extends Opaque {}

// SDL_Texture
/// {@category render}
final class SdlTexture extends Struct {
  // [0]+(4)
  @Int32()
  external int format;
  // [4]+(4)
  @Int32()
  external int w;
  // [8]+(4)
  @Int32()
  external int h;
  // [12]+(4)
  @Int32()
  external int refcount;
}

// SDL_GPURenderStateCreateInfo
/// {@category render}
final class SdlGpuRenderStateCreateInfo extends Struct {
  // [0]+(8)
  external Pointer<SdlGpuShader> fragmentShader;
  // [8]+(4)
  @Int32()
  external int numSamplerBindings;
  // [] +(4)
  @Uint32()
  external int blank_1;
  // [16]+(8)
  external Pointer<SdlGpuTextureSamplerBinding> samplerBindings;
  // [24]+(4)
  @Int32()
  external int numStorageTextures;
  // [] +(4)
  @Uint32()
  external int blank_2;
  // [32]+(8)
  external Pointer<Pointer<SdlGpuTexture>> storageTextures;
  // [40]+(4)
  @Int32()
  external int numStorageBuffers;
  // [] +(4)
  @Uint32()
  external int blank_3;
  // [48]+(8)
  external Pointer<Pointer<SdlGpuBuffer>> storageBuffers;
  // [56]+(4)
  @Uint32()
  external int props;
  // [] +(4)
  @Uint32()
  external int blank_4;
}

// SDL_GPURenderState
/// {@category render}
final class SdlGpuRenderState extends Opaque {}

// SDL_Sensor
/// {@category sensor}
final class SdlSensor extends Opaque {}

// SDL_alignment_test
/// {@category stdinc}
final class SdlAlignmentTest extends Struct {
  // [0]+(1)
  @Uint8()
  external int a;
  // [] +(7)
  @Uint32()
  external int blank_1;
  @Uint16()
  external int blank_2;
  @Uint8()
  external int blank_3;
  // [8]+(8)
  external Pointer<NativeType> b;
}

// SDL_Environment
/// {@category stdinc}
final class SdlEnvironment extends Opaque {}

// SDL_iconv_t
/// {@category stdinc}
final class SdlIconvT extends Opaque {}

// SDL_StorageInterface
/// {@category storage}
final class SdlStorageInterface extends Struct {
  // [0]+(4)
  @Uint32()
  external int version;
  // [] +(4)
  @Uint32()
  external int blank_1;
  // [8]+(8)
  external Pointer<NativeType> close;
  // [16]+(8)
  external Pointer<NativeType> ready;
  // [24]+(8)
  external Pointer<NativeType> enumerate;
  // [32]+(8)
  external Pointer<NativeType> info;
  // [40]+(8)
  external Pointer<NativeType> readFile;
  // [48]+(8)
  external Pointer<NativeType> writeFile;
  // [56]+(8)
  external Pointer<NativeType> mkdir;
  // [64]+(8)
  external Pointer<NativeType> remove;
  // [72]+(8)
  external Pointer<NativeType> rename;
  // [80]+(8)
  external Pointer<NativeType> copy;
  // [88]+(8)
  external Pointer<NativeType> spaceRemaining;
}

// SDL_Storage
/// {@category storage}
final class SdlStorage extends Opaque {}

// SDL_Surface
/// {@category surface}
final class SdlSurface extends Struct {
  // [0]+(4)
  @Uint32()
  external int flags;
  // [4]+(4)
  @Int32()
  external int format;
  // [8]+(4)
  @Int32()
  external int w;
  // [12]+(4)
  @Int32()
  external int h;
  // [16]+(4)
  @Int32()
  external int pitch;
  // [] +(4)
  @Uint32()
  external int blank_1;
  // [24]+(8)
  external Pointer<NativeType> pixels;
  // [32]+(4)
  @Int32()
  external int refcount;
  // [] +(4)
  @Uint32()
  external int blank_2;
  // [40]+(8)
  external Pointer<NativeType> reserved;
}

// MSG
/// {@category system}
final class MSG extends Opaque {}

// XEvent
/// {@category system}
final class XEvent extends Opaque {}

// XTaskQueueHandle
/// {@category system}
final class XTaskQueueHandle extends Opaque {}

// XUserHandle
/// {@category system}
final class XUserHandle extends Opaque {}

// SDL_Thread
/// {@category thread}
final class SdlThread extends Opaque {}

// SDL_DateTime
/// {@category time}
final class SdlDateTime extends Struct {
  // [0]+(4)
  @Int32()
  external int year;
  // [4]+(4)
  @Int32()
  external int month;
  // [8]+(4)
  @Int32()
  external int day;
  // [12]+(4)
  @Int32()
  external int hour;
  // [16]+(4)
  @Int32()
  external int minute;
  // [20]+(4)
  @Int32()
  external int second;
  // [24]+(4)
  @Int32()
  external int nanosecond;
  // [28]+(4)
  @Int32()
  external int dayOfWeek;
  // [32]+(4)
  @Int32()
  external int utcOffset;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

// SDL_Finger
/// {@category touch}
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

// SDL_Tray
/// {@category tray}
final class SdlTray extends Opaque {}

// SDL_TrayMenu
/// {@category tray}
final class SdlTrayMenu extends Opaque {}

// SDL_TrayEntry
/// {@category tray}
final class SdlTrayEntry extends Opaque {}

// SDL_DisplayModeData
/// {@category video}
final class SdlDisplayModeData extends Opaque {}

// SDL_DisplayMode
/// {@category video}
final class SdlDisplayMode extends Struct {
  // [0]+(4)
  @Uint32()
  external int displayId;
  // [4]+(4)
  @Int32()
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
  // [24]+(4)
  @Int32()
  external int refreshRateNumerator;
  // [28]+(4)
  @Int32()
  external int refreshRateDenominator;
  // [32]+(8)
  external Pointer<SdlDisplayModeData> internal;
}

// SDL_Window
/// {@category video}
final class SdlWindow extends Opaque {}

// SDL_GLContext
/// {@category video}
final class SdlGlContext extends Opaque {}
