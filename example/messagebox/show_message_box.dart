import 'dart:ffi';

import 'package:sdl3/sdl3.dart';

void main() {
  final data = SdlxMessageBoxData(
    flags: SdlkMessagebox.buttonsLeftToRight,
    title: 'show message box example',
    message: 'SELECT 1 or 2 or 3',
    buttons: [
      const SdlxMessageBoxButtonData(
        flags: SdlkMessageboxButton.returnkeyDefault,
        buttonId: 1,
        text: '1',
      ),
      const SdlxMessageBoxButtonData(buttonId: 2, text: '2'),
      const SdlxMessageBoxButtonData(buttonId: 3, text: '3'),
    ],
  );
  final selectedButtonId = sdlxShowMessageBox(data);
  if (selectedButtonId != null) {
    sdlShowSimpleMessageBox(
      0,
      'selected button id',
      '$selectedButtonId',
      nullptr,
    );
  }
}
