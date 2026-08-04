part of '../../../sdl.dart';

class SdlxHapticEffect {
  SdlxHapticEffect({this.type = 0});

  int type;

  Pointer<SdlHapticEffect> calloc() {
    final pointer = ffi.calloc<SdlHapticEffect>();
    pointer.ref.type = type;
    return pointer;
  }

  void loadFromPointer(Pointer<SdlHapticEffect> pointer) {}

  static SdlxHapticEffect fromPointer(Pointer<SdlHapticEffect> pointer) {
    switch (pointer.ref.type) {
      case SDL_HAPTIC_CONSTANT:
        return SdlxHapticConstant()..loadFromPointer(pointer);
      case SDL_HAPTIC_SINE:
      case SDL_HAPTIC_SQUARE:
      case SDL_HAPTIC_TRIANGLE:
      case SDL_HAPTIC_SAWTOOTHUP:
      case SDL_HAPTIC_SAWTOOTHDOWN:
        return SdlxHapticPeriodic()..loadFromPointer(pointer);
      case SDL_HAPTIC_SPRING:
      case SDL_HAPTIC_DAMPER:
      case SDL_HAPTIC_INERTIA:
      case SDL_HAPTIC_FRICTION:
        return SdlxHapticCondition()..loadFromPointer(pointer);
      case SDL_HAPTIC_RAMP:
        return SdlxHapticRamp()..loadFromPointer(pointer);
      case SDL_HAPTIC_LEFTRIGHT:
        return SdlxHapticLeftRight()..loadFromPointer(pointer);
      default:
        return SdlxHapticCustom()..loadFromPointer(pointer);
    }
  }
}

final class SdlxHapticDirection {
  SdlxHapticDirection({this.type = 0, List<int>? dir}) {
    this.dir = dir ?? List<int>.generate(3, (index) => 0);
  }

  int type;
  late List<int> dir;
}

class SdlxHapticConstant extends SdlxHapticEffect {
  SdlxHapticConstant({
    super.type = 0,
    SdlxHapticDirection? direction,
    this.length = 0,
    this.delay = 0,
    this.button = 0,
    this.interval = 0,
    this.level = 0,
    this.attackLength = 0,
    this.attackLevel = 0,
    this.fadeLength = 0,
    this.fadeLevel = 0,
  }) {
    this.direction = direction ?? SdlxHapticDirection();
  }

  late SdlxHapticDirection direction;
  int length;
  int delay;
  int button;
  int interval;
  int level;
  int attackLength;
  int attackLevel;
  int fadeLength;
  int fadeLevel;

  @override
  Pointer<SdlHapticEffect> calloc() {
    final pointer = ffi.calloc<SdlHapticEffect>();
    pointer.ref.ant.type = type;
    pointer.ref.ant.direction.type = direction.type;
    for (var i = 0; i < direction.dir.length; i++) {
      pointer.ref.ant.direction.dir[i] = direction.dir[i];
    }
    pointer.ref.ant.length = length;
    pointer.ref.ant.delay = delay;
    pointer.ref.ant.button = button;
    pointer.ref.ant.interval = interval;
    pointer.ref.ant.level = level;
    pointer.ref.ant.attackLength = attackLength;
    pointer.ref.ant.attackLevel = attackLevel;
    pointer.ref.ant.fadeLength = fadeLength;
    pointer.ref.ant.fadeLevel = fadeLevel;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlHapticEffect> pointer) {
    type = pointer.ref.ant.type;
    direction.type = pointer.ref.ant.direction.type;
    direction.dir.clear();
    for (var i = 0; i < 3; i++) {
      direction.dir.add(pointer.ref.ant.direction.dir[i]);
    }
    length = pointer.ref.ant.length;
    delay = pointer.ref.ant.delay;
    button = pointer.ref.ant.button;
    interval = pointer.ref.ant.interval;
    level = pointer.ref.ant.level;
    attackLength = pointer.ref.ant.attackLength;
    attackLevel = pointer.ref.ant.attackLevel;
    fadeLength = pointer.ref.ant.fadeLength;
    fadeLevel = pointer.ref.ant.fadeLevel;
  }
}

class SdlxHapticPeriodic extends SdlxHapticEffect {
  SdlxHapticPeriodic({
    super.type = 0,
    SdlxHapticDirection? direction,
    this.length = 0,
    this.delay = 0,
    this.button = 0,
    this.interval = 0,
    this.period = 0,
    this.magnitude = 0,
    this.offset = 0,
    this.phase = 0,
    this.attackLength = 0,
    this.attackLevel = 0,
    this.fadeLength = 0,
    this.fadeLevel = 0,
  }) {
    this.direction = direction ?? SdlxHapticDirection();
  }

  late SdlxHapticDirection direction;
  int length;
  int delay;
  int button;
  int interval;
  int period;
  int magnitude;
  int offset;
  int phase;
  int attackLength;
  int attackLevel;
  int fadeLength;
  int fadeLevel;

  @override
  Pointer<SdlHapticEffect> calloc() {
    final pointer = ffi.calloc<SdlHapticEffect>();
    pointer.ref.periodic.type = type;
    pointer.ref.periodic.direction.type = direction.type;
    for (var i = 0; i < direction.dir.length; i++) {
      pointer.ref.periodic.direction.dir[i] = direction.dir[i];
    }
    pointer.ref.periodic.length = length;
    pointer.ref.periodic.delay = delay;
    pointer.ref.periodic.button = button;
    pointer.ref.periodic.interval = interval;
    pointer.ref.periodic.period = period;
    pointer.ref.periodic.magnitude = magnitude;
    pointer.ref.periodic.offset = offset;
    pointer.ref.periodic.phase = phase;
    pointer.ref.periodic.attackLength = attackLength;
    pointer.ref.periodic.attackLevel = attackLevel;
    pointer.ref.periodic.fadeLength = fadeLength;
    pointer.ref.periodic.fadeLevel = fadeLevel;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlHapticEffect> pointer) {
    type = pointer.ref.periodic.type;
    direction.type = pointer.ref.periodic.direction.type;
    direction.dir.clear();
    for (var i = 0; i < 3; i++) {
      direction.dir.add(pointer.ref.periodic.direction.dir[i]);
    }
    length = pointer.ref.periodic.length;
    delay = pointer.ref.periodic.delay;
    button = pointer.ref.periodic.button;
    interval = pointer.ref.periodic.interval;
    period = pointer.ref.periodic.period;
    magnitude = pointer.ref.periodic.magnitude;
    offset = pointer.ref.periodic.offset;
    phase = pointer.ref.periodic.phase;
    attackLength = pointer.ref.periodic.attackLength;
    attackLevel = pointer.ref.periodic.attackLevel;
    fadeLength = pointer.ref.periodic.fadeLength;
    fadeLevel = pointer.ref.periodic.fadeLevel;
  }
}

class SdlxHapticCondition extends SdlxHapticEffect {
  SdlxHapticCondition({
    super.type = 0,
    SdlxHapticDirection? direction,
    this.length = 0,
    this.delay = 0,
    this.button = 0,
    this.interval = 0,
    List<int>? rightSat,
    List<int>? leftSat,
    List<int>? rightCoeff,
    List<int>? leftCoeff,
    List<int>? deadband,
    List<int>? center,
  }) {
    this.direction = direction ?? SdlxHapticDirection();
    this.rightSat = rightSat ?? List<int>.generate(3, (index) => 0);
    this.leftSat = leftSat ?? List<int>.generate(3, (index) => 0);
    this.rightCoeff = rightCoeff ?? List<int>.generate(3, (index) => 0);
    this.leftCoeff = leftCoeff ?? List<int>.generate(3, (index) => 0);
    this.deadband = deadband ?? List<int>.generate(3, (index) => 0);
    this.center = center ?? List<int>.generate(3, (index) => 0);
  }

  late SdlxHapticDirection direction;
  int length;
  int delay;
  int button;
  int interval;
  late List<int> rightSat;
  late List<int> leftSat;
  late List<int> rightCoeff;
  late List<int> leftCoeff;
  late List<int> deadband;
  late List<int> center;

  @override
  Pointer<SdlHapticEffect> calloc() {
    final pointer = ffi.calloc<SdlHapticEffect>();
    pointer.ref.condition.type = type;
    pointer.ref.condition.direction.type = direction.type;
    for (var i = 0; i < direction.dir.length; i++) {
      pointer.ref.condition.direction.dir[i] = direction.dir[i];
    }
    pointer.ref.condition.length = length;
    pointer.ref.condition.delay = delay;
    pointer.ref.condition.button = button;
    pointer.ref.condition.interval = interval;
    for (var i = 0; i < rightSat.length; i++) {
      pointer.ref.condition.rightSat[i] = rightSat[i];
    }
    for (var i = 0; i < leftSat.length; i++) {
      pointer.ref.condition.leftSat[i] = leftSat[i];
    }
    for (var i = 0; i < rightCoeff.length; i++) {
      pointer.ref.condition.rightCoeff[i] = rightCoeff[i];
    }
    for (var i = 0; i < leftCoeff.length; i++) {
      pointer.ref.condition.leftCoeff[i] = leftCoeff[i];
    }
    for (var i = 0; i < deadband.length; i++) {
      pointer.ref.condition.deadband[i] = deadband[i];
    }
    for (var i = 0; i < center.length; i++) {
      pointer.ref.condition.center[i] = center[i];
    }
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlHapticEffect> pointer) {
    type = pointer.ref.condition.type;
    direction.type = pointer.ref.condition.direction.type;
    direction.dir.clear();
    for (var i = 0; i < 3; i++) {
      direction.dir.add(pointer.ref.condition.direction.dir[i]);
    }
    length = pointer.ref.condition.length;
    delay = pointer.ref.condition.delay;
    button = pointer.ref.condition.button;
    interval = pointer.ref.condition.interval;
    rightSat.clear();
    for (var i = 0; i < 3; i++) {
      rightSat[i] = pointer.ref.condition.rightSat[i];
    }
    leftSat.clear();
    for (var i = 0; i < 3; i++) {
      leftSat[i] = pointer.ref.condition.leftSat[i];
    }
    rightCoeff.clear();
    for (var i = 0; i < 3; i++) {
      rightCoeff[i] = pointer.ref.condition.rightCoeff[i];
    }
    leftCoeff.clear();
    for (var i = 0; i < 3; i++) {
      leftCoeff[i] = pointer.ref.condition.leftCoeff[i];
    }
    deadband.clear();
    for (var i = 0; i < 3; i++) {
      deadband[i] = pointer.ref.condition.deadband[i];
    }
    center.clear();
    for (var i = 0; i < 3; i++) {
      center[i] = pointer.ref.condition.center[i];
    }
  }
}

class SdlxHapticRamp extends SdlxHapticEffect {
  SdlxHapticRamp({
    super.type = 0,
    SdlxHapticDirection? direction,
    this.length = 0,
    this.delay = 0,
    this.button = 0,
    this.interval = 0,
    this.start = 0,
    this.end = 0,
    this.attackLength = 0,
    this.attackLevel = 0,
    this.fadeLength = 0,
    this.fadeLevel = 0,
  }) {
    this.direction = direction ?? SdlxHapticDirection();
  }

  late SdlxHapticDirection direction;
  int length;
  int delay;
  int button;
  int interval;
  int start;
  int end;
  int attackLength;
  int attackLevel;
  int fadeLength;
  int fadeLevel;

  @override
  Pointer<SdlHapticEffect> calloc() {
    final pointer = ffi.calloc<SdlHapticEffect>();
    pointer.ref.ramp.type = type;
    pointer.ref.ramp.direction.type = direction.type;
    for (var i = 0; i < direction.dir.length; i++) {
      pointer.ref.ramp.direction.dir[i] = direction.dir[i];
    }
    pointer.ref.ramp.length = length;
    pointer.ref.ramp.delay = delay;
    pointer.ref.ramp.button = button;
    pointer.ref.ramp.interval = interval;
    pointer.ref.ramp.start = start;
    pointer.ref.ramp.end = end;
    pointer.ref.ramp.attackLength = attackLength;
    pointer.ref.ramp.attackLevel = attackLevel;
    pointer.ref.ramp.fadeLength = fadeLength;
    pointer.ref.ramp.fadeLevel = fadeLevel;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlHapticEffect> pointer) {
    type = pointer.ref.ramp.type;
    direction.type = pointer.ref.ramp.direction.type;
    direction.dir.clear();
    for (var i = 0; i < 3; i++) {
      direction.dir.add(pointer.ref.ramp.direction.dir[i]);
    }
    length = pointer.ref.ramp.length;
    delay = pointer.ref.ramp.delay;
    button = pointer.ref.ramp.button;
    interval = pointer.ref.ramp.interval;
    start = pointer.ref.ramp.start;
    end = pointer.ref.ramp.end;
    attackLength = pointer.ref.ramp.attackLength;
    attackLevel = pointer.ref.ramp.attackLevel;
    fadeLength = pointer.ref.ramp.fadeLength;
    fadeLevel = pointer.ref.ramp.fadeLevel;
  }
}

class SdlxHapticLeftRight extends SdlxHapticEffect {
  SdlxHapticLeftRight({
    super.type = 0,
    this.length = 0,
    this.largeMagnitude = 0,
    this.smallMagnitude = 0,
  });

  int length;
  int largeMagnitude;
  int smallMagnitude;

  @override
  Pointer<SdlHapticEffect> calloc() {
    final pointer = ffi.calloc<SdlHapticEffect>();
    pointer.ref.leftright.type = type;
    pointer.ref.leftright.length = length;
    pointer.ref.leftright.largeMagnitude = largeMagnitude;
    pointer.ref.leftright.smallMagnitude = smallMagnitude;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlHapticEffect> pointer) {
    type = pointer.ref.leftright.type;
    length = pointer.ref.leftright.length;
    largeMagnitude = pointer.ref.leftright.largeMagnitude;
    smallMagnitude = pointer.ref.leftright.smallMagnitude;
  }
}

class SdlxHapticCustom extends SdlxHapticEffect {
  SdlxHapticCustom({
    super.type = 0,
    SdlxHapticDirection? direction,
    this.length = 0,
    this.delay = 0,
    this.button = 0,
    this.interval = 0,
    this.channels = 0,
    this.period = 0,
    this.samples = 0,
    this.data,
    this.attackLength = 0,
    this.attackLevel = 0,
    this.fadeLength = 0,
    this.fadeLevel = 0,
  }) {
    this.direction = direction ?? SdlxHapticDirection();
  }

  late SdlxHapticDirection direction;
  int length;
  int delay;
  int button;
  int interval;
  int channels;
  int period;
  int samples;
  Uint16List? data;
  int attackLength;
  int attackLevel;
  int fadeLength;
  int fadeLevel;

  @override
  Pointer<SdlHapticEffect> calloc() {
    final pointer = ffi.calloc<SdlHapticEffect>();
    pointer.ref.custom.type = type;
    pointer.ref.custom.direction.type = direction.type;
    for (var i = 0; i < direction.dir.length; i++) {
      pointer.ref.custom.direction.dir[i] = direction.dir[i];
    }
    pointer.ref.custom.length = length;
    pointer.ref.custom.delay = delay;
    pointer.ref.custom.button = button;
    pointer.ref.custom.interval = interval;
    pointer.ref.custom.channels = channels;
    pointer.ref.custom.period = period;
    pointer.ref.custom.samples = samples;
    if (data != null) {
      final dataPointer = ffi.calloc<Uint16>(data!.length);
      dataPointer.asTypedList(data!.length).setAll(0, data!);
      pointer.ref.custom.data = dataPointer;
    }
    pointer.ref.custom.attackLength = attackLength;
    pointer.ref.custom.attackLevel = attackLevel;
    pointer.ref.custom.fadeLength = fadeLength;
    pointer.ref.custom.fadeLevel = fadeLevel;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlHapticEffect> pointer) {
    type = pointer.ref.custom.type;
    direction.type = pointer.ref.custom.direction.type;
    direction.dir.clear();
    for (var i = 0; i < 3; i++) {
      direction.dir.add(pointer.ref.custom.direction.dir[i]);
    }
    length = pointer.ref.custom.length;
    delay = pointer.ref.custom.delay;
    button = pointer.ref.custom.button;
    interval = pointer.ref.custom.interval;
    channels = pointer.ref.custom.channels;
    period = pointer.ref.custom.period;
    samples = pointer.ref.custom.samples;
    if (pointer.ref.custom.data != nullptr) {
      data = Uint16List.fromList(
        pointer.ref.custom.data.asTypedList(channels * samples),
      );
    }
    attackLength = pointer.ref.custom.attackLength;
    attackLevel = pointer.ref.custom.attackLevel;
    fadeLength = pointer.ref.custom.fadeLength;
    fadeLevel = pointer.ref.custom.fadeLevel;
  }
}

extension SdlHapticEffectPointerEx on Pointer<SdlHapticEffect> {
  void callocAllFree() {
    if (this == nullptr) return;
    if (ref.type == SDL_HAPTIC_CUSTOM) {
      if (ref.custom.data != nullptr) {
        ffi.calloc.free(ref.custom.data);
      }
    }
    callocFree();
  }
}
