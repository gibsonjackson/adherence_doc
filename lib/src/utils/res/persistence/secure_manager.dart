import 'package:shared_preferences/shared_preferences.dart';

class SecureStorageManager {
  Future<bool> putString(String key, String value) async {
    final SharedPreferences _storage = await SharedPreferences.getInstance();

    await _storage.setString(key, value);
    return true;
  }

  Future<String> getString(String key) async {
    final SharedPreferences _storage = await SharedPreferences.getInstance();

    String value = await _storage.getString(key);
    return value;
  }

  Future<bool> deleteAll() async {
    final SharedPreferences _storage = await SharedPreferences.getInstance();

    await _storage.clear();
    return true;
  }

  Future<bool> deleteValue(String key) async {
    final SharedPreferences _storage = await SharedPreferences.getInstance();

    await _storage.remove(key);
    return true;
  }

  // Future<Map<String, String>> getAllValues() async {
  //   final SharedPreferences _storage = await SharedPreferences.getInstance();

  //   Map<String, String> allValues = await _storage.readAll();
  //   return allValues;
  // }
}
