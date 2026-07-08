part of '../../sdl_net.dart';

extension NetStreamSocketPointerEx on Pointer<NetStreamSocket> {
  ///
  /// Block until a stream socket has connected to a server.
  ///
  /// The NET_StreamSocket objects returned by NET_CreateClient take time to do
  /// their work, so it does so _asynchronously_ instead of making your program
  /// wait an indefinite amount of time.
  ///
  /// However, if you want your program to sleep until the connection is
  /// complete, you can call this function.
  ///
  /// This function takes a timeout value, represented in milliseconds, of how
  /// long to wait for resolution to complete. Specifying a timeout of -1
  /// instructs the library to wait indefinitely, and a timeout of 0 just checks
  /// the current status and returns immediately (and is functionally equivalent
  /// to calling NET_GetConnectionStatus).
  ///
  /// Connections can fail after some time (server took awhile to respond at all,
  /// and then refused the connection outright), so be sure to check the result
  /// of this function instead of assuming it worked!
  ///
  /// Once a connection is successfully made, the socket may read data from, or
  /// write data to, the connected server.
  ///
  /// If you don't want your program to block, you can call
  /// NET_GetConnectionStatus() from time to time until you get a non-zero
  /// result.
  ///
  /// \param sock The NET_StreamSocket object to wait on.
  /// \param timeout Number of milliseconds to wait for resolution to complete.
  /// -1 to wait indefinitely, 0 to check once without waiting.
  /// \returns NET_SUCCESS if successfully connected, NET_FAILURE if connection
  /// failed, NET_WAITING if still connecting (this function timed out
  /// without resolution); if NET_FAILURE, call SDL_GetError() for
  /// details.
  ///
  /// \threadsafety You should not operate on the same socket from multiple
  /// threads at the same time without supplying a serialization
  /// mechanism. However, different threads may access different
  /// socket at the same time without problems.
  ///
  /// \since This function is available since SDL_net 3.0.0.
  ///
  /// \sa NET_GetConnectionStatus
  ///
  /// ```c
  /// extern SDL_DECLSPEC NET_Status SDLCALL NET_WaitUntilConnected(NET_StreamSocket *sock, Sint32 timeout)
  /// ```
  /// {@category net}
  int waitUntilConnected(int timeout) => netWaitUntilConnected(this, timeout);

  ///
  /// Get the remote address of a stream socket.
  ///
  /// This reports the address of the remote side of a stream socket, which might
  /// still be pending connnection.
  ///
  /// This adds a reference to the address; the caller _must_ call
  /// NET_UnrefAddress() when done with it.
  ///
  /// \param sock the stream socket to query.
  /// \returns the socket's remote address, or NULL on error; call SDL_GetError()
  /// for details.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_net 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC NET_Address * SDLCALL NET_GetStreamSocketAddress(NET_StreamSocket *sock)
  /// ```
  /// {@category net}
  Pointer<NetAddress> getAddress() => netGetStreamSocketAddress(this);

  ///
  /// Check if a stream socket is connected, without blocking.
  ///
  /// The NET_StreamSocket objects returned by NET_CreateClient take time to do
  /// negotiate a connection to a server, so it does so _asynchronously_ instead
  /// of making your program wait an indefinite amount of time.
  ///
  /// This function allows you to check the progress of that work without
  /// blocking.
  ///
  /// Connection can fail after some time (server took a while to respond, and
  /// then rejected the connection), so be sure to check the result of this
  /// function instead of assuming it worked because it's non-zero!
  ///
  /// Once a connection is successfully made, the stream socket can be used to
  /// send and receive data with the server.
  ///
  /// Note that if the connection succeeds, but later the connection is dropped,
  /// this will still report the connection as successful, as it only deals with
  /// the initial asynchronous work of getting connected; you'll know the
  /// connection dropped later when your reads and writes report failures.
  ///
  /// \param sock the stream socket to query.
  /// \returns NET_SUCCESS if successfully connected, NET_FAILURE if connection
  /// failed, NET_WAITING if still connecting; if NET_FAILURE, call
  /// SDL_GetError() for details.
  ///
  /// \threadsafety You should not operate on the same socket from multiple
  /// threads at the same time without supplying a serialization
  /// mechanism. However, different threads may access different
  /// sockets at the same time without problems.
  ///
  /// \since This function is available since SDL_net 3.0.0.
  ///
  /// \sa NET_WaitUntilConnected
  ///
  /// ```c
  /// extern SDL_DECLSPEC NET_Status SDLCALL NET_GetConnectionStatus(NET_StreamSocket *sock)
  /// ```
  /// {@category net}
  int getConnectionStatus() => netGetConnectionStatus(this);

  ///
  /// Send bytes over a stream socket to a remote system.
  ///
  /// Stream sockets are _reliable_, which means data sent over them will arrive
  /// in the order it was transmitted, and the system will retransmit data as
  /// necessary to ensure its delivery. Which is to say, short of catastrophic
  /// failure, data will arrive, possibly with severe delays. Also, "catastrophic
  /// failure" isn't an uncommon event.
  ///
  /// (This is opposed to Datagram sockets, which send chunks of data that might
  /// arrive in any order, or not arrive at all, but you never wait for missing
  /// chunks to show up.)
  ///
  /// Stream sockets are _bidirectional_; you can read and write from the same
  /// stream, and the other end of the connection can, too.
  ///
  /// This call never blocks; if it can't send the data immediately, the library
  /// will queue it for later transmission. You can use
  /// NET_GetStreamSocketPendingWrites() to see how much is still queued for
  /// later transmission, or NET_WaitUntilStreamSocketDrained() to block until
  /// all pending data has been sent.
  ///
  /// If the connection has failed (remote side dropped us, or one of a million
  /// other networking failures occurred), this function will report failure by
  /// returning false. Stream sockets only report failure for unrecoverable
  /// conditions; once a stream socket fails, you should assume it is no longer
  /// usable and should destroy it with NET_DestroyStreamSocket().
  ///
  /// \param sock the stream socket to send data through.
  /// \param buf a pointer to the data to send.
  /// \param buflen the size of the data to send, in bytes.
  /// \returns true if data sent or queued for transmission, false on failure;
  /// call SDL_GetError() for details.
  ///
  /// \threadsafety You should not operate on the same socket from multiple
  /// threads at the same time without supplying a serialization
  /// mechanism. However, different threads may access different
  /// sockets at the same time without problems.
  ///
  /// \since This function is available since SDL_net 3.0.0.
  ///
  /// \sa NET_GetStreamSocketPendingWrites
  /// \sa NET_WaitUntilStreamSocketDrained
  /// \sa NET_ReadFromStreamSocket
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL NET_WriteToStreamSocket(NET_StreamSocket *sock, const void *buf, int buflen)
  /// ```
  /// {@category net}
  bool write(Uint8List buf) => netxWriteToStreamSocket(this, buf);

  ///
  /// Query bytes still pending transmission on a stream socket.
  ///
  /// If NET_WriteToStreamSocket() couldn't send all its data immediately, it
  /// will queue it to be sent later. This function lets the app see how much of
  /// that queue is still pending to be sent.
  ///
  /// The library will try to send more queued data before reporting what's left,
  /// but it will not block to do so.
  ///
  /// If the connection has failed (remote side dropped us, or one of a million
  /// other networking failures occurred), this function will report failure by
  /// returning -1. Stream sockets only report failure for unrecoverable
  /// conditions; once a stream socket fails, you should assume it is no longer
  /// usable and should destroy it with NET_DestroyStreamSocket().
  ///
  /// \param sock the stream socket to query.
  /// \returns number of bytes still pending transmission, -1 on failure; call
  /// SDL_GetError() for details.
  ///
  /// \threadsafety You should not operate on the same socket from multiple
  /// threads at the same time without supplying a serialization
  /// mechanism. However, different threads may access different
  /// sockets at the same time without problems.
  ///
  /// \since This function is available since SDL_net 3.0.0.
  ///
  /// \sa NET_WriteToStreamSocket
  /// \sa NET_WaitUntilStreamSocketDrained
  ///
  /// ```c
  /// extern SDL_DECLSPEC int SDLCALL NET_GetStreamSocketPendingWrites(NET_StreamSocket *sock)
  /// ```
  /// {@category net}
  int getPendingWrites() => netGetStreamSocketPendingWrites(this);

  ///
  /// Block until all of a stream socket's pending data is sent.
  ///
  /// If NET_WriteToStreamSocket() couldn't send all its data immediately, it
  /// will queue it to be sent later. This function lets the app sleep until all
  /// the data is transmitted.
  ///
  /// This function takes a timeout value, represented in milliseconds, of how
  /// long to wait for transmission to complete. Specifying a timeout of -1
  /// instructs the library to wait indefinitely, and a timeout of 0 just checks
  /// the current status and returns immediately (and is functionally equivalent
  /// to calling NET_GetStreamSocketPendingWrites).
  ///
  /// If you don't want your program to block, you can call
  /// NET_GetStreamSocketPendingWrites from time to time until you get a result
  /// <= 0.
  ///
  /// If the connection has failed (remote side dropped us, or one of a million
  /// other networking failures occurred), this function will report failure by
  /// returning -1. Stream sockets only report failure for unrecoverable
  /// conditions; once a stream socket fails, you should assume it is no longer
  /// usable and should destroy it with NET_DestroyStreamSocket().
  ///
  /// \param sock the stream socket to wait on.
  /// \param timeout Number of milliseconds to wait for draining to complete. -1
  /// to wait indefinitely, 0 to check once without waiting.
  /// \returns number of bytes still pending transmission, -1 on failure; call
  /// SDL_GetError() for details.
  ///
  /// \threadsafety You should not operate on the same socket from multiple
  /// threads at the same time without supplying a serialization
  /// mechanism. However, different threads may access different
  /// sockets at the same time without problems.
  ///
  /// \since This function is available since SDL_net 3.0.0.
  ///
  /// \sa NET_WriteToStreamSocket
  /// \sa NET_GetStreamSocketPendingWrites
  ///
  /// ```c
  /// extern SDL_DECLSPEC int SDLCALL NET_WaitUntilStreamSocketDrained(NET_StreamSocket *sock, Sint32 timeout)
  /// ```
  /// {@category net}
  int waitUntilDrained(int timeout) =>
      netWaitUntilStreamSocketDrained(this, timeout);

  ///
  /// Receive bytes that a remote system sent to a stream socket.
  ///
  /// Stream sockets are _reliable_, which means data sent over them will arrive
  /// in the order it was transmitted, and the system will retransmit data as
  /// necessary to ensure its delivery. Which is to say, short of catastrophic
  /// failure, data will arrive, possibly with severe delays. Also, "catastrophic
  /// failure" isn't an uncommon event.
  ///
  /// (This is opposed to Datagram sockets, which send chunks of data that might
  /// arrive in any order, or not arrive at all, but you never wait for missing
  /// chunks to show up.)
  ///
  /// Stream sockets are _bidirectional_; you can read and write from the same
  /// stream, and the other end of the connection can, too.
  ///
  /// This function returns data that has arrived for the stream socket that
  /// hasn't been read yet. Data is provided in the order it was sent on the
  /// remote side. This function may return less data than requested, depending
  /// on what is available at the time, and also the app isn't required to read
  /// all available data at once.
  ///
  /// This call never blocks; if no new data is available at the time of the
  /// call, it returns 0 immediately. The caller can try again later.
  ///
  /// If the connection has failed (remote side dropped us, or one of a million
  /// other networking failures occurred), this function will report failure by
  /// returning -1. Stream sockets only report failure for unrecoverable
  /// conditions; once a stream socket fails, you should assume it is no longer
  /// usable and should destroy it with NET_DestroyStreamSocket().
  ///
  /// \param sock the stream socket to receive data from.
  /// \param buf a pointer to a buffer where received data will be collected.
  /// \param buflen the size of the buffer pointed to by `buf`, in bytes. This is
  /// the maximum that will be read from the stream socket.
  /// \returns number of bytes read from the stream socket (which can be less
  /// than `buflen` or zero if none available), -1 on failure; call
  /// SDL_GetError() for details.
  ///
  /// \threadsafety You should not operate on the same socket from multiple
  /// threads at the same time without supplying a serialization
  /// mechanism. However, different threads may access different
  /// sockets at the same time without problems.
  ///
  /// \since This function is available since SDL_net 3.0.0.
  ///
  /// \sa NET_WriteToStreamSocket
  ///
  /// ```c
  /// extern SDL_DECLSPEC int SDLCALL NET_ReadFromStreamSocket(NET_StreamSocket *sock, void *buf, int buflen)
  /// ```
  /// {@category net}
  Uint8List? read(int buflen) => netxReadFromStreamSocket(this, buflen);

  ///
  /// Enable simulated stream socket failures.
  ///
  /// Often times, testing a networked app on your development machine--which
  /// might have a wired connection to a fast, reliable network service--won't
  /// expose bugs that happen when networks intermittently fail in the real
  /// world, when the wifi is flakey and firewalls get in the way.
  ///
  /// This function allows you to tell the library to pretend that some
  /// percentage of stream socket data transmission will fail.
  ///
  /// Since stream sockets are reliable, failure in this case pretends that
  /// packets are getting lost on the network, making the stream retransmit to
  /// deal with it. To simulate this, the library will introduce some amount of
  /// delay before it sends or receives data on the socket. The higher the
  /// percentage, the more delay is introduced for bytes to make their way to
  /// their final destination. The library may also decide to drop connections at
  /// random, to simulate disasterous network conditions.
  ///
  /// Setting this to zero (the default) will disable the simulation. Setting to
  /// 100 means _everything_ fails unconditionally and no further data will get
  /// through (and perhaps your sockets eventually fail). At what percent the
  /// system merely borders on unusable is left as an exercise to the app
  /// developer.
  ///
  /// This is intended for debugging purposes, to simulate real-world conditions
  /// that are various degrees of terrible. You probably should _not_ call this
  /// in production code, where you'll likely see real failures anyhow.
  ///
  /// \param sock The socket to set a failure rate on.
  /// \param percent_loss A number between 0 and 100. Higher means more failures.
  /// Zero to disable.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_net 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL NET_SimulateStreamPacketLoss(NET_StreamSocket *sock, int percent_loss)
  /// ```
  /// {@category net}
  void simulatePacketLoss(int percentLoss) =>
      netSimulateStreamPacketLoss(this, percentLoss);
}
