part of '../../../sdl.dart';

class SdlxGamepadBindingAxis {
  SdlxGamepadBindingAxis({this.axis = 0, this.axisMin = 0, this.axisMax = 0});
  int axis;
  int axisMin;
  int axisMax;
}

class SdlxGamepadBindingHat {
  SdlxGamepadBindingHat({this.hat = 0, this.hatMask = 0});

  int hat;
  int hatMask;
}

class SdlxGamepadBinding {
  SdlxGamepadBinding({this.inputType = 0, this.outputType = 0});

  int inputType;
  int? inputButton;
  SdlxGamepadBindingAxis? inputAxis;
  SdlxGamepadBindingHat? inputHat;
  int outputType;
  int? outputButton;
  SdlxGamepadBindingAxis? outputAxis;

  void loadFromPointer(Pointer<SdlGamepadBinding> pointer) {
    inputType = pointer.ref.inputType;
    switch (inputType) {
      case SdlkGamepadBindtype.button:
        inputButton = pointer.ref.input.button;
      case SdlkGamepadBindtype.axis:
        inputAxis = SdlxGamepadBindingAxis()
          ..axis = pointer.ref.input.axis.axis
          ..axisMin = pointer.ref.input.axis.axisMin
          ..axisMin = pointer.ref.input.axis.axisMax;
      case SdlkGamepadBindtype.hat:
        inputHat = SdlxGamepadBindingHat()
          ..hat = pointer.ref.input.hat.hat
          ..hatMask = pointer.ref.input.hat.hatMask;
    }
    outputType = pointer.ref.outputType;
    switch (outputType) {
      case SdlkGamepadBindtype.button:
        outputButton = pointer.ref.output.button;
      case SdlkGamepadBindtype.axis:
        outputAxis = SdlxGamepadBindingAxis()
          ..axis = pointer.ref.output.axis.axis
          ..axisMin = pointer.ref.output.axis.axisMin
          ..axisMin = pointer.ref.output.axis.axisMax;
    }
  }
}
