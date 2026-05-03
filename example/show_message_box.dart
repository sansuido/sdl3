import 'dart:ffi';
import 'package:sdl3/sdl3.dart';

void main() {
  final data = SdlxMessageBoxData()
    ..flags = SdlkMessagebox.buttonsLeftToRight
    ..title = 'show message box example'
    ..message = 'SELECT 1 or 2 or 3'
    ..buttons = [
      SdlxMessageBoxButtonData()
        ..flags = SdlkMessageboxButton.returnkeyDefault
        ..buttonId = 1
        ..text = '1',
      SdlxMessageBoxButtonData()
        ..buttonId = 2
        ..text = '2',
      SdlxMessageBoxButtonData()
        ..buttonId = 3
        ..text = '3',
    ];
  if (sdlxShowMessageBox(data)) {
    sdlShowSimpleMessageBox(
      0,
      'selected button id',
      '${data.selectedButtonId}',
      nullptr,
    );
  }
}
