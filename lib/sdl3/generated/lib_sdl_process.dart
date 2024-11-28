// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

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
/// \since This function is available since SDL 3.1.3.
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
/// extern SDL_DECLSPEC SDL_Process *SDLCALL SDL_CreateProcess(const char * const *args, bool pipe_stdio)
/// ```
Pointer<SdlProcess> sdlCreateProcess(
    Pointer<Pointer<Int8>> args, bool pipeStdio) {
  final sdlCreateProcessLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlProcess> Function(
          Pointer<Pointer<Int8>> args, Uint8 pipeStdio),
      Pointer<SdlProcess> Function(
          Pointer<Pointer<Int8>> args, int pipeStdio)>('SDL_CreateProcess');
  return sdlCreateProcessLookupFunction(args, pipeStdio ? 1 : 0);
}

///
/// Create a new process with the specified properties.
///
/// These are the supported properties:
///
/// - `SDL_PROP_PROCESS_CREATE_ARGS_POINTER`: an array of strings containing
/// the program to run, any arguments, and a NULL pointer, e.g. const char
/// *args[] = { "myprogram", "argument", NULL }. This is a required property.
/// - `SDL_PROP_PROCESS_CREATE_ENVIRONMENT_POINTER`: an SDL_Environment
/// pointer. If this property is set, it will be the entire environment for
/// the process, otherwise the current environment is used.
/// - `SDL_PROP_PROCESS_CREATE_STDIN_NUMBER`: an SDL_ProcessIO value describing
/// where standard input for the process comes from, defaults to
/// `SDL_PROCESS_STDIO_NULL`.
/// - `SDL_PROP_PROCESS_CREATE_STDIN_POINTER`: an SDL_IOStream pointer used for
/// standard input when `SDL_PROP_PROCESS_CREATE_STDIN_NUMBER` is set to
/// `SDL_PROCESS_STDIO_REDIRECT`.
/// - `SDL_PROP_PROCESS_CREATE_STDOUT_NUMBER`: an SDL_ProcessIO value
/// describing where standard output for the process goes go, defaults to
/// `SDL_PROCESS_STDIO_INHERITED`.
/// - `SDL_PROP_PROCESS_CREATE_STDOUT_POINTER`: an SDL_IOStream pointer used
/// for standard output when `SDL_PROP_PROCESS_CREATE_STDOUT_NUMBER` is set
/// to `SDL_PROCESS_STDIO_REDIRECT`.
/// - `SDL_PROP_PROCESS_CREATE_STDERR_NUMBER`: an SDL_ProcessIO value
/// describing where standard error for the process goes go, defaults to
/// `SDL_PROCESS_STDIO_INHERITED`.
/// - `SDL_PROP_PROCESS_CREATE_STDERR_POINTER`: an SDL_IOStream pointer used
/// for standard error when `SDL_PROP_PROCESS_CREATE_STDERR_NUMBER` is set to
/// `SDL_PROCESS_STDIO_REDIRECT`.
/// - `SDL_PROP_PROCESS_CREATE_STDERR_TO_STDOUT_BOOLEAN`: true if the error
/// output of the process should be redirected into the standard output of
/// the process. This property has no effect if
/// `SDL_PROP_PROCESS_CREATE_STDERR_NUMBER` is set.
/// - `SDL_PROP_PROCESS_CREATE_BACKGROUND_BOOLEAN`: true if the process should
/// run in the background. In this case the default input and output is
/// `SDL_PROCESS_STDIO_NULL` and the exitcode of the process is not
/// available, and will always be 0.
///
/// On POSIX platforms, wait() and waitpid(-1, ...) should not be called, and
/// SIGCHLD should not be ignored or handled because those would prevent SDL
/// from properly tracking the lifetime of the underlying process. You should
/// use SDL_WaitProcess() instead.
///
/// \param props the properties to use.
/// \returns the newly created and running process, or NULL if the process
/// couldn't be created.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_CreateProcess
/// \sa SDL_GetProcessProperties
/// \sa SDL_ReadProcess
/// \sa SDL_GetProcessInput
/// \sa SDL_GetProcessOutput
/// \sa SDL_KillProcess
/// \sa SDL_WaitProcess
/// \sa SDL_DestroyProcess
///
/// ```c
/// extern SDL_DECLSPEC SDL_Process *SDLCALL SDL_CreateProcessWithProperties(SDL_PropertiesID props)
/// ```
Pointer<SdlProcess> sdlCreateProcessWithProperties(int props) {
  final sdlCreateProcessWithPropertiesLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlProcess> Function(Uint32 props),
      Pointer<SdlProcess> Function(
          int props)>('SDL_CreateProcessWithProperties');
  return sdlCreateProcessWithPropertiesLookupFunction(props);
}

///
/// Get the properties associated with a process.
///
/// The following read-only properties are provided by SDL:
///
/// - `SDL_PROP_PROCESS_PID_NUMBER`: the process ID of the process.
/// - `SDL_PROP_PROCESS_STDIN_POINTER`: an SDL_IOStream that can be used to
/// write input to the process, if it was created with
/// `SDL_PROP_PROCESS_CREATE_STDIN_NUMBER` set to `SDL_PROCESS_STDIO_APP`.
/// - `SDL_PROP_PROCESS_STDOUT_POINTER`: a non-blocking SDL_IOStream that can
/// be used to read output from the process, if it was created with
/// `SDL_PROP_PROCESS_CREATE_STDOUT_NUMBER` set to `SDL_PROCESS_STDIO_APP`.
/// - `SDL_PROP_PROCESS_STDERR_POINTER`: a non-blocking SDL_IOStream that can
/// be used to read error output from the process, if it was created with
/// `SDL_PROP_PROCESS_CREATE_STDERR_NUMBER` set to `SDL_PROCESS_STDIO_APP`.
/// - `SDL_PROP_PROCESS_BACKGROUND_BOOLEAN`: true if the process is running in
/// the background.
///
/// \param process the process to query.
/// \returns a valid property ID on success or 0 on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_CreateProcess
/// \sa SDL_CreateProcessWithProperties
///
/// ```c
/// extern SDL_DECLSPEC SDL_PropertiesID SDLCALL SDL_GetProcessProperties(SDL_Process *process)
/// ```
int sdlGetProcessProperties(Pointer<SdlProcess> process) {
  final sdlGetProcessPropertiesLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<SdlProcess> process),
      int Function(Pointer<SdlProcess> process)>('SDL_GetProcessProperties');
  return sdlGetProcessPropertiesLookupFunction(process);
}

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
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_CreateProcess
/// \sa SDL_CreateProcessWithProperties
/// \sa SDL_DestroyProcess
///
/// ```c
/// extern SDL_DECLSPEC void * SDLCALL SDL_ReadProcess(SDL_Process *process, size_t *datasize, int *exitcode)
/// ```
Pointer<NativeType> sdlReadProcess(Pointer<SdlProcess> process,
    Pointer<Uint32> datasize, Pointer<Int32> exitcode) {
  final sdlReadProcessLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(Pointer<SdlProcess> process,
          Pointer<Uint32> datasize, Pointer<Int32> exitcode),
      Pointer<NativeType> Function(
          Pointer<SdlProcess> process,
          Pointer<Uint32> datasize,
          Pointer<Int32> exitcode)>('SDL_ReadProcess');
  return sdlReadProcessLookupFunction(process, datasize, exitcode);
}

///
/// Get the SDL_IOStream associated with process standard input.
///
/// The process must have been created with SDL_CreateProcess() and pipe_stdio
/// set to true, or with SDL_CreateProcessWithProperties() and
/// `SDL_PROP_PROCESS_CREATE_STDIN_NUMBER` set to `SDL_PROCESS_STDIO_APP`.
///
/// Writing to this stream can return less data than expected if the process
/// hasn't read its input. It may be blocked waiting for its output to be read,
/// if so you may need to call SDL_GetProcessOutput() and read the output in
/// parallel with writing input.
///
/// \param process The process to get the input stream for.
/// \returns the input stream or NULL on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_CreateProcess
/// \sa SDL_CreateProcessWithProperties
/// \sa SDL_GetProcessOutput
///
/// ```c
/// extern SDL_DECLSPEC SDL_IOStream *SDLCALL SDL_GetProcessInput(SDL_Process *process)
/// ```
Pointer<SdlIoStream> sdlGetProcessInput(Pointer<SdlProcess> process) {
  final sdlGetProcessInputLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlIoStream> Function(Pointer<SdlProcess> process),
      Pointer<SdlIoStream> Function(
          Pointer<SdlProcess> process)>('SDL_GetProcessInput');
  return sdlGetProcessInputLookupFunction(process);
}

///
/// Get the SDL_IOStream associated with process standard output.
///
/// The process must have been created with SDL_CreateProcess() and pipe_stdio
/// set to true, or with SDL_CreateProcessWithProperties() and
/// `SDL_PROP_PROCESS_CREATE_STDOUT_NUMBER` set to `SDL_PROCESS_STDIO_APP`.
///
/// Reading from this stream can return 0 with SDL_GetIOStatus() returning
/// SDL_IO_STATUS_NOT_READY if no output is available yet.
///
/// \param process The process to get the output stream for.
/// \returns the output stream or NULL on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_CreateProcess
/// \sa SDL_CreateProcessWithProperties
/// \sa SDL_GetProcessInput
///
/// ```c
/// extern SDL_DECLSPEC SDL_IOStream *SDLCALL SDL_GetProcessOutput(SDL_Process *process)
/// ```
Pointer<SdlIoStream> sdlGetProcessOutput(Pointer<SdlProcess> process) {
  final sdlGetProcessOutputLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlIoStream> Function(Pointer<SdlProcess> process),
      Pointer<SdlIoStream> Function(
          Pointer<SdlProcess> process)>('SDL_GetProcessOutput');
  return sdlGetProcessOutputLookupFunction(process);
}

///
/// Stop a process.
///
/// \param process The process to stop.
/// \param force true to terminate the process immediately, false to try to
/// stop the process gracefully. In general you should try to stop
/// the process gracefully first as terminating a process may
/// leave it with half-written data or in some other unstable
/// state.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_CreateProcess
/// \sa SDL_CreateProcessWithProperties
/// \sa SDL_WaitProcess
/// \sa SDL_DestroyProcess
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_KillProcess(SDL_Process *process, bool force)
/// ```
bool sdlKillProcess(Pointer<SdlProcess> process, bool force) {
  final sdlKillProcessLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlProcess> process, Uint8 force),
      int Function(Pointer<SdlProcess> process, int force)>('SDL_KillProcess');
  return sdlKillProcessLookupFunction(process, force ? 1 : 0) == 1;
}

///
/// Wait for a process to finish.
///
/// This can be called multiple times to get the status of a process.
///
/// The exit code will be the exit code of the process if it terminates
/// normally, a negative signal if it terminated due to a signal, or -255
/// otherwise. It will not be changed if the process is still running.
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
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_CreateProcess
/// \sa SDL_CreateProcessWithProperties
/// \sa SDL_KillProcess
/// \sa SDL_DestroyProcess
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_WaitProcess(SDL_Process *process, bool block, int *exitcode)
/// ```
bool sdlWaitProcess(
    Pointer<SdlProcess> process, bool block, Pointer<Int32> exitcode) {
  final sdlWaitProcessLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(
          Pointer<SdlProcess> process, Uint8 block, Pointer<Int32> exitcode),
      int Function(Pointer<SdlProcess> process, int block,
          Pointer<Int32> exitcode)>('SDL_WaitProcess');
  return sdlWaitProcessLookupFunction(process, block ? 1 : 0, exitcode) == 1;
}

///
/// Destroy a previously created process object.
///
/// Note that this does not stop the process, just destroys the SDL object used
/// to track it. If you want to stop the process you should use
/// SDL_KillProcess().
///
/// \param process The process object to destroy.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_CreateProcess
/// \sa SDL_CreateProcessWithProperties
/// \sa SDL_KillProcess
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_DestroyProcess(SDL_Process *process)
/// ```
void sdlDestroyProcess(Pointer<SdlProcess> process) {
  final sdlDestroyProcessLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlProcess> process),
      void Function(Pointer<SdlProcess> process)>('SDL_DestroyProcess');
  return sdlDestroyProcessLookupFunction(process);
}
