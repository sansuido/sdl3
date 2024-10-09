// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
// ignore_for_file: constant_identifier_names
//const SDL_TTF_H_ = ;
const SDL_TTF_MAJOR_VERSION = 3;
const SDL_TTF_MINOR_VERSION = 0;
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
const TTF_PROP_FONT_FACE_POINTER = 'SDL_ttf.font.face';
const TTF_STYLE_NORMAL = 0x00;
const TTF_STYLE_BOLD = 0x01;
const TTF_STYLE_ITALIC = 0x02;
const TTF_STYLE_UNDERLINE = 0x04;
const TTF_STYLE_STRIKETHROUGH = 0x08;
const TTF_HINTING_NORMAL = 0;
const TTF_HINTING_LIGHT = 1;
const TTF_HINTING_MONO = 2;
const TTF_HINTING_NONE = 3;
const TTF_HINTING_LIGHT_SUBPIXEL = 4;
const TTF_HORIZONTAL_ALIGN_INVALID = -1;
const TTF_HORIZONTAL_ALIGN_LEFT = -1 + 1;
const TTF_HORIZONTAL_ALIGN_CENTER = -1 + 2;
const TTF_HORIZONTAL_ALIGN_RIGHT = -1 + 3;
const TTF_DIRECTION_LTR = 0;
const TTF_DIRECTION_RTL = 0 + 1;
const TTF_DIRECTION_TTB = 0 + 2;
const TTF_DIRECTION_BTT = 0 + 3;

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
  static const facePointer = TTF_PROP_FONT_FACE_POINTER;
}

class TtfkStyle {
  static const normal = TTF_STYLE_NORMAL;
  static const bold = TTF_STYLE_BOLD;
  static const italic = TTF_STYLE_ITALIC;
  static const underline = TTF_STYLE_UNDERLINE;
  static const strikethrough = TTF_STYLE_STRIKETHROUGH;
}

class TtfkHinting {
  static const normal = TTF_HINTING_NORMAL;
  static const light = TTF_HINTING_LIGHT;
  static const mono = TTF_HINTING_MONO;
  static const none = TTF_HINTING_NONE;
  static const lightSubpixel = TTF_HINTING_LIGHT_SUBPIXEL;
}

class TtfkHorizontalAlign {
  static const invalid = TTF_HORIZONTAL_ALIGN_INVALID;
  static const left = TTF_HORIZONTAL_ALIGN_LEFT;
  static const center = TTF_HORIZONTAL_ALIGN_CENTER;
  static const right = TTF_HORIZONTAL_ALIGN_RIGHT;
}

class TtfkDirection {
  static const ltr = TTF_DIRECTION_LTR;
  static const rtl = TTF_DIRECTION_RTL;
  static const ttb = TTF_DIRECTION_TTB;
  static const btt = TTF_DIRECTION_BTT;
}
