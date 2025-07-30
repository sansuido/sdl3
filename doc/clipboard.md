
# CategoryClipboard

SDL provides access to the system clipboard, both for reading information
from other processes and publishing information of its own.

This is not just text! SDL apps can access and publish data by mimetype.

## Basic use (text)

Obtaining and publishing simple text to the system clipboard is as easy as
calling SDL_GetClipboardText() and SDL_SetClipboardText(), respectively.
These deal with C strings in UTF-8 encoding. Data transmission and encoding
conversion is completely managed by SDL.

## Clipboard callbacks (data other than text)

Things get more complicated when the clipboard contains something other
than text. Not only can the system clipboard contain data of any type, in
some cases it can contain the same data in different formats! For example,
an image painting app might let the user copy a graphic to the clipboard,
and offers it in .BMP, .JPG, or .PNG format for other apps to consume.

Obtaining clipboard data ("pasting") like this is a matter of calling
SDL_GetClipboardData() and telling it the mimetype of the data you want.
But how does one know if that format is available? SDL_HasClipboardData()
can report if a specific mimetype is offered, and
SDL_GetClipboardMimeTypes() can provide the entire list of mimetypes
available, so the app can decide what to do with the data and what formats
it can support.

Setting the clipboard ("copying") to arbitrary data is done with
SDL_SetClipboardData. The app does not provide the data in this call, but
rather the mimetypes it is willing to provide and a callback function.
During the callback, the app will generate the data. This allows massive
data sets to be provided to the clipboard, without any data being copied
before it is explicitly requested. More specifically, it allows an app to
offer data in multiple formats without providing a copy of all of them
upfront. If the app has an image that it could provide in PNG or JPG
format, it doesn't have to encode it to either of those unless and until
something tries to paste it.

## Primary Selection

The X11 and Wayland video targets have a concept of the "primary selection"
in addition to the usual clipboard. This is generally highlighted (but not
explicitly copied) text from various apps. SDL offers APIs for this through
SDL_GetPrimarySelectionText() and SDL_SetPrimarySelectionText(). SDL offers
these APIs on platforms without this concept, too, but only so far that it
will keep a copy of a string that the app sets for later retrieval; the
operating system will not ever attempt to change the string externally if
it doesn't support a primary selection.
