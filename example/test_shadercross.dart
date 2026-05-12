import 'dart:ffi';
import 'package:sdl3/sdl3.dart';

const gHlslSource = '''
cbuffer UniformBlock : register(b0, space1)
{
    float4x4 MatrixTransform : packoffset(c0);
};

struct Input
{
    float3 inTexCoord : TEXCOORD0;
};

struct Output
{
    float3 TexCoord : TEXCOORD0;
    float4 Position : SV_Position;
};

Output main(float3 inTexCoord : TEXCOORD0)
{
    Output output;
    output.TexCoord = inTexCoord;
    output.Position = mul(MatrixTransform, float4(inTexCoord, 1.0));
    return output;
}

#ifdef BREAK_SHADER
choke
#endif
''';

enum CompileMode { dxbc, dxil, spirv }

void testCompile(CompileMode mode, String source, {bool debug = false}) {
  final hlslInfo = SdlxShaderCrossHlslInfo()
    ..source = source
    ..shaderStage = SdlkShadercrossShaderstage.vertex
    ..entrypoint = 'main';
  if (debug) {
    hlslInfo.props = sdlCreateProperties();
    sdlSetBooleanProperty(
      hlslInfo.props,
      SDL_SHADERCROSS_PROP_SHADER_DEBUG_ENABLE_BOOLEAN,
      true,
    );
    sdlSetStringProperty(
      hlslInfo.props,
      SDL_SHADERCROSS_PROP_SHADER_DEBUG_NAME_STRING,
      'Simple shader',
    );
  }
  late Pointer<NativeType> shader;
  switch (mode) {
    case CompileMode.dxbc:
      shader = sdlxShaderCrossCompileDxbcFromHlsl(hlslInfo);
      print('dxbc: size: ${hlslInfo.size}');
    case CompileMode.dxil:
      shader = sdlxShaderCrossCompileDxilFromHlsl(hlslInfo);
      print('dxil: size: ${hlslInfo.size}');
    case CompileMode.spirv:
      shader = sdlxShaderCrossCompileSpirvFromHlsl(hlslInfo);
      print('spirv: size: ${hlslInfo.size}');
  }
  if (shader == nullptr) {
    print('Failed to compile shader: ${sdlGetError()}');
  } else {
    sdlFree(shader);
  }
  if (debug) {
    sdlDestroyProperties(hlslInfo.props);
  }
}

void main() {
  testCompile(CompileMode.dxbc, gHlslSource);
  testCompile(CompileMode.dxil, gHlslSource);
  testCompile(CompileMode.spirv, gHlslSource);
}
