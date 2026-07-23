import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:sdl3/sdl3.dart';

Future<int> main() async {
  if (!sdlInit(0)) {
    print('error initializing SDL, ${sdlGetError()}');
    return -1;
  }

  final process = sdlxCreateProcess(['cmd'], pipeStdio: true);
  if (process == nullptr) {
    print('error creating process, ${sdlGetError()}');
    sdlQuit();
    return -1;
  }

  final stdoutStream = process.getOutput();
  final stdinStream = process.getInput();

  Completer<void>? commandCompleter;

  Future<void> startOutputListener() async {
    final buffer = <int>[];

    while (true) {
      final byte = stdoutStream.readUint8();
      if (byte != null) {
        buffer.add(byte);
        continue;
      }

      if (buffer.isNotEmpty) {
        final output = utf8.decode(buffer, allowMalformed: true);
        print(output);
        buffer.clear();

        final trimmed = output.trimRight();
        if (trimmed.endsWith('>')) {
          if (commandCompleter != null && !commandCompleter!.isCompleted) {
            commandCompleter!.complete();
          }
        }
      }

      final status = stdoutStream.getStatus();
      if (status == SDL_IO_STATUS_EOF || status == SDL_IO_STATUS_ERROR) {
        print('EOF?  : ${status == SDL_IO_STATUS_EOF}');
        print('ERROR?: ${status == SDL_IO_STATUS_ERROR}');
        print('\n[Process stream ended or error]');
        break;
      }

      await Future.delayed(const Duration(milliseconds: 10));
    }
  }

  Future<void> sendCommandAndWait(String command) async {
    //print('\n--- sendCommand: `$command` ---');
    commandCompleter = Completer<void>();
    stdinStream
      ..writeString('$command\n')
      ..flush();
    await commandCompleter!.future;
  }

  unawaited(startOutputListener());
  await sendCommandAndWait('');

  sdlSetHint(SDL_HINT_RENDER_VSYNC, '1');
  final window = SdlWindowEx.create(title: 'input demo', w: 640, h: 480);
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
  var running = true;
  while (running) {
    SdlxEvent? event;
    while ((event = sdlxPollEvent()) != null) {
      if (event is SdlxQuitEvent) {
        running = false;
      }
      if (event is SdlxKeyboardEvent && event.type == SdlkEvent.keyDown) {
        switch (event.scancode) {
          case SdlkScancode.escape:
            running = false;
          case SdlkScancode.d:
            await sendCommandAndWait('dir');
          case SdlkScancode.s:
            await sendCommandAndWait('set');
          case SdlkScancode.c:
            await sendCommandAndWait('cd ..');
        }
      }
    }
  }
  process.destroy();
  renderer.destroy();
  window.destroy();
  sdlQuit();
  return 0;
}
