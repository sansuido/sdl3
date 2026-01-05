// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
// ignore_for_file: constant_identifier_names, specify_nonobvious_property_types
part of '../sdl_image.dart';

//const SDL_IMAGE_H_ = ;
const SDL_IMAGE_MAJOR_VERSION = 3;
const SDL_IMAGE_MINOR_VERSION = 3;
const SDL_IMAGE_MICRO_VERSION = 2;
//const SDL_IMAGE_VERSION = SDL_VERSIONNUM(SDL_IMAGE_MAJOR_VERSION, SDL_IMAGE_MINOR_VERSION, SDL_IMAGE_MICRO_VERSION);
//const SDL_IMAGE_VERSION_ATLEAST = (X, Y, Z) ((SDL_IMAGE_MAJOR_VERSION >= X) && (SDL_IMAGE_MAJOR_VERSION > X || SDL_IMAGE_MINOR_VERSION >= Y) && (SDL_IMAGE_MAJOR_VERSION > X || SDL_IMAGE_MINOR_VERSION > Y || SDL_IMAGE_MICRO_VERSION >= Z));
const IMG_PROP_ANIMATION_ENCODER_CREATE_FILENAME_STRING =
    'SDL_image.animation_encoder.create.filename';
const IMG_PROP_ANIMATION_ENCODER_CREATE_IOSTREAM_POINTER =
    'SDL_image.animation_encoder.create.iostream';
const IMG_PROP_ANIMATION_ENCODER_CREATE_IOSTREAM_AUTOCLOSE_BOOLEAN =
    'SDL_image.animation_encoder.create.iostream.autoclose';
const IMG_PROP_ANIMATION_ENCODER_CREATE_TYPE_STRING =
    'SDL_image.animation_encoder.create.type';
const IMG_PROP_ANIMATION_ENCODER_CREATE_QUALITY_NUMBER =
    'SDL_image.animation_encoder.create.quality';
const IMG_PROP_ANIMATION_ENCODER_CREATE_TIMEBASE_NUMERATOR_NUMBER =
    'SDL_image.animation_encoder.create.timebase.numerator';
const IMG_PROP_ANIMATION_ENCODER_CREATE_TIMEBASE_DENOMINATOR_NUMBER =
    'SDL_image.animation_encoder.create.timebase.denominator';
const IMG_PROP_ANIMATION_ENCODER_CREATE_AVIF_MAX_THREADS_NUMBER =
    'SDL_image.animation_encoder.create.avif.max_threads';
const IMG_PROP_ANIMATION_ENCODER_CREATE_AVIF_KEYFRAME_INTERVAL_NUMBER =
    'SDL_image.animation_encoder.create.avif.keyframe_interval';
const IMG_PROP_ANIMATION_ENCODER_CREATE_GIF_USE_LUT_BOOLEAN =
    'SDL_image.animation_encoder.create.gif.use_lut';
const IMG_DECODER_STATUS_INVALID = -1;
const IMG_DECODER_STATUS_OK = -1 + 1;
const IMG_DECODER_STATUS_FAILED = -1 + 2;
const IMG_DECODER_STATUS_COMPLETE = -1 + 3;
const IMG_PROP_ANIMATION_DECODER_CREATE_FILENAME_STRING =
    'SDL_image.animation_decoder.create.filename';
const IMG_PROP_ANIMATION_DECODER_CREATE_IOSTREAM_POINTER =
    'SDL_image.animation_decoder.create.iostream';
const IMG_PROP_ANIMATION_DECODER_CREATE_IOSTREAM_AUTOCLOSE_BOOLEAN =
    'SDL_image.animation_decoder.create.iostream.autoclose';
const IMG_PROP_ANIMATION_DECODER_CREATE_TYPE_STRING =
    'SDL_image.animation_decoder.create.type';
const IMG_PROP_ANIMATION_DECODER_CREATE_TIMEBASE_NUMERATOR_NUMBER =
    'SDL_image.animation_decoder.create.timebase.numerator';
const IMG_PROP_ANIMATION_DECODER_CREATE_TIMEBASE_DENOMINATOR_NUMBER =
    'SDL_image.animation_decoder.create.timebase.denominator';
const IMG_PROP_ANIMATION_DECODER_CREATE_AVIF_MAX_THREADS_NUMBER =
    'SDL_image.animation_decoder.create.avif.max_threads';
const IMG_PROP_ANIMATION_DECODER_CREATE_AVIF_ALLOW_INCREMENTAL_BOOLEAN =
    'SDL_image.animation_decoder.create.avif.allow_incremental';
const IMG_PROP_ANIMATION_DECODER_CREATE_AVIF_ALLOW_PROGRESSIVE_BOOLEAN =
    'SDL_image.animation_decoder.create.avif.allow_progressive';
const IMG_PROP_ANIMATION_DECODER_CREATE_GIF_TRANSPARENT_COLOR_INDEX_NUMBER =
    'SDL_image.animation_encoder.create.gif.transparent_color_index';
const IMG_PROP_ANIMATION_DECODER_CREATE_GIF_NUM_COLORS_NUMBER =
    'SDL_image.animation_encoder.create.gif.num_colors';
const IMG_PROP_METADATA_IGNORE_PROPS_BOOLEAN =
    'SDL_image.metadata.ignore_props';
const IMG_PROP_METADATA_DESCRIPTION_STRING = 'SDL_image.metadata.description';
const IMG_PROP_METADATA_COPYRIGHT_STRING = 'SDL_image.metadata.copyright';
const IMG_PROP_METADATA_TITLE_STRING = 'SDL_image.metadata.title';
const IMG_PROP_METADATA_AUTHOR_STRING = 'SDL_image.metadata.author';
const IMG_PROP_METADATA_CREATION_TIME_STRING =
    'SDL_image.metadata.creation_time';
const IMG_PROP_METADATA_FRAME_COUNT_NUMBER = 'SDL_image.metadata.frame_count';
const IMG_PROP_METADATA_LOOP_COUNT_NUMBER = 'SDL_image.metadata.loop_count';

/// {@category image}
class ImgkPropAnimationEncoderCreate {
  static const filenameString =
      IMG_PROP_ANIMATION_ENCODER_CREATE_FILENAME_STRING;
  static const iostreamPointer =
      IMG_PROP_ANIMATION_ENCODER_CREATE_IOSTREAM_POINTER;
  static const iostreamAutocloseBoolean =
      IMG_PROP_ANIMATION_ENCODER_CREATE_IOSTREAM_AUTOCLOSE_BOOLEAN;
  static const typeString = IMG_PROP_ANIMATION_ENCODER_CREATE_TYPE_STRING;
  static const qualityNumber = IMG_PROP_ANIMATION_ENCODER_CREATE_QUALITY_NUMBER;
  static const timebaseNumeratorNumber =
      IMG_PROP_ANIMATION_ENCODER_CREATE_TIMEBASE_NUMERATOR_NUMBER;
  static const timebaseDenominatorNumber =
      IMG_PROP_ANIMATION_ENCODER_CREATE_TIMEBASE_DENOMINATOR_NUMBER;
  static const avifMaxThreadsNumber =
      IMG_PROP_ANIMATION_ENCODER_CREATE_AVIF_MAX_THREADS_NUMBER;
  static const avifKeyframeIntervalNumber =
      IMG_PROP_ANIMATION_ENCODER_CREATE_AVIF_KEYFRAME_INTERVAL_NUMBER;
  static const gifUseLutBoolean =
      IMG_PROP_ANIMATION_ENCODER_CREATE_GIF_USE_LUT_BOOLEAN;
}

/// {@category image}
class ImgkDecoderStatus {
  static const invalid = IMG_DECODER_STATUS_INVALID;
  static const ok = IMG_DECODER_STATUS_OK;
  static const failed = IMG_DECODER_STATUS_FAILED;
  static const complete = IMG_DECODER_STATUS_COMPLETE;
}

/// {@category image}
class ImgkPropAnimationDecoderCreate {
  static const filenameString =
      IMG_PROP_ANIMATION_DECODER_CREATE_FILENAME_STRING;
  static const iostreamPointer =
      IMG_PROP_ANIMATION_DECODER_CREATE_IOSTREAM_POINTER;
  static const iostreamAutocloseBoolean =
      IMG_PROP_ANIMATION_DECODER_CREATE_IOSTREAM_AUTOCLOSE_BOOLEAN;
  static const typeString = IMG_PROP_ANIMATION_DECODER_CREATE_TYPE_STRING;
  static const timebaseNumeratorNumber =
      IMG_PROP_ANIMATION_DECODER_CREATE_TIMEBASE_NUMERATOR_NUMBER;
  static const timebaseDenominatorNumber =
      IMG_PROP_ANIMATION_DECODER_CREATE_TIMEBASE_DENOMINATOR_NUMBER;
  static const avifMaxThreadsNumber =
      IMG_PROP_ANIMATION_DECODER_CREATE_AVIF_MAX_THREADS_NUMBER;
  static const avifAllowIncrementalBoolean =
      IMG_PROP_ANIMATION_DECODER_CREATE_AVIF_ALLOW_INCREMENTAL_BOOLEAN;
  static const avifAllowProgressiveBoolean =
      IMG_PROP_ANIMATION_DECODER_CREATE_AVIF_ALLOW_PROGRESSIVE_BOOLEAN;
  static const gifTransparentColorIndexNumber =
      IMG_PROP_ANIMATION_DECODER_CREATE_GIF_TRANSPARENT_COLOR_INDEX_NUMBER;
  static const gifNumColorsNumber =
      IMG_PROP_ANIMATION_DECODER_CREATE_GIF_NUM_COLORS_NUMBER;
}

/// {@category image}
class ImgkPropMetadata {
  static const ignorePropsBoolean = IMG_PROP_METADATA_IGNORE_PROPS_BOOLEAN;
  static const descriptionString = IMG_PROP_METADATA_DESCRIPTION_STRING;
  static const copyrightString = IMG_PROP_METADATA_COPYRIGHT_STRING;
  static const titleString = IMG_PROP_METADATA_TITLE_STRING;
  static const authorString = IMG_PROP_METADATA_AUTHOR_STRING;
  static const creationTimeString = IMG_PROP_METADATA_CREATION_TIME_STRING;
  static const frameCountNumber = IMG_PROP_METADATA_FRAME_COUNT_NUMBER;
  static const loopCountNumber = IMG_PROP_METADATA_LOOP_COUNT_NUMBER;
}
