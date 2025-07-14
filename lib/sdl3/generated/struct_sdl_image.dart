// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
part of '../sdl_image.dart';

// IMG_Animation
/// {@category image}
final class ImgAnimation extends Struct {
  // [0]+(4)
  @Int32()
  external int w;
  // [4]+(4)
  @Int32()
  external int h;
  // [8]+(4)
  @Int32()
  external int count;
  // [] +(4)
  @Uint32()
  external int blank_1;
  // [16]+(8)
  external Pointer<Pointer<SdlSurface>> frames;
  // [24]+(8)
  external Pointer<Int32> delays;
}
