import 'dart:ffi';
import 'dart:math' as math show Rectangle;

import '../../generated/lib_sdl_rect.dart';
import '../../generated/struct_sdl.dart';

extension SdlFRectPointerEx on Pointer<SdlFRect> {
  math.Rectangle<double> create() {
    return math.Rectangle<double>(ref.x, ref.y, ref.w, ref.h);
  }
}

extension SdlRectPointerEx on Pointer<SdlRect> {
  math.Rectangle<double> create() {
    return math.Rectangle<double>(
        ref.x.toDouble(), ref.y.toDouble(), ref.w.toDouble(), ref.h.toDouble());
  }

  ///
  /// Determine whether two rectangles intersect.
  ///
  /// If either pointer is NULL the function will return false.
  ///
  /// \param A an SDL_Rect structure representing the first rectangle.
  /// \param B an SDL_Rect structure representing the second rectangle.
  /// \returns true if there is an intersection, false otherwise.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_GetRectIntersection
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_HasRectIntersection(const SDL_Rect *A, const SDL_Rect *B)
  /// ```
  bool hasIntersection(Pointer<SdlRect> b) {
    return sdlHasRectIntersection(this, b);
  }

  ///
  /// Calculate the intersection of two rectangles.
  ///
  /// If `result` is NULL then this function will return false.
  ///
  /// \param A an SDL_Rect structure representing the first rectangle.
  /// \param B an SDL_Rect structure representing the second rectangle.
  /// \param result an SDL_Rect structure filled in with the intersection of
  /// rectangles `A` and `B`.
  /// \returns true if there is an intersection, false otherwise.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// \sa SDL_HasRectIntersection
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetRectIntersection(const SDL_Rect *A, const SDL_Rect *B, SDL_Rect *result)
  /// ```
  bool getIntersection(Pointer<SdlRect> b, Pointer<SdlRect> result) {
    return sdlGetRectIntersection(this, b, result);
  }

  ///
  /// Calculate the union of two rectangles.
  ///
  /// \param A an SDL_Rect structure representing the first rectangle.
  /// \param B an SDL_Rect structure representing the second rectangle.
  /// \param result an SDL_Rect structure filled in with the union of rectangles
  /// `A` and `B`.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetRectUnion(const SDL_Rect *A, const SDL_Rect *B, SDL_Rect *result)
  /// ```
  bool union(Pointer<SdlRect> b, Pointer<SdlRect> result) {
    return sdlGetRectUnion(this, b, result);
  }

  ///
  /// Calculate the intersection of a rectangle and line segment.
  ///
  /// This function is used to clip a line segment to a rectangle. A line segment
  /// contained entirely within the rectangle or that does not intersect will
  /// remain unchanged. A line segment that crosses the rectangle at either or
  /// both ends will be clipped to the boundary of the rectangle and the new
  /// coordinates saved in `X1`, `Y1`, `X2`, and/or `Y2` as necessary.
  ///
  /// \param rect an SDL_Rect structure representing the rectangle to intersect.
  /// \param X1 a pointer to the starting X-coordinate of the line.
  /// \param Y1 a pointer to the starting Y-coordinate of the line.
  /// \param X2 a pointer to the ending X-coordinate of the line.
  /// \param Y2 a pointer to the ending Y-coordinate of the line.
  /// \returns true if there is an intersection, false otherwise.
  ///
  /// \since This function is available since SDL 3.1.3.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetRectAndLineIntersection(const SDL_Rect *rect, int *X1, int *Y1, int *X2, int *Y2)
  /// ```
  bool getLineIntersection(Pointer<Int32> x1, Pointer<Int32> y1,
      Pointer<Int32> x2, Pointer<Int32> y2) {
    return sdlGetRectAndLineIntersection(this, x1, y1, x2, y2);
  }
}
