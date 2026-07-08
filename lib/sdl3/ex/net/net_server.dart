part of '../../sdl_net.dart';

extension NetServerPointerEx on Pointer<NetServer> {
  ///
  /// Create a stream socket for the next pending client connection.
  ///
  /// When a client connects to a server, their connection will be pending until
  /// the server _accepts_ the connection. Once accepted, the server will be
  /// given a stream socket to communicate with the client, and they can send
  /// data to, and receive data from, each other.
  ///
  /// Unlike NET_CreateClient, stream sockets returned from this function are
  /// already connected and do not have to wait for the connection to complete,
  /// as server acceptance is the final step of connecting.
  ///
  /// This function does not block. If there are no new connections pending, this
  /// function will return true (for success, but `*client_stream` will be set to
  /// NULL. This is not an error and a common condition the app should expect. In
  /// fact, this function should be called in a loop until this condition occurs,
  /// so all pending connections are accepted in a single batch.
  ///
  /// If you want the server to sleep until there's a new connection, you can use
  /// NET_WaitUntilInputAvailable().
  ///
  /// When done with the newly-accepted client, you can disconnect and dispose of
  /// the stream socket by calling NET_DestroyStreamSocket().
  ///
  /// \param server the server object to check for pending connections.
  /// \param client_stream Will be set to a new stream socket if a connection was
  /// pending, NULL otherwise.
  /// \returns true on success (even if no new connections were pending), false
  /// on error; call SDL_GetError() for details.
  ///
  /// \threadsafety You should not operate on the same server from multiple
  /// threads at the same time without supplying a serialization
  /// mechanism. However, different threads may access different
  /// servers at the same time without problems.
  ///
  /// \since This function is available since SDL_net 3.0.0.
  ///
  /// \sa NET_WaitUntilInputAvailable
  /// \sa NET_DestroyStreamSocket
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL NET_AcceptClient(NET_Server *server, NET_StreamSocket **client_stream)
  /// ```
  /// {@category net}
  Pointer<NetStreamSocket>? acceptClient() => netxAcceptClient(this);

  ///
  /// Dispose of a previously-created server.
  ///
  /// This will immediately disconnect any pending client connections that had
  /// not yet been accepted, but will not disconnect any existing accepted
  /// connections (which can still be used and must be destroyed separately).
  /// Further attempts to make new connections to this server will fail on the
  /// client side.
  ///
  /// \param server server to destroy.
  ///
  /// \threadsafety You should not operate on the same server from multiple
  /// threads at the same time without supplying a serialization
  /// mechanism. However, different threads may access different
  /// servers at the same time without problems.
  ///
  /// \since This function is available since SDL_net 3.0.0.
  ///
  /// \sa NET_CreateServer
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL NET_DestroyServer(NET_Server *server)
  /// ```
  /// {@category net}
  void destroy() => netDestroyServer(this);
}
