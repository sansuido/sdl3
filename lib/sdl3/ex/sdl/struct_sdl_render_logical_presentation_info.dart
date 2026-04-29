part of '../../sdl.dart';

class SdlxRenderLogicalPresentationInfo {
  SdlxRenderLogicalPresentationInfo({
    this.w = 0,
    this.h = 0,
    this.mode = SdlkLogicalPresentation.disabled,
    SdlxFRect? rect,
  }) {
    this.rect = rect ?? SdlxFRect();
  }
  int w;
  int h;
  int mode;
  late SdlxFRect rect;
}
