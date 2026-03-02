import 'dart:ffi';
import 'package:ffi/ffi.dart';
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
  final hlslInfo = calloc<SdlShaderCrossHlslInfo>();
  final size = calloc<Uint32>();
  final sourceUtf8 = source.toNativeUtf8();
  final entrypointUtf8 = 'main'.toNativeUtf8();
  hlslInfo.ref.source = sourceUtf8;
  hlslInfo.ref.shaderStage = SdlkShadercrossShaderstage.vertex;
  hlslInfo.ref.entrypoint = entrypointUtf8;
  if (debug) {
    hlslInfo.ref.props = sdlCreateProperties();
    sdlSetBooleanProperty(
      hlslInfo.ref.props,
      SDL_SHADERCROSS_PROP_SHADER_DEBUG_ENABLE_BOOLEAN,
      true,
    );
    sdlSetStringProperty(
      hlslInfo.ref.props,
      SDL_SHADERCROSS_PROP_SHADER_DEBUG_NAME_STRING,
      'Simple shader',
    );
  }
  late Pointer<NativeType> shader;
  switch (mode) {
    case CompileMode.dxbc:
      shader = sdlShaderCrossCompileDxbcFromHlsl(hlslInfo, size);
      print('dxbc: size: ${size.value}');
    case CompileMode.dxil:
      shader = sdlShaderCrossCompileDxilFromHlsl(hlslInfo, size);
      print('dxil: size: ${size.value}');
    case CompileMode.spirv:
      shader = sdlShaderCrossCompileSpirvFromHlsl(hlslInfo, size);
      print('spirv: size: ${size.value}');
  }
  if (shader == nullptr) {
    print('Failed to compile shader: ${sdlGetError()}');
  } else {
    sdlFree(shader);
  }
  if (debug) {
    sdlDestroyProperties(hlslInfo.ref.props);
  }
  sourceUtf8.callocFree();
  entrypointUtf8.callocFree();
  hlslInfo.callocFree();
  size.callocFree();
}

void main() {
  testCompile(CompileMode.dxbc, gHlslSource);
  testCompile(CompileMode.dxil, gHlslSource);
  testCompile(CompileMode.spirv, gHlslSource);
}
