import 'dart:ffi';
import 'dart:math' as math show Point, Rectangle;
import 'package:ffi/ffi.dart' as ffi;
import 'rectangle.dart';
import '../sdl/sdl_rect.dart';
import '../../generated/lib_sdl_mouse.dart';
import '../../generated/lib_sdl_rect.dart';
import '../../generated/struct_sdl.dart';

extension PointEx on math.Point<double> {
  // dependence package:ffi
  Pointer<SdlFPoint> calloc() {
    var result = ffi.calloc<SdlFPoint>()
      ..ref.x = x
      ..ref.y = y;
    return result;
  }

  Pointer<SdlPoint> callocInt() {
    var result = ffi.calloc<SdlPoint>()
      ..ref.x = x.toInt()
      ..ref.y = y.toInt();
    return result;
  }

  // lib_sdl_mouse.dart

  ///
  /// Query SDL's cache for the synchronous mouse button state and the
  /// window-relative SDL-cursor position.
  ///
  /// This function returns the cached synchronous state as SDL understands it
  /// from the last pump of the event queue.
  ///
  /// To query the platform for immediate asynchronous state, use
  /// SDL_GetGlobalMouseState.
  ///
  /// Passing non-NULL pointers to `x` or `y` will write the destination with
  /// respective x or y coordinates relative to the focused window.
  ///
  /// In Relative Mode, the SDL-cursor's position usually contradicts the
  /// platform-cursor's position as manually calculated from
  /// SDL_GetGlobalMouseState() and SDL_GetWindowPosition.
  ///
  /// \param x a pointer to receive the SDL-cursor's x-position from the focused
  /// window's top left corner, can be NULL if unused.
  /// \param y a pointer to receive the SDL-cursor's y-position from the focused
  /// window's top left corner, can be NULL if unused.
  /// \returns a 32-bit bitmask of the button state that can be bitwise-compared
  /// against the SDL_BUTTON_MASK(X) macro.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_GetGlobalMouseState
  /// \sa SDL_GetRelativeMouseState
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_MouseButtonFlags SDLCALL SDL_GetMouseState(float *x, float *y)
  /// ```
  static math.Point<double> getMousePosition() {
    var xPointer = ffi.calloc<Float>();
    var yPointer = ffi.calloc<Float>();
    sdlGetMouseState(xPointer, yPointer);
    var result = math.Point<double>(xPointer.value, yPointer.value);
    ffi.calloc.free(xPointer);
    ffi.calloc.free(yPointer);
    return result;
  }

  ///
  /// Query the platform for the asynchronous mouse button state and the
  /// desktop-relative platform-cursor position.
  ///
  /// This function immediately queries the platform for the most recent
  /// asynchronous state, more costly than retrieving SDL's cached state in
  /// SDL_GetMouseState().
  ///
  /// Passing non-NULL pointers to `x` or `y` will write the destination with
  /// respective x or y coordinates relative to the desktop.
  ///
  /// In Relative Mode, the platform-cursor's position usually contradicts the
  /// SDL-cursor's position as manually calculated from SDL_GetMouseState() and
  /// SDL_GetWindowPosition.
  ///
  /// This function can be useful if you need to track the mouse outside of a
  /// specific window and SDL_CaptureMouse() doesn't fit your needs. For example,
  /// it could be useful if you need to track the mouse while dragging a window,
  /// where coordinates relative to a window might not be in sync at all times.
  ///
  /// \param x a pointer to receive the platform-cursor's x-position from the
  /// desktop's top left corner, can be NULL if unused.
  /// \param y a pointer to receive the platform-cursor's y-position from the
  /// desktop's top left corner, can be NULL if unused.
  /// \returns a 32-bit bitmask of the button state that can be bitwise-compared
  /// against the SDL_BUTTON_MASK(X) macro.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_CaptureMouse
  /// \sa SDL_GetMouseState
  /// \sa SDL_GetGlobalMouseState
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_MouseButtonFlags SDLCALL SDL_GetGlobalMouseState(float *x, float *y)
  /// ```
  static math.Point<double> getGlobalMousePosition() {
    var xPointer = ffi.calloc<Float>();
    var yPointer = ffi.calloc<Float>();
    sdlGetGlobalMouseState(xPointer, yPointer);
    var result = math.Point<double>(xPointer.value, yPointer.value);
    ffi.calloc.free(xPointer);
    ffi.calloc.free(yPointer);
    return result;
  }

  ///
  /// Query SDL's cache for the synchronous mouse button state and accumulated
  /// mouse delta since last call.
  ///
  /// This function returns the cached synchronous state as SDL understands it
  /// from the last pump of the event queue.
  ///
  /// To query the platform for immediate asynchronous state, use
  /// SDL_GetGlobalMouseState.
  ///
  /// Passing non-NULL pointers to `x` or `y` will write the destination with
  /// respective x or y deltas accumulated since the last call to this function
  /// (or since event initialization).
  ///
  /// This function is useful for reducing overhead by processing relative mouse
  /// inputs in one go per-frame instead of individually per-event, at the
  /// expense of losing the order between events within the frame (e.g. quickly
  /// pressing and releasing a button within the same frame).
  ///
  /// \param x a pointer to receive the x mouse delta accumulated since last
  /// call, can be NULL if unused.
  /// \param y a pointer to receive the y mouse delta accumulated since last
  /// call, can be NULL if unused.
  /// \returns a 32-bit bitmask of the button state that can be bitwise-compared
  /// against the SDL_BUTTON_MASK(X) macro.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_GetMouseState
  /// \sa SDL_GetGlobalMouseState
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_MouseButtonFlags SDLCALL SDL_GetRelativeMouseState(float *x, float *y)
  /// ```
  static math.Point<double> getRelativeMousePosition() {
    var xPointer = ffi.calloc<Float>();
    var yPointer = ffi.calloc<Float>();
    sdlGetRelativeMouseState(xPointer, yPointer);
    var result = math.Point<double>(
        xPointer.value.toDouble(), yPointer.value.toDouble());
    ffi.calloc.free(xPointer);
    ffi.calloc.free(yPointer);
    return result;
  }
}

extension PointsEx on List<math.Point<double>> {
  // dependence package:ffi
  Pointer<SdlFPoint> calloc() {
    var pointsPointer = ffi.calloc<SdlFPoint>(length);
    for (var n = 0; n < length; n++) {
      var pointPointer = pointsPointer + n;
      pointPointer.ref.x = this[n].x;
      pointPointer.ref.y = this[n].y;
    }
    return pointsPointer;
  }

  Pointer<SdlPoint> callocInt() {
    var pointsPointer = ffi.calloc<SdlPoint>(length);
    for (var n = 0; n < length; n++) {
      var pointPointer = pointsPointer + n;
      pointPointer.ref.x = this[n].x.toInt();
      pointPointer.ref.y = this[n].y.toInt();
    }
    return pointsPointer;
  }

  Pointer<Int16> callocInt16X() {
    var xsPointer = ffi.calloc<Int16>(length);
    for (var n = 0; n < length; n++) {
      var xPointer = xsPointer + n;
      xPointer.value = this[n].x.toInt();
    }
    return xsPointer;
  }

  Pointer<Int16> callocInt16Y() {
    var ysPointer = ffi.calloc<Int16>(length);
    for (var n = 0; n < length; n++) {
      var yPointer = ysPointer + n;
      yPointer.value = this[n].y.toInt();
    }
    return ysPointer;
  }

  ///
  /// Calculate a minimal rectangle enclosing a set of points.
  ///
  /// If `clip` is not NULL then only points inside of the clipping rectangle are
  /// considered.
  ///
  /// \param points an array of SDL_Point structures representing points to be
  /// enclosed.
  /// \param count the number of structures in the `points` array.
  /// \param clip an SDL_Rect used for clipping or NULL to enclose all points.
  /// \param result an SDL_Rect structure filled in with the minimal enclosing
  /// rectangle.
  /// \returns true if any points were enclosed or false if all the points were
  /// outside of the clipping rectangle.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetRectEnclosingPoints(const SDL_Point *points, int count, const SDL_Rect *clip, SDL_Rect *result)
  /// ```
  math.Rectangle<double>? getEncloseRect({math.Rectangle<double>? clip}) {
    math.Rectangle<double>? result;
    var pointsPointer = callocInt();
    Pointer<SdlRect> clipPointer = nullptr;
    var resultPointer = ffi.calloc<SdlRect>();
    if (clip != null) {
      clipPointer = clip.callocInt();
    }
    var bl = sdlGetRectEnclosingPoints(
        pointsPointer, length, clipPointer, resultPointer);
    if (bl == true) {
      result = resultPointer.create();
    }
    ffi.calloc.free(resultPointer);
    if (clipPointer != nullptr) {
      ffi.calloc.free(clipPointer);
    }
    ffi.calloc.free(pointsPointer);
    return result;
  }
}
