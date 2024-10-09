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
  /// Retrieve the current state of the mouse.
  ///
  /// The current button state is returned as a button bitmask, which can be
  /// tested using the SDL_BUTTON_MASK(X) macro (where `X` is generally 1 for the
  /// left, 2 for middle, 3 for the right button), and `x` and `y` are set to the
  /// mouse cursor position relative to the focus window. You can pass NULL for
  /// either `x` or `y`.
  ///
  /// \param x the x coordinate of the mouse cursor position relative to the
  /// focus window.
  /// \param y the y coordinate of the mouse cursor position relative to the
  /// focus window.
  /// \returns a 32-bit button bitmask of the current button state.
  ///
  /// \since This function is available since SDL 3.0.0.
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
  /// Get the current state of the mouse in relation to the desktop.
  ///
  /// This works similarly to SDL_GetMouseState(), but the coordinates will be
  /// reported relative to the top-left of the desktop. This can be useful if you
  /// need to track the mouse outside of a specific window and SDL_CaptureMouse()
  /// doesn't fit your needs. For example, it could be useful if you need to
  /// track the mouse while dragging a window, where coordinates relative to a
  /// window might not be in sync at all times.
  ///
  /// Note: SDL_GetMouseState() returns the mouse position as SDL understands it
  /// from the last pump of the event queue. This function, however, queries the
  /// OS for the current mouse position, and as such, might be a slightly less
  /// efficient function. Unless you know what you're doing and have a good
  /// reason to use this function, you probably want SDL_GetMouseState() instead.
  ///
  /// \param x filled in with the current X coord relative to the desktop; can be
  /// NULL.
  /// \param y filled in with the current Y coord relative to the desktop; can be
  /// NULL.
  /// \returns the current button state as a bitmask which can be tested using
  /// the SDL_BUTTON_MASK(X) macros.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_CaptureMouse
  /// \sa SDL_GetMouseState
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
  /// Retrieve the relative state of the mouse.
  ///
  /// The current button state is returned as a button bitmask, which can be
  /// tested using the `SDL_BUTTON_MASK(X)` macros (where `X` is generally 1 for
  /// the left, 2 for middle, 3 for the right button), and `x` and `y` are set to
  /// the mouse deltas since the last call to SDL_GetRelativeMouseState() or
  /// since event initialization. You can pass NULL for either `x` or `y`.
  ///
  /// \param x a pointer filled with the last recorded x coordinate of the mouse.
  /// \param y a pointer filled with the last recorded y coordinate of the mouse.
  /// \returns a 32-bit button bitmask of the relative button state.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetMouseState
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
  /// \since This function is available since SDL 3.0.0.
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
