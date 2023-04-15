import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jolt/flutter_jolt_utilities.dart';

extension DeviceExtensions on BuildContext {
  String? get deviceId => jolt.deviceId;
}

Future<String?> getDeviceID() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  switch (JoltPlatform.platform) {
    case JoltTargetPlatform.iOS:
      final iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor;
    case JoltTargetPlatform.android:
      final androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id;
    case JoltTargetPlatform.macOS:
      final macosInfo = await deviceInfo.macOsInfo;
      return macosInfo.systemGUID;
    case JoltTargetPlatform.windows:
      final windowsInfo = await deviceInfo.windowsInfo;
      return windowsInfo.computerName;
    case JoltTargetPlatform.linux:
      final linuxInfo = await deviceInfo.linuxInfo;
      return linuxInfo.machineId;
    case JoltTargetPlatform.web:
    case JoltTargetPlatform.unknown:
      return null;
  }
}
