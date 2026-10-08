part of '../sdl_haptic.dart';

final class SdlxHapticDirection {
  const SdlxHapticDirection({this.type = 0, this.dir = const [0, 0, 0]});

  factory SdlxHapticDirection.fromRef(SdlHapticDirection ref) {
    final dirList = List<int>.generate(3, (i) => ref.dir[i]);
    return SdlxHapticDirection(type: ref.type, dir: List.unmodifiable(dirList));
  }

  final int type;
  final List<int> dir;

  void copyTo(SdlHapticDirection ref) {
    ref.type = type;
    for (var i = 0; i < 3 && i < dir.length; i++) {
      ref.dir[i] = dir[i];
    }
  }
}

abstract class SdlxHapticEffect {
  const SdlxHapticEffect({this.type = 0});

  factory SdlxHapticEffect.fromPointer(Pointer<SdlHapticEffect> pointer) {
    switch (pointer.ref.type) {
      case SDL_HAPTIC_CONSTANT:
        return SdlxHapticConstant.fromPointer(pointer);
      case SDL_HAPTIC_SINE:
      case SDL_HAPTIC_SQUARE:
      case SDL_HAPTIC_TRIANGLE:
      case SDL_HAPTIC_SAWTOOTHUP:
      case SDL_HAPTIC_SAWTOOTHDOWN:
        return SdlxHapticPeriodic.fromPointer(pointer);
      case SDL_HAPTIC_SPRING:
      case SDL_HAPTIC_DAMPER:
      case SDL_HAPTIC_INERTIA:
      case SDL_HAPTIC_FRICTION:
        return SdlxHapticCondition.fromPointer(pointer);
      case SDL_HAPTIC_RAMP:
        return SdlxHapticRamp.fromPointer(pointer);
      case SDL_HAPTIC_LEFTRIGHT:
        return SdlxHapticLeftRight.fromPointer(pointer);
      default:
        return SdlxHapticCustom.fromPointer(pointer);
    }
  }

  final int type;

  Pointer<SdlHapticEffect> toNative([Allocator allocator = ffi.calloc]);

  Pointer<SdlHapticEffect> calloc() => toNative();
}

class SdlxHapticConstant extends SdlxHapticEffect {
  const SdlxHapticConstant({
    super.type = SDL_HAPTIC_CONSTANT,
    this.direction = const SdlxHapticDirection(),
    this.length = 0,
    this.delay = 0,
    this.button = 0,
    this.interval = 0,
    this.level = 0,
    this.attackLength = 0,
    this.attackLevel = 0,
    this.fadeLength = 0,
    this.fadeLevel = 0,
  });

  factory SdlxHapticConstant.fromPointer(Pointer<SdlHapticEffect> pointer) {
    final ref = pointer.ref.ant;
    return SdlxHapticConstant(
      type: ref.type,
      direction: SdlxHapticDirection.fromRef(ref.direction),
      length: ref.length,
      delay: ref.delay,
      button: ref.button,
      interval: ref.interval,
      level: ref.level,
      attackLength: ref.attackLength,
      attackLevel: ref.attackLevel,
      fadeLength: ref.fadeLength,
      fadeLevel: ref.fadeLevel,
    );
  }

  final SdlxHapticDirection direction;
  final int length;
  final int delay;
  final int button;
  final int interval;
  final int level;
  final int attackLength;
  final int attackLevel;
  final int fadeLength;
  final int fadeLevel;

  @override
  Pointer<SdlHapticEffect> toNative([Allocator allocator = ffi.calloc]) {
    final pointer = allocator<SdlHapticEffect>();
    final ref = pointer.ref.ant..type = type;
    direction.copyTo(ref.direction);
    ref
      ..length = length
      ..delay = delay
      ..button = button
      ..interval = interval
      ..level = level
      ..attackLength = attackLength
      ..attackLevel = attackLevel
      ..fadeLength = fadeLength
      ..fadeLevel = fadeLevel;
    return pointer;
  }
}

class SdlxHapticPeriodic extends SdlxHapticEffect {
  const SdlxHapticPeriodic({
    super.type = 0,
    this.direction = const SdlxHapticDirection(),
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
  });

  factory SdlxHapticPeriodic.fromPointer(Pointer<SdlHapticEffect> pointer) {
    final ref = pointer.ref.periodic;
    return SdlxHapticPeriodic(
      type: ref.type,
      direction: SdlxHapticDirection.fromRef(ref.direction),
      length: ref.length,
      delay: ref.delay,
      button: ref.button,
      interval: ref.interval,
      period: ref.period,
      magnitude: ref.magnitude,
      offset: ref.offset,
      phase: ref.phase,
      attackLength: ref.attackLength,
      attackLevel: ref.attackLevel,
      fadeLength: ref.fadeLength,
      fadeLevel: ref.fadeLevel,
    );
  }

  final SdlxHapticDirection direction;
  final int length;
  final int delay;
  final int button;
  final int interval;
  final int period;
  final int magnitude;
  final int offset;
  final int phase;
  final int attackLength;
  final int attackLevel;
  final int fadeLength;
  final int fadeLevel;

  @override
  Pointer<SdlHapticEffect> toNative([Allocator allocator = ffi.calloc]) {
    final pointer = allocator<SdlHapticEffect>();
    final ref = pointer.ref.periodic..type = type;
    direction.copyTo(ref.direction);
    ref
      ..length = length
      ..delay = delay
      ..button = button
      ..interval = interval
      ..period = period
      ..magnitude = magnitude
      ..offset = offset
      ..phase = phase
      ..attackLength = attackLength
      ..attackLevel = attackLevel
      ..fadeLength = fadeLength
      ..fadeLevel = fadeLevel;
    return pointer;
  }
}

class SdlxHapticCondition extends SdlxHapticEffect {
  const SdlxHapticCondition({
    super.type = 0,
    this.direction = const SdlxHapticDirection(),
    this.length = 0,
    this.delay = 0,
    this.button = 0,
    this.interval = 0,
    this.rightSat = const [0, 0, 0],
    this.leftSat = const [0, 0, 0],
    this.rightCoeff = const [0, 0, 0],
    this.leftCoeff = const [0, 0, 0],
    this.deadband = const [0, 0, 0],
    this.center = const [0, 0, 0],
  });

  factory SdlxHapticCondition.fromPointer(Pointer<SdlHapticEffect> pointer) {
    final ref = pointer.ref.condition;
    return SdlxHapticCondition(
      type: ref.type,
      direction: SdlxHapticDirection.fromRef(ref.direction),
      length: ref.length,
      delay: ref.delay,
      button: ref.button,
      interval: ref.interval,
      rightSat: List.unmodifiable(
        List<int>.generate(3, (i) => ref.rightSat[i]),
      ),
      leftSat: List.unmodifiable(List<int>.generate(3, (i) => ref.leftSat[i])),
      rightCoeff: List.unmodifiable(
        List<int>.generate(3, (i) => ref.rightCoeff[i]),
      ),
      leftCoeff: List.unmodifiable(
        List<int>.generate(3, (i) => ref.leftCoeff[i]),
      ),
      deadband: List.unmodifiable(
        List<int>.generate(3, (i) => ref.deadband[i]),
      ),
      center: List.unmodifiable(List<int>.generate(3, (i) => ref.center[i])),
    );
  }

  final SdlxHapticDirection direction;
  final int length;
  final int delay;
  final int button;
  final int interval;
  final List<int> rightSat;
  final List<int> leftSat;
  final List<int> rightCoeff;
  final List<int> leftCoeff;
  final List<int> deadband;
  final List<int> center;

  @override
  Pointer<SdlHapticEffect> toNative([Allocator allocator = ffi.calloc]) {
    final pointer = allocator<SdlHapticEffect>();
    final ref = pointer.ref.condition..type = type;
    direction.copyTo(ref.direction);
    ref
      ..length = length
      ..delay = delay
      ..button = button
      ..interval = interval;
    for (var i = 0; i < 3 && i < rightSat.length; i++) {
      ref.rightSat[i] = rightSat[i];
    }
    for (var i = 0; i < 3 && i < leftSat.length; i++) {
      ref.leftSat[i] = leftSat[i];
    }
    for (var i = 0; i < 3 && i < rightCoeff.length; i++) {
      ref.rightCoeff[i] = rightCoeff[i];
    }
    for (var i = 0; i < 3 && i < leftCoeff.length; i++) {
      ref.leftCoeff[i] = leftCoeff[i];
    }
    for (var i = 0; i < 3 && i < deadband.length; i++) {
      ref.deadband[i] = deadband[i];
    }
    for (var i = 0; i < 3 && i < center.length; i++) {
      ref.center[i] = center[i];
    }
    return pointer;
  }
}

class SdlxHapticRamp extends SdlxHapticEffect {
  const SdlxHapticRamp({
    super.type = SDL_HAPTIC_RAMP,
    this.direction = const SdlxHapticDirection(),
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
  });

  factory SdlxHapticRamp.fromPointer(Pointer<SdlHapticEffect> pointer) {
    final ref = pointer.ref.ramp;
    return SdlxHapticRamp(
      type: ref.type,
      direction: SdlxHapticDirection.fromRef(ref.direction),
      length: ref.length,
      delay: ref.delay,
      button: ref.button,
      interval: ref.interval,
      start: ref.start,
      end: ref.end,
      attackLength: ref.attackLength,
      attackLevel: ref.attackLevel,
      fadeLength: ref.fadeLength,
      fadeLevel: ref.fadeLevel,
    );
  }

  final SdlxHapticDirection direction;
  final int length;
  final int delay;
  final int button;
  final int interval;
  final int start;
  final int end;
  final int attackLength;
  final int attackLevel;
  final int fadeLength;
  final int fadeLevel;

  @override
  Pointer<SdlHapticEffect> toNative([Allocator allocator = ffi.calloc]) {
    final pointer = allocator<SdlHapticEffect>();
    final ref = pointer.ref.ramp..type = type;
    direction.copyTo(ref.direction);
    ref
      ..length = length
      ..delay = delay
      ..button = button
      ..interval = interval
      ..start = start
      ..end = end
      ..attackLength = attackLength
      ..attackLevel = attackLevel
      ..fadeLength = fadeLength
      ..fadeLevel = fadeLevel;
    return pointer;
  }
}

class SdlxHapticLeftRight extends SdlxHapticEffect {
  const SdlxHapticLeftRight({
    super.type = SDL_HAPTIC_LEFTRIGHT,
    this.length = 0,
    this.largeMagnitude = 0,
    this.smallMagnitude = 0,
  });

  factory SdlxHapticLeftRight.fromPointer(Pointer<SdlHapticEffect> pointer) {
    final ref = pointer.ref.leftright;
    return SdlxHapticLeftRight(
      type: ref.type,
      length: ref.length,
      largeMagnitude: ref.largeMagnitude,
      smallMagnitude: ref.smallMagnitude,
    );
  }

  final int length;
  final int largeMagnitude;
  final int smallMagnitude;

  @override
  Pointer<SdlHapticEffect> toNative([Allocator allocator = ffi.calloc]) {
    final pointer = allocator<SdlHapticEffect>();
    pointer.ref.leftright
      ..type = type
      ..length = length
      ..largeMagnitude = largeMagnitude
      ..smallMagnitude = smallMagnitude;
    return pointer;
  }
}

class SdlxHapticCustom extends SdlxHapticEffect {
  const SdlxHapticCustom({
    super.type = 0,
    this.direction = const SdlxHapticDirection(),
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
  });

  factory SdlxHapticCustom.fromPointer(Pointer<SdlHapticEffect> pointer) {
    final ref = pointer.ref.custom;
    Uint16List? dataList;
    if (ref.data != nullptr && ref.channels > 0 && ref.samples > 0) {
      dataList = Uint16List.fromList(
        ref.data.asTypedList(ref.channels * ref.samples),
      );
    }
    return SdlxHapticCustom(
      type: ref.type,
      direction: SdlxHapticDirection.fromRef(ref.direction),
      length: ref.length,
      delay: ref.delay,
      button: ref.button,
      interval: ref.interval,
      channels: ref.channels,
      period: ref.period,
      samples: ref.samples,
      data: dataList,
      attackLength: ref.attackLength,
      attackLevel: ref.attackLevel,
      fadeLength: ref.fadeLength,
      fadeLevel: ref.fadeLevel,
    );
  }

  final SdlxHapticDirection direction;
  final int length;
  final int delay;
  final int button;
  final int interval;
  final int channels;
  final int period;
  final int samples;
  final Uint16List? data;
  final int attackLength;
  final int attackLevel;
  final int fadeLength;
  final int fadeLevel;

  @override
  Pointer<SdlHapticEffect> toNative([Allocator allocator = ffi.calloc]) {
    final pointer = allocator<SdlHapticEffect>();
    final ref = pointer.ref.custom..type = type;
    direction.copyTo(ref.direction);
    ref
      ..length = length
      ..delay = delay
      ..button = button
      ..interval = interval
      ..channels = channels
      ..period = period
      ..samples = samples;
    if (data != null && data!.isNotEmpty) {
      final dataPointer = allocator<Uint16>(data!.length);
      dataPointer.asTypedList(data!.length).setAll(0, data!);
      ref.data = dataPointer;
    } else {
      ref.data = nullptr;
    }
    ref
      ..attackLength = attackLength
      ..attackLevel = attackLevel
      ..fadeLength = fadeLength
      ..fadeLevel = fadeLevel;
    return pointer;
  }
}
