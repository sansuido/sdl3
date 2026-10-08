import 'dart:typed_data';

import 'package:sdl3/sdl3.dart';

const gVertexSource = '''
struct Input
{
    float3 Position : TEXCOORD0;
    float2 TexCoord : TEXCOORD1;
};

struct Output
{
    float2 TexCoord : TEXCOORD0;
    float4 Position : SV_Position;
};

Output main(Input input)
{
    Output output;
    output.TexCoord = input.TexCoord;
    output.Position = float4(input.Position, 1.0f);
    return output;
}
''';

const gFragmentSource = '''
Texture2D<float4> Texture : register(t0, space2);
SamplerState Sampler : register(s0, space2);

float4 main(float2 TexCoord : TEXCOORD0) : SV_Target0
{
    return Texture.Sample(Sampler, TexCoord);
}
  ''';

const gComputeSource = '''
[[vk::image_format("rgba8")]]
RWTexture2D<float4> outImage : register(u0, space1);

[numthreads(8, 8, 1)]
void main(uint3 GlobalInvocationID : SV_DispatchThreadID)
{
    int2 coord = int2(GlobalInvocationID.xy);
    outImage[coord] = float4(1.0f, 1.0f, 0.0f, 1.0f);
}
''';

enum CompileMode { dxbc, dxil, spirv }

Uint8List? getShader(
  CompileMode mode,
  int stage,
  String source, {
  bool debug = false,
}) {
  Uint8List? shader;
  final hlslInfo = SdlxShaderCrossHlslInfo(
    source: source,
    shaderStage: stage,
    entrypoint: 'main',
  );
  var debugProps = 0;
  if (debug) {
    debugProps = sdlCreateProperties();
    sdlSetBooleanProperty(
      debugProps,
      SDL_SHADERCROSS_PROP_SHADER_DEBUG_ENABLE_BOOLEAN,
      true,
    );
    sdlSetStringProperty(
      debugProps,
      SDL_SHADERCROSS_PROP_SHADER_DEBUG_NAME_STRING,
      'Simple shader',
    );
  }
  switch (mode) {
    case CompileMode.dxbc:
      shader = sdlxShaderCrossCompileDxbcFromHlsl(hlslInfo);
    case CompileMode.dxil:
      shader = sdlxShaderCrossCompileDxilFromHlsl(hlslInfo);
    case CompileMode.spirv:
      shader = sdlxShaderCrossCompileSpirvFromHlsl(hlslInfo);
  }
  if (debug) {
    sdlDestroyProperties(debugProps);
  }
  return shader;
}

void test(int stage, String source) {
  {
    print('DXBC ===========');
    final shader = getShader(CompileMode.dxbc, stage, source);
    if (shader != null) {
      print('size=${shader.length}');
    } else {
      print(sdlGetError());
    }
  }
  {
    print('DXIL ===========');
    final shader = getShader(CompileMode.dxil, stage, source);
    if (shader != null) {
      print('size=${shader.length}');
    } else {
      print(sdlGetError());
    }
  }
  {
    print('SPIRV ==========');
    final shader = getShader(CompileMode.spirv, stage, source);
    if (shader != null) {
      print('size=${shader.length}');
      print('** SPIRV => MSL **');
      final spirvInfo = SdlxShaderCrossSpirvInfo(
        bytecode: shader,
        shaderStage: stage,
        entrypoint: 'main',
      );
      final msl = sdlxShaderCrossTranspileMslFromSpirv(spirvInfo);
      if (msl != null) {
        print(msl);
      } else {
        print(sdlGetError());
      }
      print('** SPIRV => HLSL **');
      final hlsl = sdlxShaderCrossTranspileHlslFromSpirv(spirvInfo);
      if (hlsl != null) {
        print(hlsl);
      } else {
        print(sdlGetError());
      }
      print('** SPIRV => DXBC **');
      final dxbc = sdlxShaderCrossCompileDxbcFromSpirv(spirvInfo);
      if (dxbc != null) {
        print('size=${dxbc.length}');
      }
      print('** SPIRV => DXIL **');
      final dxil = sdlxShaderCrossCompileDxilFromSpirv(spirvInfo);
      if (dxil != null) {
        print('size=${dxil.length}');
      }
      if (stage == SdlkShadercrossShaderstage.compute) {
        print('** SPIRV => ComputePipelineMetadata **');
        final metadata = sdlxShaderCrossReflectComputeSpirv(shader);
        if (metadata != null) {
          print('metadata.numSamplers=${metadata.numSamplers}');
          print(
            'metadata.numReadonlyStorageTextures=${metadata.numReadonlyStorageTextures}',
          );
          print(
            'metadata.numReadonlyStorageBuffers=${metadata.numReadonlyStorageBuffers}',
          );
          print(
            'metadata.numReadwriteStorageTextures=${metadata.numReadwriteStorageTextures}',
          );
          print(
            'metadata.numReadwriteStorageBuffers=${metadata.numReadwriteStorageBuffers}',
          );
          print('metadata.numUniformBuffers=${metadata.numUniformBuffers}');
          print('metadata.threadcountX=${metadata.threadcountX}');
          print('metadata.threadcountY=${metadata.threadcountY}');
          print('metadata.threadcountZ=${metadata.threadcountZ}');
        }
      } else {
        print('** SPIRV => GraphicsShaderMetadata **');
        final metadata = sdlxShaderCrossReflectGraphicsSpirv(shader);
        if (metadata != null) {
          print(
            'metadata.resourceInfo.numSamplers=${metadata.resourceInfo.numSamplers}',
          );
          print(
            'metadata.resourceInfo.numStorageTextures=${metadata.resourceInfo.numStorageTextures}',
          );
          print(
            'metadata.resourceInfo.numStorageBuffers=${metadata.resourceInfo.numStorageBuffers}',
          );
          print(
            'metadata.resourceInfo.numUniformBuffers=${metadata.resourceInfo.numUniformBuffers}',
          );
          print('metadata.numInputs=${metadata.inputs.length}');
          for (var i = 0; i < metadata.inputs.length; i++) {
            print('metadata.input[$i].name=${metadata.inputs[i].name}');
            print('metadata.input[$i].location=${metadata.inputs[i].location}');
            print(
              'metadata.input[$i].vectorType=${metadata.inputs[i].vectorType}',
            );
            print(
              'metadata.input[$i].vectorSize=${metadata.inputs[i].vectorSize}',
            );
          }
          print('metadata.numOutputs=${metadata.outputs.length}');
          for (var i = 0; i < metadata.outputs.length; i++) {
            print('metadata.output[$i].name=${metadata.outputs[i].name}');
            print(
              'metadata.output[$i].location=${metadata.outputs[i].location}',
            );
            print(
              'metadata.output[$i].vectorType=${metadata.outputs[i].vectorType}',
            );
            print(
              'metadata.output[$i].vectorSize=${metadata.outputs[i].vectorSize}',
            );
          }
        }
      }
    } else {
      print(sdlGetError());
    }
  }
}

int main() {
  if (!sdlShaderCrossInit()) {
    return -1;
  }
  test(SdlkShadercrossShaderstage.vertex, gVertexSource);
  test(SdlkShadercrossShaderstage.fragment, gFragmentSource);
  test(SdlkShadercrossShaderstage.compute, gComputeSource);
  sdlShaderCrossQuit();
  return 0;
}
