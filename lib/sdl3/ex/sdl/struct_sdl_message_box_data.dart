part of '../../sdl.dart';

class SdlxMessageBoxColorScheme {
  SdlxMessageBoxColorScheme({
    required this.background,
    required this.text,
    required this.buttonBorder,
    required this.buttonBackground,
    required this.buttonSelected,
  });

  SdlxColor background;
  SdlxColor text;
  SdlxColor buttonBorder;
  SdlxColor buttonBackground;
  SdlxColor buttonSelected;

  Pointer<SdlMessageBoxColorScheme> calloc() {
    final pointer = ffi.calloc<SdlMessageBoxColorScheme>();
    pointer.colors[SdlkMessageboxColor.background].r = background.r;
    pointer.colors[SdlkMessageboxColor.background].g = background.g;
    pointer.colors[SdlkMessageboxColor.background].b = background.b;
    pointer.colors[SdlkMessageboxColor.text].r = text.r;
    pointer.colors[SdlkMessageboxColor.text].g = text.g;
    pointer.colors[SdlkMessageboxColor.text].b = text.b;
    pointer.colors[SdlkMessageboxColor.buttonBorder].r = buttonBorder.r;
    pointer.colors[SdlkMessageboxColor.buttonBorder].g = buttonBorder.g;
    pointer.colors[SdlkMessageboxColor.buttonBorder].b = buttonBorder.b;
    pointer.colors[SdlkMessageboxColor.buttonBackground].r = buttonBackground.r;
    pointer.colors[SdlkMessageboxColor.buttonBackground].g = buttonBackground.g;
    pointer.colors[SdlkMessageboxColor.buttonBackground].b = buttonBackground.b;
    pointer.colors[SdlkMessageboxColor.buttonSelected].r = buttonSelected.r;
    pointer.colors[SdlkMessageboxColor.buttonSelected].g = buttonSelected.g;
    pointer.colors[SdlkMessageboxColor.buttonSelected].b = buttonSelected.b;
    return pointer;
  }
}

class SdlxMessageBoxButtonData {
  SdlxMessageBoxButtonData({this.flags = 0, this.buttonId = 0, String? text}) {
    this.text = text ?? '';
  }
  int flags;
  int buttonId;
  late String text;
}

class SdlxMessageBoxData {
  SdlxMessageBoxData({
    this.flags = 0,
    Pointer<SdlWindow>? window,
    String? title,
    String? message,
    List<SdlxMessageBoxButtonData>? buttons,
    this.colorScheme,
  }) {
    this.window = window ?? nullptr;
    this.title = title ?? '';
    this.message = message ?? '';
    this.buttons = buttons ?? [];
    selectedButtonId = 0;
  }
  int flags;
  late Pointer<SdlWindow> window;
  late String title;
  late String message;
  late List<SdlxMessageBoxButtonData> buttons;
  SdlxMessageBoxColorScheme? colorScheme;
  late int selectedButtonId;

  Pointer<SdlMessageBoxData> calloc() {
    final pointer = ffi.calloc<SdlMessageBoxData>();
    pointer.ref.flags = flags;
    pointer.ref.window = window;
    if (title.isNotEmpty) {
      pointer.ref.title = title.toNativeUtf8();
    }
    if (message.isNotEmpty) {
      pointer.ref.message = message.toNativeUtf8();
    }
    if (buttons.isNotEmpty) {
      final buttonsPointer = ffi.calloc<SdlMessageBoxButtonData>(
        buttons.length,
      );
      for (var i = 0; i < buttons.length; i++) {
        final buttonPointer = buttonsPointer + i;
        buttonPointer.ref.flags = buttons[i].flags;
        buttonPointer.ref.buttonId = buttons[i].buttonId;
        if (buttons[i].text.isNotEmpty) {
          buttonPointer.ref.text = buttons[i].text.toNativeUtf8();
        }
      }
      pointer.ref.buttons = buttonsPointer;
      pointer.ref.numbuttons = buttons.length;
    }
    if (colorScheme != null) {
      pointer.ref.colorScheme = colorScheme!.calloc();
    }
    return pointer;
  }
}

extension SdlMessageBoxDataCallocAllFreeExtension
    on Pointer<SdlMessageBoxData> {
  void callocAllFree() {
    if (ref.title != nullptr) {
      ref.title.callocFree();
    }
    if (ref.message != nullptr) {
      ref.message.callocFree();
    }
    for (var i = 0; i < ref.numbuttons; i++) {
      final buttonPointer = ref.buttons + i;
      if (buttonPointer.ref.text != nullptr) {
        buttonPointer.ref.text.callocFree();
      }
    }
    if (ref.colorScheme != nullptr) {
      ref.colorScheme.callocFree();
    }
    callocFree();
  }
}
