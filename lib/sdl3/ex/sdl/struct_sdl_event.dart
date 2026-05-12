part of '../../sdl.dart';

class SdlxEvent {
  SdlxEvent({this.type = 0, this.reserved = 0, this.timestamp = 0});
  int type;
  int reserved;
  int timestamp;

  static SdlxEvent fromPointer(Pointer<SdlEvent> pointer) {
    if (pointer.type >= SDL_EVENT_DISPLAY_FIRST &&
        pointer.type <= SDL_EVENT_DISPLAY_LAST) {
      return SdlxDisplayEvent.fromPointer(pointer);
    } else if (pointer.type >= SDL_EVENT_WINDOW_FIRST &&
        pointer.type <= SDL_EVENT_WINDOW_LAST) {
      return SdlxWindowEvent.fromPointer(pointer);
    } else if (pointer.type >= SDL_EVENT_USER &&
        pointer.type <= SDL_EVENT_LAST) {
      return SdlxUserEvent.fromPointer(pointer);
    } else {
      switch (pointer.type) {
        case SDL_EVENT_KEYBOARD_ADDED:
        case SDL_EVENT_KEYBOARD_REMOVED:
          return SdlxKeyboardDeviceEvent.fromPointer(pointer);
        case SDL_EVENT_KEY_DOWN:
        case SDL_EVENT_KEY_UP:
          return SdlxKeyboardEvent.fromPointer(pointer);
        case SDL_EVENT_TEXT_EDITING:
          return SdlxTextEditingEvent.fromPointer(pointer);
        case SDL_EVENT_TEXT_EDITING_CANDIDATES:
          return SdlxTextEditingCandidatesEvent.fromPointer(pointer);
        case SDL_EVENT_TEXT_INPUT:
          return SdlxTextInputEvent.fromPointer(pointer);
        case SDL_EVENT_MOUSE_ADDED:
        case SDL_EVENT_MOUSE_REMOVED:
          return SdlxMouseDeviceEvent.fromPointer(pointer);
        case SDL_EVENT_MOUSE_MOTION:
          return SdlxMouseMotionEvent.fromPointer(pointer);
        case SDL_EVENT_MOUSE_BUTTON_DOWN:
        case SDL_EVENT_MOUSE_BUTTON_UP:
          return SdlxMouseButtonEvent.fromPointer(pointer);
        case SDL_EVENT_MOUSE_WHEEL:
          return SdlxMouseWheelEvent.fromPointer(pointer);
        case SDL_EVENT_JOYSTICK_AXIS_MOTION:
          return SdlxJoyAxisEvent.fromPointer(pointer);
        case SDL_EVENT_JOYSTICK_BALL_MOTION:
          return SdlxJoyBallEvent.fromPointer(pointer);
        case SDL_EVENT_JOYSTICK_HAT_MOTION:
          return SdlxJoyHatEvent.fromPointer(pointer);
        case SDL_EVENT_JOYSTICK_BUTTON_DOWN:
        case SDL_EVENT_JOYSTICK_BUTTON_UP:
          return SdlxJoyButtonEvent.fromPointer(pointer);
        case SDL_EVENT_JOYSTICK_ADDED:
        case SDL_EVENT_JOYSTICK_REMOVED:
        case SDL_EVENT_JOYSTICK_UPDATE_COMPLETE:
          return SdlxJoyDeviceEvent.fromPointer(pointer);
        case SDL_EVENT_JOYSTICK_BATTERY_UPDATED:
          return SdlxJoyBatteryEvent.fromPointer(pointer);
        case SDL_EVENT_GAMEPAD_AXIS_MOTION:
          return SdlxGamepadAxisEvent.fromPointer(pointer);
        case SDL_EVENT_GAMEPAD_BUTTON_DOWN:
        case SDL_EVENT_GAMEPAD_BUTTON_UP:
          return SdlxGamepadButtonEvent.fromPointer(pointer);
        case SDL_EVENT_GAMEPAD_ADDED:
        case SDL_EVENT_GAMEPAD_REMOVED:
        case SDL_EVENT_GAMEPAD_REMAPPED:
        case SDL_EVENT_GAMEPAD_UPDATE_COMPLETE:
        case SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED:
          return SdlxGamepadDeviceEvent.fromPointer(pointer);
        case SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN:
        case SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION:
        case SDL_EVENT_GAMEPAD_TOUCHPAD_UP:
          return SdlxGamepadTouchpadEvent.fromPointer(pointer);
        case SDL_EVENT_GAMEPAD_SENSOR_UPDATE:
          return SdlxGamepadSensorEvent.fromPointer(pointer);
        case SDL_EVENT_AUDIO_DEVICE_ADDED:
        case SDL_EVENT_AUDIO_DEVICE_REMOVED:
        case SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED:
          return SdlxAudioDeviceEvent.fromPointer(pointer);
        case SDL_EVENT_CAMERA_DEVICE_ADDED:
        case SDL_EVENT_CAMERA_DEVICE_REMOVED:
        case SDL_EVENT_CAMERA_DEVICE_APPROVED:
        case SDL_EVENT_CAMERA_DEVICE_DENIED:
          return SdlxCameraDeviceEvent.fromPointer(pointer);
        case SDL_EVENT_RENDER_TARGETS_RESET:
        case SDL_EVENT_RENDER_DEVICE_RESET:
        case SDL_EVENT_RENDER_DEVICE_LOST:
          return SdlxRenderEvent.fromPointer(pointer);
        case SDL_EVENT_FINGER_DOWN:
        case SDL_EVENT_FINGER_UP:
        case SDL_EVENT_FINGER_MOTION:
        case SDL_EVENT_FINGER_CANCELED:
          return SdlxTouchFingerEvent.fromPointer(pointer);
        case SDL_EVENT_PINCH_BEGIN:
        case SDL_EVENT_PINCH_UPDATE:
        case SDL_EVENT_PINCH_END:
          return SdlxPinchFingerEvent.fromPointer(pointer);
        case SDL_EVENT_PEN_PROXIMITY_IN:
        case SDL_EVENT_PEN_PROXIMITY_OUT:
          return SdlxPenProximityEvent.fromPointer(pointer);
        case SDL_EVENT_PEN_MOTION:
          return SdlxPenMotionEvent.fromPointer(pointer);
        case SDL_EVENT_PEN_DOWN:
        case SDL_EVENT_PEN_UP:
          return SdlxPenButtonEvent.fromPointer(pointer);
        case SDL_EVENT_PEN_BUTTON_DOWN:
        case SDL_EVENT_PEN_BUTTON_UP:
          return SdlxPenButtonEvent.fromPointer(pointer);
        case SDL_EVENT_PEN_AXIS:
          return SdlxPenAxisEvent.fromPointer(pointer);
        case SDL_EVENT_DROP_BEGIN:
        case SDL_EVENT_DROP_FILE:
        case SDL_EVENT_DROP_TEXT:
        case SDL_EVENT_DROP_COMPLETE:
        case SDL_EVENT_DROP_POSITION:
          return SdlxDropEvent.fromPointer(pointer);
        case SDL_EVENT_CLIPBOARD_UPDATE:
          return SdlxClipboardEvent.fromPointer(pointer);
        case SDL_EVENT_SENSOR_UPDATE:
          return SdlxSensorEvent.fromPointer(pointer);
        case SDL_EVENT_QUIT:
          return SdlxQuitEvent.fromPointer(pointer);
        default:
          return SdlxCommonEvent.fromPointer(pointer);
      }
    }
  }
}

class SdlxCommonEvent extends SdlxEvent {
  SdlxCommonEvent({super.type = 0, super.reserved = 0, super.timestamp = 0});

  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.common.ref.type;
    reserved = pointer.common.ref.reserved;
    timestamp = pointer.common.ref.timestamp;
  }

  static SdlxCommonEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxCommonEvent()..loadFromPointer(pointer);
}

class SdlxDisplayEvent extends SdlxEvent {
  SdlxDisplayEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.displayId = 0,
    this.data1 = 0,
    this.data2 = 0,
  });

  int displayId;
  int data1;
  int data2;

  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.display.ref.type;
    reserved = pointer.display.ref.reserved;
    timestamp = pointer.display.ref.timestamp;
    displayId = pointer.display.ref.displayId;
    data1 = pointer.display.ref.data1;
    data2 = pointer.display.ref.data2;
  }

  static SdlxDisplayEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxDisplayEvent()..loadFromPointer(pointer.cast<SdlEvent>());
}

class SdlxWindowEvent extends SdlxEvent {
  SdlxWindowEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.data1 = 0,
    this.data2 = 0,
  });

  int windowId;
  int data1;
  int data2;

  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.window.ref.type;
    reserved = pointer.window.ref.reserved;
    timestamp = pointer.window.ref.timestamp;
    windowId = pointer.window.ref.windowId;
    data1 = pointer.window.ref.data1;
    data2 = pointer.window.ref.data2;
  }

  static SdlxWindowEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxWindowEvent()..loadFromPointer(pointer);
}

class SdlxKeyboardDeviceEvent extends SdlxEvent {
  SdlxKeyboardDeviceEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
  });

  int which;
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.kdevice.ref.type;
    reserved = pointer.kdevice.ref.reserved;
    timestamp = pointer.kdevice.ref.timestamp;
    which = pointer.kdevice.ref.which;
  }

  static SdlxKeyboardDeviceEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxKeyboardDeviceEvent()..loadFromPointer(pointer);
}

class SdlxKeyboardEvent extends SdlxEvent {
  SdlxKeyboardEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.which = 0,
    this.scancode = 0,
    this.key = 0,
    this.mod = 0,
    this.raw = 0,
    this.down = 0,
    this.repeat = 0,
  });

  int windowId;
  int which;
  int scancode;
  int key;
  int mod;
  int raw;
  int down;
  int repeat;

  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.key.ref.type;
    reserved = pointer.key.ref.reserved;
    timestamp = pointer.key.ref.timestamp;
    windowId = pointer.key.ref.windowId;
    which = pointer.key.ref.which;
    scancode = pointer.key.ref.scancode;
    key = pointer.key.ref.key;
    mod = pointer.key.ref.mod;
    raw = pointer.key.ref.raw;
    down = pointer.key.ref.down;
    repeat = pointer.key.ref.repeat;
  }

  static SdlxKeyboardEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxKeyboardEvent()..loadFromPointer(pointer);
}

class SdlxTextEditingEvent extends SdlxEvent {
  SdlxTextEditingEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.text = '',
    this.start = 0,
    this.length = 0,
  });

  int windowId;
  String text;
  int start;
  int length;
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.edit.ref.type;
    reserved = pointer.edit.ref.reserved;
    timestamp = pointer.edit.ref.timestamp;
    windowId = pointer.edit.ref.windowId;
    if (pointer.edit.ref.text != nullptr) {
      text = pointer.edit.ref.text.toDartString();
    }
    start = pointer.edit.ref.start;
    length = pointer.edit.ref.length;
  }

  static SdlxTextEditingEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxTextEditingEvent()..loadFromPointer(pointer);
}

class SdlxTextEditingCandidatesEvent extends SdlxEvent {
  SdlxTextEditingCandidatesEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    List<String>? candidates,
    this.selectedCandidate = 0,
    this.horizontal = 0,
  }) {
    this.candidates = candidates ?? [];
  }
  int windowId;
  late List<String> candidates;
  int selectedCandidate;
  int horizontal;

  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.editCandidates.ref.type;
    reserved = pointer.editCandidates.ref.reserved;
    timestamp = pointer.editCandidates.ref.timestamp;
    for (var i = 0; i < pointer.editCandidates.ref.numCandidates; i++) {
      if (pointer.editCandidates.ref.candidates[i] != nullptr) {
        candidates.add(
          pointer.editCandidates.ref.candidates[i].cast<Utf8>().toDartString(),
        );
      }
    }
    windowId = pointer.editCandidates.ref.windowId;
    selectedCandidate = pointer.editCandidates.ref.selectedCandidate;
    horizontal = pointer.editCandidates.ref.horizontal;
  }

  static SdlxTextEditingCandidatesEvent fromPointer(
    Pointer<SdlEvent> pointer,
  ) => SdlxTextEditingCandidatesEvent()..loadFromPointer(pointer);
}

class SdlxTextInputEvent extends SdlxEvent {
  SdlxTextInputEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.text = '',
  });

  int windowId;
  String text;

  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.text.ref.type;
    reserved = pointer.text.ref.reserved;
    timestamp = pointer.text.ref.timestamp;
    windowId = pointer.text.ref.windowId;
    if (pointer.text.ref.text != nullptr) {
      text = pointer.text.ref.text.toDartString();
    }
  }

  static SdlxTextInputEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxTextInputEvent()..loadFromPointer(pointer);
}

class SdlxMouseDeviceEvent extends SdlxEvent {
  SdlxMouseDeviceEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
  });

  int which;

  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.mdevice.ref.type;
    reserved = pointer.mdevice.ref.reserved;
    timestamp = pointer.mdevice.ref.timestamp;
    which = pointer.mdevice.ref.which;
  }

  static SdlxMouseDeviceEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxMouseDeviceEvent()..loadFromPointer(pointer);
}

class SdlxMouseMotionEvent extends SdlxEvent {
  SdlxMouseMotionEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.which = 0,
    this.state = 0,
    this.x = 0,
    this.y = 0,
    this.xrel = 0,
    this.yrel = 0,
  });

  int windowId;
  int which;
  int state;
  double x;
  double y;
  double xrel;
  double yrel;

  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.motion.ref.type;
    reserved = pointer.motion.ref.reserved;
    timestamp = pointer.motion.ref.timestamp;
    windowId = pointer.motion.ref.windowId;
    which = pointer.motion.ref.which;
    state = pointer.motion.ref.state;
    x = pointer.motion.ref.x;
    y = pointer.motion.ref.y;
    xrel = pointer.motion.ref.xrel;
    yrel = pointer.motion.ref.yrel;
  }

  static SdlxMouseMotionEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxMouseMotionEvent()..loadFromPointer(pointer);
}

class SdlxMouseButtonEvent extends SdlxEvent {
  SdlxMouseButtonEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.which = 0,
    this.button = 0,
    this.down = 0,
    this.clicks = 0,
    this.x = 0,
    this.y = 0,
  });

  int windowId;
  int which;
  int button;
  int down;
  int clicks;
  double x;
  double y;

  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.button.ref.type;
    reserved = pointer.button.ref.reserved;
    timestamp = pointer.button.ref.timestamp;
    windowId = pointer.button.ref.windowId;
    which = pointer.button.ref.which;
    button = pointer.button.ref.button;
    down = pointer.button.ref.down;
    clicks = pointer.button.ref.clicks;
    x = pointer.button.ref.x;
    y = pointer.button.ref.y;
  }

  static SdlxMouseButtonEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxMouseButtonEvent()..loadFromPointer(pointer);
}

class SdlxMouseWheelEvent extends SdlxEvent {
  SdlxMouseWheelEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.which = 0,
    this.x = 0,
    this.y = 0,
    this.direction = 0,
    this.mouseX = 0,
    this.mouseY = 0,
    this.integerX = 0,
    this.integerY = 0,
  });

  int windowId;
  int which;
  double x;
  double y;
  int direction;
  double mouseX;
  double mouseY;
  int integerX;
  int integerY;

  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.wheel.ref.type;
    reserved = pointer.wheel.ref.reserved;
    timestamp = pointer.wheel.ref.timestamp;
    windowId = pointer.wheel.ref.windowId;
    which = pointer.wheel.ref.which;
    x = pointer.wheel.ref.x;
    y = pointer.wheel.ref.y;
    direction = pointer.wheel.ref.direction;
    mouseX = pointer.wheel.ref.mouseX;
    mouseY = pointer.wheel.ref.mouseY;
    integerX = pointer.wheel.ref.integerX;
    integerY = pointer.wheel.ref.integerY;
  }

  static SdlxMouseWheelEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxMouseWheelEvent()..loadFromPointer(pointer);
}

class SdlxJoyAxisEvent extends SdlxEvent {
  SdlxJoyAxisEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    this.axis = 0,
    this.value = 0,
  });

  int which;
  int axis;
  int value;

  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.jaxis.ref.type;
    reserved = pointer.jaxis.ref.reserved;
    timestamp = pointer.jaxis.ref.timestamp;
    which = pointer.jaxis.ref.which;
    axis = pointer.jaxis.ref.axis;
    value = pointer.jaxis.ref.value;
  }

  static SdlxJoyAxisEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxJoyAxisEvent()..loadFromPointer(pointer);
}

class SdlxJoyBallEvent extends SdlxEvent {
  SdlxJoyBallEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    this.ball = 0,
    this.xrel = 0,
    this.yrel = 0,
  });

  int which;
  int ball;
  int xrel;
  int yrel;
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.jball.ref.type;
    reserved = pointer.jball.ref.reserved;
    timestamp = pointer.jball.ref.timestamp;
    which = pointer.jball.ref.which;
    ball = pointer.jball.ref.ball;
    xrel = pointer.jball.ref.xrel;
    yrel = pointer.jball.ref.yrel;
  }

  static SdlxJoyBallEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxJoyBallEvent()..loadFromPointer(pointer);
}

class SdlxJoyHatEvent extends SdlxEvent {
  SdlxJoyHatEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    this.hat = 0,
    this.value = 0,
  });

  int which;
  int hat;
  int value;

  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.jhat.ref.type;
    reserved = pointer.jhat.ref.reserved;
    timestamp = pointer.jhat.ref.timestamp;
    which = pointer.jhat.ref.which;
    hat = pointer.jhat.ref.hat;
    value = pointer.jhat.ref.value;
  }

  static SdlxJoyHatEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxJoyHatEvent()..loadFromPointer(pointer);
}

class SdlxJoyButtonEvent extends SdlxEvent {
  SdlxJoyButtonEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    this.button = 0,
    this.down = 0,
  });

  int which;
  int button;
  int down;

  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.jbutton.ref.type;
    reserved = pointer.jbutton.ref.reserved;
    timestamp = pointer.jbutton.ref.timestamp;
    which = pointer.jbutton.ref.which;
    button = pointer.jbutton.ref.button;
    down = pointer.jbutton.ref.down;
  }

  static SdlxJoyButtonEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxJoyButtonEvent()..loadFromPointer(pointer);
}

class SdlxJoyDeviceEvent extends SdlxEvent {
  SdlxJoyDeviceEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
  });
  int which;

  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.jdevice.ref.type;
    reserved = pointer.jdevice.ref.reserved;
    timestamp = pointer.jdevice.ref.timestamp;
    which = pointer.jdevice.ref.which;
  }

  static SdlxJoyDeviceEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxJoyDeviceEvent()..loadFromPointer(pointer);
}

class SdlxJoyBatteryEvent extends SdlxEvent {
  SdlxJoyBatteryEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    this.state = 0,
    this.percent = 0,
  });

  int which;
  int state;
  int percent;
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.jbattery.ref.type;
    reserved = pointer.jbattery.ref.reserved;
    timestamp = pointer.jbattery.ref.timestamp;
    which = pointer.jbattery.ref.which;
    state = pointer.jbattery.ref.state;
    percent = pointer.jbattery.ref.percent;
  }

  static SdlxJoyBatteryEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxJoyBatteryEvent()..loadFromPointer(pointer);
}

class SdlxGamepadAxisEvent extends SdlxEvent {
  SdlxGamepadAxisEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    this.axis = 0,
    this.value = 0,
  });

  int which;
  int axis;
  int value;

  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.gaxis.ref.type;
    reserved = pointer.gaxis.ref.reserved;
    timestamp = pointer.gaxis.ref.timestamp;
    which = pointer.gaxis.ref.which;
    axis = pointer.gaxis.ref.axis;
    value = pointer.gaxis.ref.value;
  }

  static SdlxGamepadAxisEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxGamepadAxisEvent()..loadFromPointer(pointer);
}

class SdlxGamepadButtonEvent extends SdlxEvent {
  SdlxGamepadButtonEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    this.button = 0,
    this.down = 0,
  });

  int which;
  int button;
  int down;

  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.gbutton.ref.type;
    reserved = pointer.gbutton.ref.reserved;
    timestamp = pointer.gbutton.ref.timestamp;
    which = pointer.gbutton.ref.which;
    button = pointer.gbutton.ref.button;
    down = pointer.gbutton.ref.down;
  }

  static SdlxGamepadButtonEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxGamepadButtonEvent()..loadFromPointer(pointer);
}

class SdlxGamepadDeviceEvent extends SdlxEvent {
  SdlxGamepadDeviceEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
  });

  int which;

  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.gdevice.ref.type;
    reserved = pointer.gdevice.ref.reserved;
    timestamp = pointer.gdevice.ref.timestamp;
    which = pointer.gdevice.ref.which;
  }

  static SdlxGamepadDeviceEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxGamepadDeviceEvent()..loadFromPointer(pointer);
}

class SdlxGamepadTouchpadEvent extends SdlxEvent {
  SdlxGamepadTouchpadEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    this.touchpad = 0,
    this.finger = 0,
    this.x = 0,
    this.y = 0,
    this.pressure = 0,
  });
  int which;
  int touchpad;
  int finger;
  double x;
  double y;
  double pressure;

  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.gtouchpad.ref.type;
    reserved = pointer.gtouchpad.ref.reserved;
    timestamp = pointer.gtouchpad.ref.timestamp;
    which = pointer.gtouchpad.ref.which;
    touchpad = pointer.gtouchpad.ref.touchpad;
    finger = pointer.gtouchpad.ref.finger;
    x = pointer.gtouchpad.ref.x;
    y = pointer.gtouchpad.ref.y;
    pressure = pointer.gtouchpad.ref.pressure;
  }

  static SdlxGamepadTouchpadEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxGamepadTouchpadEvent()..loadFromPointer(pointer);
}

class SdlxGamepadSensorEvent extends SdlxEvent {
  SdlxGamepadSensorEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    List<double>? datas,
    this.sensor = 0,
  }) {
    this.datas = datas ?? [];
  }

  int which;
  late List<double> datas;
  int sensor;
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.gsensor.ref.type;
    reserved = pointer.gsensor.ref.reserved;
    timestamp = pointer.gsensor.ref.timestamp;
    which = pointer.gsensor.ref.which;
    datas
      ..add(pointer.gsensor.ref.data_1)
      ..add(pointer.gsensor.ref.data_2)
      ..add(pointer.gsensor.ref.data_3);
    sensor = pointer.gsensor.ref.sensor;
  }

  static SdlxGamepadSensorEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxGamepadSensorEvent()..loadFromPointer(pointer);
}

class SdlxAudioDeviceEvent extends SdlxEvent {
  SdlxAudioDeviceEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    this.recording = 0,
  });

  int which;
  int recording;

  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.adevice.ref.type;
    reserved = pointer.adevice.ref.reserved;
    timestamp = pointer.adevice.ref.timestamp;
    which = pointer.adevice.ref.which;
    recording = pointer.adevice.ref.recording;
  }

  static SdlxAudioDeviceEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxAudioDeviceEvent()..loadFromPointer(pointer);
}

class SdlxCameraDeviceEvent extends SdlxEvent {
  SdlxCameraDeviceEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
  });

  int which;
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.cdevice.ref.type;
    reserved = pointer.cdevice.ref.reserved;
    timestamp = pointer.cdevice.ref.timestamp;
    which = pointer.cdevice.ref.which;
  }

  static SdlxCameraDeviceEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxCameraDeviceEvent()..loadFromPointer(pointer);
}

class SdlxRenderEvent extends SdlxEvent {
  SdlxRenderEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
  });

  int windowId;
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.render.ref.type;
    reserved = pointer.render.ref.reserved;
    timestamp = pointer.render.ref.timestamp;
    windowId = pointer.render.ref.windowId;
  }

  static SdlxRenderEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxRenderEvent()..loadFromPointer(pointer);
}

class SdlxTouchFingerEvent extends SdlxEvent {
  SdlxTouchFingerEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.touchId = 0,
    this.fingerId = 0,
    this.x = 0,
    this.y = 0,
    this.dx = 0,
    this.dy = 0,
    this.pressure = 0,
    this.windowId = 0,
  });
  int touchId;
  int fingerId;
  double x;
  double y;
  double dx;
  double dy;
  double pressure;
  int windowId;

  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.tfinger.ref.type;
    reserved = pointer.tfinger.ref.reserved;
    timestamp = pointer.tfinger.ref.timestamp;
    touchId = pointer.tfinger.ref.touchId;
    fingerId = pointer.tfinger.ref.fingerId;
    x = pointer.tfinger.ref.x;
    y = pointer.tfinger.ref.y;
    dx = pointer.tfinger.ref.dx;
    dy = pointer.tfinger.ref.dy;
    pressure = pointer.tfinger.ref.pressure;
    windowId = pointer.tfinger.ref.windowId;
  }

  static SdlxTouchFingerEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxTouchFingerEvent()..loadFromPointer(pointer);
}

class SdlxPinchFingerEvent extends SdlxEvent {
  SdlxPinchFingerEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.scale = 0,
    this.windowId = 0,
  });
  double scale;
  int windowId;

  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.pinch.ref.type;
    reserved = pointer.pinch.ref.reserved;
    timestamp = pointer.pinch.ref.timestamp;
    scale = pointer.pinch.ref.scale;
    windowId = pointer.pinch.ref.windowId;
  }

  static SdlxPinchFingerEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxPinchFingerEvent()..loadFromPointer(pointer);
}

class SdlxPenProximityEvent extends SdlxEvent {
  SdlxPenProximityEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.which = 0,
  });

  int windowId;
  int which;

  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.pproximity.ref.type;
    reserved = pointer.pproximity.ref.reserved;
    timestamp = pointer.pproximity.ref.timestamp;
    windowId = pointer.pproximity.ref.windowId;
    which = pointer.pproximity.ref.which;
  }

  static SdlxPenProximityEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxPenProximityEvent()..loadFromPointer(pointer);
}

class SdlxPenMotionEvent extends SdlxEvent {
  SdlxPenMotionEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.which = 0,
    this.penState = 0,
    this.x = 0,
    this.y = 0,
  });
  int windowId;
  int which;
  int penState;
  double x;
  double y;

  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.pmotion.ref.type;
    reserved = pointer.pmotion.ref.reserved;
    timestamp = pointer.pmotion.ref.timestamp;
    windowId = pointer.pmotion.ref.windowId;
    which = pointer.pmotion.ref.which;
    penState = pointer.pmotion.ref.penState;
    x = pointer.pmotion.ref.x;
    y = pointer.pmotion.ref.y;
  }

  static SdlxPenMotionEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxPenMotionEvent()..loadFromPointer(pointer);
}

class SdlxPenTouchEvent extends SdlxEvent {
  SdlxPenTouchEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.which = 0,
    this.penState = 0,
    this.x = 0,
    this.y = 0,
    this.eraser = 0,
    this.down = 0,
  });
  int windowId;
  int which;
  int penState;
  double x;
  double y;
  int eraser;
  int down;

  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ptouch.ref.type;
    reserved = pointer.ptouch.ref.reserved;
    timestamp = pointer.ptouch.ref.timestamp;
    windowId = pointer.ptouch.ref.windowId;
    which = pointer.ptouch.ref.which;
    penState = pointer.ptouch.ref.penState;
    x = pointer.ptouch.ref.x;
    y = pointer.ptouch.ref.y;
    eraser = pointer.ptouch.ref.eraser;
    down = pointer.ptouch.ref.down;
  }

  static SdlxPenTouchEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxPenTouchEvent()..loadFromPointer(pointer);
}

class SdlxPenButtonEvent extends SdlxEvent {
  SdlxPenButtonEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.which = 0,
    this.penState = 0,
    this.x = 0,
    this.y = 0,
    this.button = 0,
    this.down = 0,
  });
  int windowId;
  int which;
  int penState;
  double x;
  double y;
  int button;
  int down;

  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.pbutton.ref.type;
    reserved = pointer.pbutton.ref.reserved;
    timestamp = pointer.pbutton.ref.timestamp;
    windowId = pointer.pbutton.ref.windowId;
    which = pointer.pbutton.ref.which;
    penState = pointer.pbutton.ref.penState;
    x = pointer.pbutton.ref.x;
    y = pointer.pbutton.ref.y;
    button = pointer.pbutton.ref.button;
    down = pointer.pbutton.ref.down;
  }

  static SdlxPenButtonEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxPenButtonEvent()..loadFromPointer(pointer);
}

class SdlxPenAxisEvent extends SdlxEvent {
  SdlxPenAxisEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.which = 0,
    this.penState = 0,
    this.x = 0,
    this.y = 0,
    this.axis = 0,
    this.value = 0,
  });
  int windowId;
  int which;
  int penState;
  double x;
  double y;
  int axis;
  double value;

  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.paxis.ref.type;
    reserved = pointer.paxis.ref.reserved;
    timestamp = pointer.paxis.ref.timestamp;
    windowId = pointer.paxis.ref.windowId;
    which = pointer.paxis.ref.which;
    penState = pointer.paxis.ref.penState;
    x = pointer.paxis.ref.x;
    y = pointer.paxis.ref.y;
    axis = pointer.paxis.ref.axis;
    value = pointer.paxis.ref.value;
  }

  static SdlxPenAxisEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxPenAxisEvent()..loadFromPointer(pointer);
}

class SdlxDropEvent extends SdlxEvent {
  SdlxDropEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.x = 0,
    this.y = 0,
    this.source = '',
    this.data = '',
  });

  int windowId;
  double x;
  double y;
  String source;
  String data;

  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.drop.ref.type;
    reserved = pointer.drop.ref.reserved;
    timestamp = pointer.drop.ref.timestamp;
    windowId = pointer.drop.ref.windowId;
    x = pointer.drop.ref.x;
    y = pointer.drop.ref.y;
    if (pointer.drop.ref.source != nullptr) {
      source = pointer.drop.ref.source.toDartString();
    }
    if (pointer.drop.ref.data != nullptr) {
      data = pointer.drop.ref.data.toDartString();
    }
  }

  static SdlxDropEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxDropEvent()..loadFromPointer(pointer);
}

class SdlxClipboardEvent extends SdlxEvent {
  SdlxClipboardEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.owner = 0,
    List<String>? mimeTypes,
  }) {
    this.mimeTypes = mimeTypes ?? [];
  }
  int owner;
  late List<String> mimeTypes;

  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.clipboard.ref.type;
    reserved = pointer.clipboard.ref.reserved;
    timestamp = pointer.clipboard.ref.timestamp;
    owner = pointer.clipboard.ref.owner;
    for (var i = 0; i < pointer.clipboard.ref.numMimeTypes; i++) {
      if (pointer.clipboard.ref.mimeTypes[i] != nullptr) {
        mimeTypes.add(
          pointer.clipboard.ref.mimeTypes[i].cast<Utf8>().toDartString(),
        );
      }
    }
  }

  static SdlxClipboardEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxClipboardEvent()..loadFromPointer(pointer);
}

class SdlxSensorEvent extends SdlxEvent {
  SdlxSensorEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    List<double>? datas,
    this.sensorTimestamp = 0,
  }) {
    this.datas = datas ?? [];
  }

  int which;
  late List<double> datas;
  int sensorTimestamp;

  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.sensor.ref.type;
    reserved = pointer.sensor.ref.reserved;
    timestamp = pointer.sensor.ref.timestamp;
    which = pointer.sensor.ref.which;
    datas
      ..add(pointer.sensor.ref.data_1)
      ..add(pointer.sensor.ref.data_2)
      ..add(pointer.sensor.ref.data_3)
      ..add(pointer.sensor.ref.data_4)
      ..add(pointer.sensor.ref.data_5)
      ..add(pointer.sensor.ref.data_6);
    sensorTimestamp = pointer.sensor.ref.sensorTimestamp;
  }

  static SdlxSensorEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxSensorEvent()..loadFromPointer(pointer);
}

class SdlxQuitEvent extends SdlxEvent {
  SdlxQuitEvent({super.type = 0, super.reserved = 0, super.timestamp = 0});

  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.quit.ref.type;
    reserved = pointer.quit.ref.reserved;
    timestamp = pointer.quit.ref.timestamp;
  }

  static SdlxQuitEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxQuitEvent()..loadFromPointer(pointer);
}

class SdlxUserEvent extends SdlxEvent {
  SdlxUserEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.code = 0,
    Pointer<NativeType>? data1,
    Pointer<NativeType>? data2,
  }) {
    this.data1 = data1 ?? nullptr;
    this.data2 = data2 ?? nullptr;
  }

  int windowId;
  int code;
  late Pointer<NativeType> data1;
  late Pointer<NativeType> data2;

  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.user.ref.type;
    reserved = pointer.user.ref.reserved;
    timestamp = pointer.user.ref.timestamp;
    windowId = pointer.user.ref.windowId;
    code = pointer.user.ref.code;
    data1 = pointer.user.ref.data1;
    data2 = pointer.user.ref.data2;
  }

  static SdlxUserEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxUserEvent()..loadFromPointer(pointer);
}
