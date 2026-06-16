import 'dart:ffi';
import 'package:sdl3/sdl3.dart';

void printPropertyValues(int props) {
  final propertyNames = sdlxGetPropertyNames(props);
  for (final propertyName in propertyNames) {
    final propertyType = sdlGetPropertyType(props, propertyName);
    var typeName = '';
    Object? value;
    switch (propertyType) {
      case SdlkPropertyType.pointer:
        typeName = 'pointer';
        value = sdlGetPointerProperty(props, propertyName, nullptr);
      case SdlkPropertyType.string:
        typeName = 'string ';
        value = sdlGetStringProperty(props, propertyName, '');
      case SdlkPropertyType.number:
        typeName = 'number ';
        value = sdlGetNumberProperty(props, propertyName, 0);
      case SdlkPropertyType.float:
        typeName = 'float  ';
        value = sdlGetFloatProperty(props, propertyName, 0);
      case SdlkPropertyType.boolean:
        typeName = 'boolean';
        value = sdlGetBooleanProperty(props, propertyName, false);
      default:
        typeName = 'unknown';
    }
    print('[$typeName] $propertyName => $value');
  }
}

int main() {
  if (!sdlInit(SDL_INIT_VIDEO)) {
    print(sdlGetError());
    return -1;
  }
  final window = SdlWindowEx.create(
    title: '',
    w: 640,
    h: 480,
    flags: SdlkWindow.hidden,
  );
  if (window == nullptr) {
    print(sdlGetError());
    sdlQuit();
    return -1;
  }
  final renderer = window.createRenderer();
  if (renderer == nullptr) {
    print(sdlGetError());
    window.destroy();
    sdlQuit();
    return -1;
  }
  print(
    'GLOVAL =========================================================================',
  );
  printPropertyValues(sdlGetGlobalProperties());
  print(
    'WINDOW =========================================================================',
  );
  printPropertyValues(sdlGetWindowProperties(window));
  print(
    'RENDERER =======================================================================',
  );
  printPropertyValues(sdlGetRendererProperties(renderer));
  print(
    'DISPLAY ========================================================================',
  );
  final displays = sdlxGetDisplays();
  for (final display in displays) {
    printPropertyValues(sdlGetDisplayProperties(display));
  }
  renderer.destroy();
  window.destroy();
  sdlQuit();
  return 0;
}
