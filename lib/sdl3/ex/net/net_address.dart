part of '../../sdl_net.dart';

extension NetAddressPointerEx on Pointer<NetAddress> {
  ///
  /// Block until an address is resolved.
  ///
  /// The NET_Address objects returned by NET_ResolveHostname take time to do
  /// their work, so it does so _asynchronously_ instead of making your program
  /// wait an indefinite amount of time.
  ///
  /// However, if you want your program to sleep until the address resolution is
  /// complete, you can call this function.
  ///
  /// This function takes a timeout value, represented in milliseconds, of how
  /// long to wait for resolution to complete. Specifying a timeout of -1
  /// instructs the library to wait indefinitely, and a timeout of 0 just checks
  /// the current status and returns immediately (and is functionally equivalent
  /// to calling NET_GetAddressStatus).
  ///
  /// Resolution can fail after some time (DNS server took awhile to reply that
  /// the hostname isn't recognized, etc), so be sure to check the result of this
  /// function instead of assuming it worked!
  ///
  /// Once an address is successfully resolved, it can be used to connect to the
  /// host represented by the address.
  ///
  /// If you don't want your program to block, you can call NET_GetAddressStatus
  /// from time to time until you get a non-zero result.
  ///
  /// \param address The NET_Address object to wait on.
  /// \param timeout Number of milliseconds to wait for resolution to complete.
  /// -1 to wait indefinitely, 0 to check once without waiting.
  /// \returns NET_SUCCESS if successfully resolved, NET_FAILURE if resolution
  /// failed, NET_WAITING if still resolving (this function timed out
  /// without resolution); if NET_FAILURE, call SDL_GetError() for
  /// details.
  ///
  /// \threadsafety It is safe to call this function from any thread, and several
  /// threads can block on the same address simultaneously.
  ///
  /// \since This function is available since SDL_net 3.0.0.
  ///
  /// \sa NET_GetAddressStatus
  ///
  /// ```c
  /// extern SDL_DECLSPEC NET_Status SDLCALL NET_WaitUntilResolved(NET_Address *address, Sint32 timeout)
  /// ```
  /// {@category net}
  int waitUntilResolved(int timeout) => netWaitUntilResolved(this, timeout);

  ///
  /// Check if an address is resolved, without blocking.
  ///
  /// The NET_Address objects returned by NET_ResolveHostname take time to do
  /// their work, so it does so _asynchronously_ instead of making your program
  /// wait an indefinite amount of time.
  ///
  /// This function allows you to check the progress of that work without
  /// blocking.
  ///
  /// Resolution can fail after some time (DNS server took awhile to reply that
  /// the hostname isn't recognized, etc), so be sure to check the result of this
  /// function instead of assuming it worked because it's non-zero!
  ///
  /// Once an address is successfully resolved, it can be used to connect to the
  /// host represented by the address.
  ///
  /// \param address The NET_Address to query.
  /// \returns NET_SUCCESS if successfully resolved, NET_FAILURE if resolution
  /// failed, NET_WAITING if still resolving (this function timed out
  /// without resolution); if NET_FAILURE, call SDL_GetError() for
  /// details.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_net 3.0.0.
  ///
  /// \sa NET_WaitUntilResolved
  ///
  /// ```c
  /// extern SDL_DECLSPEC NET_Status SDLCALL NET_GetAddressStatus(NET_Address *address)
  /// ```
  /// {@category net}
  int getStatus() => netGetAddressStatus(this);

  ///
  /// Get a human-readable string from a resolved address.
  ///
  /// This returns a string that's "human-readable", in that it's probably a
  /// string of numbers and symbols, like "159.203.69.7" or
  /// "2604:a880:800:a1::71f:3001". It won't be the original hostname (like
  /// "icculus.org"), but it's suitable for writing to a log file, etc.
  ///
  /// Do not free or modify the returned string; it belongs to the NET_Address
  /// that was queried, and is valid as long as the object lives. Either make
  /// sure the address has a reference as long as you need this or make a copy of
  /// the string.
  ///
  /// This will return NULL if resolution is still in progress, or if resolution
  /// failed. You can use NET_GetAddressStatus() or NET_WaitUntilResolved() to
  /// make sure resolution has successfully completed before calling this.
  ///
  /// \param address The NET_Address to query.
  /// \returns a string, or NULL on error; call SDL_GetError() for details.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_net 3.0.0.
  ///
  /// \sa NET_GetAddressStatus
  /// \sa NET_WaitUntilResolved
  ///
  /// ```c
  /// extern SDL_DECLSPEC const char * SDLCALL NET_GetAddressString(NET_Address *address)
  /// ```
  /// {@category net}
  String? getString() => netGetAddressString(this);

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
  Uint8List? netGetAddressBytes(Pointer<Int32> numBytes) =>
      netxGetAddressBytes(this);

  ///
  /// Add a reference to an NET_Address.
  ///
  /// Since several pieces of the library might share a single NET_Address,
  /// including a background thread that's working on resolving, these objects
  /// are referenced counted. This allows everything that's using it to declare
  /// they still want it, and drop their reference to the address when they are
  /// done with it. The object's resources are freed when the last reference is
  /// dropped.
  ///
  /// This function adds a reference to an NET_Address, increasing its reference
  /// count by one.
  ///
  /// The documentation will tell you when the app has to explicitly unref an
  /// address. For example, NET_ResolveHostname() creates addresses that are
  /// already referenced, so the caller needs to unref it when done.
  ///
  /// Generally you only have to explicit ref an address when you have different
  /// parts of your own app that will be sharing an address. In normal usage, you
  /// only have to unref things you've created once (like you might free()
  /// something), but you are free to add extra refs if it makes sense.
  ///
  /// This returns the same address passed as a parameter, which makes it easy to
  /// ref and assign in one step:
  ///
  /// ```c
  /// myAddr = NET_RefAddress(yourAddr);
  /// ```
  ///
  /// \param address The NET_Address to add a reference to.
  /// \returns the same address that was passed as a parameter.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_net 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC NET_Address *SDLCALL NET_RefAddress(NET_Address *address)
  /// ```
  /// {@category net}
  Pointer<NetAddress> ref() => netRefAddress(this);

  ///
  /// Drop a reference to an NET_Address.
  ///
  /// Since several pieces of the library might share a single NET_Address,
  /// including a background thread that's working on resolving, these objects
  /// are referenced counted. This allows everything that's using it to declare
  /// they still want it, and drop their reference to the address when they are
  /// done with it. The object's resources are freed when the last reference is
  /// dropped.
  ///
  /// This function drops a reference to an NET_Address, decreasing its reference
  /// count by one.
  ///
  /// The documentation will tell you when the app has to explicitly unref an
  /// address. For example, NET_ResolveHostname() creates addresses that are
  /// already referenced, so the caller needs to unref it when done.
  ///
  /// \param address The NET_Address to drop a reference to.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_net 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL NET_UnrefAddress(NET_Address *address)
  /// ```
  /// {@category net}
  void unref() => netUnrefAddress(this);

  ///
  /// Compare two NET_Address objects.
  ///
  /// This compares two addresses, returning a value that is useful for qsort (or
  /// SDL_qsort).
  ///
  /// \param a first address to compare.
  /// \param b second address to compare.
  /// \returns a value less than zero if `a` is "less than" `b`, a value greater
  /// than zero if "greater than", zero if equal.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_net 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC int SDLCALL NET_CompareAddresses(const NET_Address *a, const NET_Address *b)
  /// ```
  /// {@category net}
  int compare(Pointer<NetAddress> b) => netCompareAddresses(this, b);

  ///
  /// Begin connecting a socket as a client to a remote server.
  ///
  /// Each NET_StreamSocket represents a single connection between systems.
  /// Usually, a client app will have one connection to a server app on a
  /// different computer, and the server app might have many connections from
  /// different clients. Each of these connections communicate over a separate
  /// stream socket.
  ///
  /// Connecting is an asynchronous operation; this function does not block, and
  /// will return before the connection is complete. One has to then use
  /// NET_WaitUntilConnected() or NET_GetConnectionStatus() to see when the
  /// operation has completed, and if it was successful.
  ///
  /// Once connected, you can read and write data to the returned socket. Stream
  /// sockets are a mode of _reliable_ transmission, which means data will be
  /// received as a stream of bytes in the order you sent it. If there are
  /// problems in transmission, the system will deal with protocol negotiation
  /// and retransmission as necessary, transparent to your app, but this means
  /// until data is available in the order sent, the remote side will not get any
  /// new data. This is the tradeoff vs datagram sockets, where data can arrive
  /// in any order, or not arrive at all, without waiting, but the sender will
  /// not know.
  ///
  /// Stream sockets don't employ any protocol (above the TCP level), so they can
  /// connect to servers that aren't using SDL_net, but if you want to speak any
  /// protocol beyond an abritrary stream of bytes, such as HTTP, you'll have to
  /// implement that yourself on top of the stream socket.
  ///
  /// This function will fail if `address` is not finished resolving.
  ///
  /// When you are done with this connection (whether it failed to connect or
  /// not), you must dispose of it with NET_DestroyStreamSocket().
  ///
  /// Unlike BSD sockets or WinSock, you specify the port as a normal integer;
  /// you do not have to byteswap it into "network order," as the library will
  /// handle that for you.
  ///
  /// There are currently no extra properties for creating a client, so `props`
  /// should be zero. A future revision of SDL_net may add additional (optional)
  /// properties.
  ///
  /// \param address the address of the remote server to connect to.
  /// \param port the port on the remote server to connect to.
  /// \param props properties of the new client. Specify zero for defaults.
  /// \returns a new NET_StreamSocket, pending connection, or NULL on error; call
  /// SDL_GetError() for details.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_net 3.0.0.
  ///
  /// \sa NET_WaitUntilConnected
  /// \sa NET_GetConnectionStatus
  /// \sa NET_DestroyStreamSocket
  ///
  /// ```c
  /// extern SDL_DECLSPEC NET_StreamSocket * SDLCALL NET_CreateClient(NET_Address *address, Uint16 port, SDL_PropertiesID props)
  /// ```
  /// {@category net}
  Pointer<NetStreamSocket> createClient(int port, int props) =>
      netCreateClient(this, port, props);

  ///
  /// Create a server, which listens for connections to accept.
  ///
  /// An app that initiates connection to a remote computer is called a "client,"
  /// and the thing the client connects to is called a "server."
  ///
  /// Servers listen for and accept connections from clients, which spawns a new
  /// stream socket on the server's end, which it can then send/receive data on.
  ///
  /// Use this function to create a server that will accept connections from
  /// other systems.
  ///
  /// This function does not block, and is not asynchronous, as the system can
  /// decide immediately if it can create a server or not. If this returns
  /// success, you can immediately start accepting connections.
  ///
  /// You can specify an address to listen for connections on; this address must
  /// be local to the system, and probably one returned by
  /// NET_GetLocalAddresses(), but almost always you just want to specify NULL
  /// here, to listen on any address available to the app.
  ///
  /// After creating a server, you get stream sockets to talk to incoming client
  /// connections by calling NET_AcceptClient().
  ///
  /// Stream sockets don't employ any protocol (above the TCP level), so they can
  /// accept connections from clients that aren't using SDL_net, but if you want
  /// to speak any protocol beyond an abritrary stream of bytes, such as HTTP,
  /// you'll have to implement that yourself on top of the stream socket.
  ///
  /// Unlike BSD sockets or WinSock, you specify the port as a normal integer;
  /// you do not have to byteswap it into "network order," as the library will
  /// handle that for you.
  ///
  /// The caller may supply properties to customize behavior. This is optional,
  /// and a value of zero for `props` will request defaults for all properties.
  ///
  /// These are the supported properties:
  ///
  /// - `NET_PROP_SERVER_REUSEADDR_BOOLEAN`: true if the server should be created
  /// even if a previous server has recently used this address. For various
  /// reasons, networks prefer that there be some delay between apps reusing
  /// the same address, but this can be problematic when iterating quickly, for
  /// software development purposes or just restarting a crashed service. This
  /// property defaults to true (although it should be noted that, at the
  /// operating system level, this defaults to false!). If this property is
  /// false and the OS feels that not enough time has elapsed, server creation
  /// will fail and this function will report an error.
  ///
  /// \param addr the _local_ address to listen for connections on, or NULL.
  /// \param port the port on the local address to listen for connections on.
  /// \param props properties of the new server. Specify zero for defaults.
  /// \returns a new NET_Server, or NULL on error; call SDL_GetError() for
  /// details.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_net 3.0.0.
  ///
  /// \sa NET_GetLocalAddresses
  /// \sa NET_AcceptClient
  /// \sa NET_DestroyServer
  ///
  /// ```c
  /// extern SDL_DECLSPEC NET_Server * SDLCALL NET_CreateServer(NET_Address *addr, Uint16 port, SDL_PropertiesID props)
  /// ```
  /// {@category net}
  Pointer<NetServer> createServer(int port, int props) =>
      netCreateServer(this, port, props);

  ///
  /// Create and bind a new datagram socket.
  ///
  /// Datagram sockets follow different rules than stream sockets. They are not a
  /// reliable stream of bytes but rather packets, they are not limited to
  /// talking to a single other remote system, they do not maintain a single
  /// "connection" that can be dropped, and they are more nimble about network
  /// failures at the expense of being more complex to use. What makes sense for
  /// your app depends entirely on what your app is trying to accomplish.
  ///
  /// Generally the idea of a datagram socket is that you send data one chunk
  /// ("packet") at a time to any address you want, and it arrives whenever it
  /// gets there, even if later packets get there first, and maybe it doesn't get
  /// there at all, and you don't know when anything of this happens by default.
  ///
  /// This function creates a new datagram socket.
  ///
  /// This function does not block, and is not asynchronous, as the system can
  /// decide immediately if it can create a socket or not. If this returns
  /// success, you can immediately start talking to the network.
  ///
  /// You can specify an address to listen for connections on; this address must
  /// be local to the system, and probably one returned by
  /// NET_GetLocalAddresses(), but almost always you just want to specify NULL
  /// here, to listen on any address available to the app.
  ///
  /// If you need to bind to a specific port (like a server), you should specify
  /// it in the `port` argument; datagram servers should do this, so they can be
  /// reached at a well-known port. If you only plan to initiate communications
  /// (like a client), you should specify 0 and let the system pick an unused
  /// port. Only one process can bind to a specific port at a time, so if you
  /// aren't acting as a server, you should choose 0. Datagram sockets can send
  /// individual packets to any port, so this just declares where data will
  /// arrive for your socket.
  ///
  /// Datagram sockets don't employ any protocol (above the UDP level), so they
  /// can talk to apps that aren't using SDL_net, but if you want to speak any
  /// protocol beyond arbitrary packets of bytes, such as WebRTC, you'll have to
  /// implement that yourself on top of the stream socket.
  ///
  /// Unlike BSD sockets or WinSock, you specify the port as a normal integer;
  /// you do not have to byteswap it into "network order," as the library will
  /// handle that for you.
  ///
  /// The caller may supply properties to customize behavior. This is optional,
  /// and a value of zero for `props` will request defaults for all properties.
  ///
  /// These are the supported properties:
  ///
  /// - `NET_PROP_DATAGRAM_SOCKET_REUSEADDR_BOOLEAN`: true if the socket should
  /// be created even if a previous socket has recently used this address. For
  /// various reasons, networks prefer that there be some delay between apps
  /// reusing the same address, but this can be problematic when iterating
  /// quickly, for software development purposes or just restarting a crashed
  /// service. This property defaults to true (although it should be noted
  /// that, at the operating system level, this defaults to false!). If this
  /// property is false and the OS feels that not enough time has elapsed,
  /// socket creation will fail and this function will report an error.
  /// - `NET_PROP_DATAGRAM_SOCKET_ALLOW_BROADCAST_BOOLEAN`: true if the socket
  /// should allow broadcasting. At the lower level, this will set
  /// `SO_BROADCAST` for IPv4 sockets, to allow sending to the subnet's
  /// broadcast address at the OS level. For IPv6, it'll join the all-nodes
  /// link-local multicast group, ff02::1, allowing sending and receiving
  /// there, more or less simulating the usual IPv4 broadcast semantics. Other
  /// protocols take similar approaches. If you do not intend to send or
  /// receive broadcast packets on this socket, set this property to false, or
  /// omit it, as it defaults to false. Note: IPv4 will still be able to
  /// receive broadcast packets without this option, but IPv6 will not. Also
  /// see notes about sending to a broadcast address in NET_SendDatagram().
  ///
  /// \param addr the local address to listen for connections on, or NULL to
  /// listen on all available local addresses.
  /// \param port the port on the local address to listen for connections on, or
  /// zero for the system to decide.
  /// \param props properties of the new socket. Specify zero for defaults.
  /// \returns a new NET_DatagramSocket, or NULL on error; call SDL_GetError()
  /// for details.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_net 3.0.0.
  ///
  /// \sa NET_GetLocalAddresses
  /// \sa NET_DestroyDatagramSocket
  ///
  /// ```c
  /// extern SDL_DECLSPEC NET_DatagramSocket * SDLCALL NET_CreateDatagramSocket(NET_Address *addr, Uint16 port, SDL_PropertiesID props)
  /// ```
  /// {@category net}
  Pointer<NetDatagramSocket> createDatagramSocket(int port, int props) =>
      netCreateDatagramSocket(this, port, props);
}
