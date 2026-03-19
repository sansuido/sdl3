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
    this.enableDepthBias = 0,
    this.enableDepthClip = 0,
  });

  int fillMode;
  int cullMode;
  int frontFace;
  double depthBiasAntFactor;
  double depthBiasClamp;
  double depthBiasSlopeFactor;
  int enableDepthBias;
  int enableDepthClip;
}

class SdlxGpuMultisampleState {
  SdlxGpuMultisampleState({
    this.sampleCount = 0,
    this.sampleMask = 0,
    this.enableMask = 0,
    this.enableAlphaToCoverage = 0,
  });
  int sampleCount;
  int sampleMask;
  int enableMask;
  int enableAlphaToCoverage;
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
    this.enableDepthTest = 0,
    this.enableDepthWrite = 0,
    this.enableStencilTest = 0,
  }) {
    backStencilState = SdlxGpuStencilOpState();
    frontStencilState = SdlxGpuStencilOpState();
  }
  int compareOp;
  late SdlxGpuStencilOpState backStencilState;
  late SdlxGpuStencilOpState frontStencilState;
  int compareMask;
  int writeMask;
  int enableDepthTest;
  int enableDepthWrite;
  int enableStencilTest;
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
    this.enableBlend = 0,
    this.enableColorWriteMask = 0,
  });
  int srcColorBlendfactor;
  int dstColorBlendfactor;
  int colorBlendOp;
  int srcAlphaBlendfactor;
  int dstAlphaBlendfactor;
  int alphaBlendOp;
  int colorWriteMask;
  int enableBlend;
  int enableColorWriteMask;
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
    this.hasDepthStencilTarget = 0,
  }) {
    this.colorTargetDescriptions = colorTargetDescriptions ?? [];
  }
  late List<SdlxGpuColorTargetDescription> colorTargetDescriptions;
  //int numColorTargets;
  int depthStencilFormat;
  int hasDepthStencilTarget;
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
        pointer.vertexInputState.ref.numVertexBuffers =
            vertexInputState.vertexBufferDescriptions.length;
        pointer.vertexInputState.ref.vertexBufferDescriptions =
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
        pointer.vertexInputState.ref.numVertexAttributes =
            vertexInputState.vertexAttributes.length;
        pointer.vertexInputState.ref.vertexAttributes = vertexAttributes;
      }
    }
    // rasterizerState
    {
      pointer.rasterizerState.ref.fillMode = rasterizerState.fillMode;
      pointer.rasterizerState.ref.cullMode = rasterizerState.cullMode;
      pointer.rasterizerState.ref.frontFace = rasterizerState.frontFace;
      pointer.rasterizerState.ref.depthBiasAntFactor =
          rasterizerState.depthBiasAntFactor;
      pointer.rasterizerState.ref.depthBiasClamp =
          rasterizerState.depthBiasClamp;
      pointer.rasterizerState.ref.depthBiasSlopeFactor =
          rasterizerState.depthBiasSlopeFactor;
      pointer.rasterizerState.ref.enableDepthBias =
          rasterizerState.enableDepthBias;
      pointer.rasterizerState.ref.enableDepthClip =
          rasterizerState.enableDepthClip;
    }
    // multisampleState
    {
      pointer.multisampleState.ref.sampleCount = multisampleState.sampleCount;
      pointer.multisampleState.ref.sampleMask = multisampleState.sampleMask;
      pointer.multisampleState.ref.enableMask = multisampleState.enableMask;
      pointer.multisampleState.ref.enableAlphaToCoverage =
          multisampleState.enableAlphaToCoverage;
    }
    // depthStencilState
    {
      pointer.depthStencilState.ref.compareOp = depthStencilState.compareOp;
      // backStencilState
      pointer.depthStencilState.backStencilState.ref.failOp =
          depthStencilState.backStencilState.failOp;
      pointer.depthStencilState.backStencilState.ref.passOp =
          depthStencilState.backStencilState.passOp;
      pointer.depthStencilState.backStencilState.ref.depthFailOp =
          depthStencilState.backStencilState.depthFailOp;
      pointer.depthStencilState.backStencilState.ref.compareOp =
          depthStencilState.backStencilState.compareOp;
      // frontStencilState
      pointer.depthStencilState.frontStencilState.ref.failOp =
          depthStencilState.frontStencilState.failOp;
      pointer.depthStencilState.frontStencilState.ref.passOp =
          depthStencilState.frontStencilState.passOp;
      pointer.depthStencilState.frontStencilState.ref.depthFailOp =
          depthStencilState.frontStencilState.depthFailOp;
      pointer.depthStencilState.frontStencilState.ref.compareOp =
          depthStencilState.frontStencilState.compareOp;
      pointer.depthStencilState.ref.compareMask = depthStencilState.compareMask;
      pointer.depthStencilState.ref.writeMask = depthStencilState.writeMask;
      pointer.depthStencilState.ref.enableDepthTest =
          depthStencilState.enableDepthTest;
      pointer.depthStencilState.ref.enableDepthWrite =
          depthStencilState.enableDepthWrite;
      pointer.depthStencilState.ref.enableStencilTest =
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
          colorTargetDescription.blendState.ref.srcColorBlendfactor = targetInfo
              .colorTargetDescriptions[i]
              .blendState
              .srcColorBlendfactor;
          colorTargetDescription.blendState.ref.dstColorBlendfactor = targetInfo
              .colorTargetDescriptions[i]
              .blendState
              .dstColorBlendfactor;
          colorTargetDescription.blendState.ref.colorBlendOp =
              targetInfo.colorTargetDescriptions[i].blendState.colorBlendOp;
          colorTargetDescription.blendState.ref.srcAlphaBlendfactor = targetInfo
              .colorTargetDescriptions[i]
              .blendState
              .srcAlphaBlendfactor;
          colorTargetDescription.blendState.ref.dstAlphaBlendfactor = targetInfo
              .colorTargetDescriptions[i]
              .blendState
              .dstAlphaBlendfactor;
          colorTargetDescription.blendState.ref.alphaBlendOp =
              targetInfo.colorTargetDescriptions[i].blendState.alphaBlendOp;
          colorTargetDescription.blendState.ref.colorWriteMask =
              targetInfo.colorTargetDescriptions[i].blendState.colorWriteMask;
          colorTargetDescription.blendState.ref.enableBlend =
              targetInfo.colorTargetDescriptions[i].blendState.enableBlend;
          colorTargetDescription.blendState.ref.enableColorWriteMask =
              targetInfo
                  .colorTargetDescriptions[i]
                  .blendState
                  .enableColorWriteMask;
        }
        pointer.targetInfo.ref.numColorTargets =
            targetInfo.colorTargetDescriptions.length;
        pointer.targetInfo.ref.colorTargetDescriptions =
            colorTargetDescriptions;
      }
      pointer.targetInfo.ref.depthStencilFormat = targetInfo.depthStencilFormat;
      pointer.targetInfo.ref.hasDepthStencilTarget =
          targetInfo.hasDepthStencilTarget;
    }
    return pointer;
  }
}

extension SdlGpuGraphicsPipelineCreateInfoCallocAllFreeExtension
    on Pointer<SdlGpuGraphicsPipelineCreateInfo> {
  void callocAllFree() {
    if (vertexInputState.ref.numVertexBuffers > 0) {
      vertexInputState.ref.vertexBufferDescriptions.callocFree();
      vertexInputState.ref.vertexBufferDescriptions = nullptr;
    }
    if (vertexInputState.ref.numVertexAttributes > 0) {
      vertexInputState.ref.vertexAttributes.callocFree();
      vertexInputState.ref.vertexAttributes = nullptr;
    }
    if (targetInfo.ref.numColorTargets > 0) {
      targetInfo.ref.colorTargetDescriptions.callocFree();
      targetInfo.ref.colorTargetDescriptions = nullptr;
    }
    callocFree();
  }
}
