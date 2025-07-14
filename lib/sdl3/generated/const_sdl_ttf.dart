// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
// ignore_for_file: constant_identifier_names, specify_nonobvious_property_types
part of '../sdl_ttf.dart';

//const SDL_TTF_H_ = ;
const SDL_TTF_MAJOR_VERSION = 3;
const SDL_TTF_MINOR_VERSION = 3;
const SDL_TTF_MICRO_VERSION = 0;
//const SDL_TTF_VERSION = SDL_VERSIONNUM(SDL_TTF_MAJOR_VERSION, SDL_TTF_MINOR_VERSION, SDL_TTF_MICRO_VERSION);
//const SDL_TTF_VERSION_ATLEAST = (X, Y, Z) ((SDL_TTF_MAJOR_VERSION >= X) && (SDL_TTF_MAJOR_VERSION > X || SDL_TTF_MINOR_VERSION >= Y) && (SDL_TTF_MAJOR_VERSION > X || SDL_TTF_MINOR_VERSION > Y || SDL_TTF_MICRO_VERSION >= Z));
const TTF_PROP_FONT_CREATE_FILENAME_STRING = 'SDL_ttf.font.create.filename';
const TTF_PROP_FONT_CREATE_IOSTREAM_POINTER = 'SDL_ttf.font.create.iostream';
const TTF_PROP_FONT_CREATE_IOSTREAM_OFFSET_NUMBER =
    'SDL_ttf.font.create.iostream.offset';
const TTF_PROP_FONT_CREATE_IOSTREAM_AUTOCLOSE_BOOLEAN =
    'SDL_ttf.font.create.iostream.autoclose';
const TTF_PROP_FONT_CREATE_SIZE_FLOAT = 'SDL_ttf.font.create.size';
const TTF_PROP_FONT_CREATE_FACE_NUMBER = 'SDL_ttf.font.create.face';
const TTF_PROP_FONT_CREATE_HORIZONTAL_DPI_NUMBER = 'SDL_ttf.font.create.hdpi';
const TTF_PROP_FONT_CREATE_VERTICAL_DPI_NUMBER = 'SDL_ttf.font.create.vdpi';
const TTF_PROP_FONT_CREATE_EXISTING_FONT_POINTER =
    'SDL_ttf.font.create.existing_font';
const TTF_PROP_FONT_OUTLINE_LINE_CAP_NUMBER = 'SDL_ttf.font.outline.line_cap';
const TTF_PROP_FONT_OUTLINE_LINE_JOIN_NUMBER = 'SDL_ttf.font.outline.line_join';
const TTF_PROP_FONT_OUTLINE_MITER_LIMIT_NUMBER =
    'SDL_ttf.font.outline.miter_limit';
const TTF_STYLE_NORMAL = 0x00;
const TTF_STYLE_BOLD = 0x01;
const TTF_STYLE_ITALIC = 0x02;
const TTF_STYLE_UNDERLINE = 0x04;
const TTF_STYLE_STRIKETHROUGH = 0x08;
const TTF_HINTING_INVALID = -1;
const TTF_HINTING_NORMAL = -1 + 1;
const TTF_HINTING_LIGHT = -1 + 2;
const TTF_HINTING_MONO = -1 + 3;
const TTF_HINTING_NONE = -1 + 4;
const TTF_HINTING_LIGHT_SUBPIXEL = -1 + 5;
const TTF_FONT_WEIGHT_THIN = 100;
const TTF_FONT_WEIGHT_EXTRA_LIGHT = 200;
const TTF_FONT_WEIGHT_LIGHT = 300;
const TTF_FONT_WEIGHT_NORMAL = 400;
const TTF_FONT_WEIGHT_MEDIUM = 500;
const TTF_FONT_WEIGHT_SEMI_BOLD = 600;
const TTF_FONT_WEIGHT_BOLD = 700;
const TTF_FONT_WEIGHT_EXTRA_BOLD = 800;
const TTF_FONT_WEIGHT_BLACK = 900;
const TTF_FONT_WEIGHT_EXTRA_BLACK = 950;
const TTF_HORIZONTAL_ALIGN_INVALID = -1;
const TTF_HORIZONTAL_ALIGN_LEFT = -1 + 1;
const TTF_HORIZONTAL_ALIGN_CENTER = -1 + 2;
const TTF_HORIZONTAL_ALIGN_RIGHT = -1 + 3;
const TTF_DIRECTION_INVALID = 0;
const TTF_DIRECTION_LTR = 4;
const TTF_DIRECTION_RTL = 4 + 1;
const TTF_DIRECTION_TTB = 4 + 2;
const TTF_DIRECTION_BTT = 4 + 3;
const TTF_IMAGE_INVALID = 0;
const TTF_IMAGE_ALPHA = 1;
const TTF_IMAGE_COLOR = 2;
const TTF_IMAGE_SDF = 3;
const TTF_PROP_RENDERER_TEXT_ENGINE_RENDERER_POINTER =
    'SDL_ttf.renderer_text_engine.create.renderer';
const TTF_PROP_RENDERER_TEXT_ENGINE_ATLAS_TEXTURE_SIZE_NUMBER =
    'SDL_ttf.renderer_text_engine.create.atlas_texture_size';
const TTF_PROP_GPU_TEXT_ENGINE_DEVICE_POINTER =
    'SDL_ttf.gpu_text_engine.create.device';
const TTF_PROP_GPU_TEXT_ENGINE_ATLAS_TEXTURE_SIZE_NUMBER =
    'SDL_ttf.gpu_text_engine.create.atlas_texture_size';
const TTF_GPU_TEXTENGINE_WINDING_INVALID = -1;
const TTF_GPU_TEXTENGINE_WINDING_CLOCKWISE = -1 + 1;
const TTF_GPU_TEXTENGINE_WINDING_COUNTER_CLOCKWISE = -1 + 2;
const TTF_SUBSTRING_DIRECTION_MASK = 0x000000FF;
const TTF_SUBSTRING_TEXT_START = 0x00000100;
const TTF_SUBSTRING_LINE_START = 0x00000200;
const TTF_SUBSTRING_LINE_END = 0x00000400;
const TTF_SUBSTRING_TEXT_END = 0x00000800;

/// {@category ttf}
class TtfkPropFont {
  static const createFilenameString = TTF_PROP_FONT_CREATE_FILENAME_STRING;
  static const createIostreamPointer = TTF_PROP_FONT_CREATE_IOSTREAM_POINTER;
  static const createIostreamOffsetNumber =
      TTF_PROP_FONT_CREATE_IOSTREAM_OFFSET_NUMBER;
  static const createIostreamAutocloseBoolean =
      TTF_PROP_FONT_CREATE_IOSTREAM_AUTOCLOSE_BOOLEAN;
  static const createSizeFloat = TTF_PROP_FONT_CREATE_SIZE_FLOAT;
  static const createFaceNumber = TTF_PROP_FONT_CREATE_FACE_NUMBER;
  static const createHorizontalDpiNumber =
      TTF_PROP_FONT_CREATE_HORIZONTAL_DPI_NUMBER;
  static const createVerticalDpiNumber =
      TTF_PROP_FONT_CREATE_VERTICAL_DPI_NUMBER;
  static const createExistingFontPointer =
      TTF_PROP_FONT_CREATE_EXISTING_FONT_POINTER;
  static const outlineLineCapNumber = TTF_PROP_FONT_OUTLINE_LINE_CAP_NUMBER;
  static const outlineLineJoinNumber = TTF_PROP_FONT_OUTLINE_LINE_JOIN_NUMBER;
  static const outlineMiterLimitNumber =
      TTF_PROP_FONT_OUTLINE_MITER_LIMIT_NUMBER;
}

/// {@category ttf}
class TtfkStyle {
  static const normal = TTF_STYLE_NORMAL;
  static const bold = TTF_STYLE_BOLD;
  static const italic = TTF_STYLE_ITALIC;
  static const underline = TTF_STYLE_UNDERLINE;
  static const strikethrough = TTF_STYLE_STRIKETHROUGH;
}

/// {@category ttf}
class TtfkHinting {
  static const invalid = TTF_HINTING_INVALID;
  static const normal = TTF_HINTING_NORMAL;
  static const light = TTF_HINTING_LIGHT;
  static const mono = TTF_HINTING_MONO;
  static const none = TTF_HINTING_NONE;
  static const lightSubpixel = TTF_HINTING_LIGHT_SUBPIXEL;
}

/// {@category ttf}
class TtfkFontWeight {
  static const thin = TTF_FONT_WEIGHT_THIN;
  static const extraLight = TTF_FONT_WEIGHT_EXTRA_LIGHT;
  static const light = TTF_FONT_WEIGHT_LIGHT;
  static const normal = TTF_FONT_WEIGHT_NORMAL;
  static const medium = TTF_FONT_WEIGHT_MEDIUM;
  static const semiBold = TTF_FONT_WEIGHT_SEMI_BOLD;
  static const bold = TTF_FONT_WEIGHT_BOLD;
  static const extraBold = TTF_FONT_WEIGHT_EXTRA_BOLD;
  static const black = TTF_FONT_WEIGHT_BLACK;
  static const extraBlack = TTF_FONT_WEIGHT_EXTRA_BLACK;
}

/// {@category ttf}
class TtfkHorizontalAlign {
  static const invalid = TTF_HORIZONTAL_ALIGN_INVALID;
  static const left = TTF_HORIZONTAL_ALIGN_LEFT;
  static const center = TTF_HORIZONTAL_ALIGN_CENTER;
  static const right = TTF_HORIZONTAL_ALIGN_RIGHT;
}

/// {@category ttf}
class TtfkDirection {
  static const invalid = TTF_DIRECTION_INVALID;
  static const ltr = TTF_DIRECTION_LTR;
  static const rtl = TTF_DIRECTION_RTL;
  static const ttb = TTF_DIRECTION_TTB;
  static const btt = TTF_DIRECTION_BTT;
}

/// {@category ttf}
class TtfkImage {
  static const invalid = TTF_IMAGE_INVALID;
  static const alpha = TTF_IMAGE_ALPHA;
  static const color = TTF_IMAGE_COLOR;
  static const sdf = TTF_IMAGE_SDF;
}

/// {@category ttf}
class TtfkProp {
  static const fontCreateFilenameString = TTF_PROP_FONT_CREATE_FILENAME_STRING;
  static const fontCreateIostreamPointer =
      TTF_PROP_FONT_CREATE_IOSTREAM_POINTER;
  static const fontCreateIostreamOffsetNumber =
      TTF_PROP_FONT_CREATE_IOSTREAM_OFFSET_NUMBER;
  static const fontCreateIostreamAutocloseBoolean =
      TTF_PROP_FONT_CREATE_IOSTREAM_AUTOCLOSE_BOOLEAN;
  static const fontCreateSizeFloat = TTF_PROP_FONT_CREATE_SIZE_FLOAT;
  static const fontCreateFaceNumber = TTF_PROP_FONT_CREATE_FACE_NUMBER;
  static const fontCreateHorizontalDpiNumber =
      TTF_PROP_FONT_CREATE_HORIZONTAL_DPI_NUMBER;
  static const fontCreateVerticalDpiNumber =
      TTF_PROP_FONT_CREATE_VERTICAL_DPI_NUMBER;
  static const fontCreateExistingFontPointer =
      TTF_PROP_FONT_CREATE_EXISTING_FONT_POINTER;
  static const fontOutlineLineCapNumber = TTF_PROP_FONT_OUTLINE_LINE_CAP_NUMBER;
  static const fontOutlineLineJoinNumber =
      TTF_PROP_FONT_OUTLINE_LINE_JOIN_NUMBER;
  static const fontOutlineMiterLimitNumber =
      TTF_PROP_FONT_OUTLINE_MITER_LIMIT_NUMBER;
  static const rendererTextEngineRendererPointer =
      TTF_PROP_RENDERER_TEXT_ENGINE_RENDERER_POINTER;
  static const rendererTextEngineAtlasTextureSizeNumber =
      TTF_PROP_RENDERER_TEXT_ENGINE_ATLAS_TEXTURE_SIZE_NUMBER;
  static const gpuTextEngineDevicePointer =
      TTF_PROP_GPU_TEXT_ENGINE_DEVICE_POINTER;
  static const gpuTextEngineAtlasTextureSizeNumber =
      TTF_PROP_GPU_TEXT_ENGINE_ATLAS_TEXTURE_SIZE_NUMBER;
}

/// {@category ttf}
class TtfkGpuTextengineWinding {
  static const invalid = TTF_GPU_TEXTENGINE_WINDING_INVALID;
  static const clockwise = TTF_GPU_TEXTENGINE_WINDING_CLOCKWISE;
  static const counterClockwise = TTF_GPU_TEXTENGINE_WINDING_COUNTER_CLOCKWISE;
}

/// {@category ttf}
class TtfkSubstring {
  static const directionMask = TTF_SUBSTRING_DIRECTION_MASK;
  static const textStart = TTF_SUBSTRING_TEXT_START;
  static const lineStart = TTF_SUBSTRING_LINE_START;
  static const lineEnd = TTF_SUBSTRING_LINE_END;
  static const textEnd = TTF_SUBSTRING_TEXT_END;
}
