
# CategoryAssert

A helpful assertion macro!

SDL assertions operate like your usual `assert` macro, but with some added
features:

- It uses a trick with the `sizeof` operator, so disabled assertions
  vaporize out of the compiled code, but variables only referenced in the
  assertion won't trigger compiler warnings about being unused.
- It is safe to use with a dangling-else: `if (x) SDL_assert(y); else
  do_something();`
- It works the same everywhere, instead of counting on various platforms'
  compiler and C runtime to behave.
- It provides multiple levels of assertion (SDL_assert, SDL_assert_release,
  SDL_assert_paranoid) instead of a single all-or-nothing option.
- It offers a variety of responses when an assertion fails (retry, trigger
  the debugger, abort the program, ignore the failure once, ignore it for
  the rest of the program's run).
- It tries to show the user a dialog by default, if possible, but the app
  can provide a callback to handle assertion failures however they like.
- It lets failed assertions be retried. Perhaps you had a network failure
  and just want to retry the test after plugging your network cable back
  in? You can.
- It lets the user ignore an assertion failure, if there's a harmless
  problem that one can continue past.
- It lets the user mark an assertion as ignored for the rest of the
  program's run; if there's a harmless problem that keeps popping up.
- It provides statistics and data on all failed assertions to the app.
- It allows the default assertion handler to be controlled with environment
  variables, in case an automated script needs to control it.
- It can be used as an aid to Clang's static analysis; it will treat SDL
  assertions as universally true (under the assumption that you are serious
  about the asserted claims and that your debug builds will detect when
  these claims were wrong). This can help the analyzer avoid false
  positives.

To use it: compile a debug build and just sprinkle around tests to check
your code!
