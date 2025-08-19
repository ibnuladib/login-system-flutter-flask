import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform; 

Future<String> getBaseUrl() async {
  if (kIsWeb) {
    return "http://localhost:5000"; 
  }

  if (Platform.isAndroid) {
    return "http://10.0.2.2:5000"; 
  } else if (Platform.isIOS) {
    return "http://127.0.0.1:5000"; 
  } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    return "http://localhost:5000"; 
  }

  return "http://localhost:5000"; 
}
