part of '../../sdl_image.dart';

class ImgxAnimationDecoderFrame {
  ImgxAnimationDecoderFrame({Pointer<SdlSurface>? frame, this.duration = 0}) {
    this.frame = frame ?? nullptr;
  }

  late Pointer<SdlSurface> frame;
  int duration;
}
