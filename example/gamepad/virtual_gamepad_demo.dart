// ignore_for_file: unreachable_from_main

import 'dart:ffi' as ffi;

import 'package:sdl3/sdl3.dart';

// ============================================================================
// 1. Virtual Input Enum & Event Definitions
// ============================================================================

/// Analog stick / trigger threshold for detecting input activation
const kStickThreshold = 16000;

/// Enumeration integrating all virtual buttons and directional inputs
enum VirtualInput {
  // Face Buttons
  a(SDL_GAMEPAD_BUTTON_SOUTH, 'A Button (South / Z, Enter, Space)'),
  b(SDL_GAMEPAD_BUTTON_EAST, 'B Button (East / X)'),
  x(SDL_GAMEPAD_BUTTON_WEST, 'X Button (West / C)'),
  y(SDL_GAMEPAD_BUTTON_NORTH, 'Y Button (North / V)'),

  // Shoulders & Triggers
  leftShoulder(SDL_GAMEPAD_BUTTON_LEFT_SHOULDER, 'L1 / LB (Q)'),
  rightShoulder(SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, 'R1 / RB (E)'),
  leftTrigger(1000, 'L2 / LT (Shift)'),
  rightTrigger(1001, 'R2 / RT (Ctrl)'),

  // D-Pad
  dpadUp(SDL_GAMEPAD_BUTTON_DPAD_UP, 'D-Pad UP'),
  dpadDown(SDL_GAMEPAD_BUTTON_DPAD_DOWN, 'D-Pad DOWN'),
  dpadLeft(SDL_GAMEPAD_BUTTON_DPAD_LEFT, 'D-Pad LEFT'),
  dpadRight(SDL_GAMEPAD_BUTTON_DPAD_RIGHT, 'D-Pad RIGHT'),

  // Left Stick Directions
  leftStickUp(1002, 'Left Stick UP (W)'),
  leftStickDown(1003, 'Left Stick DOWN (S)'),
  leftStickLeft(1004, 'Left Stick LEFT (A)'),
  leftStickRight(1005, 'Left Stick RIGHT (D)'),
  leftStickPress(SDL_GAMEPAD_BUTTON_LEFT_STICK, 'L3 Press (R)'),

  // Right Stick Directions
  rightStickUp(1006, 'Right Stick UP (I)'),
  rightStickDown(1007, 'Right Stick DOWN (K)'),
  rightStickLeft(1008, 'Right Stick LEFT (J)'),
  rightStickRight(1009, 'Right Stick RIGHT (L)'),
  rightStickPress(SDL_GAMEPAD_BUTTON_RIGHT_STICK, 'R3 Press (F)'),

  // Menu Buttons
  start(SDL_GAMEPAD_BUTTON_START, 'Start (ESC)'),
  back(SDL_GAMEPAD_BUTTON_BACK, 'Back / Select (Tab)'),
  guide(SDL_GAMEPAD_BUTTON_GUIDE, 'Guide');

  const VirtualInput(this.code, this.label);

  /// Internal identification code (SDL button index or custom code)
  final int code;

  /// Label used for display and logging
  final String label;
}

/// Event Types for Input State
enum InputEventType {
  /// Triggered on the single frame when pressed
  press,

  /// Triggered on initial press and at repeating intervals during hold
  repeat,

  /// Triggered on the single frame when released
  release,
}

/// Type definition for input event callbacks
typedef InputEventCallback = void Function(
  int gamepadId,
  VirtualInput input,
  InputEventType eventType,
);

// ============================================================================
// 2. Input State Management
// ============================================================================

/// Holds and manages state for an individual button
class ButtonState {
  var isDown = false;
  var isPress = false;
  var isUp = false;
  var isTriggered = false;

  var pressTimeMs = 0;
  var lastRepeatTimeMs = 0;

  void updateState(
    bool currentDown,
    int currentTimeMs,
    int initialDelayMs,
    int repeatIntervalMs,
  ) {
    if (currentDown) {
      if (!isDown) {
        // Just pressed this frame
        isDown = true;
        isPress = true;
        isUp = false;
        isTriggered = true;
        pressTimeMs = currentTimeMs;
        lastRepeatTimeMs = currentTimeMs;
      } else {
        // Held down continuously
        isPress = false;
        isUp = false;

        final heldDuration = currentTimeMs - pressTimeMs;
        if (heldDuration >= initialDelayMs) {
          if (currentTimeMs - lastRepeatTimeMs >= repeatIntervalMs) {
            isTriggered = true;
            lastRepeatTimeMs = currentTimeMs;
          } else {
            isTriggered = false;
          }
        } else {
          isTriggered = false;
        }
      }
    } else {
      if (isDown) {
        // Just released this frame
        isDown = false;
        isPress = false;
        isUp = true;
        isTriggered = false;
      } else {
        // Remains unpressed
        isDown = false;
        isPress = false;
        isUp = false;
        isTriggered = false;
      }
    }
  }
}

/// Input evaluator for a single gamepad device
class SingleGamepadInput {
  SingleGamepadInput({
    required this.gamepadId,
    this.initialDelayMs = 300,
    this.repeatIntervalMs = 100,
  });

  final int gamepadId;
  final int initialDelayMs;
  final int repeatIntervalMs;

  final Map<VirtualInput, ButtonState> _states = {
    for (final input in VirtualInput.values) input: ButtonState(),
  };

  void update() {
    final now = sdlGetTicks();
    final gamepadHandle = sdlGetGamepadFromId(gamepadId);

    if (gamepadHandle == ffi.nullptr) return;

    void updateInputState(VirtualInput input, bool down) {
      _states[input]?.updateState(down, now, initialDelayMs, repeatIntervalMs);
    }

    // 1. Evaluate physical gamepad buttons
    for (final input in VirtualInput.values) {
      if (input.code < SDL_GAMEPAD_BUTTON_COUNT) {
        final down = sdlGetGamepadButton(gamepadHandle, input.code);
        updateInputState(input, down);
      }
    }

    // 2. Evaluate Left Stick axes
    final lx = sdlGetGamepadAxis(gamepadHandle, SDL_GAMEPAD_AXIS_LEFTX);
    final ly = sdlGetGamepadAxis(gamepadHandle, SDL_GAMEPAD_AXIS_LEFTY);
    updateInputState(VirtualInput.leftStickUp, ly < -kStickThreshold);
    updateInputState(VirtualInput.leftStickDown, ly > kStickThreshold);
    updateInputState(VirtualInput.leftStickLeft, lx < -kStickThreshold);
    updateInputState(VirtualInput.leftStickRight, lx > kStickThreshold);

    // 3. Evaluate Right Stick axes
    final rx = sdlGetGamepadAxis(gamepadHandle, SDL_GAMEPAD_AXIS_RIGHTX);
    final ry = sdlGetGamepadAxis(gamepadHandle, SDL_GAMEPAD_AXIS_RIGHTY);
    updateInputState(VirtualInput.rightStickUp, ry < -kStickThreshold);
    updateInputState(VirtualInput.rightStickDown, ry > kStickThreshold);
    updateInputState(VirtualInput.rightStickLeft, rx < -kStickThreshold);
    updateInputState(VirtualInput.rightStickRight, rx > kStickThreshold);

    // 4. Evaluate Trigger axes
    final lt = sdlGetGamepadAxis(gamepadHandle, SDL_GAMEPAD_AXIS_LEFT_TRIGGER);
    final rt = sdlGetGamepadAxis(gamepadHandle, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER);
    updateInputState(VirtualInput.leftTrigger, lt > kStickThreshold);
    updateInputState(VirtualInput.rightTrigger, rt > kStickThreshold);
  }

  bool isDown(VirtualInput input) => _states[input]?.isDown ?? false;
  bool isPress(VirtualInput input) => _states[input]?.isPress ?? false;
  bool isUp(VirtualInput input) => _states[input]?.isUp ?? false;
  bool isTriggered(VirtualInput input) => _states[input]?.isTriggered ?? false;
}

/// Automatically manages assignment and tracking of multiple gamepads
class MultiGamepadInputManager {
  MultiGamepadInputManager({
    this.initialDelayMs = 300,
    this.repeatIntervalMs = 100,
  });

  final Map<int, SingleGamepadInput> _players = {};
  final int initialDelayMs;
  final int repeatIntervalMs;

  Map<int, SingleGamepadInput> get allPlayers => _players;

  SingleGamepadInput _getOrCreatePlayer(int gamepadId) => _players.putIfAbsent(
    gamepadId,
    () => SingleGamepadInput(
      gamepadId: gamepadId,
      initialDelayMs: initialDelayMs,
      repeatIntervalMs: repeatIntervalMs,
    ),
  );

  void handleEvent(SdlxEvent event) {
    if (event is SdlxGamepadDeviceEvent) {
      if (event.type == SDL_EVENT_GAMEPAD_REMOVED) {
        _players.remove(event.which);
        print('Gamepad disconnected: ${event.which}');
      } else if (event.type == SDL_EVENT_GAMEPAD_ADDED) {
        _getOrCreatePlayer(event.which);
        print('Gamepad connected: ${event.which}');
      }
    }
  }

  void update() {
    for (final player in _players.values) {
      player.update();
    }
  }
}

// ============================================================================
// 3. Event Dispatcher (Iterates All Keys and Dispatches Events)
// ============================================================================

class GamepadEventDispatcher {
  final List<InputEventCallback> _listeners = [];

  void addListener(InputEventCallback callback) {
    _listeners.add(callback);
  }

  void removeListener(InputEventCallback callback) {
    _listeners.remove(callback);
  }

  /// Iterates through VirtualInput.values and fires event listeners when state changes occur
  void processAndDispatch(int gamepadId, SingleGamepadInput player) {
    for (final input in VirtualInput.values) {
      if (player.isPress(input)) {
        _dispatch(gamepadId, input, InputEventType.press);
      }
      if (player.isTriggered(input)) {
        _dispatch(gamepadId, input, InputEventType.repeat);
      }
      if (player.isUp(input)) {
        _dispatch(gamepadId, input, InputEventType.release);
      }
    }
  }

  void _dispatch(int gamepadId, VirtualInput input, InputEventType type) {
    for (final listener in _listeners) {
      listener(gamepadId, input, type);
    }
  }
}

// ============================================================================
// 4. Main Entry Point
// ============================================================================

void main() {
  print('Initializing SDL3 Multi-Gamepad System...');
  if (!sdlInit(SDL_INIT_VIDEO | SDL_INIT_GAMEPAD)) {
    print('SDL_Init Error: ${sdlGetError()}');
    return;
  }

  // --- Attach Virtual Joystick ---
  final desc = SdlxVirtualJoystickDesc(
    type: SDL_JOYSTICK_TYPE_GAMEPAD,
    naxes: 6, // LeftX, LeftY, RightX, RightY, L2, R2
    nbuttons: 15,
    nhats: 1,
    name: 'Keyboard Virtual Gamepad',
  );

  final virtualJoystickId = sdlxAttachVirtualJoystick(desc);
  print('Virtual joystick attached (JoystickID: $virtualJoystickId)');

  if (virtualJoystickId == 0) {
    print('Failed to create virtual joystick: ${sdlGetError()}');
    sdlQuit();
    return;
  }

  // Register Gamepad mapping for the Virtual Joystick
  final guid = sdlGetJoystickGuidForId(virtualJoystickId);
  final guidString = sdlxGuidToString(guid);

  final mappingString =
      // ignore: missing_whitespace_between_adjacent_strings
      '$guidString,Virtual Gamepad,'
      'leftx:a0,lefty:a1,rightx:a2,righty:a3,lefttrigger:a4,righttrigger:a5,'
      'a:b0,b:b1,x:b2,y:b3,'
      'leftshoulder:b4,rightshoulder:b5,'
      'lefttrigger:b6,righttrigger:b7,'
      'start:b8,back:b9,guide:b10,'
      'leftstick:b11,rightstick:b12,'
      'dpup:h0.1,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,';

  sdlAddGamepadMapping(mappingString);

  // Open Virtual Gamepad
  final virtualGamepad = sdlOpenGamepad(virtualJoystickId);
  if (virtualGamepad == ffi.nullptr) {
    print('Failed to open virtual gamepad: ${sdlGetError()}');
    sdlDetachVirtualJoystick(virtualJoystickId);
    sdlQuit();
    return;
  }

  final virtualJoystickHandle = sdlGetGamepadJoystick(virtualGamepad);

  final window = sdlCreateWindow('SDL3 Enum-based Event System', 600, 400, 0);

  print('=========================================================');
  print(' Keyboard Virtual Gamepad #1 Mappings:');
  print('  WASD              = Left Stick (X/Y)');
  print('  IJKL              = Right Stick (X/Y)');
  print('  Arrow Keys        = D-Pad (Hat)');
  print('  Z / Enter / Space = A Button (South)');
  print('  X / C / V         = B / X / Y');
  print('  Q / E             = L1 (LB) / R1 (RB)');
  print('  L-Shift / L-Ctrl  = L2 (LT) / R2 (RT)');
  print('  ESC               = Start');
  print('  Tab               = Back (Select)');
  print('  R / F             = L3 / R3 (Stick Press)');
  print('  Close Window (X)  = Exit Program');
  print('=========================================================');

  final multiInputManager = MultiGamepadInputManager();
  final dispatcher = GamepadEventDispatcher()
    // --- Register Event Listener ---
    ..addListener((gamepadId, input, eventType) {
      switch (eventType) {
        case InputEventType.press:
          print('[Gamepad #$gamepadId] PRESSED  : ${input.label}');
        case InputEventType.repeat:
          print('[Gamepad #$gamepadId] TRIGGERED: ${input.label}');
        case InputEventType.release:
          print('[Gamepad #$gamepadId] RELEASED : ${input.label}');
      }
    });

  var running = true;
  while (running) {
    // --- Step 1: Feed Keyboard Input into Virtual Gamepad ---
    final keyState = sdlxGetKeyboardState();

    // 1.1 Left Stick (WASD) -> Axes 0 & 1
    var leftX = 0;
    if (keyState[SDL_SCANCODE_A]) leftX -= 32767;
    if (keyState[SDL_SCANCODE_D]) leftX += 32767;
    sdlSetJoystickVirtualAxis(virtualJoystickHandle, 0, leftX);

    var leftY = 0;
    if (keyState[SDL_SCANCODE_W]) leftY -= 32767;
    if (keyState[SDL_SCANCODE_S]) leftY += 32767;
    sdlSetJoystickVirtualAxis(virtualJoystickHandle, 1, leftY);

    // 1.2 Right Stick (IJKL) -> Axes 2 & 3
    var rightX = 0;
    if (keyState[SDL_SCANCODE_J]) rightX -= 32767;
    if (keyState[SDL_SCANCODE_L]) rightX += 32767;
    sdlSetJoystickVirtualAxis(virtualJoystickHandle, 2, rightX);

    var rightY = 0;
    if (keyState[SDL_SCANCODE_I]) rightY -= 32767;
    if (keyState[SDL_SCANCODE_K]) rightY += 32767;
    sdlSetJoystickVirtualAxis(virtualJoystickHandle, 3, rightY);

    // 1.3 Trigger Axes (Shift / Ctrl) -> Axes 4 & 5
    final lTriggerVal = keyState[SDL_SCANCODE_LSHIFT] ? 32767 : -32768;
    final rTriggerVal = keyState[SDL_SCANCODE_LCTRL] ? 32767 : -32768;
    sdlSetJoystickVirtualAxis(virtualJoystickHandle, 4, lTriggerVal);
    sdlSetJoystickVirtualAxis(virtualJoystickHandle, 5, rTriggerVal);

    // 1.4 D-Pad (Arrow Keys) -> Hat 0
    var hatValue = SDL_HAT_CENTERED;
    final up = keyState[SDL_SCANCODE_UP];
    final down = keyState[SDL_SCANCODE_DOWN];
    final left = keyState[SDL_SCANCODE_LEFT];
    final right = keyState[SDL_SCANCODE_RIGHT];

    if (up && right) {
      hatValue = SDL_HAT_RIGHTUP;
    } else if (up && left) {
      hatValue = SDL_HAT_LEFTUP;
    } else if (down && right) {
      hatValue = SDL_HAT_RIGHTDOWN;
    } else if (down && left) {
      hatValue = SDL_HAT_LEFTDOWN;
    } else if (up) {
      hatValue = SDL_HAT_UP;
    } else if (down) {
      hatValue = SDL_HAT_DOWN;
    } else if (left) {
      hatValue = SDL_HAT_LEFT;
    } else if (right) {
      hatValue = SDL_HAT_RIGHT;
    }
    sdlSetJoystickVirtualHat(virtualJoystickHandle, 0, hatValue);

    // 1.5 Face Buttons (Z, X, C, V + Enter, Space for A Button) -> Buttons 0..3
    sdlSetJoystickVirtualButton(
      virtualJoystickHandle,
      0, // Button 0: A Button (South)
      keyState[SDL_SCANCODE_Z] ||
          keyState[SDL_SCANCODE_RETURN] ||
          keyState[SDL_SCANCODE_SPACE],
    );
    sdlSetJoystickVirtualButton(
      virtualJoystickHandle,
      1, // Button 1: B Button (East)
      keyState[SDL_SCANCODE_X],
    );
    sdlSetJoystickVirtualButton(
      virtualJoystickHandle,
      2, // Button 2: X Button (West)
      keyState[SDL_SCANCODE_C],
    );
    sdlSetJoystickVirtualButton(
      virtualJoystickHandle,
      3, // Button 3: Y Button (North)
      keyState[SDL_SCANCODE_V],
    );

    // 1.6 Shoulder Buttons (Q, E) -> Buttons 4, 5
    sdlSetJoystickVirtualButton(
      virtualJoystickHandle,
      4,
      keyState[SDL_SCANCODE_Q],
    );
    sdlSetJoystickVirtualButton(
      virtualJoystickHandle,
      5,
      keyState[SDL_SCANCODE_E],
    );

    // 1.7 Trigger Buttons (Shift, Ctrl) -> Buttons 6, 7
    sdlSetJoystickVirtualButton(
      virtualJoystickHandle,
      6,
      keyState[SDL_SCANCODE_LSHIFT],
    );
    sdlSetJoystickVirtualButton(
      virtualJoystickHandle,
      7,
      keyState[SDL_SCANCODE_LCTRL],
    );

    // 1.8 Menu Buttons (ESC -> Start, TAB -> Back / Select) -> Buttons 8, 9, 10
    sdlSetJoystickVirtualButton(
      virtualJoystickHandle,
      8, // Button 8: Start
      keyState[SDL_SCANCODE_ESCAPE],
    );
    sdlSetJoystickVirtualButton(
      virtualJoystickHandle,
      9, // Button 9: Back (Select)
      keyState[SDL_SCANCODE_TAB],
    );

    // 1.9 Stick Press (R, F) -> Buttons 11, 12
    sdlSetJoystickVirtualButton(
      virtualJoystickHandle,
      11,
      keyState[SDL_SCANCODE_R],
    );
    sdlSetJoystickVirtualButton(
      virtualJoystickHandle,
      12,
      keyState[SDL_SCANCODE_F],
    );

    // --- Step 2: Poll Event loop ---
    SdlxEvent? event;
    while ((event = sdlxPollEvent()) != null) {
      if (event is SdlxQuitEvent) {
        running = false;
      }
      multiInputManager.handleEvent(event!);
    }

    // --- Step 3: Update Gamepad Input States ---
    multiInputManager.update();

    // --- Step 4: Iterate All Keys for All Players & Dispatch Events ---
    for (final entry in multiInputManager.allPlayers.entries) {
      dispatcher.processAndDispatch(entry.key, entry.value);
    }

    sdlDelay(16); // Approx. 60 FPS
  }

  // --- Clean up ---
  sdlCloseGamepad(virtualGamepad);
  sdlDetachVirtualJoystick(virtualJoystickId);
  sdlDestroyWindow(window);
  sdlQuit();

  print('Program exited successfully.');
}
