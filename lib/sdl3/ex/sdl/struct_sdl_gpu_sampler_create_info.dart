part of '../../sdl.dart';

class SdlxGpuSamplerCreateInfo {
  SdlxGpuSamplerCreateInfo({
    this.minFilter = 0,
    this.magFilter = 0,
    this.mipmapMode = 0,
    this.addressModeU = 0,
    this.addressModeV = 0,
    this.addressModeW = 0,
    this.mipLodBias = 0,
    this.maxAnisotropy = 0,
    this.compareOp = 0,
    this.minLod = 0,
    this.maxLod = 0,
    this.enableAnisotropy = false,
    this.enableCompare = false,
    this.padding1 = 0,
    this.padding2 = 0,
    this.props = 0,
  });
  int minFilter;
  int magFilter;
  int mipmapMode;
  int addressModeU;
  int addressModeV;
  int addressModeW;
  double mipLodBias;
  double maxAnisotropy;
  int compareOp;
  double minLod;
  double maxLod;
  bool enableAnisotropy;
  bool enableCompare;
  int padding1;
  int padding2;
  int props;

  Pointer<SdlGpuSamplerCreateInfo> calloc() {
    final pointer = ffi.calloc<SdlGpuSamplerCreateInfo>();
    pointer.ref.minFilter = minFilter;
    pointer.ref.magFilter = magFilter;
    pointer.ref.mipmapMode = mipmapMode;
    pointer.ref.addressModeU = addressModeU;
    pointer.ref.addressModeV = addressModeV;
    pointer.ref.addressModeW = addressModeW;
    pointer.ref.mipLodBias = mipLodBias;
    pointer.ref.maxAnisotropy = maxAnisotropy;
    pointer.ref.compareOp = compareOp;
    pointer.ref.minLod = minLod;
    pointer.ref.maxLod = maxLod;
    pointer.ref.enableAnisotropy = enableAnisotropy;
    pointer.ref.enableCompare = enableCompare;
    pointer.ref.padding1 = padding1;
    pointer.ref.padding2 = padding2;
    pointer.ref.props = props;
    return pointer;
  }
}
