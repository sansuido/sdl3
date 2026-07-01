// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
part of '../sdl.dart';

// SDL_AssertData
/// {@category assert}
final class SdlAssertData extends Struct {
  // [0]+(1)
  @Bool()
  external bool alwaysIgnore;
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
  external Pointer<Void> buffer;
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
  external Pointer<Void> userdata;
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
}

// SDL_AtomicU32
/// {@category atomic}
final class SdlAtomicU32 extends Struct {
  // [0]+(4)
  @Uint32()
  external int value;
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
  @Bool()
  external bool down;
  // [37]+(1)
  @Bool()
  external bool repeat;
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
  // [24]+(8)
  external Pointer<Pointer<Int8>> candidates;
  // [32]+(4)
  @Int32()
  external int numCandidates;
  // [36]+(4)
  @Int32()
  external int selectedCandidate;
  // [40]+(1)
  @Bool()
  external bool horizontal;
  // [41]+(1)
  @Uint8()
  external int padding1;
  // [42]+(1)
  @Uint8()
  external int padding2;
  // [43]+(1)
  @Uint8()
  external int padding3;
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
  @Bool()
  external bool down;
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
  @Bool()
  external bool down;
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
  @Bool()
  external bool down;
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
  @Array(3)
  external Array<Float> data;
  // [40]+(8)
  @Uint64()
  external int sensorTimestamp;
}

// SDL_GamepadCapSenseEvent
/// {@category events}
final class SdlGamepadCapSenseEvent extends Struct {
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
  external int capsense;
  // [21]+(1)
  @Bool()
  external bool down;
  // [22]+(1)
  @Uint8()
  external int padding1;
  // [23]+(1)
  @Uint8()
  external int padding2;
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
  @Bool()
  external bool recording;
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
}

// SDL_NotificationEvent
/// {@category events}
final class SdlNotificationEvent extends Struct {
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
  // [24]+(8)
  external Pointer<Utf8> actionId;
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
  // [24]+(4)
  @Float()
  external double spanX;
  // [28]+(4)
  @Float()
  external double spanY;
  // [32]+(4)
  @Float()
  external double focusX;
  // [36]+(4)
  @Float()
  external double focusY;
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
  @Bool()
  external bool eraser;
  // [37]+(1)
  @Bool()
  external bool down;
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
  @Bool()
  external bool down;
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
  @Bool()
  external bool owner;
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
  @Array(6)
  external Array<Float> data;
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
  external Pointer<Void> data1;
  // [32]+(8)
  external Pointer<Void> data2;
}

// SDL_Event
/// {@category events}
final class SdlEvent extends Union {
  // [0]+(4)
  @Uint32()
  external int type;
  // [0]+(16)
  external SdlCommonEvent common;
  // [0]+(32)
  external SdlDisplayEvent display;
  // [0]+(32)
  external SdlWindowEvent window;
  // [0]+(24)
  external SdlKeyboardDeviceEvent kdevice;
  // [0]+(40)
  external SdlKeyboardEvent key;
  // [0]+(40)
  external SdlTextEditingEvent edit;
  // [0]+(48)
  external SdlTextEditingCandidatesEvent editCandidates;
  // [0]+(32)
  external SdlTextInputEvent text;
  // [0]+(24)
  external SdlMouseDeviceEvent mdevice;
  // [0]+(48)
  external SdlMouseMotionEvent motion;
  // [0]+(40)
  external SdlMouseButtonEvent button;
  // [0]+(56)
  external SdlMouseWheelEvent wheel;
  // [0]+(24)
  external SdlJoyDeviceEvent jdevice;
  // [0]+(32)
  external SdlJoyAxisEvent jaxis;
  // [0]+(32)
  external SdlJoyBallEvent jball;
  // [0]+(24)
  external SdlJoyHatEvent jhat;
  // [0]+(24)
  external SdlJoyButtonEvent jbutton;
  // [0]+(32)
  external SdlJoyBatteryEvent jbattery;
  // [0]+(24)
  external SdlGamepadDeviceEvent gdevice;
  // [0]+(32)
  external SdlGamepadAxisEvent gaxis;
  // [0]+(24)
  external SdlGamepadButtonEvent gbutton;
  // [0]+(40)
  external SdlGamepadTouchpadEvent gtouchpad;
  // [0]+(48)
  external SdlGamepadSensorEvent gsensor;
  // [0]+(24)
  external SdlGamepadCapSenseEvent gcapsense;
  // [0]+(24)
  external SdlAudioDeviceEvent adevice;
  // [0]+(24)
  external SdlCameraDeviceEvent cdevice;
  // [0]+(56)
  external SdlSensorEvent sensor;
  // [0]+(16)
  external SdlQuitEvent quit;
  // [0]+(40)
  external SdlUserEvent user;
  // [0]+(56)
  external SdlTouchFingerEvent tfinger;
  // [0]+(40)
  external SdlPinchFingerEvent pinch;
  // [0]+(24)
  external SdlPenProximityEvent pproximity;
  // [0]+(40)
  external SdlPenTouchEvent ptouch;
  // [0]+(40)
  external SdlPenMotionEvent pmotion;
  // [0]+(40)
  external SdlPenButtonEvent pbutton;
  // [0]+(48)
  external SdlPenAxisEvent paxis;
  // [0]+(24)
  external SdlRenderEvent render;
  // [0]+(48)
  external SdlDropEvent drop;
  // [0]+(32)
  external SdlClipboardEvent clipboard;
  // [0]+(32)
  external SdlNotificationEvent notification;
  // [0]+(1*128)
  @Array(128)
  external Array<Uint8> padding;
}

// SDL_PathInfo
/// {@category filesystem}
final class SdlPathInfo extends Struct {
  // [0]+(4)
  @Int32()
  external int type;
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

// SDL_GamepadBindingInputAxis
/// {@category gamepad}
final class SdlGamepadBindingInputAxis extends Struct {
  // [0]+(4)
  @Int32()
  external int axis;
  // [4]+(4)
  @Int32()
  external int axisMin;
  // [8]+(4)
  @Int32()
  external int axisMax;
}

// SDL_GamepadBindingInputHat
/// {@category gamepad}
final class SdlGamepadBindingInputHat extends Struct {
  // [0]+(4)
  @Int32()
  external int hat;
  // [4]+(4)
  @Int32()
  external int hatMask;
}

// SDL_GamepadBindingInput
/// {@category gamepad}
final class SdlGamepadBindingInput extends Union {
  // [0]+(4)
  @Int32()
  external int button;
  // [0]+(12)
  external SdlGamepadBindingInputAxis axis;
  // [0]+(8)
  external SdlGamepadBindingInputHat hat;
}

// SDL_GamepadBindingOutputAxis
/// {@category gamepad}
final class SdlGamepadBindingOutputAxis extends Struct {
  // [0]+(4)
  @Int32()
  external int axis;
  // [4]+(4)
  @Int32()
  external int axisMin;
  // [8]+(4)
  @Int32()
  external int axisMax;
}

// SDL_GamepadBindingOutput
/// {@category gamepad}
final class SdlGamepadBindingOutput extends Union {
  // [0]+(4)
  @Int32()
  external int button;
  // [0]+(12)
  external SdlGamepadBindingOutputAxis axis;
}

// SDL_GamepadBinding
/// {@category gamepad}
final class SdlGamepadBinding extends Struct {
  // [0]+(4)
  @Int32()
  external int inputType;
  // [4]+(12)
  external SdlGamepadBindingInput input;
  // [16]+(4)
  @Int32()
  external int outputType;
  // [20]+(12)
  external SdlGamepadBindingOutput output;
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
}

// SDL_GPUTransferBufferLocation
/// {@category gpu}
final class SdlGpuTransferBufferLocation extends Struct {
  // [0]+(8)
  external Pointer<SdlGpuTransferBuffer> transferBuffer;
  // [8]+(4)
  @Uint32()
  external int offset;
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
  @Bool()
  external bool enableAnisotropy;
  // [45]+(1)
  @Bool()
  external bool enableCompare;
  // [46]+(1)
  @Uint8()
  external int padding1;
  // [47]+(1)
  @Uint8()
  external int padding2;
  // [48]+(4)
  @Uint32()
  external int props;
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
  // [16]+(8)
  external Pointer<SdlGpuVertexAttribute> vertexAttributes;
  // [24]+(4)
  @Uint32()
  external int numVertexAttributes;
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
  @Bool()
  external bool enableBlend;
  // [26]+(1)
  @Bool()
  external bool enableColorWriteMask;
  // [27]+(1)
  @Uint8()
  external int padding1;
  // [28]+(1)
  @Uint8()
  external int padding2;
}

// SDL_GPUShaderCreateInfo
/// {@category gpu}
final class SdlGpuShaderCreateInfo extends Struct {
  // [0]+(8)
  @Size()
  external int codeSize;
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
  @Bool()
  external bool enableDepthBias;
  // [25]+(1)
  @Bool()
  external bool enableDepthClip;
  // [26]+(1)
  @Uint8()
  external int padding1;
  // [27]+(1)
  @Uint8()
  external int padding2;
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
  @Bool()
  external bool enableMask;
  // [9]+(1)
  @Bool()
  external bool enableAlphaToCoverage;
  // [10]+(1)
  @Uint8()
  external int padding2;
  // [11]+(1)
  @Uint8()
  external int padding3;
}

// SDL_GPUDepthStencilState
/// {@category gpu}
final class SdlGpuDepthStencilState extends Struct {
  // [0]+(4)
  @Int32()
  external int compareOp;
  // [4]+(16)
  external SdlGpuStencilOpState backStencilState;
  // [20]+(16)
  external SdlGpuStencilOpState frontStencilState;
  // [36]+(1)
  @Uint8()
  external int compareMask;
  // [37]+(1)
  @Uint8()
  external int writeMask;
  // [38]+(1)
  @Bool()
  external bool enableDepthTest;
  // [39]+(1)
  @Bool()
  external bool enableDepthWrite;
  // [40]+(1)
  @Bool()
  external bool enableStencilTest;
  // [41]+(1)
  @Uint8()
  external int padding1;
  // [42]+(1)
  @Uint8()
  external int padding2;
  // [43]+(1)
  @Uint8()
  external int padding3;
}

// SDL_GPUColorTargetDescription
/// {@category gpu}
final class SdlGpuColorTargetDescription extends Struct {
  // [0]+(4)
  @Int32()
  external int format;
  // [4]+(32)
  external SdlGpuColorTargetBlendState blendState;
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
  @Bool()
  external bool hasDepthStencilTarget;
  // [17]+(1)
  @Uint8()
  external int padding1;
  // [18]+(1)
  @Uint8()
  external int padding2;
  // [19]+(1)
  @Uint8()
  external int padding3;
}

// SDL_GPUGraphicsPipelineCreateInfo
/// {@category gpu}
final class SdlGpuGraphicsPipelineCreateInfo extends Struct {
  // [0]+(8)
  external Pointer<SdlGpuShader> vertexShader;
  // [8]+(8)
  external Pointer<SdlGpuShader> fragmentShader;
  // [16]+(32)
  external SdlGpuVertexInputState vertexInputState;
  // [48]+(4)
  @Int32()
  external int primitiveType;
  // [52]+(28)
  external SdlGpuRasterizerState rasterizerState;
  // [80]+(12)
  external SdlGpuMultisampleState multisampleState;
  // [92]+(44)
  external SdlGpuDepthStencilState depthStencilState;
  // [136]+(24)
  external SdlGpuGraphicsPipelineTargetInfo targetInfo;
  // [160]+(4)
  @Uint32()
  external int props;
}

// SDL_GPUComputePipelineCreateInfo
/// {@category gpu}
final class SdlGpuComputePipelineCreateInfo extends Struct {
  // [0]+(8)
  @Size()
  external int codeSize;
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
  external SdlFColor clearColor;
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
  @Bool()
  external bool cycle;
  // [57]+(1)
  @Bool()
  external bool cycleResolveTexture;
  // [58]+(1)
  @Uint8()
  external int padding1;
  // [59]+(1)
  @Uint8()
  external int padding2;
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
  @Bool()
  external bool cycle;
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
  external SdlGpuBlitRegion source;
  // [32]+(32)
  external SdlGpuBlitRegion destination;
  // [64]+(4)
  @Int32()
  external int loadOp;
  // [68]+(16)
  external SdlFColor clearColor;
  // [84]+(4)
  @Int32()
  external int flipMode;
  // [88]+(4)
  @Int32()
  external int filter;
  // [92]+(1)
  @Bool()
  external bool cycle;
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

// SDL_GPUBufferBinding
/// {@category gpu}
final class SdlGpuBufferBinding extends Struct {
  // [0]+(8)
  external Pointer<SdlGpuBuffer> buffer;
  // [8]+(4)
  @Uint32()
  external int offset;
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
  @Bool()
  external bool cycle;
  // [9]+(1)
  @Uint8()
  external int padding1;
  // [10]+(1)
  @Uint8()
  external int padding2;
  // [11]+(1)
  @Uint8()
  external int padding3;
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
  @Bool()
  external bool cycle;
  // [17]+(1)
  @Uint8()
  external int padding1;
  // [18]+(1)
  @Uint8()
  external int padding2;
  // [19]+(1)
  @Uint8()
  external int padding3;
}

// SDL_GPUVulkanOptions
/// {@category gpu}
final class SdlGpuVulkanOptions extends Struct {
  // [0]+(4)
  @Uint32()
  external int vulkanApiVersion;
  // [8]+(8)
  external Pointer<Void> featureList;
  // [16]+(8)
  external Pointer<Void> vulkan10PhysicalDeviceFeatures;
  // [24]+(4)
  @Uint32()
  external int deviceExtensionCount;
  // [32]+(8)
  external Pointer<Pointer<Int8>> deviceExtensionNames;
  // [40]+(4)
  @Uint32()
  external int instanceExtensionCount;
  // [48]+(8)
  external Pointer<Pointer<Int8>> instanceExtensionNames;
}

// SDL_GUID
/// {@category guid}
final class SdlGuid extends Struct {
  // [0]+(1*16)
  @Array(16)
  external Array<Uint8> data;
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
  // [4]+(4*3)
  @Array(3)
  external Array<Int32> dir;
}

// SDL_HapticConstant
/// {@category haptic}
final class SdlHapticConstant extends Struct {
  // [0]+(2)
  @Uint16()
  external int type;
  // [4]+(16)
  external SdlHapticDirection direction;
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

// SDL_HapticPeriodic
/// {@category haptic}
final class SdlHapticPeriodic extends Struct {
  // [0]+(2)
  @Uint16()
  external int type;
  // [4]+(16)
  external SdlHapticDirection direction;
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
}

// SDL_HapticCondition
/// {@category haptic}
final class SdlHapticCondition extends Struct {
  // [0]+(2)
  @Uint16()
  external int type;
  // [4]+(16)
  external SdlHapticDirection direction;
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
  @Array(3)
  external Array<Uint16> rightSat;
  // [36]+(2*3)
  @Array(3)
  external Array<Uint16> leftSat;
  // [42]+(2*3)
  @Array(3)
  external Array<Int16> rightCoeff;
  // [48]+(2*3)
  @Array(3)
  external Array<Int16> leftCoeff;
  // [54]+(2*3)
  @Array(3)
  external Array<Uint16> deadband;
  // [60]+(2*3)
  @Array(3)
  external Array<Int16> center;
}

// SDL_HapticRamp
/// {@category haptic}
final class SdlHapticRamp extends Struct {
  // [0]+(2)
  @Uint16()
  external int type;
  // [4]+(16)
  external SdlHapticDirection direction;
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
}

// SDL_HapticLeftRight
/// {@category haptic}
final class SdlHapticLeftRight extends Struct {
  // [0]+(2)
  @Uint16()
  external int type;
  // [4]+(4)
  @Uint32()
  external int length;
  // [8]+(2)
  @Uint16()
  external int largeMagnitude;
  // [10]+(2)
  @Uint16()
  external int smallMagnitude;
}

// SDL_HapticCustom
/// {@category haptic}
final class SdlHapticCustom extends Struct {
  // [0]+(2)
  @Uint16()
  external int type;
  // [4]+(16)
  external SdlHapticDirection direction;
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
  // [32]+(2)
  @Uint16()
  external int period;
  // [34]+(2)
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

// SDL_HapticEffect
/// {@category haptic}
final class SdlHapticEffect extends Union {
  // [0]+(2)
  @Uint16()
  external int type;
  // [0]+(40)
  external SdlHapticConstant ant;
  // [0]+(48)
  external SdlHapticPeriodic periodic;
  // [0]+(68)
  external SdlHapticCondition condition;
  // [0]+(44)
  external SdlHapticRamp ramp;
  // [0]+(12)
  external SdlHapticLeftRight leftright;
  // [0]+(56)
  external SdlHapticCustom custom;
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
  @UnsignedShort()
  external int vendorId;
  // [10]+(2)
  @UnsignedShort()
  external int productId;
  // [16]+(8)
  external Pointer<WChar> serialNumber;
  // [24]+(2)
  @UnsignedShort()
  external int releaseNumber;
  // [32]+(8)
  external Pointer<WChar> manufacturerString;
  // [40]+(8)
  external Pointer<WChar> productString;
  // [48]+(2)
  @UnsignedShort()
  external int usagePage;
  // [50]+(2)
  @UnsignedShort()
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
  // [8]+(8)
  external Pointer<NativeFunction<SdlIoStreamInterfaceSize>> size;
  // [16]+(8)
  external Pointer<NativeFunction<SdlIoStreamInterfaceSeek>> seek;
  // [24]+(8)
  external Pointer<NativeFunction<SdlIoStreamInterfaceRead>> read;
  // [32]+(8)
  external Pointer<NativeFunction<SdlIoStreamInterfaceWrite>> write;
  // [40]+(8)
  external Pointer<NativeFunction<SdlIoStreamInterfaceFlush>> flush;
  // [48]+(8)
  external Pointer<NativeFunction<SdlIoStreamInterfaceClose>> close;
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
  @Array(3)
  external Array<Uint16> padding;
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
  @Array(2)
  external Array<Uint16> padding2;
  // [28]+(4)
  @Uint32()
  external int buttonMask;
  // [32]+(4)
  @Uint32()
  external int axisMask;
  // [40]+(8)
  external Pointer<Utf8> name;
  // [48]+(8)
  external Pointer<SdlVirtualJoystickTouchpadDesc> touchpads;
  // [56]+(8)
  external Pointer<SdlVirtualJoystickSensorDesc> sensors;
  // [64]+(8)
  external Pointer<Void> userdata;
  // [72]+(8)
  external Pointer<NativeFunction<SdlVirtualJoystickDescUpdate>> update;
  // [80]+(8)
  external Pointer<NativeFunction<SdlVirtualJoystickDescSetPlayerIndex>>
  setPlayerIndex;
  // [88]+(8)
  external Pointer<NativeFunction<SdlVirtualJoystickDescRumble>> rumble;
  // [96]+(8)
  external Pointer<NativeFunction<SdlVirtualJoystickDescRumbleTriggers>>
  rumbleTriggers;
  // [104]+(8)
  external Pointer<NativeFunction<SdlVirtualJoystickDescSetLed>> setLed;
  // [112]+(8)
  external Pointer<NativeFunction<SdlVirtualJoystickDescSendEffect>> sendEffect;
  // [120]+(8)
  external Pointer<NativeFunction<SdlVirtualJoystickDescSetSensorsEnabled>>
  setSensorsEnabled;
  // [128]+(8)
  external Pointer<NativeFunction<SdlVirtualJoystickDescCleanup>> cleanup;
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
}

// SDL_MessageBoxColorScheme
/// {@category messagebox}
final class SdlMessageBoxColorScheme extends Struct {
  // [0]+(3*5)
  @Array(5)
  external SdlMessageBoxColor colors;
}

// SDL_MessageBoxData
/// {@category messagebox}
final class SdlMessageBoxData extends Struct {
  // [0]+(4)
  @Uint32()
  external int flags;
  // [8]+(8)
  external Pointer<SdlWindow> window;
  // [16]+(8)
  external Pointer<Utf8> title;
  // [24]+(8)
  external Pointer<Utf8> message;
  // [32]+(4)
  @Int32()
  external int numbuttons;
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
  // [0]+(4)
  external SdlAtomicInt status;
  // [8]+(8)
  @Uint64()
  external int thread;
  // [16]+(8)
  external Pointer<Void> reserved;
}

// SDL_NotificationActionButton
/// {@category notification}
final class SdlNotificationActionButton extends Struct {
  // [0]+(4)
  @Int32()
  external int type;
  // [8]+(8)
  external Pointer<Utf8> actionId;
  // [16]+(8)
  external Pointer<Utf8> actionLabel;
}

// SDL_NotificationAction
/// {@category notification}
final class SdlNotificationAction extends Union {
  // [0]+(4)
  @Int32()
  external int type;
  // [0]+(24)
  external SdlNotificationActionButton button;
  // [0]+(1*128)
  @Array(128)
  external Array<Uint8> padding;
}

// XrSessionCreateInfo
/// {@category openxr}
final class XrSessionCreateInfo extends Struct {
  // [0]+(4)
  @Int32()
  external int type;
  // [8]+(8)
  external Pointer<Void> next;
}

// XrSwapchainCreateInfo
/// {@category openxr}
final class XrSwapchainCreateInfo extends Struct {
  // [0]+(4)
  @Int32()
  external int type;
  // [8]+(8)
  external Pointer<Void> next;
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
  @Array(2)
  external Array<Uint8> padding;
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
  external SdlFPoint position;
  // [8]+(16)
  external SdlFColor color;
  // [24]+(8)
  external SdlFPoint texCoord;
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
  // [16]+(8)
  external Pointer<SdlGpuTextureSamplerBinding> samplerBindings;
  // [24]+(4)
  @Int32()
  external int numStorageTextures;
  // [32]+(8)
  external Pointer<Pointer<SdlGpuTexture>> storageTextures;
  // [40]+(4)
  @Int32()
  external int numStorageBuffers;
  // [48]+(8)
  external Pointer<Pointer<SdlGpuBuffer>> storageBuffers;
  // [56]+(4)
  @Uint32()
  external int props;
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
  // [8]+(8)
  external Pointer<Void> b;
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
  // [8]+(8)
  external Pointer<NativeFunction<SdlStorageInterfaceClose>> close;
  // [16]+(8)
  external Pointer<NativeFunction<SdlStorageInterfaceReady>> ready;
  // [24]+(8)
  external Pointer<NativeFunction<SdlStorageInterfaceEnumerate>> enumerate;
  // [32]+(8)
  external Pointer<NativeFunction<SdlStorageInterfaceInfo>> info;
  // [40]+(8)
  external Pointer<NativeFunction<SdlStorageInterfaceReadFile>> readFile;
  // [48]+(8)
  external Pointer<NativeFunction<SdlStorageInterfaceWriteFile>> writeFile;
  // [56]+(8)
  external Pointer<NativeFunction<SdlStorageInterfaceMkdir>> mkdir;
  // [64]+(8)
  external Pointer<NativeFunction<SdlStorageInterfaceRemove>> remove;
  // [72]+(8)
  external Pointer<NativeFunction<SdlStorageInterfaceRename>> rename;
  // [80]+(8)
  external Pointer<NativeFunction<SdlStorageInterfaceCopy>> copy;
  // [88]+(8)
  external Pointer<NativeFunction<SdlStorageInterfaceSpaceRemaining>>
  spaceRemaining;
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
  // [24]+(8)
  external Pointer<Void> pixels;
  // [32]+(4)
  @Int32()
  external int refcount;
  // [40]+(8)
  external Pointer<Void> reserved;
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
