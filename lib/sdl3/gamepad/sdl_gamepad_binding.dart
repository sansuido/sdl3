part of '../sdl_gamepad.dart';

class SdlxGamepadBindingAxis {
  const SdlxGamepadBindingAxis({
    this.axis = 0,
    this.axisMin = 0,
    this.axisMax = 0,
  });

  final int axis;
  final int axisMin;
  final int axisMax;
}

class SdlxGamepadBindingHat {
  const SdlxGamepadBindingHat({this.hat = 0, this.hatMask = 0});

  final int hat;
  final int hatMask;
}

class SdlxGamepadBinding {
  const SdlxGamepadBinding({
    required this.inputType,
    required this.outputType,
    this.inputButton,
    this.inputAxis,
    this.inputHat,
    this.outputButton,
    this.outputAxis,
  });

  factory SdlxGamepadBinding.fromPointer(Pointer<SdlGamepadBinding> pointer) {
    final ref = pointer.ref;
    final inputType = ref.inputType;

    int? inputButton;
    SdlxGamepadBindingAxis? inputAxis;
    SdlxGamepadBindingHat? inputHat;

    switch (inputType) {
      case SdlkGamepadBindtype.button:
        inputButton = ref.input.button;
      case SdlkGamepadBindtype.axis:
        inputAxis = SdlxGamepadBindingAxis(
          axis: ref.input.axis.axis,
          axisMin: ref.input.axis.axisMin,
          axisMax: ref.input.axis.axisMax,
        );
      case SdlkGamepadBindtype.hat:
        inputHat = SdlxGamepadBindingHat(
          hat: ref.input.hat.hat,
          hatMask: ref.input.hat.hatMask,
        );
    }

    final outputType = ref.outputType;
    int? outputButton;
    SdlxGamepadBindingAxis? outputAxis;

    switch (outputType) {
      case SdlkGamepadBindtype.button:
        outputButton = ref.output.button;
      case SdlkGamepadBindtype.axis:
        outputAxis = SdlxGamepadBindingAxis(
          axis: ref.output.axis.axis,
          axisMin: ref.output.axis.axisMin,
          axisMax: ref.output.axis.axisMax,
        );
    }

    return SdlxGamepadBinding(
      inputType: inputType,
      outputType: outputType,
      inputButton: inputButton,
      inputAxis: inputAxis,
      inputHat: inputHat,
      outputButton: outputButton,
      outputAxis: outputAxis,
    );
  }

  final int inputType;
  final int? inputButton;
  final SdlxGamepadBindingAxis? inputAxis;
  final SdlxGamepadBindingHat? inputHat;

  final int outputType;
  final int? outputButton;
  final SdlxGamepadBindingAxis? outputAxis;
}
