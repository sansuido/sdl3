
# CategoryDialog

File dialog support.

SDL offers file dialogs, to let users select files with native GUI
interfaces. There are "open" dialogs, "save" dialogs, and folder selection
dialogs. The app can control some details, such as filtering to specific
files, or whether multiple files can be selected by the user.

Note that launching a file dialog is a non-blocking operation; control
returns to the app immediately, and a callback is called later (possibly in
another thread) when the user makes a choice.
