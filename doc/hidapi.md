
# CategoryHIDAPI

Header file for SDL HIDAPI functions.

This is an adaptation of the original HIDAPI interface by Alan Ott, and
includes source code licensed under the following license:

```
HIDAPI - Multi-Platform library for
communication with HID devices.

Copyright 2009, Alan Ott, Signal 11 Software.
All Rights Reserved.

This software may be used by anyone for any reason so
long as the copyright notice in the source files
remains intact.
```

(Note that this license is the same as item three of SDL's zlib license, so
it adds no new requirements on the user.)

If you would like a version of SDL without this code, you can build SDL
with SDL_HIDAPI_DISABLED defined to 1. You might want to do this for
example on iOS or tvOS to avoid a dependency on the CoreBluetooth
framework.
