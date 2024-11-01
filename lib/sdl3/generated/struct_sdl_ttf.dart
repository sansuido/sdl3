// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:sdl3/sdl3/generated/struct_sdl.dart';

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
