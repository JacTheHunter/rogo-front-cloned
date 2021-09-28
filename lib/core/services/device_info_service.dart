import 'dart:io';

import 'package:device_info/device_info.dart';

class DeviceInfoService {
  late IosDeviceInfo iosDeviceInfo;
  late AndroidDeviceInfo androidDeviceInfo;
  late DeviceInfoPlugin _deviceInfo;

  Future<DeviceInfoService> init() async {
    _deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) iosDeviceInfo = await _deviceInfo.iosInfo;
    if (Platform.isAndroid) androidDeviceInfo = await _deviceInfo.androidInfo;
    return this;
  }

  String get deviceName {
    if (Platform.isIOS) {
      return iosDeviceInfo.name;
    } else {
      return androidDeviceInfo.model;
    }
  }

  String get deviceId {
    if (Platform.isIOS) {
      return iosDeviceInfo.identifierForVendor;
    } else {
      return androidDeviceInfo.androidId;
    }
  }

  String get type {
    if (Platform.isIOS) {
      return 'ios';
    } else {
      return 'android';
    }
  }
}
