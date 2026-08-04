part of '../../../sdl.dart';

class SdlxJoystickGuidInfo {
  SdlxJoystickGuidInfo({
    this.vendor = 0,
    this.product = 0,
    this.version = 0,
    this.crc16 = 0,
  });

  int vendor;
  int product;
  int version;
  int crc16;
}
