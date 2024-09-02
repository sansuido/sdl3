// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Determine whether two rectangles intersect.
///
/// If either pointer is NULL the function will return SDL_FALSE.
///
/// \param A an SDL_Rect structure representing the first rectangle.
/// \param B an SDL_Rect structure representing the second rectangle.
/// \returns SDL_TRUE if there is an intersection, SDL_FALSE otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetRectIntersection
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_HasRectIntersection(const SDL_Rect *A, const SDL_Rect *B)
/// ```
bool sdlHasRectIntersection(Pointer<SdlRect> a, Pointer<SdlRect> b) {
  final sdlHasRectIntersectionLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlRect> a, Pointer<SdlRect> b),
      int Function(
          Pointer<SdlRect> a, Pointer<SdlRect> b)>('SDL_HasRectIntersection');
  return sdlHasRectIntersectionLookupFunction(a, b) == 1;
}

///
/// Calculate the intersection of two rectangles.
///
/// If `result` is NULL then this function will return SDL_FALSE.
///
/// \param A an SDL_Rect structure representing the first rectangle.
/// \param B an SDL_Rect structure representing the second rectangle.
/// \param result an SDL_Rect structure filled in with the intersection of
/// rectangles `A` and `B`.
/// \returns SDL_TRUE if there is an intersection, SDL_FALSE otherwise.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_HasRectIntersection
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_GetRectIntersection(const SDL_Rect *A, const SDL_Rect *B, SDL_Rect *result)
/// ```
bool sdlGetRectIntersection(
    Pointer<SdlRect> a, Pointer<SdlRect> b, Pointer<SdlRect> result) {
  final sdlGetRectIntersectionLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(
          Pointer<SdlRect> a, Pointer<SdlRect> b, Pointer<SdlRect> result),
      int Function(Pointer<SdlRect> a, Pointer<SdlRect> b,
          Pointer<SdlRect> result)>('SDL_GetRectIntersection');
  return sdlGetRectIntersectionLookupFunction(a, b, result) == 1;
}

///
/// Calculate the union of two rectangles.
///
/// \param A an SDL_Rect structure representing the first rectangle.
/// \param B an SDL_Rect structure representing the second rectangle.
/// \param result an SDL_Rect structure filled in with the union of rectangles
/// `A` and `B`.
/// \returns SDL_TRUE on success or SDL_FALSE on failure; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_GetRectUnion(const SDL_Rect *A, const SDL_Rect *B, SDL_Rect *result)
/// ```
bool sdlGetRectUnion(
    Pointer<SdlRect> a, Pointer<SdlRect> b, Pointer<SdlRect> result) {
  final sdlGetRectUnionLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(
          Pointer<SdlRect> a, Pointer<SdlRect> b, Pointer<SdlRect> result),
      int Function(Pointer<SdlRect> a, Pointer<SdlRect> b,
          Pointer<SdlRect> result)>('SDL_GetRectUnion');
  return sdlGetRectUnionLookupFunction(a, b, result) == 1;
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
/// \returns SDL_TRUE if any points were enclosed or SDL_FALSE if all the
/// points were outside of the clipping rectangle.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_GetRectEnclosingPoints(const SDL_Point *points, int count, const SDL_Rect *clip, SDL_Rect *result)
/// ```
bool sdlGetRectEnclosingPoints(Pointer<SdlPoint> points, int count,
    Pointer<SdlRect> clip, Pointer<SdlRect> result) {
  final sdlGetRectEnclosingPointsLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlPoint> points, Int32 count,
          Pointer<SdlRect> clip, Pointer<SdlRect> result),
      int Function(Pointer<SdlPoint> points, int count, Pointer<SdlRect> clip,
          Pointer<SdlRect> result)>('SDL_GetRectEnclosingPoints');
  return sdlGetRectEnclosingPointsLookupFunction(points, count, clip, result) ==
      1;
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
/// \returns SDL_TRUE if there is an intersection, SDL_FALSE otherwise.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_GetRectAndLineIntersection(const SDL_Rect *rect, int *X1, int *Y1, int *X2, int *Y2)
/// ```
bool sdlGetRectAndLineIntersection(Pointer<SdlRect> rect, Pointer<Int32> x1,
    Pointer<Int32> y1, Pointer<Int32> x2, Pointer<Int32> y2) {
  final sdlGetRectAndLineIntersectionLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlRect> rect, Pointer<Int32> x1,
          Pointer<Int32> y1, Pointer<Int32> x2, Pointer<Int32> y2),
      int Function(
          Pointer<SdlRect> rect,
          Pointer<Int32> x1,
          Pointer<Int32> y1,
          Pointer<Int32> x2,
          Pointer<Int32> y2)>('SDL_GetRectAndLineIntersection');
  return sdlGetRectAndLineIntersectionLookupFunction(rect, x1, y1, x2, y2) == 1;
}

///
/// Determine whether two rectangles intersect with float precision.
///
/// If either pointer is NULL the function will return SDL_FALSE.
///
/// \param A an SDL_FRect structure representing the first rectangle.
/// \param B an SDL_FRect structure representing the second rectangle.
/// \returns SDL_TRUE if there is an intersection, SDL_FALSE otherwise.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetRectIntersection
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_HasRectIntersectionFloat(const SDL_FRect *A, const SDL_FRect *B)
/// ```
bool sdlHasRectIntersectionFloat(Pointer<SdlFRect> a, Pointer<SdlFRect> b) {
  final sdlHasRectIntersectionFloatLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlFRect> a, Pointer<SdlFRect> b),
      int Function(Pointer<SdlFRect> a,
          Pointer<SdlFRect> b)>('SDL_HasRectIntersectionFloat');
  return sdlHasRectIntersectionFloatLookupFunction(a, b) == 1;
}

///
/// Calculate the intersection of two rectangles with float precision.
///
/// If `result` is NULL then this function will return SDL_FALSE.
///
/// \param A an SDL_FRect structure representing the first rectangle.
/// \param B an SDL_FRect structure representing the second rectangle.
/// \param result an SDL_FRect structure filled in with the intersection of
/// rectangles `A` and `B`.
/// \returns SDL_TRUE if there is an intersection, SDL_FALSE otherwise.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_HasRectIntersectionFloat
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_GetRectIntersectionFloat(const SDL_FRect *A, const SDL_FRect *B, SDL_FRect *result)
/// ```
bool sdlGetRectIntersectionFloat(
    Pointer<SdlFRect> a, Pointer<SdlFRect> b, Pointer<SdlFRect> result) {
  final sdlGetRectIntersectionFloatLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(
          Pointer<SdlFRect> a, Pointer<SdlFRect> b, Pointer<SdlFRect> result),
      int Function(Pointer<SdlFRect> a, Pointer<SdlFRect> b,
          Pointer<SdlFRect> result)>('SDL_GetRectIntersectionFloat');
  return sdlGetRectIntersectionFloatLookupFunction(a, b, result) == 1;
}

///
/// Calculate the union of two rectangles with float precision.
///
/// \param A an SDL_FRect structure representing the first rectangle.
/// \param B an SDL_FRect structure representing the second rectangle.
/// \param result an SDL_FRect structure filled in with the union of rectangles
/// `A` and `B`.
/// \returns SDL_TRUE on success or SDL_FALSE on failure; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_GetRectUnionFloat(const SDL_FRect *A, const SDL_FRect *B, SDL_FRect *result)
/// ```
bool sdlGetRectUnionFloat(
    Pointer<SdlFRect> a, Pointer<SdlFRect> b, Pointer<SdlFRect> result) {
  final sdlGetRectUnionFloatLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(
          Pointer<SdlFRect> a, Pointer<SdlFRect> b, Pointer<SdlFRect> result),
      int Function(Pointer<SdlFRect> a, Pointer<SdlFRect> b,
          Pointer<SdlFRect> result)>('SDL_GetRectUnionFloat');
  return sdlGetRectUnionFloatLookupFunction(a, b, result) == 1;
}

///
/// Calculate a minimal rectangle enclosing a set of points with float
/// precision.
///
/// If `clip` is not NULL then only points inside of the clipping rectangle are
/// considered.
///
/// \param points an array of SDL_FPoint structures representing points to be
/// enclosed.
/// \param count the number of structures in the `points` array.
/// \param clip an SDL_FRect used for clipping or NULL to enclose all points.
/// \param result an SDL_FRect structure filled in with the minimal enclosing
/// rectangle.
/// \returns SDL_TRUE if any points were enclosed or SDL_FALSE if all the
/// points were outside of the clipping rectangle.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_GetRectEnclosingPointsFloat(const SDL_FPoint *points, int count, const SDL_FRect *clip, SDL_FRect *result)
/// ```
bool sdlGetRectEnclosingPointsFloat(Pointer<SdlFPoint> points, int count,
    Pointer<SdlFRect> clip, Pointer<SdlFRect> result) {
  final sdlGetRectEnclosingPointsFloatLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlFPoint> points, Int32 count,
          Pointer<SdlFRect> clip, Pointer<SdlFRect> result),
      int Function(Pointer<SdlFPoint> points, int count, Pointer<SdlFRect> clip,
          Pointer<SdlFRect> result)>('SDL_GetRectEnclosingPointsFloat');
  return sdlGetRectEnclosingPointsFloatLookupFunction(
          points, count, clip, result) ==
      1;
}

///
/// Calculate the intersection of a rectangle and line segment with float
/// precision.
///
/// This function is used to clip a line segment to a rectangle. A line segment
/// contained entirely within the rectangle or that does not intersect will
/// remain unchanged. A line segment that crosses the rectangle at either or
/// both ends will be clipped to the boundary of the rectangle and the new
/// coordinates saved in `X1`, `Y1`, `X2`, and/or `Y2` as necessary.
///
/// \param rect an SDL_FRect structure representing the rectangle to intersect.
/// \param X1 a pointer to the starting X-coordinate of the line.
/// \param Y1 a pointer to the starting Y-coordinate of the line.
/// \param X2 a pointer to the ending X-coordinate of the line.
/// \param Y2 a pointer to the ending Y-coordinate of the line.
/// \returns SDL_TRUE if there is an intersection, SDL_FALSE otherwise.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_GetRectAndLineIntersectionFloat(const SDL_FRect *rect, float *X1, float *Y1, float *X2, float *Y2)
/// ```
bool sdlGetRectAndLineIntersectionFloat(
    Pointer<SdlFRect> rect,
    Pointer<Float> x1,
    Pointer<Float> y1,
    Pointer<Float> x2,
    Pointer<Float> y2) {
  final sdlGetRectAndLineIntersectionFloatLookupFunction =
      libSdl3.lookupFunction<
          Uint8 Function(Pointer<SdlFRect> rect, Pointer<Float> x1,
              Pointer<Float> y1, Pointer<Float> x2, Pointer<Float> y2),
          int Function(
              Pointer<SdlFRect> rect,
              Pointer<Float> x1,
              Pointer<Float> y1,
              Pointer<Float> x2,
              Pointer<Float> y2)>('SDL_GetRectAndLineIntersectionFloat');
  return sdlGetRectAndLineIntersectionFloatLookupFunction(
          rect, x1, y1, x2, y2) ==
      1;
}
