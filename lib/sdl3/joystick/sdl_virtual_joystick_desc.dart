part of '../sdl_joystick.dart';

class SdlxVirtualJoystickTouchpadDesc {
  const SdlxVirtualJoystickTouchpadDesc({this.nfingers = 0});

  final int nfingers;
}

class SdlxVirtualJoystickSensorDesc {
  const SdlxVirtualJoystickSensorDesc({this.type = 0, this.rate = 0});

  final int type;
  final double rate;
}

class SdlxVirtualJoystickDesc {
  SdlxVirtualJoystickDesc({
    int? version,
    this.type = 0,
    this.vendorId = 0,
    this.productId = 0,
    this.naxes = 0,
    this.nbuttons = 0,
    this.nballs = 0,
    this.nhats = 0,
    this.buttonMask = 0,
    this.axisMask = 0,
    this.name = '',
    this.touchpads = const [],
    this.sensors = const [],
    Pointer<Void>? userdata,
    Pointer<NativeFunction<SdlVirtualJoystickDescUpdate>>? update,
    Pointer<NativeFunction<SdlVirtualJoystickDescSetPlayerIndex>>?
    setPlayerIndex,
    Pointer<NativeFunction<SdlVirtualJoystickDescRumble>>? rumble,
    Pointer<NativeFunction<SdlVirtualJoystickDescRumbleTriggers>>?
    rumbleTriggers,
    Pointer<NativeFunction<SdlVirtualJoystickDescSetLed>>? setLed,
    Pointer<NativeFunction<SdlVirtualJoystickDescSendEffect>>? sendEffect,
    Pointer<NativeFunction<SdlVirtualJoystickDescSetSensorsEnabled>>?
    setSensorsEnabled,
    Pointer<NativeFunction<SdlVirtualJoystickDescCleanup>>? cleanup,
  }) : version = version ?? sizeOf<SdlVirtualJoystickDesc>(),
       userdata = userdata ?? nullptr,
       update = update ?? nullptr,
       setPlayerIndex = setPlayerIndex ?? nullptr,
       rumble = rumble ?? nullptr,
       rumbleTriggers = rumbleTriggers ?? nullptr,
       setLed = setLed ?? nullptr,
       sendEffect = sendEffect ?? nullptr,
       setSensorsEnabled = setSensorsEnabled ?? nullptr,
       cleanup = cleanup ?? nullptr;

  final int version;
  final int type;
  final int vendorId;
  final int productId;
  final int naxes;
  final int nbuttons;
  final int nballs;
  final int nhats;
  final int buttonMask;
  final int axisMask;
  final String name;
  final List<SdlxVirtualJoystickTouchpadDesc> touchpads;
  final List<SdlxVirtualJoystickSensorDesc> sensors;
  final Pointer<Void> userdata;
  final Pointer<NativeFunction<SdlVirtualJoystickDescUpdate>> update;
  final Pointer<NativeFunction<SdlVirtualJoystickDescSetPlayerIndex>>
  setPlayerIndex;
  final Pointer<NativeFunction<SdlVirtualJoystickDescRumble>> rumble;
  final Pointer<NativeFunction<SdlVirtualJoystickDescRumbleTriggers>>
  rumbleTriggers;
  final Pointer<NativeFunction<SdlVirtualJoystickDescSetLed>> setLed;
  final Pointer<NativeFunction<SdlVirtualJoystickDescSendEffect>> sendEffect;
  final Pointer<NativeFunction<SdlVirtualJoystickDescSetSensorsEnabled>>
  setSensorsEnabled;
  final Pointer<NativeFunction<SdlVirtualJoystickDescCleanup>> cleanup;

  Pointer<SdlVirtualJoystickDesc> calloc() {
    final pointer = ffi.calloc<SdlVirtualJoystickDesc>();
    pointer.ref.version = version;
    pointer.ref.type = type;
    pointer.ref.vendorId = vendorId;
    pointer.ref.productId = productId;
    pointer.ref.naxes = naxes;
    pointer.ref.nbuttons = nbuttons;
    pointer.ref.nballs = nballs;
    pointer.ref.nhats = nhats;
    pointer.ref.buttonMask = buttonMask;
    pointer.ref.axisMask = axisMask;
    if (name.isNotEmpty) {
      pointer.ref.name = name.toNativeUtf8();
    }
    if (touchpads.isNotEmpty) {
      pointer.ref.touchpads = ffi.calloc<SdlVirtualJoystickTouchpadDesc>();
      for (var i = 0; i < touchpads.length; i++) {
        pointer.ref.touchpads[i].nfingers = touchpads[i].nfingers;
      }
      pointer.ref.ntouchpads = touchpads.length;
    }
    if (sensors.isNotEmpty) {
      pointer.ref.sensors = ffi.calloc<SdlVirtualJoystickSensorDesc>();
      for (var i = 0; i < sensors.length; i++) {
        pointer.ref.sensors[i].type = sensors[i].type;
        pointer.ref.sensors[i].rate = sensors[i].rate;
      }
      pointer.ref.nsensors = sensors.length;
    }
    pointer.ref.userdata = userdata;
    pointer.ref.update = update;
    pointer.ref.setPlayerIndex = setPlayerIndex;
    pointer.ref.rumble = rumble;
    pointer.ref.rumbleTriggers = rumbleTriggers;
    pointer.ref.setLed = setLed;
    pointer.ref.sendEffect = sendEffect;
    pointer.ref.setSensorsEnabled = setSensorsEnabled;
    pointer.ref.cleanup = cleanup;
    return pointer;
  }
}

extension SdlVirtualJoystickDescCallocAllFreeExtension
    on Pointer<SdlVirtualJoystickDesc> {
  void callocAllFree() {
    if (ref.name != nullptr) {
      ref.name.callocFree();
    }
    if (ref.touchpads != nullptr) {
      ref.touchpads.callocFree();
    }
    if (ref.sensors != nullptr) {
      ref.sensors.callocFree();
    }
    callocFree();
  }
}
