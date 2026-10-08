part of '../sdl_shadercross.dart';

class SdlxShaderCrossIoVarMetadata {
  const SdlxShaderCrossIoVarMetadata({
    this.name = '',
    this.location = 0,
    this.vectorType = 0,
    this.vectorSize = 0,
  });

  factory SdlxShaderCrossIoVarMetadata.fromPointer(
    Pointer<SdlShaderCrossIoVarMetadata> pointer,
  ) {
    final ref = pointer.ref;
    return SdlxShaderCrossIoVarMetadata(
      name: ref.name != nullptr ? ref.name.cast<ffi.Utf8>().toDartString() : '',
      location: ref.location,
      vectorType: ref.vectorType,
      vectorSize: ref.vectorSize,
    );
  }

  final String name;
  final int location;
  final int vectorType;
  final int vectorSize;

  void copyTo(
    Pointer<SdlShaderCrossIoVarMetadata> pointer,
    Allocator allocator,
  ) {
    pointer.ref
      ..name = name.isNotEmpty
          ? name.toNativeUtf8(allocator: allocator).cast<Int8>()
          : nullptr
      ..location = location
      ..vectorType = vectorType
      ..vectorSize = vectorSize;
  }
}

class SdlxShaderCrossGraphicsShaderMetadata {
  const SdlxShaderCrossGraphicsShaderMetadata({
    this.resourceInfo = const SdlxShaderCrossGraphicsShaderResourceInfo(),
    this.inputs = const [],
    this.outputs = const [],
  });

  factory SdlxShaderCrossGraphicsShaderMetadata.fromPointer(
    Pointer<SdlShaderCrossGraphicsShaderMetadata> pointer,
  ) {
    final ref = pointer.ref;

    final inputList = <SdlxShaderCrossIoVarMetadata>[];
    if (ref.inputs != nullptr && ref.numInputs > 0) {
      for (var i = 0; i < ref.numInputs; i++) {
        inputList.add(SdlxShaderCrossIoVarMetadata.fromPointer(ref.inputs + i));
      }
    }

    final outputList = <SdlxShaderCrossIoVarMetadata>[];
    if (ref.outputs != nullptr && ref.numOutputs > 0) {
      for (var i = 0; i < ref.numOutputs; i++) {
        outputList.add(
          SdlxShaderCrossIoVarMetadata.fromPointer(ref.outputs + i),
        );
      }
    }

    return SdlxShaderCrossGraphicsShaderMetadata(
      resourceInfo: SdlxShaderCrossGraphicsShaderResourceInfo.fromRef(
        ref.resourceInfo,
      ),
      inputs: List.unmodifiable(inputList),
      outputs: List.unmodifiable(outputList),
    );
  }

  final SdlxShaderCrossGraphicsShaderResourceInfo resourceInfo;
  final List<SdlxShaderCrossIoVarMetadata> inputs;
  final List<SdlxShaderCrossIoVarMetadata> outputs;

  Pointer<SdlShaderCrossGraphicsShaderMetadata> calloc([
    Allocator allocator = ffi.calloc,
  ]) {
    final pointer = allocator<SdlShaderCrossGraphicsShaderMetadata>();
    final ref = pointer.ref;

    resourceInfo.copyTo(ref.resourceInfo);

    if (inputs.isNotEmpty) {
      final inputsPtr = allocator<SdlShaderCrossIoVarMetadata>(inputs.length);
      for (var i = 0; i < inputs.length; i++) {
        inputs[i].copyTo(inputsPtr + i, allocator);
      }
      ref
        ..inputs = inputsPtr
        ..numInputs = inputs.length;
    } else {
      ref
        ..inputs = nullptr
        ..numInputs = 0;
    }

    if (outputs.isNotEmpty) {
      final outputsPtr = allocator<SdlShaderCrossIoVarMetadata>(outputs.length);
      for (var i = 0; i < outputs.length; i++) {
        outputs[i].copyTo(outputsPtr + i, allocator);
      }
      ref
        ..outputs = outputsPtr
        ..numOutputs = outputs.length;
    } else {
      ref
        ..outputs = nullptr
        ..numOutputs = 0;
    }

    return pointer;
  }
}
