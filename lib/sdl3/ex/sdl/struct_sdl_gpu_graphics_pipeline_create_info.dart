part of '../../sdl.dart';

class SdlxGpuVertexBufferDescription {
  SdlxGpuVertexBufferDescription({
    this.slot = 0,
    this.pitch = 0,
    this.inputRate = 0,
    this.instanceStepRate = 0,
  });
  int slot;
  int pitch;
  int inputRate;
  int instanceStepRate;
}

class SdlxGpuVertexAttribute {
  SdlxGpuVertexAttribute({
    this.location = 0,
    this.bufferSlot = 0,
    this.format = 0,
    this.offset = 0,
  });
  int location;
  int bufferSlot;
  int format;
  int offset;
}

class SdlxGpuVertexInputState {
  SdlxGpuVertexInputState({
    List<SdlxGpuVertexBufferDescription>? vertexBufferDescriptions,
    List<SdlxGpuVertexAttribute>? vertexAttributes,
  }) {
    this.vertexBufferDescriptions = vertexBufferDescriptions ?? [];
    this.vertexAttributes = vertexAttributes ?? [];
  }

  late List<SdlxGpuVertexBufferDescription> vertexBufferDescriptions;
  //int numVertexBuffers;
  late List<SdlxGpuVertexAttribute> vertexAttributes;
  //int numVertexAttributes
}

class SdlxGpuRasterizerState {
  SdlxGpuRasterizerState({
    this.fillMode = 0,
    this.cullMode = 0,
    this.frontFace = 0,
    this.depthBiasAntFactor = 0,
    this.depthBiasClamp = 0,
    this.depthBiasSlopeFactor = 0,
    this.enableDepthBias = false,
    this.enableDepthClip = false,
  });

  int fillMode;
  int cullMode;
  int frontFace;
  double depthBiasAntFactor;
  double depthBiasClamp;
  double depthBiasSlopeFactor;
  bool enableDepthBias;
  bool enableDepthClip;
}

class SdlxGpuMultisampleState {
  SdlxGpuMultisampleState({
    this.sampleCount = 0,
    this.sampleMask = 0,
    this.enableMask = false,
    this.enableAlphaToCoverage = false,
  });
  int sampleCount;
  int sampleMask;
  bool enableMask;
  bool enableAlphaToCoverage;
}

class SdlxGpuStencilOpState {
  SdlxGpuStencilOpState({
    this.failOp = 0,
    this.passOp = 0,
    this.depthFailOp = 0,
    this.compareOp = 0,
  });
  int failOp;
  int passOp;
  int depthFailOp;
  int compareOp;
}

class SdlxGpuDepthStencilState {
  SdlxGpuDepthStencilState({
    this.compareOp = 0,
    this.compareMask = 0,
    this.writeMask = 0,
    this.enableDepthTest = false,
    this.enableDepthWrite = false,
    this.enableStencilTest = false,
  }) {
    backStencilState = SdlxGpuStencilOpState();
    frontStencilState = SdlxGpuStencilOpState();
  }
  int compareOp;
  late SdlxGpuStencilOpState backStencilState;
  late SdlxGpuStencilOpState frontStencilState;
  int compareMask;
  int writeMask;
  bool enableDepthTest;
  bool enableDepthWrite;
  bool enableStencilTest;
}

class SdlxGpuColorTargetBlendState {
  SdlxGpuColorTargetBlendState({
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
  int srcColorBlendfactor;
  int dstColorBlendfactor;
  int colorBlendOp;
  int srcAlphaBlendfactor;
  int dstAlphaBlendfactor;
  int alphaBlendOp;
  int colorWriteMask;
  bool enableBlend;
  bool enableColorWriteMask;
}

class SdlxGpuColorTargetDescription {
  SdlxGpuColorTargetDescription({this.format = 0}) {
    blendState = SdlxGpuColorTargetBlendState();
  }
  int format;
  late SdlxGpuColorTargetBlendState blendState;
}

class SdlxGpuGraphicsPipelineTargetInfo {
  SdlxGpuGraphicsPipelineTargetInfo({
    List<SdlxGpuColorTargetDescription>? colorTargetDescriptions,
    this.depthStencilFormat = 0,
    this.hasDepthStencilTarget = false,
  }) {
    this.colorTargetDescriptions = colorTargetDescriptions ?? [];
  }
  late List<SdlxGpuColorTargetDescription> colorTargetDescriptions;
  //int numColorTargets;
  int depthStencilFormat;
  bool hasDepthStencilTarget;
}

class SdlxGpuGraphicsPipelineCreateInfo {
  SdlxGpuGraphicsPipelineCreateInfo({
    Pointer<SdlGpuShader>? vertexShader,
    Pointer<SdlGpuShader>? fragmentShader,
    this.primitiveType = 0,
    this.props = 0,
  }) {
    this.vertexShader = vertexShader ?? nullptr;
    this.fragmentShader = fragmentShader ?? nullptr;
    vertexInputState = SdlxGpuVertexInputState();
    rasterizerState = SdlxGpuRasterizerState();
    multisampleState = SdlxGpuMultisampleState();
    depthStencilState = SdlxGpuDepthStencilState();
    targetInfo = SdlxGpuGraphicsPipelineTargetInfo();
  }

  late Pointer<SdlGpuShader> vertexShader;
  late Pointer<SdlGpuShader> fragmentShader;
  int primitiveType;
  late SdlxGpuVertexInputState vertexInputState;
  late SdlxGpuRasterizerState rasterizerState;
  late SdlxGpuMultisampleState multisampleState;
  late SdlxGpuDepthStencilState depthStencilState;
  late SdlxGpuGraphicsPipelineTargetInfo targetInfo;
  int props;

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
