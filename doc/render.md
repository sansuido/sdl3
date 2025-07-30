
# CategoryRender

Header file for SDL 2D rendering functions.

This API supports the following features:

- single pixel points
- single pixel lines
- filled rectangles
- texture images
- 2D polygons

The primitives may be drawn in opaque, blended, or additive modes.

The texture images may be drawn in opaque, blended, or additive modes. They
can have an additional color tint or alpha modulation applied to them, and
may also be stretched with linear interpolation.

This API is designed to accelerate simple 2D operations. You may want more
functionality such as polygons and particle effects and in that case you
should use SDL's OpenGL/Direct3D support, the SDL3 GPU API, or one of the
many good 3D engines.

These functions must be called from the main thread. See this bug for
details: https://github.com/libsdl-org/SDL/issues/986
