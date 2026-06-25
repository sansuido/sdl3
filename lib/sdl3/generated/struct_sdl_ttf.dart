// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
part of '../sdl_ttf.dart';

// TTF_FillOperation
/// {@category textengine}
final class TtfFillOperation extends Struct {
  // [0]+(4)
  @Int32()
  external int cmd;
  // [4]+(16)
  external SdlRect rect;
}

// TTF_CopyOperation
/// {@category textengine}
final class TtfCopyOperation extends Struct {
  // [0]+(4)
  @Int32()
  external int cmd;
  // [4]+(4)
  @Int32()
  external int textOffset;
  // [8]+(8)
  external Pointer<TtfFont> glyphFont;
  // [16]+(4)
  @Uint32()
  external int glyphIndex;
  // [20]+(16)
  external SdlRect src;
  // [36]+(16)
  external SdlRect dst;
  // [56]+(8)
  external Pointer<Void> reserved;
}

// TTF_DrawOperation
/// {@category textengine}
final class TtfDrawOperation extends Union {
  // [0]+(4)
  @Int32()
  external int cmd;
  // [0]+(20)
  external TtfFillOperation fill;
  // [0]+(64)
  external TtfCopyOperation copy;
}

// TTF_TextLayout
/// {@category textengine}
final class TtfTextLayout extends Opaque {}

// TTF_TextData
/// {@category textengine}
final class TtfTextData extends Struct {
  // [0]+(8)
  external Pointer<TtfFont> font;
  // [8]+(16)
  external SdlFColor color;
  // [24]+(1)
  @Bool()
  external bool needsLayoutUpdate;
  // [32]+(8)
  external Pointer<TtfTextLayout> layout;
  // [40]+(4)
  @Int32()
  external int x;
  // [44]+(4)
  @Int32()
  external int y;
  // [48]+(4)
  @Int32()
  external int w;
  // [52]+(4)
  @Int32()
  external int h;
  // [56]+(4)
  @Int32()
  external int numOps;
  // [64]+(8)
  external Pointer<TtfDrawOperation> ops;
  // [72]+(4)
  @Int32()
  external int numClusters;
  // [80]+(8)
  external Pointer<TtfSubString> clusters;
  // [88]+(4)
  @Uint32()
  external int props;
  // [92]+(1)
  @Bool()
  external bool needsEngineUpdate;
  // [96]+(8)
  external Pointer<TtfTextEngine> engine;
  // [104]+(8)
  external Pointer<Void> engineText;
}

// TTF_TextEngine
/// {@category textengine}
final class TtfTextEngine extends Struct {
  // [0]+(4)
  @Uint32()
  external int version;
  // [8]+(8)
  external Pointer<Void> userdata;
  // [16]+(8)
  external Pointer<NativeFunction<TtfTextEngineCreateText>> createText;
  // [24]+(8)
  external Pointer<NativeFunction<TtfTextEngineDestroyText>> destroyText;
}

// TTF_Font
/// {@category ttf}
final class TtfFont extends Opaque {}

// TTF_Text
/// {@category ttf}
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
/// {@category ttf}
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
  // [32]+(8)
  external Pointer<Int32> indices;
  // [40]+(4)
  @Int32()
  external int numIndices;
  // [44]+(4)
  @Int32()
  external int imageType;
  // [48]+(8)
  external Pointer<TtfGpuAtlasDrawSequence> next;
}

// TTF_GLAtlasDrawVertex
/// {@category ttf}
final class TtfGlAtlasDrawVertex extends Struct {
  // [0]+(8)
  external SdlFPoint position;
  // [8]+(8)
  external SdlFPoint texcoord;
}

// TTF_GLAtlasDrawSequence
/// {@category ttf}
final class TtfGlAtlasDrawSequence extends Struct {
  // [0]+(4)
  @Uint32()
  external int atlasTexture;
  // [8]+(8)
  external Pointer<TtfGlAtlasDrawVertex> vertices;
  // [16]+(4)
  @Int32()
  external int numVertices;
  // [24]+(8)
  external Pointer<Uint16> indices;
  // [32]+(4)
  @Int32()
  external int numIndices;
  // [36]+(4)
  @Int32()
  external int imageType;
  // [40]+(8)
  external Pointer<TtfGlAtlasDrawSequence> next;
}

// TTF_SubString
/// {@category ttf}
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
  external SdlRect rect;
}
