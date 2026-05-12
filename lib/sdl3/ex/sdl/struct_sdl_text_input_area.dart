part of '../../sdl.dart';

class SdlxTextInputArea {
  SdlxTextInputArea({SdlxRect? rect, this.cursor = 0}) {
    this.rect = rect ?? SdlxRect();
  }
  late SdlxRect rect;
  int cursor;
}
