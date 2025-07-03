import 'package:shared_preferences/shared_preferences.dart';

class AppUtils {
  static const String _keyFirstOpen = 'isFirstOpen';

  // Check if the app is being opened for the first time
  static Future<bool> isFirstOpen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyFirstOpen) ??
        true; // Default to true if the key doesn't exist
  }

  // Mark the app as opened
  static Future<void> setAppOpened() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyFirstOpen, false);
  }
}
