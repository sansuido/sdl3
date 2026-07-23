import 'dart:ffi';
import 'package:sdl3/sdl3.dart';

const int gChunkSize = 1024 * 64;
const gWavesSound =
    'assets/waves-at-baltic-sea-shore/waves-at-baltic-sea-shore.wav';

Future<int> main() async {
  if (!sdlInit(SDL_INIT_VIDEO)) {
    print('Failed to initialize SDL: ${sdlGetError()}');
    return -1;
  }
  final queue = sdlCreateAsyncIoQueue();
  if (queue == nullptr) {
    print('Failed to create async IO queue: ${sdlGetError()}');
    sdlQuit();
    return -1;
  }
  final io = sdlAsyncIoFromFile(gWavesSound, 'r');
  if (io == nullptr) {
    print('Failed to create async IO: ${sdlGetError()}');
    queue.destroy();
    sdlQuit();
    return -1;
  }
  final totalSize = io.getSize();
  var totalRequests = 0;
  var offset = 0;
  final buffer = sdlMalloc(totalSize).cast<Uint8>();
  while (offset < totalSize) {
    final bytesToRead = (offset + gChunkSize <= totalSize)
        ? gChunkSize
        : (totalSize - offset);
    if (io.read(
      (buffer + offset).cast<Void>(),
      offset,
      bytesToRead,
      queue,
      nullptr,
    )) {
      totalRequests++;
    }
    offset += bytesToRead;
  }
  var completedRequests = 0;
  var running = true;
  while (running) {
    final outcome = SdlxAsyncIoOutcome();
    if (queue.getResult(outcome)) {
      if (outcome.result == SdlkAsyncio.complete) {
        completedRequests++;
        print(
          'Request completed: $completedRequests / $totalRequests (outcome.offset: ${outcome.offset})',
        );
        if (completedRequests >= totalRequests) {
          print('All requests completed');
          running = false;
        }
      } else {
        print('Error');
        running = false;
      }
    }
    sdlDelay(1);
  }
  io.close(queue, nullptr);
  queue.destroy();
  sdlQuit();
  return 0;
}
