part of '../sdl_process.dart';

///
/// Create a new process.
///
/// The path to the executable is supplied in args[0]. args[1..N] are
/// additional arguments passed on the command line of the new process, and the
/// argument list should be terminated with a NULL, e.g.:
///
/// ```c
/// const char *args[] = { "myprogram", "argument", NULL };
/// ```
///
/// Setting pipe_stdio to true is equivalent to setting
/// `SDL_PROP_PROCESS_CREATE_STDIN_NUMBER` and
/// `SDL_PROP_PROCESS_CREATE_STDOUT_NUMBER` to `SDL_PROCESS_STDIO_APP`, and
/// will allow the use of SDL_ReadProcess() or SDL_GetProcessInput() and
/// SDL_GetProcessOutput().
///
/// See SDL_CreateProcessWithProperties() for more details.
///
/// \param args the path and arguments for the new process.
/// \param pipe_stdio true to create pipes to the process's standard input and
/// from the process's standard output, false for the process
/// to have no input and inherit the application's standard
/// output.
/// \returns the newly created and running process, or NULL if the process
/// couldn't be created.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CreateProcessWithProperties
/// \sa SDL_GetProcessProperties
/// \sa SDL_ReadProcess
/// \sa SDL_GetProcessInput
/// \sa SDL_GetProcessOutput
/// \sa SDL_KillProcess
/// \sa SDL_WaitProcess
/// \sa SDL_DestroyProcess
///
/// ```c
/// extern SDL_DECLSPEC SDL_Process * SDLCALL SDL_CreateProcess(const char * const *args, bool pipe_stdio)
/// ```
///
/// See also:
/// - [SDL_CreateProcess - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_CreateProcess)
///
/// {@category process}
Pointer<SdlProcess> sdlxCreateProcess(
  List<String> args, {
  bool pipeStdio = false,
}) => ffi.using((arena) {
  final count = args.length;
  final argsPointer = arena<Pointer<Int8>>(count + 1);

  for (var i = 0; i < count; i++) {
    argsPointer[i] = args[i].toNativeUtf8(allocator: arena).cast<Int8>();
  }
  argsPointer[count] = nullptr;

  return sdlCreateProcess(argsPointer, pipeStdio);
});

///
/// Read all the output from a process.
///
/// If a process was created with I/O enabled, you can use this function to
/// read the output. This function blocks until the process is complete,
/// capturing all output, and providing the process exit code.
///
/// The data is allocated with a zero byte at the end (null terminated) for
/// convenience. This extra byte is not included in the value reported via
/// `datasize`.
///
/// The data should be freed with SDL_free().
///
/// \param process The process to read.
/// \param datasize a pointer filled in with the number of bytes read, may be
/// NULL.
/// \param exitcode a pointer filled in with the process exit code if the
/// process has exited, may be NULL.
/// \returns the data or NULL on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CreateProcess
/// \sa SDL_CreateProcessWithProperties
/// \sa SDL_DestroyProcess
///
/// ```c
/// extern SDL_DECLSPEC void * SDLCALL SDL_ReadProcess(SDL_Process *process, size_t *datasize, int *exitcode)
/// ```
///
/// See also:
/// - [SDL_ReadProcess - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_ReadProcess)
///
/// {@category process}
({Uint8List data, int datasize, int exitcode})? sdlxReadProcess(
  Pointer<SdlProcess> process,
) => ffi.using((arena) {
  final datasizePointer = arena<Size>();
  final exitcodePointer = arena<Int32>();

  final dataPointer = sdlReadProcess(process, datasizePointer, exitcodePointer);

  final exitcode = exitcodePointer.value;
  final datasize = datasizePointer.value;

  if (dataPointer == nullptr) {
    return null;
  }

  final data = Uint8List.fromList(
    dataPointer.cast<Uint8>().asTypedList(datasize),
  );
  sdlFree(dataPointer.cast<Void>());

  return (data: data, datasize: datasize, exitcode: exitcode);
});

///
/// Wait for a process to finish.
///
/// This can be called multiple times to get the status of a process.
///
/// The exit code will be the exit code of the process if it terminates
/// normally, a negative signal if it terminated due to a signal, or -255
/// otherwise. It will not be changed if the process is still running.
///
/// If you create a process with standard output piped to the application
/// (`pipe_stdio` being true) then you should read all of the process output
/// before calling SDL_WaitProcess(). If you don't do this the process might be
/// blocked indefinitely waiting for output to be read and SDL_WaitProcess()
/// will never return true;
///
/// \param process The process to wait for.
/// \param block If true, block until the process finishes; otherwise, report
/// on the process' status.
/// \param exitcode a pointer filled in with the process exit code if the
/// process has exited, may be NULL.
/// \returns true if the process exited, false otherwise.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CreateProcess
/// \sa SDL_CreateProcessWithProperties
/// \sa SDL_KillProcess
/// \sa SDL_DestroyProcess
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_WaitProcess(SDL_Process *process, bool block, int *exitcode)
/// ```
///
/// See also:
/// - [SDL_WaitProcess - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_WaitProcess)
///
/// {@category process}
int? sdlxWaitProcess(Pointer<SdlProcess> process, {bool block = false}) =>
    ffi.using((arena) {
      final exitcodePointer = arena<Int32>();

      if (!sdlWaitProcess(process, block, exitcodePointer)) {
        return null;
      }

      return exitcodePointer.value;
    });
