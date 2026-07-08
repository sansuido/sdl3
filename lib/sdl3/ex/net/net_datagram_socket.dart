part of '../../sdl_net.dart';

extension NetDatagramSocketPointerEx on Pointer<NetDatagramSocket> {
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
  bool send(Pointer<NetAddress> address, int port, Uint8List buf) =>
      netxSendDatagram(this, address, port, buf);

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
  NetxDatagram? receive({bool refAddress = true}) =>
      netxReceiveDatagram(this, refAddress: refAddress);

  ///
  /// Enable simulated datagram socket failures.
  ///
  /// Often times, testing a networked app on your development machine--which
  /// might have a wired connection to a fast, reliable network service--won't
  /// expose bugs that happen when networks intermittently fail in the real
  /// world, when the wifi is flakey and firewalls get in the way.
  ///
  /// This function allows you to tell the library to pretend that some
  /// percentage of datagram socket data transmission will fail.
  ///
  /// The library will randomly lose packets (both incoming and outgoing) at an
  /// average matching `percent_loss`. Setting this to zero (the default) will
  /// disable the simulation. Setting to 100 means _everything_ fails
  /// unconditionally and no further data will get through. At what percent the
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
  /// extern SDL_DECLSPEC void SDLCALL NET_SimulateDatagramPacketLoss(NET_DatagramSocket *sock, int percent_loss)
  /// ```
  /// {@category net}
  void simulatePacketLoss(int percentLoss) =>
      netSimulateDatagramPacketLoss(this, percentLoss);

  ///
  /// Dispose of a previously-created datagram socket.
  ///
  /// This will _abandon_ any data queued for sending that hasn't made it to the
  /// socket. If you need this data to arrive, you should wait for confirmation
  /// from the remote computer in some form that you devise yourself. Queued data
  /// is not guaranteed to arrive even if the library made efforts to transmit it
  /// here.
  ///
  /// Any data that has arrived from the remote end of the connection that hasn't
  /// been read yet is lost.
  ///
  /// \param sock datagram socket to destroy.
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
  /// extern SDL_DECLSPEC void SDLCALL NET_DestroyDatagramSocket(NET_DatagramSocket *sock)
  /// ```
  /// {@category net}
  void destroy() => netDestroyDatagramSocket(this);
}
