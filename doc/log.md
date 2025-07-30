
# CategoryLog

Simple log messages with priorities and categories. A message's
SDL_LogPriority signifies how important the message is. A message's
SDL_LogCategory signifies from what domain it belongs to. Every category
has a minimum priority specified: when a message belongs to that category,
it will only be sent out if it has that minimum priority or higher.

SDL's own logs are sent below the default priority threshold, so they are
quiet by default.

You can change the log verbosity programmatically using
SDL_SetLogPriority() or with SDL_SetHint(SDL_HINT_LOGGING, ...), or with
the "SDL_LOGGING" environment variable. This variable is a comma separated
set of category=level tokens that define the default logging levels for SDL
applications.

The category can be a numeric category, one of "app", "error", "assert",
"system", "audio", "video", "render", "input", "test", or `*` for any
unspecified category.

The level can be a numeric level, one of "trace", "verbose", "debug",
"info", "warn", "error", "critical", or "quiet" to disable that category.

You can omit the category if you want to set the logging level for all
categories.

If this hint isn't set, the default log levels are equivalent to:

`app=info,assert=warn,test=verbose,*=error`

Here's where the messages go on different platforms:

- Windows: debug output stream
- Android: log output
- Others: standard error output (stderr)

You don't need to have a newline (`\n`) on the end of messages, the
functions will do that for you. For consistent behavior cross-platform, you
shouldn't have any newlines in messages, such as to log multiple lines in
one call; unusual platform-specific behavior can be observed in such usage.
Do one log call per line instead, with no newlines in messages.

Each log call is atomic, so you won't see log messages cut off one another
when logging from multiple threads.
