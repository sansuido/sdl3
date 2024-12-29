// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'struct_sdl.dart';

// TTF_Font
final class TtfFont extends Opaque {}

// TTF_TextEngine
final class TtfTextEngine extends Opaque {}

// TTF_TextData
final class TtfTextData extends Opaque {}

// TTF_Text
final class TtfText extends Struct {
  // [0]+(8)
  external Pointer<Int8> text;
  // [8]+(4)
  @Int32()
  external int numLines;
  // [12]+(4)
  @Int32()
  external int refcount;
  // [16]+(8)
  external Pointer<TtfTextData> internal;
}

// TTF_GPUAtlasDrawSequence
final class TtfGpuAtlasDrawSequence extends Struct {
  // [0]+(8)
  external Pointer<SdlGpuTexture> atlasTexture;
  // [8]+(8)
  external Pointer<SdlFPoint> xy;
  // [16]+(8)
  external Pointer<SdlFPoint> uv;
  // [24]+(4)
  @Int32()
  external int numVertices;
  // [] +(4)
  @Uint32()
  external int blank_1;
  // [32]+(8)
  external Pointer<Int32> indices;
  // [40]+(4)
  @Int32()
  external int numIndices;
  // [] +(4)
  @Uint32()
  external int blank_2;
  // [48]+(8)
  external Pointer<TtfGpuAtlasDrawSequence> next;
}

// TTF_SubString
final class TtfSubString extends Struct {
  // [0]+(4)
  @Uint32()
  external int flags;
  // [4]+(4)
  @Int32()
  external int offset;
  // [8]+(4)
  @Int32()
  external int length;
  // [12]+(4)
  @Int32()
  external int lineIndex;
  // [16]+(4)
  @Int32()
  external int clusterIndex;
  // [20]+(16)
  @Uint64()
  external int rect_1;
  @Uint64()
  external int rect_2;
  // [] +(4)
  @Uint32()
  external int blank_1;
}

extension TtfSubStringExtension on Pointer<TtfSubString> {
  Pointer<SdlRect> get rect => (cast<Uint8>() + 20).cast<SdlRect>();
}
