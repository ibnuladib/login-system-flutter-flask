import 'dart:io' show Platform;
import 'package:device_info_plus/device_info_plus.dart';

class ApiConfig {
  static Future<String> getBaseUrl() async {
    String port = "5000";

    if (Platform.isAndroid) {
      final deviceInfo = DeviceInfoPlugin();
      final androidInfo = await deviceInfo.androidInfo;

      if (androidInfo.isPhysicalDevice) {
        return "http://192.168.1.100:$port"; 
      } else {
        return "http://10.0.2.2:$port";
      }
    } else if (Platform.isIOS) {
      final deviceInfo = DeviceInfoPlugin();
      final iosInfo = await deviceInfo.iosInfo;

      if (iosInfo.isPhysicalDevice) {
        return "http://192.168.1.100:$port"; 
      } else {
        return "http://127.0.0.1:$port";
      }
    } else {
      return "http://127.0.0.1:$port";
    }
  }
}
