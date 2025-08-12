
# CategorySDLNet

SDL_net is a simple library to help with networking.

In current times, it's a relatively thin layer over system-level APIs like
BSD Sockets or WinSock. It's primary strength is in making those interfaces
less complicated to use, and handling several unexpected corner cases, so
the app doesn't have to.

Some design philosophies of SDL_net:

- Nothing is blocking (but you can explicitly wait on things if you want).
- Addressing is abstract so you don't have to worry about specific networks
  and their specific protocols.
- Simple is better than hard, and not necessarily less powerful either.

There are several pieces to this library, and most apps won't use them all,
but rather choose the portion that's relevant to their needs.

All apps will call NET_Init() on startup and NET_Quit() on shutdown.

The cornerstone of the library is the NET_Address object. This is what
manages the details of how to reach another computer on the network, and
what network protocol to use to get there. You'll need a NET_Address to
talk over the network. If you need to convert a hostname (such as
"google.com" or "libsdl.org") into a NET_Address, you can call
NET_ResolveHostname(), which will do the appropriate DNS queries on a
background thread. Once these are ready, you can use the NET_Address to
connect to these hosts over the Internet.

Something that initiates a connection to a remote system is called a
"client," connecting to a "server." To establish a connection, use the
NET_Address you resolved with NET_CreateClient(). Once the connection is
established (a non-blocking operation), you'll have a NET_StreamSocket
object that can send and receive data over the connection, using
NET_WriteToStreamSocket() and NET_ReadFromStreamSocket().

To instead be a server, that clients connect to, call NET_CreateServer() to
get a NET_Server object. All a NET_Server does is allow you to accept
connections from clients, turning them into NET_StreamSockets, where you
can read and write from the opposite side of the connection from a given
client.

These things are, underneath this API, TCP connections, which means you can
use a client or server to talk to something that _isn't_ using SDL_net at
all.

Clients and servers deal with "stream sockets," a reliable stream of bytes.
There are tradeoffs to using these, especially in poor network conditions.
Another option is to use "datagram sockets," which map to UDP packet
transmission. With datagrams, everyone involved can send small packets of
data that may arrive in any order, or not at all, but transmission can
carry on if a packet is lost, each packet is clearly separated from every
other, and communication can happen in a peer-to-peer model instead of
client-server: while datagrams can be more complex, these _are_ useful
properties not avaiable to stream sockets. NET_CreateDatagramSocket() is
used to prepare for datagram communication, then NET_SendDatagram() and
NET_ReceiveDatagram() transmit packets.

As previously mentioned, SDL_net's API is "non-blocking" (asynchronous).
Any network operation might take time, but SDL_net's APIs will not wait
until they complete. Any operation will return immediately, with options to
check if the operation has completed later. Generally this is what a video
game needs, but there are times where it makes sense to pause until an
operation completes; in a background thread this might make sense, as it
could simplify the code dramatically.

The functions that block until an operation completes:

- NET_WaitUntilConnected
- NET_WaitUntilInputAvailable
- NET_WaitUntilResolved
- NET_WaitUntilStreamSocketDrained

All of these functions offer a timeout, which allow for a maximum wait
time, an immediate non-blocking query, or an infinite wait.

Finally, SDL_net offers a way to simulate network problems, to test the
always-less-than-ideal conditions in the real world. One can
programmatically make the app behave like it's on a flakey wifi connection
even if it's running wired directly to a gigabit fiber line. The functions:

- NET_SimulateAddressResolutionLoss
- NET_SimulateStreamPacketLoss
- NET_SimulateDatagramPacketLoss
