import 'dart:ffi';

import 'package:sdl3/sdl3.dart';

void main() {
  final env = sdlGetEnvironment();
  if (env != nullptr) {
    final variables = sdlxGetEnvironmentVariables(env);
    for (final variable in variables) {
      print(variable);
    }
  }
}
