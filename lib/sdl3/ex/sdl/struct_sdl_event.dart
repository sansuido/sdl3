part of '../../sdl.dart';

class SdlxEvent {
  SdlxEvent({this.type = 0, this.reserved = 0, this.timestamp = 0});
  int type;
  int reserved;
  int timestamp;

  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.type = type;
    return pointer;
  }

  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) => ifNoWindow;

  void loadFromPointer(Pointer<SdlEvent> pointer) {}

  static SdlxEvent fromPointer(Pointer<SdlEvent> pointer) {
    if (pointer.ref.type >= SDL_EVENT_DISPLAY_FIRST &&
        pointer.ref.type <= SDL_EVENT_DISPLAY_LAST) {
      return SdlxDisplayEvent.fromPointer(pointer);
    } else if (pointer.ref.type >= SDL_EVENT_WINDOW_FIRST &&
        pointer.ref.type <= SDL_EVENT_WINDOW_LAST) {
      return SdlxWindowEvent.fromPointer(pointer);
    } else if (pointer.ref.type >= SDL_EVENT_USER &&
        pointer.ref.type <= SDL_EVENT_LAST) {
      return SdlxUserEvent.fromPointer(pointer);
    } else {
      switch (pointer.ref.type) {
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
        case SDL_EVENT_GAMEPAD_CAPSENSE_TOUCH:
        case SDL_EVENT_GAMEPAD_CAPSENSE_RELEASE:
          return SdlxGamepadCapSenseEvent.fromPointer(pointer);
        case SDL_EVENT_AUDIO_DEVICE_ADDED:
        case SDL_EVENT_AUDIO_DEVICE_REMOVED:
        case SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED:
          return SdlxAudioDeviceEvent.fromPointer(pointer);
        case SDL_EVENT_CAMERA_DEVICE_ADDED:
        case SDL_EVENT_CAMERA_DEVICE_REMOVED:
        case SDL_EVENT_CAMERA_DEVICE_APPROVED:
        case SDL_EVENT_CAMERA_DEVICE_DENIED:
          return SdlxCameraDeviceEvent.fromPointer(pointer);
        case SDL_EVENT_NOTIFICATION_ACTION_INVOKED:
          return SdlxNotificationEvent.fromPointer(pointer);
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
          return SdlxPenTouchEvent.fromPointer(pointer);
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

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.common.type = type;
    pointer.ref.common.reserved = reserved;
    pointer.ref.common.timestamp = timestamp;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.common.type;
    reserved = pointer.ref.common.reserved;
    timestamp = pointer.ref.common.timestamp;
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

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.display.type = type;
    pointer.ref.display.reserved = reserved;
    pointer.ref.display.timestamp = timestamp;
    pointer.ref.display.displayId = displayId;
    pointer.ref.display.data1 = data1;
    pointer.ref.display.data2 = data2;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.display.type;
    reserved = pointer.ref.display.reserved;
    timestamp = pointer.ref.display.timestamp;
    displayId = pointer.ref.display.displayId;
    data1 = pointer.ref.display.data1;
    data2 = pointer.ref.display.data2;
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

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.window.type = type;
    pointer.ref.window.reserved = reserved;
    pointer.ref.window.timestamp = timestamp;
    pointer.ref.window.windowId = windowId;
    pointer.ref.window.data1 = data1;
    pointer.ref.window.data2 = data2;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.window.type;
    reserved = pointer.ref.window.reserved;
    timestamp = pointer.ref.window.timestamp;
    windowId = pointer.ref.window.windowId;
    data1 = pointer.ref.window.data1;
    data2 = pointer.ref.window.data2;
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

  factory SdlxKeyboardDeviceEvent.added({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxKeyboardDeviceEvent(
    type: SDL_EVENT_KEYBOARD_ADDED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );
  factory SdlxKeyboardDeviceEvent.removed({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxKeyboardDeviceEvent(
    type: SDL_EVENT_KEYBOARD_REMOVED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );

  int which;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.kdevice.type = type;
    pointer.ref.kdevice.reserved = reserved;
    pointer.ref.kdevice.timestamp = timestamp;
    pointer.ref.kdevice.which = which;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.kdevice.type;
    reserved = pointer.ref.kdevice.reserved;
    timestamp = pointer.ref.kdevice.timestamp;
    which = pointer.ref.kdevice.which;
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
    this.down = false,
    this.repeat = false,
  });

  factory SdlxKeyboardEvent.down({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
    int which = 0,
    int scancode = 0,
    int key = 0,
    int mod = 0,
    int raw = 0,
    bool down = false,
    bool repeat = false,
  }) => SdlxKeyboardEvent(
    type: SDL_EVENT_KEY_DOWN,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
    which: which,
    scancode: scancode,
    key: key,
    mod: mod,
    raw: raw,
    down: down,
    repeat: repeat,
  );

  factory SdlxKeyboardEvent.up({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
    int which = 0,
    int scancode = 0,
    int key = 0,
    int mod = 0,
    int raw = 0,
    bool down = false,
    bool repeat = false,
  }) => SdlxKeyboardEvent(
    type: SDL_EVENT_KEY_UP,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
    which: which,
    scancode: scancode,
    key: key,
    mod: mod,
    raw: raw,
    down: down,
    repeat: repeat,
  );

  int windowId;
  int which;
  int scancode;
  int key;
  int mod;
  int raw;
  bool down;
  bool repeat;

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.key.type = type;
    pointer.ref.key.reserved = reserved;
    pointer.ref.key.timestamp = timestamp;
    pointer.ref.key.windowId = windowId;
    pointer.ref.key.which = which;
    pointer.ref.key.scancode = scancode;
    pointer.ref.key.key = key;
    pointer.ref.key.mod = mod;
    pointer.ref.key.raw = raw;
    pointer.ref.key.down = down;
    pointer.ref.key.repeat = repeat;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.key.type;
    reserved = pointer.ref.key.reserved;
    timestamp = pointer.ref.key.timestamp;
    windowId = pointer.ref.key.windowId;
    which = pointer.ref.key.which;
    scancode = pointer.ref.key.scancode;
    key = pointer.ref.key.key;
    mod = pointer.ref.key.mod;
    raw = pointer.ref.key.raw;
    down = pointer.ref.key.down;
    repeat = pointer.ref.key.repeat;
  }

  static SdlxKeyboardEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxKeyboardEvent()..loadFromPointer(pointer);
}

class SdlxTextEditingEvent extends SdlxEvent {
  SdlxTextEditingEvent({
    super.type = SDL_EVENT_TEXT_EDITING,
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

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.edit.type = type;
    pointer.ref.edit.reserved = reserved;
    pointer.ref.edit.timestamp = timestamp;
    pointer.ref.edit.windowId = windowId;
    if (text.isNotEmpty) {
      pointer.ref.edit.text = text.toNativeUtf8();
    }
    pointer.ref.edit.start = start;
    pointer.ref.edit.length = length;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.edit.type;
    reserved = pointer.ref.edit.reserved;
    timestamp = pointer.ref.edit.timestamp;
    windowId = pointer.ref.edit.windowId;
    if (pointer.ref.edit.text != nullptr) {
      text = pointer.ref.edit.text.toDartString();
    }
    start = pointer.ref.edit.start;
    length = pointer.ref.edit.length;
  }

  static SdlxTextEditingEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxTextEditingEvent()..loadFromPointer(pointer);
}

class SdlxTextEditingCandidatesEvent extends SdlxEvent {
  SdlxTextEditingCandidatesEvent({
    super.type = SDL_EVENT_TEXT_EDITING_CANDIDATES,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    List<String>? candidates,
    this.selectedCandidate = 0,
    this.horizontal = false,
  }) {
    this.candidates = candidates ?? [];
  }
  int windowId;
  late List<String> candidates;
  int selectedCandidate;
  bool horizontal;

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.editCandidates.type = type;
    pointer.ref.editCandidates.reserved = reserved;
    pointer.ref.editCandidates.timestamp = timestamp;
    pointer.ref.editCandidates.windowId = windowId;
    if (candidates.isNotEmpty) {
      final candidatesPointer = ffi.calloc<Pointer<Int8>>(candidates.length);
      for (var i = 0; i < candidates.length; i++) {
        candidatesPointer[i] = candidates[i].toNativeUtf8().cast<Int8>();
      }
      pointer.ref.editCandidates.candidates = candidatesPointer;
      pointer.ref.editCandidates.numCandidates = candidates.length;
    }
    pointer.ref.editCandidates.selectedCandidate = selectedCandidate;
    pointer.ref.editCandidates.horizontal = horizontal;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.editCandidates.type;
    reserved = pointer.ref.editCandidates.reserved;
    timestamp = pointer.ref.editCandidates.timestamp;
    for (var i = 0; i < pointer.ref.editCandidates.numCandidates; i++) {
      if (pointer.ref.editCandidates.candidates[i] != nullptr) {
        candidates.add(
          pointer.ref.editCandidates.candidates[i].cast<Utf8>().toDartString(),
        );
      }
    }
    windowId = pointer.ref.editCandidates.windowId;
    selectedCandidate = pointer.ref.editCandidates.selectedCandidate;
    horizontal = pointer.ref.editCandidates.horizontal;
  }

  static SdlxTextEditingCandidatesEvent fromPointer(
    Pointer<SdlEvent> pointer,
  ) => SdlxTextEditingCandidatesEvent()..loadFromPointer(pointer);
}

class SdlxTextInputEvent extends SdlxEvent {
  SdlxTextInputEvent({
    super.type = SDL_EVENT_TEXT_INPUT,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.text = '',
  });

  int windowId;
  String text;

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.text.type = type;
    pointer.ref.text.reserved = reserved;
    pointer.ref.text.timestamp = timestamp;
    pointer.ref.text.windowId = windowId;
    if (text.isNotEmpty) {
      pointer.ref.text.text = text.toNativeUtf8();
    }
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.text.type;
    reserved = pointer.ref.text.reserved;
    timestamp = pointer.ref.text.timestamp;
    windowId = pointer.ref.text.windowId;
    if (pointer.ref.text.text != nullptr) {
      text = pointer.ref.text.text.toDartString();
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

  factory SdlxMouseDeviceEvent.added({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxMouseDeviceEvent(
    type: SDL_EVENT_MOUSE_ADDED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );

  factory SdlxMouseDeviceEvent.removed({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxMouseDeviceEvent(
    type: SDL_EVENT_MOUSE_REMOVED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );

  int which;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.mdevice.type = type;
    pointer.ref.mdevice.reserved = reserved;
    pointer.ref.mdevice.timestamp = timestamp;
    pointer.ref.mdevice.which = which;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.mdevice.type;
    reserved = pointer.ref.mdevice.reserved;
    timestamp = pointer.ref.mdevice.timestamp;
    which = pointer.ref.mdevice.which;
  }

  static SdlxMouseDeviceEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxMouseDeviceEvent()..loadFromPointer(pointer);
}

class SdlxMouseMotionEvent extends SdlxEvent {
  SdlxMouseMotionEvent({
    super.type = SDL_EVENT_MOUSE_MOTION,
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

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.motion.type = type;
    pointer.ref.motion.reserved = reserved;
    pointer.ref.motion.timestamp = timestamp;
    pointer.ref.motion.windowId = windowId;
    pointer.ref.motion.which = which;
    pointer.ref.motion.state = state;
    pointer.ref.motion.x = x;
    pointer.ref.motion.y = y;
    pointer.ref.motion.xrel = xrel;
    pointer.ref.motion.yrel = yrel;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.motion.type;
    reserved = pointer.ref.motion.reserved;
    timestamp = pointer.ref.motion.timestamp;
    windowId = pointer.ref.motion.windowId;
    which = pointer.ref.motion.which;
    state = pointer.ref.motion.state;
    x = pointer.ref.motion.x;
    y = pointer.ref.motion.y;
    xrel = pointer.ref.motion.xrel;
    yrel = pointer.ref.motion.yrel;
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
    this.down = false,
    this.clicks = 0,
    this.x = 0,
    this.y = 0,
  });

  factory SdlxMouseButtonEvent.down({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
    int which = 0,
    int button = 0,
    bool down = false,
    int clicks = 0,
    double x = 0,
    double y = 0,
  }) => SdlxMouseButtonEvent(
    type: SDL_EVENT_MOUSE_BUTTON_DOWN,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
    which: which,
    button: button,
    down: down,
    clicks: clicks,
    x: x,
    y: y,
  );

  factory SdlxMouseButtonEvent.up({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
    int which = 0,
    int button = 0,
    bool down = false,
    int clicks = 0,
    double x = 0,
    double y = 0,
  }) => SdlxMouseButtonEvent(
    type: SDL_EVENT_MOUSE_BUTTON_UP,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
    which: which,
    button: button,
    down: down,
    clicks: clicks,
    x: x,
    y: y,
  );

  int windowId;
  int which;
  int button;
  bool down;
  int clicks;
  double x;
  double y;

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.button.type = type;
    pointer.ref.button.reserved = reserved;
    pointer.ref.button.timestamp = timestamp;
    pointer.ref.button.windowId = windowId;
    pointer.ref.button.which = which;
    pointer.ref.button.button = button;
    pointer.ref.button.down = down;
    pointer.ref.button.clicks = clicks;
    pointer.ref.button.x = x;
    pointer.ref.button.y = y;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.button.type;
    reserved = pointer.ref.button.reserved;
    timestamp = pointer.ref.button.timestamp;
    windowId = pointer.ref.button.windowId;
    which = pointer.ref.button.which;
    button = pointer.ref.button.button;
    down = pointer.ref.button.down;
    clicks = pointer.ref.button.clicks;
    x = pointer.ref.button.x;
    y = pointer.ref.button.y;
  }

  static SdlxMouseButtonEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxMouseButtonEvent()..loadFromPointer(pointer);
}

class SdlxMouseWheelEvent extends SdlxEvent {
  SdlxMouseWheelEvent({
    super.type = SDL_EVENT_MOUSE_WHEEL,
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

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.wheel.type = type;
    pointer.ref.wheel.reserved = reserved;
    pointer.ref.wheel.timestamp = timestamp;
    pointer.ref.wheel.windowId = windowId;
    pointer.ref.wheel.which = which;
    pointer.ref.wheel.x = x;
    pointer.ref.wheel.y = y;
    pointer.ref.wheel.direction = direction;
    pointer.ref.wheel.mouseX = mouseX;
    pointer.ref.wheel.mouseY = mouseY;
    pointer.ref.wheel.integerX = integerX;
    pointer.ref.wheel.integerY = integerY;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.wheel.type;
    reserved = pointer.ref.wheel.reserved;
    timestamp = pointer.ref.wheel.timestamp;
    windowId = pointer.ref.wheel.windowId;
    which = pointer.ref.wheel.which;
    x = pointer.ref.wheel.x;
    y = pointer.ref.wheel.y;
    direction = pointer.ref.wheel.direction;
    mouseX = pointer.ref.wheel.mouseX;
    mouseY = pointer.ref.wheel.mouseY;
    integerX = pointer.ref.wheel.integerX;
    integerY = pointer.ref.wheel.integerY;
  }

  static SdlxMouseWheelEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxMouseWheelEvent()..loadFromPointer(pointer);
}

class SdlxJoyAxisEvent extends SdlxEvent {
  SdlxJoyAxisEvent({
    super.type = SDL_EVENT_JOYSTICK_AXIS_MOTION,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    this.axis = 0,
    this.value = 0,
  });

  int which;
  int axis;
  int value;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.jaxis.type = type;
    pointer.ref.jaxis.reserved = reserved;
    pointer.ref.jaxis.timestamp = timestamp;
    pointer.ref.jaxis.which = which;
    pointer.ref.jaxis.axis = axis;
    pointer.ref.jaxis.value = value;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.jaxis.type;
    reserved = pointer.ref.jaxis.reserved;
    timestamp = pointer.ref.jaxis.timestamp;
    which = pointer.ref.jaxis.which;
    axis = pointer.ref.jaxis.axis;
    value = pointer.ref.jaxis.value;
  }

  static SdlxJoyAxisEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxJoyAxisEvent()..loadFromPointer(pointer);
}

class SdlxJoyBallEvent extends SdlxEvent {
  SdlxJoyBallEvent({
    super.type = SDL_EVENT_JOYSTICK_BALL_MOTION,
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

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.jball.type = type;
    pointer.ref.jball.reserved = reserved;
    pointer.ref.jball.timestamp = timestamp;
    pointer.ref.jball.which = which;
    pointer.ref.jball.ball = ball;
    pointer.ref.jball.xrel = xrel;
    pointer.ref.jball.yrel = yrel;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.jball.type;
    reserved = pointer.ref.jball.reserved;
    timestamp = pointer.ref.jball.timestamp;
    which = pointer.ref.jball.which;
    ball = pointer.ref.jball.ball;
    xrel = pointer.ref.jball.xrel;
    yrel = pointer.ref.jball.yrel;
  }

  static SdlxJoyBallEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxJoyBallEvent()..loadFromPointer(pointer);
}

class SdlxJoyHatEvent extends SdlxEvent {
  SdlxJoyHatEvent({
    super.type = SDL_EVENT_JOYSTICK_HAT_MOTION,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    this.hat = 0,
    this.value = 0,
  });

  int which;
  int hat;
  int value;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.jhat.type = type;
    pointer.ref.jhat.reserved = reserved;
    pointer.ref.jhat.timestamp = timestamp;
    pointer.ref.jhat.which = which;
    pointer.ref.jhat.hat = hat;
    pointer.ref.jhat.value = value;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.jhat.type;
    reserved = pointer.ref.jhat.reserved;
    timestamp = pointer.ref.jhat.timestamp;
    which = pointer.ref.jhat.which;
    hat = pointer.ref.jhat.hat;
    value = pointer.ref.jhat.value;
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
    this.down = false,
  });

  factory SdlxJoyButtonEvent.down({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
    int button = 0,
    bool down = false,
  }) => SdlxJoyButtonEvent(
    type: SDL_EVENT_JOYSTICK_BUTTON_DOWN,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
    button: button,
    down: down,
  );

  factory SdlxJoyButtonEvent.up({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
    int button = 0,
    bool down = false,
  }) => SdlxJoyButtonEvent(
    type: SDL_EVENT_JOYSTICK_BUTTON_UP,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
    button: button,
    down: down,
  );

  int which;
  int button;
  bool down;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.jbutton.type = type;
    pointer.ref.jbutton.reserved = reserved;
    pointer.ref.jbutton.timestamp = timestamp;
    pointer.ref.jbutton.which = which;
    pointer.ref.jbutton.button = button;
    pointer.ref.jbutton.down = down;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.jbutton.type;
    reserved = pointer.ref.jbutton.reserved;
    timestamp = pointer.ref.jbutton.timestamp;
    which = pointer.ref.jbutton.which;
    button = pointer.ref.jbutton.button;
    down = pointer.ref.jbutton.down;
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

  factory SdlxJoyDeviceEvent.added({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxJoyDeviceEvent(
    type: SDL_EVENT_JOYSTICK_ADDED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );

  factory SdlxJoyDeviceEvent.removed({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxJoyDeviceEvent(
    type: SDL_EVENT_JOYSTICK_REMOVED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );

  factory SdlxJoyDeviceEvent.updateComplete({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxJoyDeviceEvent(
    type: SDL_EVENT_JOYSTICK_UPDATE_COMPLETE,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );

  int which;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.jdevice.type = type;
    pointer.ref.jdevice.reserved = reserved;
    pointer.ref.jdevice.timestamp = timestamp;
    pointer.ref.jdevice.which = which;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.jdevice.type;
    reserved = pointer.ref.jdevice.reserved;
    timestamp = pointer.ref.jdevice.timestamp;
    which = pointer.ref.jdevice.which;
  }

  static SdlxJoyDeviceEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxJoyDeviceEvent()..loadFromPointer(pointer);
}

class SdlxJoyBatteryEvent extends SdlxEvent {
  SdlxJoyBatteryEvent({
    super.type = SDL_EVENT_JOYSTICK_BATTERY_UPDATED,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    this.state = 0,
    this.percent = 0,
  });

  int which;
  int state;
  int percent;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.jbattery.type = type;
    pointer.ref.jbattery.reserved = reserved;
    pointer.ref.jbattery.timestamp = timestamp;
    pointer.ref.jbattery.which = which;
    pointer.ref.jbattery.state = state;
    pointer.ref.jbattery.percent = percent;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.jbattery.type;
    reserved = pointer.ref.jbattery.reserved;
    timestamp = pointer.ref.jbattery.timestamp;
    which = pointer.ref.jbattery.which;
    state = pointer.ref.jbattery.state;
    percent = pointer.ref.jbattery.percent;
  }

  static SdlxJoyBatteryEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxJoyBatteryEvent()..loadFromPointer(pointer);
}

class SdlxGamepadAxisEvent extends SdlxEvent {
  SdlxGamepadAxisEvent({
    super.type = SDL_EVENT_GAMEPAD_AXIS_MOTION,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    this.axis = 0,
    this.value = 0,
  });

  int which;
  int axis;
  int value;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.gaxis.type = type;
    pointer.ref.gaxis.reserved = reserved;
    pointer.ref.gaxis.timestamp = timestamp;
    pointer.ref.gaxis.which = which;
    pointer.ref.gaxis.axis = axis;
    pointer.ref.gaxis.value = value;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.gaxis.type;
    reserved = pointer.ref.gaxis.reserved;
    timestamp = pointer.ref.gaxis.timestamp;
    which = pointer.ref.gaxis.which;
    axis = pointer.ref.gaxis.axis;
    value = pointer.ref.gaxis.value;
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
    this.down = false,
  });

  factory SdlxGamepadButtonEvent.down({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
    int button = 0,
    bool down = false,
  }) => SdlxGamepadButtonEvent(
    type: SDL_EVENT_GAMEPAD_BUTTON_DOWN,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
    button: button,
    down: down,
  );

  factory SdlxGamepadButtonEvent.up({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
    int button = 0,
    bool down = false,
  }) => SdlxGamepadButtonEvent(
    type: SDL_EVENT_GAMEPAD_BUTTON_UP,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
    button: button,
    down: down,
  );

  int which;
  int button;
  bool down;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.gbutton.type = type;
    pointer.ref.gbutton.reserved = reserved;
    pointer.ref.gbutton.timestamp = timestamp;
    pointer.ref.gbutton.which = which;
    pointer.ref.gbutton.button = button;
    pointer.ref.gbutton.down = down;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.gbutton.type;
    reserved = pointer.ref.gbutton.reserved;
    timestamp = pointer.ref.gbutton.timestamp;
    which = pointer.ref.gbutton.which;
    button = pointer.ref.gbutton.button;
    down = pointer.ref.gbutton.down;
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

  factory SdlxGamepadDeviceEvent.added({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxGamepadDeviceEvent(
    type: SDL_EVENT_GAMEPAD_ADDED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );

  factory SdlxGamepadDeviceEvent.removed({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxGamepadDeviceEvent(
    type: SDL_EVENT_GAMEPAD_REMOVED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );

  factory SdlxGamepadDeviceEvent.remapped({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxGamepadDeviceEvent(
    type: SDL_EVENT_GAMEPAD_REMAPPED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );

  factory SdlxGamepadDeviceEvent.updateComplete({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxGamepadDeviceEvent(
    type: SDL_EVENT_GAMEPAD_UPDATE_COMPLETE,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );

  factory SdlxGamepadDeviceEvent.handleUpdated({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxGamepadDeviceEvent(
    type: SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );

  int which;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.gdevice.type = type;
    pointer.ref.gdevice.reserved = reserved;
    pointer.ref.gdevice.timestamp = timestamp;
    pointer.ref.gdevice.which = which;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.gdevice.type;
    reserved = pointer.ref.gdevice.reserved;
    timestamp = pointer.ref.gdevice.timestamp;
    which = pointer.ref.gdevice.which;
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

  factory SdlxGamepadTouchpadEvent.down({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
    int touchpad = 0,
    int finger = 0,
    double x = 0,
    double y = 0,
    double pressure = 0,
  }) => SdlxGamepadTouchpadEvent(
    type: SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
    touchpad: touchpad,
    finger: finger,
    x: x,
    y: y,
    pressure: pressure,
  );

  factory SdlxGamepadTouchpadEvent.motion({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
    int touchpad = 0,
    int finger = 0,
    double x = 0,
    double y = 0,
    double pressure = 0,
  }) => SdlxGamepadTouchpadEvent(
    type: SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
    touchpad: touchpad,
    finger: finger,
    x: x,
    y: y,
    pressure: pressure,
  );

  factory SdlxGamepadTouchpadEvent.up({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
    int touchpad = 0,
    int finger = 0,
    double x = 0,
    double y = 0,
    double pressure = 0,
  }) => SdlxGamepadTouchpadEvent(
    type: SDL_EVENT_GAMEPAD_TOUCHPAD_UP,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
    touchpad: touchpad,
    finger: finger,
    x: x,
    y: y,
    pressure: pressure,
  );

  int which;
  int touchpad;
  int finger;
  double x;
  double y;
  double pressure;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.gtouchpad.type = type;
    pointer.ref.gtouchpad.reserved = reserved;
    pointer.ref.gtouchpad.timestamp = timestamp;
    pointer.ref.gtouchpad.which = which;
    pointer.ref.gtouchpad.touchpad = touchpad;
    pointer.ref.gtouchpad.finger = finger;
    pointer.ref.gtouchpad.x = x;
    pointer.ref.gtouchpad.y = y;
    pointer.ref.gtouchpad.pressure = pressure;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.gtouchpad.type;
    reserved = pointer.ref.gtouchpad.reserved;
    timestamp = pointer.ref.gtouchpad.timestamp;
    which = pointer.ref.gtouchpad.which;
    touchpad = pointer.ref.gtouchpad.touchpad;
    finger = pointer.ref.gtouchpad.finger;
    x = pointer.ref.gtouchpad.x;
    y = pointer.ref.gtouchpad.y;
    pressure = pointer.ref.gtouchpad.pressure;
  }

  static SdlxGamepadTouchpadEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxGamepadTouchpadEvent()..loadFromPointer(pointer);
}

class SdlxGamepadSensorEvent extends SdlxEvent {
  SdlxGamepadSensorEvent({
    super.type = SDL_EVENT_GAMEPAD_SENSOR_UPDATE,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    List<double>? data,
    this.sensor = 0,
  }) {
    this.data = data ?? [];
  }

  int which;
  late List<double> data;
  int sensor;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.gsensor.type = type;
    pointer.ref.gsensor.reserved = reserved;
    pointer.ref.gsensor.timestamp = timestamp;
    pointer.ref.gsensor.which = which;
    if (data.isNotEmpty) {
      pointer.ref.gsensor.data[0] = data[0];
    }
    if (data.length > 1) {
      pointer.ref.gsensor.data[1] = data[1];
    }
    if (data.length > 2) {
      pointer.ref.gsensor.data[2] = data[2];
    }
    pointer.ref.gsensor.sensor = sensor;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.gsensor.type;
    reserved = pointer.ref.gsensor.reserved;
    timestamp = pointer.ref.gsensor.timestamp;
    which = pointer.ref.gsensor.which;
    data
      ..add(pointer.ref.gsensor.data[0])
      ..add(pointer.ref.gsensor.data[1])
      ..add(pointer.ref.gsensor.data[2]);
    sensor = pointer.ref.gsensor.sensor;
  }

  static SdlxGamepadSensorEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxGamepadSensorEvent()..loadFromPointer(pointer);
}

class SdlxGamepadCapSenseEvent extends SdlxEvent {
  SdlxGamepadCapSenseEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    this.capsense = 0,
    this.down = false,
  });

  factory SdlxGamepadCapSenseEvent.touch({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
    int capsense = 0,
    bool down = false,
  }) => SdlxGamepadCapSenseEvent(
    type: SDL_EVENT_GAMEPAD_CAPSENSE_TOUCH,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
    capsense: capsense,
    down: down,
  );

  factory SdlxGamepadCapSenseEvent.release({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
    int capsense = 0,
    bool down = false,
  }) => SdlxGamepadCapSenseEvent(
    type: SDL_EVENT_GAMEPAD_CAPSENSE_RELEASE,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
    capsense: capsense,
    down: down,
  );

  int which;
  int capsense;
  bool down;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.gcapsense.type = type;
    pointer.ref.gcapsense.reserved = reserved;
    pointer.ref.gcapsense.timestamp = timestamp;
    pointer.ref.gcapsense.which = which;
    pointer.ref.gcapsense.capsense = capsense;
    pointer.ref.gcapsense.down = down;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.gcapsense.type;
    reserved = pointer.ref.gcapsense.reserved;
    timestamp = pointer.ref.gcapsense.timestamp;
    which = pointer.ref.gcapsense.which;
    capsense = pointer.ref.gcapsense.capsense;
    down = pointer.ref.gcapsense.down;
  }

  static SdlxGamepadCapSenseEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxGamepadCapSenseEvent()..loadFromPointer(pointer);
}

class SdlxAudioDeviceEvent extends SdlxEvent {
  SdlxAudioDeviceEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    this.recording = false,
  });

  factory SdlxAudioDeviceEvent.added({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
    bool recording = false,
  }) => SdlxAudioDeviceEvent(
    type: SDL_EVENT_AUDIO_DEVICE_ADDED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
    recording: recording,
  );

  factory SdlxAudioDeviceEvent.removed({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
    bool recording = false,
  }) => SdlxAudioDeviceEvent(
    type: SDL_EVENT_AUDIO_DEVICE_REMOVED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
    recording: recording,
  );

  factory SdlxAudioDeviceEvent.formatChanged({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
    bool recording = false,
  }) => SdlxAudioDeviceEvent(
    type: SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
    recording: recording,
  );

  int which;
  bool recording;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.adevice.type = type;
    pointer.ref.adevice.reserved = reserved;
    pointer.ref.adevice.timestamp = timestamp;
    pointer.ref.adevice.which = which;
    pointer.ref.adevice.recording = recording;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.adevice.type;
    reserved = pointer.ref.adevice.reserved;
    timestamp = pointer.ref.adevice.timestamp;
    which = pointer.ref.adevice.which;
    recording = pointer.ref.adevice.recording;
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

  factory SdlxCameraDeviceEvent.added({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxCameraDeviceEvent(
    type: SDL_EVENT_CAMERA_DEVICE_ADDED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );

  factory SdlxCameraDeviceEvent.removed({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxCameraDeviceEvent(
    type: SDL_EVENT_CAMERA_DEVICE_REMOVED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );

  factory SdlxCameraDeviceEvent.approved({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxCameraDeviceEvent(
    type: SDL_EVENT_CAMERA_DEVICE_APPROVED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );

  factory SdlxCameraDeviceEvent.denied({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxCameraDeviceEvent(
    type: SDL_EVENT_CAMERA_DEVICE_DENIED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );

  int which;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.cdevice.type = type;
    pointer.ref.cdevice.reserved = reserved;
    pointer.ref.cdevice.timestamp = timestamp;
    pointer.ref.cdevice.which = which;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.cdevice.type;
    reserved = pointer.ref.cdevice.reserved;
    timestamp = pointer.ref.cdevice.timestamp;
    which = pointer.ref.cdevice.which;
  }

  static SdlxCameraDeviceEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxCameraDeviceEvent()..loadFromPointer(pointer);
}

class SdlxNotificationEvent extends SdlxEvent {
  SdlxNotificationEvent({
    super.type = SDL_EVENT_NOTIFICATION_ACTION_INVOKED,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    this.actionId = '',
  });
  int which;
  String actionId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.notification.type = type;
    pointer.ref.notification.reserved = reserved;
    pointer.ref.notification.timestamp = timestamp;
    pointer.ref.notification.which = which;
    if (actionId.isNotEmpty) {
      pointer.ref.notification.actionId = actionId.toNativeUtf8();
    }
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.notification.type;
    reserved = pointer.ref.notification.reserved;
    timestamp = pointer.ref.notification.timestamp;
    which = pointer.ref.notification.which;
    if (pointer.ref.notification.actionId != nullptr) {
      actionId = pointer.ref.notification.actionId.toDartString();
    }
  }

  static SdlxNotificationEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxNotificationEvent()..loadFromPointer(pointer);
}

class SdlxRenderEvent extends SdlxEvent {
  SdlxRenderEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
  });

  factory SdlxRenderEvent.targetsReset({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
  }) => SdlxRenderEvent(
    type: SDL_EVENT_RENDER_TARGETS_RESET,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
  );

  factory SdlxRenderEvent.deviceReset({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
  }) => SdlxRenderEvent(
    type: SDL_EVENT_RENDER_DEVICE_RESET,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
  );

  factory SdlxRenderEvent.deviceLost({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
  }) => SdlxRenderEvent(
    type: SDL_EVENT_RENDER_DEVICE_LOST,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
  );

  int windowId;

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.render.type = type;
    pointer.ref.render.reserved = reserved;
    pointer.ref.render.timestamp = timestamp;
    pointer.ref.render.windowId = windowId;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.render.type;
    reserved = pointer.ref.render.reserved;
    timestamp = pointer.ref.render.timestamp;
    windowId = pointer.ref.render.windowId;
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

  factory SdlxTouchFingerEvent.down({
    int reserved = 0,
    int timestamp = 0,
    int touchId = 0,
    int fingerId = 0,
    double x = 0,
    double y = 0,
    double dx = 0,
    double dy = 0,
    double pressure = 0,
    int windowId = 0,
  }) => SdlxTouchFingerEvent(
    type: SDL_EVENT_FINGER_DOWN,
    reserved: reserved,
    timestamp: timestamp,
    touchId: touchId,
    fingerId: fingerId,
    x: x,
    y: y,
    dx: dx,
    dy: dy,
    pressure: pressure,
    windowId: windowId,
  );

  factory SdlxTouchFingerEvent.up({
    int reserved = 0,
    int timestamp = 0,
    int touchId = 0,
    int fingerId = 0,
    double x = 0,
    double y = 0,
    double dx = 0,
    double dy = 0,
    double pressure = 0,
    int windowId = 0,
  }) => SdlxTouchFingerEvent(
    type: SDL_EVENT_FINGER_UP,
    reserved: reserved,
    timestamp: timestamp,
    touchId: touchId,
    fingerId: fingerId,
    x: x,
    y: y,
    dx: dx,
    dy: dy,
    pressure: pressure,
    windowId: windowId,
  );

  factory SdlxTouchFingerEvent.motion({
    int reserved = 0,
    int timestamp = 0,
    int touchId = 0,
    int fingerId = 0,
    double x = 0,
    double y = 0,
    double dx = 0,
    double dy = 0,
    double pressure = 0,
    int windowId = 0,
  }) => SdlxTouchFingerEvent(
    type: SDL_EVENT_FINGER_MOTION,
    reserved: reserved,
    timestamp: timestamp,
    touchId: touchId,
    fingerId: fingerId,
    x: x,
    y: y,
    dx: dx,
    dy: dy,
    pressure: pressure,
    windowId: windowId,
  );

  factory SdlxTouchFingerEvent.canceled({
    int reserved = 0,
    int timestamp = 0,
    int touchId = 0,
    int fingerId = 0,
    double x = 0,
    double y = 0,
    double dx = 0,
    double dy = 0,
    double pressure = 0,
    int windowId = 0,
  }) => SdlxTouchFingerEvent(
    type: SDL_EVENT_FINGER_CANCELED,
    reserved: reserved,
    timestamp: timestamp,
    touchId: touchId,
    fingerId: fingerId,
    x: x,
    y: y,
    dx: dx,
    dy: dy,
    pressure: pressure,
    windowId: windowId,
  );

  int touchId;
  int fingerId;
  double x;
  double y;
  double dx;
  double dy;
  double pressure;
  int windowId;

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.tfinger.type = type;
    pointer.ref.tfinger.reserved = reserved;
    pointer.ref.tfinger.timestamp = timestamp;
    pointer.ref.tfinger.touchId = touchId;
    pointer.ref.tfinger.fingerId = fingerId;
    pointer.ref.tfinger.x = x;
    pointer.ref.tfinger.y = y;
    pointer.ref.tfinger.dx = dx;
    pointer.ref.tfinger.dy = dy;
    pointer.ref.tfinger.pressure = pressure;
    pointer.ref.tfinger.windowId = windowId;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.tfinger.type;
    reserved = pointer.ref.tfinger.reserved;
    timestamp = pointer.ref.tfinger.timestamp;
    touchId = pointer.ref.tfinger.touchId;
    fingerId = pointer.ref.tfinger.fingerId;
    x = pointer.ref.tfinger.x;
    y = pointer.ref.tfinger.y;
    dx = pointer.ref.tfinger.dx;
    dy = pointer.ref.tfinger.dy;
    pressure = pointer.ref.tfinger.pressure;
    windowId = pointer.ref.tfinger.windowId;
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

  factory SdlxPinchFingerEvent.begin({
    int reserved = 0,
    int timestamp = 0,
    double scale = 0,
    int windowId = 0,
  }) => SdlxPinchFingerEvent(
    type: SDL_EVENT_PINCH_BEGIN,
    reserved: reserved,
    timestamp: timestamp,
    scale: scale,
    windowId: windowId,
  );

  factory SdlxPinchFingerEvent.update({
    int reserved = 0,
    int timestamp = 0,
    double scale = 0,
    int windowId = 0,
  }) => SdlxPinchFingerEvent(
    type: SDL_EVENT_PINCH_UPDATE,
    reserved: reserved,
    timestamp: timestamp,
    scale: scale,
    windowId: windowId,
  );

  factory SdlxPinchFingerEvent.end({
    int reserved = 0,
    int timestamp = 0,
    double scale = 0,
    int windowId = 0,
  }) => SdlxPinchFingerEvent(
    type: SDL_EVENT_PINCH_END,
    reserved: reserved,
    timestamp: timestamp,
    scale: scale,
    windowId: windowId,
  );

  double scale;
  int windowId;

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.pinch.type = type;
    pointer.ref.pinch.reserved = reserved;
    pointer.ref.pinch.timestamp = timestamp;
    pointer.ref.pinch.scale = scale;
    pointer.ref.pinch.windowId = windowId;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.pinch.type;
    reserved = pointer.ref.pinch.reserved;
    timestamp = pointer.ref.pinch.timestamp;
    scale = pointer.ref.pinch.scale;
    windowId = pointer.ref.pinch.windowId;
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

  factory SdlxPenProximityEvent.onIn({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
    int which = 0,
  }) => SdlxPenProximityEvent(
    type: SDL_EVENT_PEN_PROXIMITY_IN,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
    which: which,
  );

  factory SdlxPenProximityEvent.onOut({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
    int which = 0,
  }) => SdlxPenProximityEvent(
    type: SDL_EVENT_PEN_PROXIMITY_OUT,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
    which: which,
  );

  int windowId;
  int which;

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.pproximity.type = type;
    pointer.ref.pproximity.reserved = reserved;
    pointer.ref.pproximity.timestamp = timestamp;
    pointer.ref.pproximity.windowId = windowId;
    pointer.ref.pproximity.which = which;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.pproximity.type;
    reserved = pointer.ref.pproximity.reserved;
    timestamp = pointer.ref.pproximity.timestamp;
    windowId = pointer.ref.pproximity.windowId;
    which = pointer.ref.pproximity.which;
  }

  static SdlxPenProximityEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxPenProximityEvent()..loadFromPointer(pointer);
}

class SdlxPenMotionEvent extends SdlxEvent {
  SdlxPenMotionEvent({
    super.type = SDL_EVENT_PEN_MOTION,
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

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.pmotion.type = type;
    pointer.ref.pmotion.reserved = reserved;
    pointer.ref.pmotion.timestamp = timestamp;
    pointer.ref.pmotion.windowId = windowId;
    pointer.ref.pmotion.which = which;
    pointer.ref.pmotion.penState = penState;
    pointer.ref.pmotion.x = x;
    pointer.ref.pmotion.y = y;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.pmotion.type;
    reserved = pointer.ref.pmotion.reserved;
    timestamp = pointer.ref.pmotion.timestamp;
    windowId = pointer.ref.pmotion.windowId;
    which = pointer.ref.pmotion.which;
    penState = pointer.ref.pmotion.penState;
    x = pointer.ref.pmotion.x;
    y = pointer.ref.pmotion.y;
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
    this.eraser = false,
    this.down = false,
  });

  factory SdlxPenTouchEvent.down({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
    int which = 0,
    int penState = 0,
    double x = 0,
    double y = 0,
    bool eraser = false,
    bool down = false,
  }) => SdlxPenTouchEvent(
    type: SDL_EVENT_PEN_DOWN,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
    which: which,
    penState: penState,
    x: x,
    y: y,
    eraser: eraser,
    down: down,
  );

  factory SdlxPenTouchEvent.up({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
    int which = 0,
    int penState = 0,
    double x = 0,
    double y = 0,
    bool eraser = false,
    bool down = false,
  }) => SdlxPenTouchEvent(
    type: SDL_EVENT_PEN_UP,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
    which: which,
    penState: penState,
    x: x,
    y: y,
    eraser: eraser,
    down: down,
  );

  int windowId;
  int which;
  int penState;
  double x;
  double y;
  bool eraser;
  bool down;

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.ptouch.type = type;
    pointer.ref.ptouch.reserved = reserved;
    pointer.ref.ptouch.timestamp = timestamp;
    pointer.ref.ptouch.windowId = windowId;
    pointer.ref.ptouch.which = which;
    pointer.ref.ptouch.penState = penState;
    pointer.ref.ptouch.x = x;
    pointer.ref.ptouch.y = y;
    pointer.ref.ptouch.eraser = eraser;
    pointer.ref.ptouch.down = down;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.ptouch.type;
    reserved = pointer.ref.ptouch.reserved;
    timestamp = pointer.ref.ptouch.timestamp;
    windowId = pointer.ref.ptouch.windowId;
    which = pointer.ref.ptouch.which;
    penState = pointer.ref.ptouch.penState;
    x = pointer.ref.ptouch.x;
    y = pointer.ref.ptouch.y;
    eraser = pointer.ref.ptouch.eraser;
    down = pointer.ref.ptouch.down;
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
    this.down = false,
  });

  factory SdlxPenButtonEvent.down({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
    int which = 0,
    int penState = 0,
    double x = 0,
    double y = 0,
    int button = 0,
    bool down = false,
  }) => SdlxPenButtonEvent(
    type: SDL_EVENT_PEN_BUTTON_DOWN,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
    which: which,
    penState: penState,
    x: x,
    y: y,
    button: button,
    down: down,
  );

  factory SdlxPenButtonEvent.up({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
    int which = 0,
    int penState = 0,
    double x = 0,
    double y = 0,
    int button = 0,
    bool down = false,
  }) => SdlxPenButtonEvent(
    type: SDL_EVENT_PEN_BUTTON_UP,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
    which: which,
    penState: penState,
    x: x,
    y: y,
    button: button,
    down: down,
  );

  int windowId;
  int which;
  int penState;
  double x;
  double y;
  int button;
  bool down;

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.pbutton.type = type;
    pointer.ref.pbutton.reserved = reserved;
    pointer.ref.pbutton.timestamp = timestamp;
    pointer.ref.pbutton.windowId = windowId;
    pointer.ref.pbutton.which = which;
    pointer.ref.pbutton.penState = penState;
    pointer.ref.pbutton.x = x;
    pointer.ref.pbutton.y = y;
    pointer.ref.pbutton.button = button;
    pointer.ref.pbutton.down = down;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.pbutton.type;
    reserved = pointer.ref.pbutton.reserved;
    timestamp = pointer.ref.pbutton.timestamp;
    windowId = pointer.ref.pbutton.windowId;
    which = pointer.ref.pbutton.which;
    penState = pointer.ref.pbutton.penState;
    x = pointer.ref.pbutton.x;
    y = pointer.ref.pbutton.y;
    button = pointer.ref.pbutton.button;
    down = pointer.ref.pbutton.down;
  }

  static SdlxPenButtonEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxPenButtonEvent()..loadFromPointer(pointer);
}

class SdlxPenAxisEvent extends SdlxEvent {
  SdlxPenAxisEvent({
    super.type = SDL_EVENT_PEN_AXIS,
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

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.paxis.type = type;
    pointer.ref.paxis.reserved = reserved;
    pointer.ref.paxis.timestamp = timestamp;
    pointer.ref.paxis.windowId = windowId;
    pointer.ref.paxis.which = which;
    pointer.ref.paxis.penState = penState;
    pointer.ref.paxis.x = x;
    pointer.ref.paxis.y = y;
    pointer.ref.paxis.axis = axis;
    pointer.ref.paxis.value = value;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.paxis.type;
    reserved = pointer.ref.paxis.reserved;
    timestamp = pointer.ref.paxis.timestamp;
    windowId = pointer.ref.paxis.windowId;
    which = pointer.ref.paxis.which;
    penState = pointer.ref.paxis.penState;
    x = pointer.ref.paxis.x;
    y = pointer.ref.paxis.y;
    axis = pointer.ref.paxis.axis;
    value = pointer.ref.paxis.value;
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

  factory SdlxDropEvent.begin({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
    double x = 0,
    double y = 0,
    String source = '',
    String data = '',
  }) => SdlxDropEvent(
    type: SDL_EVENT_DROP_BEGIN,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
    x: x,
    y: y,
    source: source,
    data: data,
  );

  factory SdlxDropEvent.file({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
    double x = 0,
    double y = 0,
    String source = '',
    String data = '',
  }) => SdlxDropEvent(
    type: SDL_EVENT_DROP_FILE,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
    x: x,
    y: y,
    source: source,
    data: data,
  );

  factory SdlxDropEvent.text({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
    double x = 0,
    double y = 0,
    String source = '',
    String data = '',
  }) => SdlxDropEvent(
    type: SDL_EVENT_DROP_TEXT,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
    x: x,
    y: y,
    source: source,
    data: data,
  );

  factory SdlxDropEvent.complete({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
    double x = 0,
    double y = 0,
    String source = '',
    String data = '',
  }) => SdlxDropEvent(
    type: SDL_EVENT_DROP_COMPLETE,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
    x: x,
    y: y,
    source: source,
    data: data,
  );

  factory SdlxDropEvent.position({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
    double x = 0,
    double y = 0,
    String source = '',
    String data = '',
  }) => SdlxDropEvent(
    type: SDL_EVENT_DROP_POSITION,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
    x: x,
    y: y,
    source: source,
    data: data,
  );

  int windowId;
  double x;
  double y;
  String source;
  String data;

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.drop.type = type;
    pointer.ref.drop.reserved = reserved;
    pointer.ref.drop.timestamp = timestamp;
    pointer.ref.drop.windowId = windowId;
    pointer.ref.drop.x = x;
    pointer.ref.drop.y = y;
    if (source.isNotEmpty) {
      pointer.ref.drop.source = source.toNativeUtf8();
    }
    if (data.isNotEmpty) {
      pointer.ref.drop.data = data.toNativeUtf8();
    }
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.drop.type;
    reserved = pointer.ref.drop.reserved;
    timestamp = pointer.ref.drop.timestamp;
    windowId = pointer.ref.drop.windowId;
    x = pointer.ref.drop.x;
    y = pointer.ref.drop.y;
    if (pointer.ref.drop.source != nullptr) {
      source = pointer.ref.drop.source.toDartString();
    }
    if (pointer.ref.drop.data != nullptr) {
      data = pointer.ref.drop.data.toDartString();
    }
  }

  static SdlxDropEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxDropEvent()..loadFromPointer(pointer);
}

class SdlxClipboardEvent extends SdlxEvent {
  SdlxClipboardEvent({
    super.type = SDL_EVENT_CLIPBOARD_UPDATE,
    super.reserved = 0,
    super.timestamp = 0,
    this.owner = false,
    List<String>? mimeTypes,
  }) {
    this.mimeTypes = mimeTypes ?? [];
  }
  bool owner;
  late List<String> mimeTypes;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.clipboard.type = type;
    pointer.ref.clipboard.reserved = reserved;
    pointer.ref.clipboard.timestamp = timestamp;
    pointer.ref.clipboard.owner = owner;
    if (mimeTypes.isNotEmpty) {
      final mimeTypesPointer = ffi.calloc<Pointer<Int8>>(mimeTypes.length);
      for (var i = 0; i < mimeTypes.length; i++) {
        mimeTypesPointer[i] = mimeTypes[i].toNativeUtf8().cast<Int8>();
      }
      pointer.ref.clipboard.mimeTypes = mimeTypesPointer;
      pointer.ref.clipboard.numMimeTypes = mimeTypes.length;
    }
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.clipboard.type;
    reserved = pointer.ref.clipboard.reserved;
    timestamp = pointer.ref.clipboard.timestamp;
    owner = pointer.ref.clipboard.owner;
    for (var i = 0; i < pointer.ref.clipboard.numMimeTypes; i++) {
      if (pointer.ref.clipboard.mimeTypes[i] != nullptr) {
        mimeTypes.add(
          pointer.ref.clipboard.mimeTypes[i].cast<Utf8>().toDartString(),
        );
      }
    }
  }

  static SdlxClipboardEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxClipboardEvent()..loadFromPointer(pointer);
}

class SdlxSensorEvent extends SdlxEvent {
  SdlxSensorEvent({
    super.type = SDL_EVENT_SENSOR_UPDATE,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    List<double>? data,
    this.sensorTimestamp = 0,
  }) {
    this.data = data ?? [];
  }

  int which;
  late List<double> data;
  int sensorTimestamp;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.sensor.type = type;
    pointer.ref.sensor.reserved = reserved;
    pointer.ref.sensor.timestamp = timestamp;
    pointer.ref.sensor.which = which;
    if (data.isNotEmpty) {
      pointer.ref.sensor.data[0] = data[0];
    }
    if (data.length > 1) {
      pointer.ref.sensor.data[1] = data[1];
    }
    if (data.length > 2) {
      pointer.ref.sensor.data[2] = data[2];
    }
    if (data.length > 3) {
      pointer.ref.sensor.data[3] = data[3];
    }
    if (data.length > 4) {
      pointer.ref.sensor.data[4] = data[4];
    }
    if (data.length > 5) {
      pointer.ref.sensor.data[5] = data[5];
    }
    pointer.ref.sensor.sensorTimestamp = sensorTimestamp;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.sensor.type;
    reserved = pointer.ref.sensor.reserved;
    timestamp = pointer.ref.sensor.timestamp;
    which = pointer.ref.sensor.which;
    data
      ..add(pointer.ref.sensor.data[0])
      ..add(pointer.ref.sensor.data[1])
      ..add(pointer.ref.sensor.data[2])
      ..add(pointer.ref.sensor.data[3])
      ..add(pointer.ref.sensor.data[4])
      ..add(pointer.ref.sensor.data[5]);
    sensorTimestamp = pointer.ref.sensor.sensorTimestamp;
  }

  static SdlxSensorEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxSensorEvent()..loadFromPointer(pointer);
}

class SdlxQuitEvent extends SdlxEvent {
  SdlxQuitEvent({
    super.type = SDL_EVENT_QUIT,
    super.reserved = 0,
    super.timestamp = 0,
  });

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.quit.type = type;
    pointer.ref.quit.reserved = reserved;
    pointer.ref.quit.timestamp = timestamp;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.quit.type;
    reserved = pointer.ref.quit.reserved;
    timestamp = pointer.ref.quit.timestamp;
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
    Pointer<Void>? data1,
    Pointer<Void>? data2,
  }) {
    this.data1 = data1 ?? nullptr;
    this.data2 = data2 ?? nullptr;
  }

  int windowId;
  int code;
  late Pointer<Void> data1;
  late Pointer<Void> data2;

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.user.type = type;
    pointer.ref.user.reserved = reserved;
    pointer.ref.user.timestamp = timestamp;
    pointer.ref.user.windowId = windowId;
    pointer.ref.user.code = code;
    pointer.ref.user.data1 = data1;
    pointer.ref.user.data2 = data2;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.user.type;
    reserved = pointer.ref.user.reserved;
    timestamp = pointer.ref.user.timestamp;
    windowId = pointer.ref.user.windowId;
    code = pointer.ref.user.code;
    data1 = pointer.ref.user.data1;
    data2 = pointer.ref.user.data2;
  }

  static SdlxUserEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxUserEvent()..loadFromPointer(pointer);
}
