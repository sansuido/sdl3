part of '../../sdl_shadercross.dart';

class SdlxShaderCrossIoVarMetadata {
  SdlxShaderCrossIoVarMetadata({
    this.name = '',
    this.location = 0,
    this.vectorType = 0,
    this.vectorSize = 0,
  });
  String name;
  int location;
  int vectorType;
  int vectorSize;
}

class SdlxShaderCrossGraphicsShaderMetadata {
  SdlxShaderCrossGraphicsShaderMetadata({
    SdlxShaderCrossGraphicsShaderResourceInfo? resourceInfo,
    List<SdlxShaderCrossIoVarMetadata>? inputs,
    List<SdlxShaderCrossIoVarMetadata>? outputs,
  }) {
    this.resourceInfo =
        resourceInfo ?? SdlxShaderCrossGraphicsShaderResourceInfo();
    this.inputs = inputs ?? [];
    this.outputs = outputs ?? [];
  }

  late SdlxShaderCrossGraphicsShaderResourceInfo resourceInfo;
  late List<SdlxShaderCrossIoVarMetadata> inputs;
  late List<SdlxShaderCrossIoVarMetadata> outputs;

  Pointer<SdlShaderCrossGraphicsShaderMetadata> calloc() {
    final pointer = ffi.calloc<SdlShaderCrossGraphicsShaderMetadata>();
    pointer.ref.resourceInfo.numSamplers = resourceInfo.numSamplers;
    pointer.ref.resourceInfo.numStorageTextures =
        resourceInfo.numStorageTextures;
    pointer.ref.resourceInfo.numStorageBuffers = resourceInfo.numStorageBuffers;
    pointer.ref.resourceInfo.numUniformBuffers = resourceInfo.numUniformBuffers;
    if (inputs.isNotEmpty) {
      pointer.ref.inputs = ffi.calloc<SdlShaderCrossIoVarMetadata>(
        inputs.length,
      );
      pointer.ref.numInputs = inputs.length;
      for (var i = 0; i < inputs.length; i++) {
        final input = pointer.ref.inputs + i;
        input.ref.name = inputs[i].name.toNativeUtf8().cast<Int8>();
        input.ref.location = inputs[i].location;
        input.ref.vectorType = inputs[i].vectorType;
        input.ref.vectorSize = inputs[i].vectorSize;
      }
    }
    if (outputs.isNotEmpty) {
      pointer.ref.outputs = ffi.calloc<SdlShaderCrossIoVarMetadata>(
        outputs.length,
      );
      pointer.ref.numOutputs = outputs.length;
      for (var i = 0; i < outputs.length; i++) {
        final output = pointer.ref.outputs + i;
        output.ref.name = outputs[i].name.toNativeUtf8().cast<Int8>();
        output.ref.location = outputs[i].location;
        output.ref.vectorType = outputs[i].vectorType;
        output.ref.vectorSize = outputs[i].vectorSize;
      }
    }
    return pointer;
  }

  void loadFromPointer(Pointer<SdlShaderCrossGraphicsShaderMetadata> pointer) {
    resourceInfo.numSamplers = pointer.ref.resourceInfo.numSamplers;
    resourceInfo.numStorageTextures =
        pointer.ref.resourceInfo.numStorageTextures;
    resourceInfo.numStorageBuffers = pointer.ref.resourceInfo.numStorageBuffers;
    resourceInfo.numUniformBuffers = pointer.ref.resourceInfo.numUniformBuffers;
    inputs.clear();
    if (pointer.ref.numInputs != 0) {
      for (var i = 0; i < pointer.ref.numInputs; i++) {
        final pointerInput = pointer.ref.inputs + i;
        final input = SdlxShaderCrossIoVarMetadata();
        if (pointerInput.ref.name != nullptr) {
          input.name = pointerInput.ref.name.cast<Utf8>().toDartString();
        }
        input
          ..location = pointerInput.ref.location
          ..vectorType = pointerInput.ref.vectorType
          ..vectorSize = pointerInput.ref.vectorSize;
        inputs.add(input);
      }
    }
    outputs.clear();
    if (pointer.ref.numOutputs != 0) {
      for (var i = 0; i < pointer.ref.numOutputs; i++) {
        final pointerOutput = pointer.ref.outputs + i;
        final output = SdlxShaderCrossIoVarMetadata();
        if (pointerOutput.ref.name != nullptr) {
          output.name = pointerOutput.ref.name.cast<Utf8>().toDartString();
        }
        output
          ..location = pointerOutput.ref.location
          ..vectorType = pointerOutput.ref.vectorType
          ..vectorSize = pointerOutput.ref.vectorSize;
        outputs.add(output);
      }
    }
  }
}

extension SdlShaderCrossGraphicsShaderMetadataCallocAllFreeExtension
    on Pointer<SdlShaderCrossGraphicsShaderMetadata> {
  void callocAllFree() {
    if (ref.numInputs != 0) {
      for (var i = 0; i < ref.numInputs; i++) {
        final input = ref.inputs + i;
        if (input.ref.name != nullptr) {
          input.ref.name.callocFree();
        }
      }
    }
    if (ref.numOutputs != 0) {
      for (var i = 0; i < ref.numOutputs; i++) {
        final output = ref.outputs + i;
        if (output.ref.name != nullptr) {
          output.ref.name.callocFree();
        }
      }
    }
    callocFree();
  }
}
