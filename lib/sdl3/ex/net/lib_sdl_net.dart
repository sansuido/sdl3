part of '../../sdl_net.dart';

///
/// Get the protocol-level bytes of a network address from a resolved address.
///
/// This data is not human-readable, is protocol-specific, and might not even
/// be in a specific byte order.
///
/// This is only useful for possibly hashing, to map a address to a specific
/// player in a game, or possibly for handing to a system-level networking API
/// (which is _not_ recommended; an app does this at their own risk).
///
/// Do not store these bytes for future runs of the program; there is no
/// promise the format won't change.
///
/// On return `*num_bytes` will hold the number of bytes provided with the
/// address. Since the data is not NULL-terminated, this is the only way to
/// determine its size; as such, this parameter must not be NULL.
///
/// Do not free or modify the returned data; it belongs to the NET_Address that
/// was queried, and is valid as long as the object lives. Either make sure the
/// address has a reference as long as you need this or make a copy of the
/// bytes.
///
/// This will return NULL if resolution is still in progress, or if resolution
/// failed. You can use NET_GetAddressStatus() or NET_WaitUntilResolved() to
/// make sure resolution has successfully completed before calling this.
///
/// A human-readable version is available in NET_GetAddressString() and isn't
/// any less efficient to query than the raw bytes.
///
/// \param address The NET_Address to query.
/// \param num_bytes on return, will be set to the number of bytes returned.
/// \returns a pointer to bytes, or NULL on error; call SDL_GetError() for
/// details.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_net 3.0.0.
///
/// \sa NET_GetAddressString
/// \sa NET_GetAddressStatus
/// \sa NET_WaitUntilResolved
///
/// ```c
/// extern SDL_DECLSPEC const void * SDLCALL NET_GetAddressBytes(NET_Address *address, int *num_bytes)
/// ```
/// {@category net}
Uint8List? netxGetAddressBytes(Pointer<NetAddress> address) {
  Uint8List? result;
  var numBytes = 0;
  final numBytesPointer = ffi.calloc<Int32>();
  final bytesPointer = netGetAddressBytes(address, numBytesPointer);
  numBytes = numBytesPointer.value;
  if (bytesPointer != nullptr && numBytes > 0) {
    result = Uint8List.fromList(
      bytesPointer.cast<Uint8>().asTypedList(numBytes),
    );
  }
  numBytesPointer.callocFree();
  return result;
}

///
/// Obtain a list of local addresses on the system.
///
/// This returns addresses that you can theoretically bind a socket to, to
/// accept connections from other machines at that address.
///
/// You almost never need this function; first, it's hard to tell _what_ is a
/// good address to bind to, without asking the user (who will likely find it
/// equally hard to decide). Second, most machines will have lots of _private_
/// addresses that are accessible on the same LAN, but not public ones that are
/// accessible from the outside Internet.
///
/// Usually it's better to use NET_CreateServer() or NET_CreateDatagramSocket()
/// with a NULL address, to say "bind to all interfaces."
///
/// The array of addresses returned from this is guaranteed to be
/// NULL-terminated. You can also pass a pointer to an int, which will return
/// the final count, not counting the NULL at the end of the array.
///
/// Pass the returned array to NET_FreeLocalAddresses when you are done with
/// it. It is safe to keep any addresses you want from this array even after
/// calling that function, as long as you called NET_RefAddress() on them.
///
/// \param num_addresses on exit, will be set to the number of addresses
/// returned. Can be NULL.
/// \returns A NULL-terminated array of NET_Address pointers, one for each
/// bindable address on the system, or NULL on error; call
/// SDL_GetError() for details.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_net 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC NET_Address **SDLCALL NET_GetLocalAddresses(int *num_addresses)
/// ```
/// {@category net}
List<String> netxGetLocalAddresses() {
  final result = <String>[];
  final numAddressesPointer = ffi.calloc<Int32>();
  final addressesPointer = netGetLocalAddresses(numAddressesPointer);
  if (addressesPointer != nullptr) {
    for (var i = 0; i < numAddressesPointer.value; i++) {
      final addressPointer = addressesPointer[i];
      final addressString = netGetAddressString(addressPointer);
      if (addressString != null) {
        result.add(addressString);
      }
    }
    netFreeLocalAddresses(addressesPointer);
  }
  numAddressesPointer.callocFree();
  return result;
}

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
Pointer<NetStreamSocket>? netxAcceptClient(Pointer<NetServer> server) {
  Pointer<NetStreamSocket>? result;
  final clientStreamPointer = ffi.calloc<Pointer<NetStreamSocket>>();
  final bl = netAcceptClient(server, clientStreamPointer);
  if (bl) {
    result = clientStreamPointer.value;
  }
  clientStreamPointer.callocFree();
  return result;
}

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
bool netxWriteToStreamSocket(Pointer<NetStreamSocket> sock, Uint8List buf) {
  if (buf.isEmpty) {
    return false;
  }
  final bufPointer = ffi.calloc<Uint8>(buf.length);
  bufPointer.asTypedList(buf.length).setAll(0, buf);
  final result = netWriteToStreamSocket(
    sock,
    bufPointer.cast<Void>(),
    buf.length,
  );
  bufPointer.callocFree();
  return result;
}

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
Uint8List? netxReadFromStreamSocket(Pointer<NetStreamSocket> sock, int buflen) {
  Uint8List? result;
  final bufPointer = ffi.calloc<Uint8>(buflen);
  final numBytes = netReadFromStreamSocket(
    sock,
    bufPointer.cast<Void>(),
    buflen,
  );
  if (bufPointer != nullptr && numBytes > 0) {
    result = Uint8List.fromList(bufPointer.cast<Uint8>().asTypedList(numBytes));
  }
  bufPointer.callocFree();
  return result;
}

///
/// Send a new packet over a datagram socket to a remote system.
///
/// Datagram sockets send packets of data. They either arrive as complete
/// packets or they don't arrive at all, as opposed to stream sockets, where
/// individual bytes might trickle in as they attempt to reliably deliver a
/// stream of data.
///
/// Datagram packets might arrive in a different order than you sent them, or
/// they may just be lost while travelling across the network. You have to plan
/// for this. As an added confusion, since SDL_net might send the same packet
/// on multiple interfaces, you might get duplicate packets, possibly from
/// different network addresses. You have to plan for this, too.
///
/// You can send to any address and port on the network, but there has to be a
/// datagram socket waiting for the data on the other side for the packet not
/// to be lost.
///
/// General wisdom is that you shouldn't send a packet larger than 1500 bytes
/// over the Internet, as bad routers might fragment or lose larger ones, but
/// this limit is not hardcoded into SDL_net and in good conditions you might
/// be able to send significantly more.
///
/// This call never blocks; if it can't send the data immediately, the library
/// will queue it for later transmission. There is no query to see what is
/// still queued, as datagram transmission is unreliable, so you should never
/// assume anything about queued data.
///
/// If there's a fatal error, this function will return false. Datagram sockets
/// generally won't report failures, because there is no state like a
/// "connection" to fail at this level, but may report failure for
/// unrecoverable system-level conditions; once a datagram socket fails, you
/// should assume it is no longer usable and should destroy it with
/// SDL_DestroyDatagramSocket().
///
/// Sending to a NULL address is treated as a request to broadcast a packet.
/// Note that this will report failure immediately if the socket was not
/// created with broadcast permission. Broadcast packets are (more or less)
/// sent to every machine on the LAN, unconditionally.
///
/// **WARNING**: It is possible to build a game where everyone is playing on
/// the same LAN, and every player is simply broadcasting packets. This is
/// absolutely the wrong thing to do, however. Broadcast packets go to every
/// device on the LAN, whether they want them or not. The game DOOM, in its
/// heyday, was capable of
/// [bringing entire networks to their knees](https://doomwiki.org/wiki/Doom_in_workplaces)
/// , as many players on the same network would all be broadcasting
/// relentlessly.
///
/// In practice, broadcasting sparingly can be useful for certain
/// functionality: a LAN-only client broadcasting a few packets to ask for
/// available servers, and running servers replying directly to that client
/// without broadcasting at all, is reasonable and safe. Once clients and
/// servers have found each other, they can communicate directly without any
/// broadcasting at all. For peer-to-peer games, once connection is
/// established, it's better to either send unique packets to each known
/// player, or use a multicasting (which works like broadcast, but only routes
/// packets to devices that are explicitly listening for it).
///
/// With IPv6, which doesn't support broadcasts, broadcasting is faked with
/// multicast to the all-nodes link-local multicast group, ff02::1, either on a
/// specific interface or letting the OS choose the default. Other protocols
/// might fake broadcast operations in similar ways in the future.
///
/// \param sock the datagram socket to send data through.
/// \param address the NET_Address object address. May be NULL to broadcast.
/// \param port the address port.
/// \param buf a pointer to the data to send as a single packet.
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
/// \sa NET_ReceiveDatagram
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL NET_SendDatagram(NET_DatagramSocket *sock, NET_Address *address, Uint16 port, const void *buf, int buflen)
/// ```
/// {@category net}
bool netxSendDatagram(
  Pointer<NetDatagramSocket> sock,
  Pointer<NetAddress> address,
  int port,
  Uint8List buf,
) {
  if (buf.isEmpty) {
    return false;
  }
  final bufPointer = ffi.calloc<Uint8>(buf.length);
  bufPointer.asTypedList(buf.length).setAll(0, buf);
  final result = netSendDatagram(
    sock,
    address,
    port,
    bufPointer.cast<Void>(),
    buf.length,
  );
  bufPointer.callocFree();
  return result;
}

///
/// Receive a new packet that a remote system sent to a datagram socket.
///
/// Datagram sockets send packets of data. They either arrive as complete
/// packets or they don't arrive at all, so you'll never receive half a packet.
///
/// This call never blocks; if no new data is available at the time of the
/// call, it returns true immediately. The caller can try again later.
///
/// On a successful call to this function, it returns true, even if no new
/// packets are available, so you should check for a successful return and a
/// non-NULL value in `*dgram` to decide if a new packet is available.
///
/// You must pass received packets to NET_DestroyDatagram when you are done
/// with them. If you want to save the sender's address past this time, it is
/// safe to call NET_RefAddress() on the address and hold onto the pointer, so
/// long as you call NET_UnrefAddress() on it when you are done with it.
///
/// Since datagrams can arrive from any address or port on the network without
/// prior warning, this information is available in the NET_Datagram object
/// that is provided by this function, and this is the only way to know who to
/// reply to. Even if you aren't acting as a "server," packets can still arrive
/// at your socket if someone sends one.
///
/// If there's a fatal error, this function will return false. Datagram sockets
/// generally won't report failures, because there is no state like a
/// "connection" to fail at this level, but may report failure for
/// unrecoverable system-level conditions; once a datagram socket fails, you
/// should assume it is no longer usable and should destroy it with
/// SDL_DestroyDatagramSocket().
///
/// \param sock the datagram socket to send data through.
/// \param dgram a pointer to the datagram packet pointer.
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
/// \sa NET_SendDatagram
/// \sa NET_DestroyDatagram
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL NET_ReceiveDatagram(NET_DatagramSocket *sock, NET_Datagram **dgram)
/// ```
/// {@category net}
NetxDatagram? netxReceiveDatagram(
  Pointer<NetDatagramSocket> sock, {
  bool refAddress = true,
}) {
  NetxDatagram? result;
  final dgramPointer = ffi.calloc<Pointer<NetDatagram>>();
  final bl = netReceiveDatagram(sock, dgramPointer);
  if (bl) {
    result = NetxDatagram()
      ..loadFromPointer(dgramPointer.value, refAddress: refAddress);
    netDestroyDatagram(dgramPointer.value);
  }
  dgramPointer.callocFree();
  return result;
}

///
/// Block on multiple sockets until at least one has data available.
///
/// This is a complex function that most apps won't need, but it could be used
/// to implement a more efficient server or i/o thread in some cases.
///
/// This allows you to give it a list of objects and wait for new input to
/// become available on any of them. The calling thread is put to sleep until
/// such a time.
///
/// The following things can be specified in the `vsockets` array, cast to
/// `void *`:
///
/// - NET_Server (reports new input when a connection is ready to be accepted
/// with NET_AcceptClient())
/// - NET_StreamSocket (reports new input when the remote end has sent more
/// bytes of data to be read with NET_ReadFromStreamSocket, or if the socket
/// finished making its initial connection).
/// - NET_DatagramSocket (reports new input when a new packet arrives that can
/// be read with NET_ReceiveDatagram).
///
/// This function takes a timeout value, represented in milliseconds, of how
/// long to wait for resolution to complete. Specifying a timeout of -1
/// instructs the library to wait indefinitely, and a timeout of 0 just checks
/// the current status and returns immediately.
///
/// This returns the number of items that have new input, but it does not tell
/// you which ones; since access to them is non-blocking, you can just try to
/// read from each of them and see which are ready. If nothing is ready and the
/// timeout is reached, this returns zero. On error, this returns -1.
///
/// \param vsockets an array of pointers to various objects that can be waited
/// on, each cast to a void pointer.
/// \param numsockets the number of pointers in the `vsockets` array.
/// \param timeout Number of milliseconds to wait for new input to become
/// available. -1 to wait indefinitely, 0 to check once without
/// waiting.
/// \returns the number of items that have new input, or -1 on error.
///
/// \threadsafety You should not operate on the same socket from multiple
/// threads at the same time without supplying a serialization
/// mechanism. However, different threads may access different
/// sockets at the same time without problems.
///
/// \since This function is available since SDL_net 3.0.0.
///
/// \sa NET_CreateDatagramSocket
/// \sa NET_SendDatagram
/// \sa NET_ReceiveDatagram
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL NET_WaitUntilInputAvailable(void **vsockets, int numsockets, Sint32 timeout)
/// ```
/// {@category net}
int netxWaitUntilInputAvailable(List<Pointer<Void>> vsockets, int timeout) {
  final vsocketsPointer = ffi.calloc<Pointer<Void>>(vsockets.length);
  for (var i = 0; i < vsockets.length; i++) {
    vsocketsPointer[i] = vsockets[i];
  }
  final result = netWaitUntilInputAvailable(
    vsocketsPointer,
    vsockets.length,
    timeout,
  );
  vsocketsPointer.callocFree();
  return result;
}
