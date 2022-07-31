import 'package:device_info_plus/device_info_plus.dart';
import 'package:universal_platform/universal_platform.dart';

Future<String?> getDeviceID() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  // iOS device info
  if (UniversalPlatform.isIOS) {
    final iosInfo = await deviceInfo.iosInfo;
    return iosInfo.identifierForVendor;
  }
  // Android device info
  else if (UniversalPlatform.isAndroid) {
    final androidInfo = await deviceInfo.androidInfo;
    return androidInfo.androidId;
  }
  // MacOS device info
  else if (UniversalPlatform.isMacOS) {
    final macosInfo = await deviceInfo.macOsInfo;
    return macosInfo.systemGUID;
  }
  // Windows device info
  else if (UniversalPlatform.isWindows) {
    final windowsInfo = await deviceInfo.windowsInfo;
    return windowsInfo.computerName;
  }
  // Linux device info
  else if (UniversalPlatform.isLinux) {
    final linuxInfo = await deviceInfo.linuxInfo;
    return linuxInfo.machineId;
  }
  // Unsupported Platform
  else {
    return null;
  }
}
