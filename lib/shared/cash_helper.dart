import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putData(String key, bool value) async {
    return await _preferences?.setBool(key, value) ?? false;
  }

  static bool? getData(String key) {
    return _preferences?.getBool(key);
  }
}