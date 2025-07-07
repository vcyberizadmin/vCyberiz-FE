import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Future<bool> checkBrowser() async {
  if (kIsWeb) {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
    return webBrowserInfo.browserName.name.toLowerCase() == 'safari';
  }

  return false;
}
