// ignore_for_file: avoid_positional_boolean_parameters
import 'dart:ffi' as ffi;

import 'package:sdl3/sdl3.dart';

// ============================================================================
// 1. Input Repeat Manager Class (Initial delay: 300ms, Repeat interval: 100ms)
// ============================================================================
enum Direction { up, down, left, right }

class _RepeatState {
  var isPressed = false;
  var pressStartTime = 0;
  var lastRepeatTime = 0;

  bool update(
    bool isDown,
    int nowMs,
    int initialDelayMs,
    int repeatIntervalMs,
  ) {
    if (!isDown) {
      isPressed = false;
      return false;
    }

    if (!isPressed) {
      isPressed = true;
      pressStartTime = nowMs;
      lastRepeatTime = nowMs;
      return true;
    }

    final elapsed = nowMs - pressStartTime;
    if (elapsed >= initialDelayMs) {
      if (nowMs - lastRepeatTime >= repeatIntervalMs) {
        lastRepeatTime = nowMs;
        return true;
      }
    }

    return false;
  }
}

class InputRepeatManager<T extends Enum> {
  InputRepeatManager({this.initialDelayMs = 300, this.repeatIntervalMs = 100});

  final int initialDelayMs;
  final int repeatIntervalMs;
  final Map<T, _RepeatState> _states = {};

  Set<T> update(Set<T> currentInputs, int nowMs) {
    final triggered = <T>{};
    final allKeys = {..._states.keys, ...currentInputs};

    for (final key in allKeys) {
      final state = _states.putIfAbsent(key, _RepeatState.new);
      final isDown = currentInputs.contains(key);

      if (state.update(isDown, nowMs, initialDelayMs, repeatIntervalMs)) {
        triggered.add(key);
      }
    }

    return triggered;
  }
}

// ============================================================================
// 2. Main Program
// ============================================================================
void main() {
  print('Initializing SDL3...');
  if (!sdlInit(SDL_INIT_VIDEO | SDL_INIT_JOYSTICK)) {
    print('SDL_Init Error: ${sdlGetError()}');
    return;
  }

  // --- Attach Virtual Joystick ---
  final desc = SdlxVirtualJoystickDesc(
    type: SDL_JOYSTICK_TYPE_GAMEPAD,
    naxes: 2, // Axis 0: X-axis, Axis 1: Y-axis
    nbuttons: 2, // Button 0: Z key, Button 1: X key
    name: 'Keyboard Virtual Joystick (SDL3)',
  );

  final joystickId = sdlxAttachVirtualJoystick(desc);
  print('Virtual joystick attached (JoystickID: $joystickId)');

  if (joystickId == 0) {
    print('Failed to create virtual joystick: ${sdlGetError()}');
    sdlQuit();
    return;
  }

  // Open joystick
  final joystick = sdlOpenJoystick(joystickId);
  if (joystick == ffi.nullptr) {
    print('Failed to open joystick: ${sdlGetError()}');
    sdlDetachVirtualJoystick(joystickId);
    sdlQuit();
    return;
  }

  // Create window to receive keyboard events
  final window = sdlCreateWindow('SDL3 Virtual Joystick Emulator', 400, 300, 0);

  print('---------------------------------------------------------');
  print('Controls: Arrow Keys = Axis Input');
  print('          Z Key = Button 0, X Key = Button 1');
  print('          ESC Key = Quit');
  print('---------------------------------------------------------');

  final repeatManager = InputRepeatManager<Direction>();

  // Set to store raw axis states for both virtual and physical joysticks
  final rawJoystickDirections = <Direction>{};

  // Threshold setting for analog stick dead zone
  const deadZone = 16000;

  var running = true;
  while (running) {
    // --- 1. Process SDL events (handles physical/virtual joysticks in one place) ---
    SdlxEvent? event;
    while ((event = sdlxPollEvent()) != null) {
      if (event is SdlxQuitEvent) {
        running = false;
      }

      // Receive joystick axis events
      if (event is SdlxJoyAxisEvent) {
        // Update X-axis (Axis 0) state
        if (event.axis == 0) {
          if (event.value < -deadZone) {
            rawJoystickDirections
              ..add(Direction.left)
              ..remove(Direction.right);
          } else if (event.value > deadZone) {
            rawJoystickDirections
              ..add(Direction.right)
              ..remove(Direction.left);
          } else {
            rawJoystickDirections
              ..remove(Direction.left)
              ..remove(Direction.right);
          }
        }

        // Update Y-axis (Axis 1) state
        if (event.axis == 1) {
          if (event.value < -deadZone) {
            rawJoystickDirections
              ..add(Direction.up)
              ..remove(Direction.down);
          } else if (event.value > deadZone) {
            rawJoystickDirections
              ..add(Direction.down)
              ..remove(Direction.up);
          } else {
            rawJoystickDirections
              ..remove(Direction.up)
              ..remove(Direction.down);
          }
        }
      }

      if (event is SdlxJoyButtonEvent) {
        final isDown = event.down;
        print(
          '[JoyButton] Button: ${event.button} ${isDown ? "pressed" : "released"}',
        );
      }
    }

    // --- 2. Pass current state to InputRepeatManager after receiving events ---
    final nowMs = sdlGetTicks();
    final triggeredDirections = repeatManager.update(
      rawJoystickDirections,
      nowMs,
    );

    // Handle actions when repeat triggers
    for (final dir in triggeredDirections) {
      print('[RepeatTriggered] Direction: $dir (Time: ${nowMs}ms)');
    }

    // --- 3. Pass raw keyboard input values directly to virtual joystick ---
    final keyState = sdlxGetKeyboardState();

    var axisXValue = 0;
    if (keyState[SDL_SCANCODE_LEFT]) axisXValue -= 32767;
    if (keyState[SDL_SCANCODE_RIGHT]) axisXValue += 32767;
    sdlSetJoystickVirtualAxis(joystick, 0, axisXValue);

    var axisYValue = 0;
    if (keyState[SDL_SCANCODE_UP]) axisYValue -= 32767;
    if (keyState[SDL_SCANCODE_DOWN]) axisYValue += 32767;
    sdlSetJoystickVirtualAxis(joystick, 1, axisYValue);

    sdlSetJoystickVirtualButton(joystick, 0, keyState[SDL_SCANCODE_Z]);
    sdlSetJoystickVirtualButton(joystick, 1, keyState[SDL_SCANCODE_X]);

    sdlDelay(16); // Loop at roughly 60 FPS
  }

  // --- Clean up ---
  sdlCloseJoystick(joystick);
  sdlDetachVirtualJoystick(joystickId);
  sdlDestroyWindow(window);
  sdlQuit();

  print('Program exited successfully.');
}
