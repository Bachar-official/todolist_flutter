import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

String getDeviceId() {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    String id = '';
    deviceInfo.androidInfo.then((value) => id = value.id);
    return id;
  }
  if (Platform.isIOS) {
    String id = '';
    deviceInfo.iosInfo.then((value) => id = value.identifierForVendor ?? '');
    return id;
  } else {
    throw Exception('Unsupported platform');
  }
}