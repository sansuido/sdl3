part of '../../../sdl.dart';

class SdlxGamepadTouchpadFinger {
  SdlxGamepadTouchpadFinger({
    this.down = false,
    this.x = 0,
    this.y = 0,
    this.pressure = 0,
  });
  bool down;
  double x;
  double y;
  double pressure;
}
