part of '../../../sdl.dart';

///
/// Open a HID device using a Vendor ID (VID), Product ID (PID) and optionally
/// a serial number.
///
/// If `serial_number` is NULL, the first device with the specified VID and PID
/// is opened.
///
/// \param vendor_id the Vendor ID (VID) of the device to open.
/// \param product_id the Product ID (PID) of the device to open.
/// \param serial_number the Serial Number of the device to open (Optionally
/// NULL).
/// \returns a pointer to a SDL_hid_device object on success or NULL on
/// failure; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_hid_device * SDLCALL SDL_hid_open(unsigned short vendor_id, unsigned short product_id, const wchar_t *serial_number)
/// ```
/// {@category hidapi}
Pointer<SdlHidDevice> sdlxHidOpen(
  int vendorId,
  int productId,
  String serialNumber,
) {
  final serialNumberPointer = serialNumber.toNativeWChar();
  final result = sdlHidOpen(vendorId, productId, serialNumberPointer);
  serialNumberPointer.callocFree();
  return result;
}

///
/// Write an Output report to a HID device.
///
/// The first byte of `data` must contain the Report ID. For devices which only
/// support a single report, this must be set to 0x0. The remaining bytes
/// contain the report data. Since the Report ID is mandatory, calls to
/// SDL_hid_write() will always contain one more byte than the report contains.
/// For example, if a hid report is 16 bytes long, 17 bytes must be passed to
/// SDL_hid_write(), the Report ID (or 0x0, for devices with a single report),
/// followed by the report data (16 bytes). In this example, the length passed
/// in would be 17.
///
/// SDL_hid_write() will send the data on the first OUT endpoint, if one
/// exists. If it does not, it will send the data through the Control Endpoint
/// (Endpoint 0).
///
/// \param dev a device handle returned from SDL_hid_open().
/// \param data the data to send, including the report number as the first
/// byte.
/// \param length the length in bytes of the data to send.
/// \returns the actual number of bytes written and -1 on on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_hid_write(SDL_hid_device *dev, const unsigned char *data, size_t length)
/// ```
/// {@category hidapi}
int sdlxHidWrite(
  Pointer<SdlHidDevice> dev,
  Uint8List data, {
  int reportId = 0x00,
}) {
  final dataPointer = ffi.calloc<Uint8>(data.length + 1);
  dataPointer[0] = reportId;
  dataPointer.asTypedList(data.length + 1).setAll(1, data);
  final result = sdlHidWrite(dev, dataPointer, data.length + 1);
  dataPointer.callocFree();
  return result;
}

///
/// Read an Input report from a HID device with timeout.
///
/// Input reports are returned to the host through the INTERRUPT IN endpoint.
/// The first byte will contain the Report number if the device uses numbered
/// reports.
///
/// \param dev a device handle returned from SDL_hid_open().
/// \param data a buffer to put the read data into.
/// \param length the number of bytes to read. For devices with multiple
/// reports, make sure to read an extra byte for the report
/// number.
/// \param milliseconds timeout in milliseconds or -1 for blocking wait.
/// \returns the actual number of bytes read and -1 on on failure; call
/// SDL_GetError() for more information. If no packet was available to
/// be read within the timeout period, this function returns 0.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_hid_read_timeout(SDL_hid_device *dev, unsigned char *data, size_t length, int milliseconds)
/// ```
/// {@category hidapi}
({int bytes, Uint8List data, int reportId}) sdlxHidReadTimeout(
  Pointer<SdlHidDevice> dev,
  int length,
  int milliseconds,
) {
  var bytes = 0;
  var reportId = 0;
  late Uint8List data;
  final totalLength = length + 1;
  final dataPointer = ffi.calloc<Uint8>(totalLength);
  bytes = sdlHidReadTimeout(dev, dataPointer, totalLength, milliseconds);
  if (bytes > 0) {
    reportId = dataPointer[0];
    if (bytes > 1) {
      data = Uint8List.fromList(dataPointer.asTypedList(bytes).sublist(1));
    } else {
      data = Uint8List(0);
    }
  } else {
    data = Uint8List(0);
  }
  dataPointer.callocFree();
  return (bytes: bytes, data: data, reportId: reportId);
}

///
/// Read an Input report from a HID device.
///
/// Input reports are returned to the host through the INTERRUPT IN endpoint.
/// The first byte will contain the Report number if the device uses numbered
/// reports.
///
/// \param dev a device handle returned from SDL_hid_open().
/// \param data a buffer to put the read data into.
/// \param length the number of bytes to read. For devices with multiple
/// reports, make sure to read an extra byte for the report
/// number.
/// \returns the actual number of bytes read and -1 on failure; call
/// SDL_GetError() for more information. If no packet was available to
/// be read and the handle is in non-blocking mode, this function
/// returns 0.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_hid_read(SDL_hid_device *dev, unsigned char *data, size_t length)
/// ```
/// {@category hidapi}
({int bytes, Uint8List data, int reportId}) sdlxHidRead(
  Pointer<SdlHidDevice> dev,
  int length,
) {
  var bytes = 0;
  var reportId = 0;
  late Uint8List data;
  final totalLength = length + 1;
  final dataPointer = ffi.calloc<Uint8>(totalLength);
  bytes = sdlHidRead(dev, dataPointer, totalLength);
  if (bytes > 0) {
    reportId = dataPointer[0];
    if (bytes > 1) {
      data = Uint8List.fromList(dataPointer.asTypedList(bytes).sublist(1));
    } else {
      data = Uint8List(0);
    }
  } else {
    data = Uint8List(0);
  }
  dataPointer.callocFree();
  return (bytes: bytes, data: data, reportId: reportId);
}

///
/// Send a Feature report to the device.
///
/// Feature reports are sent over the Control endpoint as a Set_Report
/// transfer. The first byte of `data` must contain the Report ID. For devices
/// which only support a single report, this must be set to 0x0. The remaining
/// bytes contain the report data. Since the Report ID is mandatory, calls to
/// SDL_hid_send_feature_report() will always contain one more byte than the
/// report contains. For example, if a hid report is 16 bytes long, 17 bytes
/// must be passed to SDL_hid_send_feature_report(): the Report ID (or 0x0, for
/// devices which do not use numbered reports), followed by the report data (16
/// bytes). In this example, the length passed in would be 17.
///
/// \param dev a device handle returned from SDL_hid_open().
/// \param data the data to send, including the report number as the first
/// byte.
/// \param length the length in bytes of the data to send, including the report
/// number.
/// \returns the actual number of bytes written and -1 on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_hid_send_feature_report(SDL_hid_device *dev, const unsigned char *data, size_t length)
/// ```
/// {@category hidapi}
int sdlxHidSendFeatureReport(
  Pointer<SdlHidDevice> dev,
  Uint8List data, {
  int reportId = 0x00,
}) {
  final dataPointer = ffi.calloc<Uint8>(data.length + 1);
  dataPointer[0] = reportId;
  dataPointer.asTypedList(data.length + 1).setAll(1, data);
  final result = sdlHidSendFeatureReport(dev, dataPointer, data.length + 1);
  dataPointer.callocFree();
  return result;
}

///
/// Get a feature report from a HID device.
///
/// Set the first byte of `data` to the Report ID of the report to be read.
/// Make sure to allow space for this extra byte in `data`. Upon return, the
/// first byte will still contain the Report ID, and the report data will start
/// in data[1].
///
/// \param dev a device handle returned from SDL_hid_open().
/// \param data a buffer to put the read data into, including the Report ID.
/// Set the first byte of `data` to the Report ID of the report to
/// be read, or set it to zero if your device does not use numbered
/// reports.
/// \param length the number of bytes to read, including an extra byte for the
/// report ID. The buffer can be longer than the actual report.
/// \returns the number of bytes read plus one for the report ID (which is
/// still in the first byte), or -1 on on failure; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_hid_get_feature_report(SDL_hid_device *dev, unsigned char *data, size_t length)
/// ```
/// {@category hidapi}
({int bytes, Uint8List data, int reportId}) sdlxHidGetFeatureReport(
  Pointer<SdlHidDevice> dev,
  int length,
) {
  var bytes = 0;
  var reportId = 0;
  late Uint8List data;
  final totalLength = length + 1;
  final dataPointer = ffi.calloc<Uint8>(totalLength);
  bytes = sdlHidGetFeatureReport(dev, dataPointer, totalLength);
  if (bytes > 0) {
    reportId = dataPointer[0];
    if (bytes > 1) {
      data = Uint8List.fromList(dataPointer.asTypedList(bytes).sublist(1));
    } else {
      data = Uint8List(0);
    }
  } else {
    data = Uint8List(0);
  }
  dataPointer.callocFree();
  return (bytes: bytes, data: data, reportId: reportId);
}

///
/// Get an input report from a HID device.
///
/// Set the first byte of `data` to the Report ID of the report to be read.
/// Make sure to allow space for this extra byte in `data`. Upon return, the
/// first byte will still contain the Report ID, and the report data will start
/// in data[1].
///
/// \param dev a device handle returned from SDL_hid_open().
/// \param data a buffer to put the read data into, including the Report ID.
/// Set the first byte of `data` to the Report ID of the report to
/// be read, or set it to zero if your device does not use numbered
/// reports.
/// \param length the number of bytes to read, including an extra byte for the
/// report ID. The buffer can be longer than the actual report.
/// \returns the number of bytes read plus one for the report ID (which is
/// still in the first byte), or -1 on on failure; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_hid_get_input_report(SDL_hid_device *dev, unsigned char *data, size_t length)
/// ```
/// {@category hidapi}
({int bytes, Uint8List data, int reportId}) sdlxHidGetInputReport(
  Pointer<SdlHidDevice> dev,
  int length,
) {
  var bytes = 0;
  var reportId = 0;
  late Uint8List data;
  final totalLength = length + 1;
  final dataPointer = ffi.calloc<Uint8>(totalLength);
  bytes = sdlHidGetInputReport(dev, dataPointer, totalLength);
  if (bytes > 0) {
    reportId = dataPointer[0];
    if (bytes > 1) {
      data = Uint8List.fromList(dataPointer.asTypedList(bytes).sublist(1));
    } else {
      data = Uint8List(0);
    }
  } else {
    data = Uint8List(0);
  }
  dataPointer.callocFree();
  return (bytes: bytes, data: data, reportId: reportId);
}

///
/// Get The Manufacturer String from a HID device.
///
/// \param dev a device handle returned from SDL_hid_open().
/// \param string a wide string buffer to put the data into.
/// \param maxlen the length of the buffer in multiples of wchar_t.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_hid_get_manufacturer_string(SDL_hid_device *dev, wchar_t *string, size_t maxlen)
/// ```
/// {@category hidapi}
String? sdlxHidGetManufacturerString(
  Pointer<SdlHidDevice> dev, {
  int maxlen = 256,
}) {
  String? result;
  final stringPointer = ffi.calloc<WChar>(maxlen);
  final errorcode = sdlHidGetManufacturerString(dev, stringPointer, maxlen);
  if (errorcode == 0) {
    result = stringPointer.toDartString();
    if (result.isEmpty) {
      result = null;
    }
  } else {
    result = null;
  }
  stringPointer.callocFree();
  return result;
}

///
/// Get The Product String from a HID device.
///
/// \param dev a device handle returned from SDL_hid_open().
/// \param string a wide string buffer to put the data into.
/// \param maxlen the length of the buffer in multiples of wchar_t.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_hid_get_product_string(SDL_hid_device *dev, wchar_t *string, size_t maxlen)
/// ```
/// {@category hidapi}
String? sdlxHidGetProductString(Pointer<SdlHidDevice> dev, {int maxlen = 256}) {
  String? result;
  final stringPointer = ffi.calloc<WChar>(maxlen);
  final errorcode = sdlHidGetProductString(dev, stringPointer, maxlen);
  if (errorcode == 0) {
    result = stringPointer.toDartString();
    if (result.isEmpty) {
      result = null;
    }
  } else {
    result = null;
  }
  stringPointer.callocFree();
  return result;
}

///
/// Get The Serial Number String from a HID device.
///
/// \param dev a device handle returned from SDL_hid_open().
/// \param string a wide string buffer to put the data into.
/// \param maxlen the length of the buffer in multiples of wchar_t.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_hid_get_serial_number_string(SDL_hid_device *dev, wchar_t *string, size_t maxlen)
/// ```
/// {@category hidapi}
String? sdlxHidGetSerialNumberString(
  Pointer<SdlHidDevice> dev, {
  int maxlen = 256,
}) {
  String? result;
  final stringPointer = ffi.calloc<WChar>(maxlen);
  final errorcode = sdlHidGetSerialNumberString(dev, stringPointer, maxlen);
  if (errorcode == 0) {
    result = stringPointer.toDartString();
    if (result.isEmpty) {
      result = null;
    }
  } else {
    result = null;
  }
  stringPointer.callocFree();
  return result;
}

///
/// Get a string from a HID device, based on its string index.
///
/// \param dev a device handle returned from SDL_hid_open().
/// \param string_index the index of the string to get.
/// \param string a wide string buffer to put the data into.
/// \param maxlen the length of the buffer in multiples of wchar_t.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_hid_get_indexed_string(SDL_hid_device *dev, int string_index, wchar_t *string, size_t maxlen)
/// ```
/// {@category hidapi}
String? sdlxHidGetIndexedString(
  Pointer<SdlHidDevice> dev,
  int stringIndex, {
  int maxlen = 256,
}) {
  String? result;
  final stringPointer = ffi.calloc<WChar>(maxlen);
  final errorcode = sdlHidGetIndexedString(
    dev,
    stringIndex,
    stringPointer,
    maxlen,
  );
  if (errorcode == 0) {
    result = stringPointer.toDartString();
    if (result.isEmpty) {
      result = null;
    }
  } else {
    result = null;
  }
  stringPointer.callocFree();
  return result;
}

///
/// Get a report descriptor from a HID device.
///
/// User has to provide a preallocated buffer where descriptor will be copied
/// to. The recommended size for a preallocated buffer is 4096 bytes.
///
/// \param dev a device handle returned from SDL_hid_open().
/// \param buf the buffer to copy descriptor into.
/// \param buf_size the size of the buffer in bytes.
/// \returns the number of bytes actually copied or -1 on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_hid_get_report_descriptor(SDL_hid_device *dev, unsigned char *buf, size_t buf_size)
/// ```
/// {@category hidapi}
Uint8List sdlxHidGetReportDescriptor(
  Pointer<SdlHidDevice> dev, {
  int bufSize = 4096,
}) {
  var bytes = 0;
  late Uint8List data;
  final dataPointer = ffi.calloc<Uint8>(bufSize);
  bytes = sdlHidGetReportDescriptor(dev, dataPointer, bufSize);
  if (bytes > 0) {
    data = Uint8List.fromList(dataPointer.asTypedList(bytes).sublist(0));
  } else {
    data = Uint8List(0);
  }
  dataPointer.callocFree();
  return data;
}
