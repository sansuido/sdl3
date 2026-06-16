part of '../../sdl.dart';

class SdlxVirtualJoystickTouchpadDesc {
  SdlxVirtualJoystickTouchpadDesc({this.nfingers = 0});
  int nfingers;
}

class SdlxVirtualJoystickSensorDesc {
  SdlxVirtualJoystickSensorDesc({this.type = 0, this.rate = 0});
  int type;
  double rate;
}

class SdlxVirtualJoystickDesc {
  SdlxVirtualJoystickDesc({
    this.version = 0,
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
    List<SdlxVirtualJoystickTouchpadDesc>? touchpads,
    List<SdlxVirtualJoystickSensorDesc>? sensors,
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
  }) {
    this.touchpads = touchpads ?? [];
    this.sensors = sensors ?? [];
    this.userdata = userdata ?? nullptr;
    this.update = update ?? nullptr;
    this.setPlayerIndex = setPlayerIndex ?? nullptr;
    this.rumble = rumble ?? nullptr;
    this.rumbleTriggers = rumbleTriggers ?? nullptr;
    this.setLed = setLed ?? nullptr;
    this.sendEffect = sendEffect ?? nullptr;
    this.setSensorsEnabled = setSensorsEnabled ?? nullptr;
    this.cleanup = cleanup ?? nullptr;
  }

  int version;
  int type;
  int vendorId;
  int productId;
  int naxes;
  int nbuttons;
  int nballs;
  int nhats;
  //  int ntouchpads;
  //  int nsensors;
  int buttonMask;
  int axisMask;
  String name;
  late List<SdlxVirtualJoystickTouchpadDesc> touchpads;
  late List<SdlxVirtualJoystickSensorDesc> sensors;
  late Pointer<Void> userdata;
  late Pointer<NativeFunction<SdlVirtualJoystickDescUpdate>> update;
  late Pointer<NativeFunction<SdlVirtualJoystickDescSetPlayerIndex>>
  setPlayerIndex;
  late Pointer<NativeFunction<SdlVirtualJoystickDescRumble>> rumble;
  late Pointer<NativeFunction<SdlVirtualJoystickDescRumbleTriggers>>
  rumbleTriggers;
  late Pointer<NativeFunction<SdlVirtualJoystickDescSetLed>> setLed;
  late Pointer<NativeFunction<SdlVirtualJoystickDescSendEffect>> sendEffect;
  late Pointer<NativeFunction<SdlVirtualJoystickDescSetSensorsEnabled>>
  setSensorsEnabled;
  late Pointer<NativeFunction<SdlVirtualJoystickDescCleanup>> cleanup;

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
