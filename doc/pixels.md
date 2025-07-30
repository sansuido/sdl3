
# CategoryPixels

SDL offers facilities for pixel management.

Largely these facilities deal with pixel _format_: what does this set of
bits represent?

If you mostly want to think of a pixel as some combination of red, green,
blue, and maybe alpha intensities, this is all pretty straightforward, and
in many cases, is enough information to build a perfectly fine game.

However, the actual definition of a pixel is more complex than that:

Pixels are a representation of a color in a particular color space.

The first characteristic of a color space is the color type. SDL
understands two different color types, RGB and YCbCr, or in SDL also
referred to as YUV.

RGB colors consist of red, green, and blue channels of color that are added
together to represent the colors we see on the screen.

https://en.wikipedia.org/wiki/RGB_color_model

YCbCr colors represent colors as a Y luma brightness component and red and
blue chroma color offsets. This color representation takes advantage of the
fact that the human eye is more sensitive to brightness than the color in
an image. The Cb and Cr components are often compressed and have lower
resolution than the luma component.

https://en.wikipedia.org/wiki/YCbCr

When the color information in YCbCr is compressed, the Y pixels are left at
full resolution and each Cr and Cb pixel represents an average of the color
information in a block of Y pixels. The chroma location determines where in
that block of pixels the color information is coming from.

The color range defines how much of the pixel to use when converting a
pixel into a color on the display. When the full color range is used, the
entire numeric range of the pixel bits is significant. When narrow color
range is used, for historical reasons, the pixel uses only a portion of the
numeric range to represent colors.

The color primaries and white point are a definition of the colors in the
color space relative to the standard XYZ color space.

https://en.wikipedia.org/wiki/CIE_1931_color_space

The transfer characteristic, or opto-electrical transfer function (OETF),
is the way a color is converted from mathematically linear space into a
non-linear output signals.

https://en.wikipedia.org/wiki/Rec._709#Transfer_characteristics

The matrix coefficients are used to convert between YCbCr and RGB colors.
