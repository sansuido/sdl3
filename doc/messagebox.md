
# CategoryMessagebox

SDL offers a simple message box API, which is useful for simple alerts,
such as informing the user when something fatal happens at startup without
the need to build a UI for it (or informing the user _before_ your UI is
ready).

These message boxes are native system dialogs where possible.

There is both a customizable function (SDL_ShowMessageBox()) that offers
lots of options for what to display and reports on what choice the user
made, and also a much-simplified version (SDL_ShowSimpleMessageBox()),
merely takes a text message and title, and waits until the user presses a
single "OK" UI button. Often, this is all that is necessary.
