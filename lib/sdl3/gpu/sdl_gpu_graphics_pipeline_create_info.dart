part of '../sdl_gpu.dart';

class SdlxGpuVertexBufferDescription {
  const SdlxGpuVertexBufferDescription({
    this.slot = 0,
    this.pitch = 0,
    this.inputRate = 0,
    this.instanceStepRate = 0,
  });

  final int slot;
  final int pitch;
  final int inputRate;
  final int instanceStepRate;
}

class SdlxGpuVertexAttribute {
  const SdlxGpuVertexAttribute({
    this.location = 0,
    this.bufferSlot = 0,
    this.format = 0,
    this.offset = 0,
  });

  final int location;
  final int bufferSlot;
  final int format;
  final int offset;
}

class SdlxGpuVertexInputState {
  const SdlxGpuVertexInputState({
    this.vertexBufferDescriptions = const [],
    this.vertexAttributes = const [],
  });

  final List<SdlxGpuVertexBufferDescription> vertexBufferDescriptions;
  final List<SdlxGpuVertexAttribute> vertexAttributes;
}

class SdlxGpuRasterizerState {
  const SdlxGpuRasterizerState({
    this.fillMode = 0,
    this.cullMode = 0,
    this.frontFace = 0,
    this.depthBiasAntFactor = 0,
    this.depthBiasClamp = 0,
    this.depthBiasSlopeFactor = 0,
    this.enableDepthBias = false,
    this.enableDepthClip = false,
  });

  final int fillMode;
  final int cullMode;
  final int frontFace;
  final double depthBiasAntFactor;
  final double depthBiasClamp;
  final double depthBiasSlopeFactor;
  final bool enableDepthBias;
  final bool enableDepthClip;
}

class SdlxGpuMultisampleState {
  const SdlxGpuMultisampleState({
    this.sampleCount = 0,
    this.sampleMask = 0,
    this.enableMask = false,
    this.enableAlphaToCoverage = false,
  });

  final int sampleCount;
  final int sampleMask;
  final bool enableMask;
  final bool enableAlphaToCoverage;
}

class SdlxGpuStencilOpState {
  const SdlxGpuStencilOpState({
    this.failOp = 0,
    this.passOp = 0,
    this.depthFailOp = 0,
    this.compareOp = 0,
  });

  final int failOp;
  final int passOp;
  final int depthFailOp;
  final int compareOp;
}

class SdlxGpuDepthStencilState {
  const SdlxGpuDepthStencilState({
    this.compareOp = 0,
    this.compareMask = 0,
    this.writeMask = 0,
    this.enableDepthTest = false,
    this.enableDepthWrite = false,
    this.enableStencilTest = false,
  }) : backStencilState = const SdlxGpuStencilOpState(),
       frontStencilState = const SdlxGpuStencilOpState();

  final int compareOp;
  final SdlxGpuStencilOpState backStencilState;
  final SdlxGpuStencilOpState frontStencilState;
  final int compareMask;
  final int writeMask;
  final bool enableDepthTest;
  final bool enableDepthWrite;
  final bool enableStencilTest;
}

class SdlxGpuColorTargetBlendState {
  const SdlxGpuColorTargetBlendState({
    this.srcColorBlendfactor = 0,
    this.dstColorBlendfactor = 0,
    this.colorBlendOp = 0,
    this.srcAlphaBlendfactor = 0,
    this.dstAlphaBlendfactor = 0,
    this.alphaBlendOp = 0,
    this.colorWriteMask = 0,
    this.enableBlend = false,
    this.enableColorWriteMask = false,
  });

  final int srcColorBlendfactor;
  final int dstColorBlendfactor;
  final int colorBlendOp;
  final int srcAlphaBlendfactor;
  final int dstAlphaBlendfactor;
  final int alphaBlendOp;
  final int colorWriteMask;
  final bool enableBlend;
  final bool enableColorWriteMask;
}

class SdlxGpuColorTargetDescription {
  const SdlxGpuColorTargetDescription({this.format = 0})
    : blendState = const SdlxGpuColorTargetBlendState();

  final int format;
  final SdlxGpuColorTargetBlendState blendState;
}

class SdlxGpuGraphicsPipelineTargetInfo {
  SdlxGpuGraphicsPipelineTargetInfo({
    this.colorTargetDescriptions = const [],
    this.depthStencilFormat = 0,
    this.hasDepthStencilTarget = false,
  });

  final List<SdlxGpuColorTargetDescription> colorTargetDescriptions;
  final int depthStencilFormat;
  final bool hasDepthStencilTarget;
}

class SdlxGpuGraphicsPipelineCreateInfo {
  SdlxGpuGraphicsPipelineCreateInfo({
    Pointer<SdlGpuShader>? vertexShader,
    Pointer<SdlGpuShader>? fragmentShader,
    this.primitiveType = 0,
    this.props = 0,
  }) : vertexShader = vertexShader ?? nullptr,
       fragmentShader = fragmentShader ?? nullptr,
       vertexInputState = const SdlxGpuVertexInputState(),
       rasterizerState = const SdlxGpuRasterizerState(),
       multisampleState = const SdlxGpuMultisampleState(),
       depthStencilState = const SdlxGpuDepthStencilState(),
       targetInfo = SdlxGpuGraphicsPipelineTargetInfo();

  final Pointer<SdlGpuShader> vertexShader;
  final Pointer<SdlGpuShader> fragmentShader;
  final int primitiveType;
  final SdlxGpuVertexInputState vertexInputState;
  final SdlxGpuRasterizerState rasterizerState;
  final SdlxGpuMultisampleState multisampleState;
  final SdlxGpuDepthStencilState depthStencilState;
  final SdlxGpuGraphicsPipelineTargetInfo targetInfo;
  final int props;

  Pointer<SdlGpuGraphicsPipelineCreateInfo> calloc() {
    final pointer = ffi.calloc<SdlGpuGraphicsPipelineCreateInfo>();
    pointer.ref.vertexShader = vertexShader;
    pointer.ref.fragmentShader = fragmentShader;
    pointer.ref.primitiveType = primitiveType;
    pointer.ref.props = props;
    // vertexInputState
    {
      if (vertexInputState.vertexBufferDescriptions.isNotEmpty) {
        final vertexBufferDescriptions = ffi
            .calloc<SdlGpuVertexBufferDescription>(
              vertexInputState.vertexBufferDescriptions.length,
            );
        for (
          var i = 0;
          i < vertexInputState.vertexBufferDescriptions.length;
          i++
        ) {
          vertexBufferDescriptions[i].slot =
              vertexInputState.vertexBufferDescriptions[i].slot;
          vertexBufferDescriptions[i].pitch =
              vertexInputState.vertexBufferDescriptions[i].pitch;
          vertexBufferDescriptions[i].inputRate =
              vertexInputState.vertexBufferDescriptions[i].inputRate;
          vertexBufferDescriptions[i].instanceStepRate =
              vertexInputState.vertexBufferDescriptions[i].instanceStepRate;
        }
        pointer.ref.vertexInputState.numVertexBuffers =
            vertexInputState.vertexBufferDescriptions.length;
        pointer.ref.vertexInputState.vertexBufferDescriptions =
            vertexBufferDescriptions;
      }
      if (vertexInputState.vertexAttributes.isNotEmpty) {
        final vertexAttributes = ffi.calloc<SdlGpuVertexAttribute>(
          vertexInputState.vertexAttributes.length,
        );
        for (var i = 0; i < vertexInputState.vertexAttributes.length; i++) {
          vertexAttributes[i].location =
              vertexInputState.vertexAttributes[i].location;
          vertexAttributes[i].bufferSlot =
              vertexInputState.vertexAttributes[i].bufferSlot;
          vertexAttributes[i].format =
              vertexInputState.vertexAttributes[i].format;
          vertexAttributes[i].offset =
              vertexInputState.vertexAttributes[i].offset;
        }
        pointer.ref.vertexInputState.numVertexAttributes =
            vertexInputState.vertexAttributes.length;
        pointer.ref.vertexInputState.vertexAttributes = vertexAttributes;
      }
    }
    // rasterizerState
    {
      pointer.ref.rasterizerState.fillMode = rasterizerState.fillMode;
      pointer.ref.rasterizerState.cullMode = rasterizerState.cullMode;
      pointer.ref.rasterizerState.frontFace = rasterizerState.frontFace;
      pointer.ref.rasterizerState.depthBiasAntFactor =
          rasterizerState.depthBiasAntFactor;
      pointer.ref.rasterizerState.depthBiasClamp =
          rasterizerState.depthBiasClamp;
      pointer.ref.rasterizerState.depthBiasSlopeFactor =
          rasterizerState.depthBiasSlopeFactor;
      pointer.ref.rasterizerState.enableDepthBias =
          rasterizerState.enableDepthBias;
      pointer.ref.rasterizerState.enableDepthClip =
          rasterizerState.enableDepthClip;
    }
    // multisampleState
    {
      pointer.ref.multisampleState.sampleCount = multisampleState.sampleCount;
      pointer.ref.multisampleState.sampleMask = multisampleState.sampleMask;
      pointer.ref.multisampleState.enableMask = multisampleState.enableMask;
      pointer.ref.multisampleState.enableAlphaToCoverage =
          multisampleState.enableAlphaToCoverage;
    }
    // depthStencilState
    {
      pointer.ref.depthStencilState.compareOp = depthStencilState.compareOp;
      // backStencilState
      pointer.ref.depthStencilState.backStencilState.failOp =
          depthStencilState.backStencilState.failOp;
      pointer.ref.depthStencilState.backStencilState.passOp =
          depthStencilState.backStencilState.passOp;
      pointer.ref.depthStencilState.backStencilState.depthFailOp =
          depthStencilState.backStencilState.depthFailOp;
      pointer.ref.depthStencilState.backStencilState.compareOp =
          depthStencilState.backStencilState.compareOp;
      // frontStencilState
      pointer.ref.depthStencilState.frontStencilState.failOp =
          depthStencilState.frontStencilState.failOp;
      pointer.ref.depthStencilState.frontStencilState.passOp =
          depthStencilState.frontStencilState.passOp;
      pointer.ref.depthStencilState.frontStencilState.depthFailOp =
          depthStencilState.frontStencilState.depthFailOp;
      pointer.ref.depthStencilState.frontStencilState.compareOp =
          depthStencilState.frontStencilState.compareOp;
      pointer.ref.depthStencilState.compareMask = depthStencilState.compareMask;
      pointer.ref.depthStencilState.writeMask = depthStencilState.writeMask;
      pointer.ref.depthStencilState.enableDepthTest =
          depthStencilState.enableDepthTest;
      pointer.ref.depthStencilState.enableDepthWrite =
          depthStencilState.enableDepthWrite;
      pointer.ref.depthStencilState.enableStencilTest =
          depthStencilState.enableStencilTest;
    }
    // targetInfo
    {
      // colorTargetDescriptions
      if (targetInfo.colorTargetDescriptions.isNotEmpty) {
        final colorTargetDescriptions = ffi
            .calloc<SdlGpuColorTargetDescription>(
              targetInfo.colorTargetDescriptions.length,
            );
        for (var i = 0; i < targetInfo.colorTargetDescriptions.length; i++) {
          final colorTargetDescription = colorTargetDescriptions + i;
          colorTargetDescriptions[i].format =
              targetInfo.colorTargetDescriptions[i].format;
          colorTargetDescription.ref.blendState.srcColorBlendfactor = targetInfo
              .colorTargetDescriptions[i]
              .blendState
              .srcColorBlendfactor;
          colorTargetDescription.ref.blendState.dstColorBlendfactor = targetInfo
              .colorTargetDescriptions[i]
              .blendState
              .dstColorBlendfactor;
          colorTargetDescription.ref.blendState.colorBlendOp =
              targetInfo.colorTargetDescriptions[i].blendState.colorBlendOp;
          colorTargetDescription.ref.blendState.srcAlphaBlendfactor = targetInfo
              .colorTargetDescriptions[i]
              .blendState
              .srcAlphaBlendfactor;
          colorTargetDescription.ref.blendState.dstAlphaBlendfactor = targetInfo
              .colorTargetDescriptions[i]
              .blendState
              .dstAlphaBlendfactor;
          colorTargetDescription.ref.blendState.alphaBlendOp =
              targetInfo.colorTargetDescriptions[i].blendState.alphaBlendOp;
          colorTargetDescription.ref.blendState.colorWriteMask =
              targetInfo.colorTargetDescriptions[i].blendState.colorWriteMask;
          colorTargetDescription.ref.blendState.enableBlend =
              targetInfo.colorTargetDescriptions[i].blendState.enableBlend;
          colorTargetDescription.ref.blendState.enableColorWriteMask =
              targetInfo
                  .colorTargetDescriptions[i]
                  .blendState
                  .enableColorWriteMask;
        }
        pointer.ref.targetInfo.numColorTargets =
            targetInfo.colorTargetDescriptions.length;
        pointer.ref.targetInfo.colorTargetDescriptions =
            colorTargetDescriptions;
      }
      pointer.ref.targetInfo.depthStencilFormat = targetInfo.depthStencilFormat;
      pointer.ref.targetInfo.hasDepthStencilTarget =
          targetInfo.hasDepthStencilTarget;
    }
    return pointer;
  }
}

extension SdlGpuGraphicsPipelineCreateInfoCallocAllFreeExtension
    on Pointer<SdlGpuGraphicsPipelineCreateInfo> {
  void callocAllFree() {
    if (ref.vertexInputState.numVertexBuffers > 0) {
      ref.vertexInputState.vertexBufferDescriptions.callocFree();
      ref.vertexInputState.vertexBufferDescriptions = nullptr;
    }
    if (ref.vertexInputState.numVertexAttributes > 0) {
      ref.vertexInputState.vertexAttributes.callocFree();
      ref.vertexInputState.vertexAttributes = nullptr;
    }
    if (ref.targetInfo.numColorTargets > 0) {
      ref.targetInfo.colorTargetDescriptions.callocFree();
      ref.targetInfo.colorTargetDescriptions = nullptr;
    }
    callocFree();
  }
}
