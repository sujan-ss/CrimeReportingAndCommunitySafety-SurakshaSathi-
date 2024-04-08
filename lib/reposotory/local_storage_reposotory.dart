import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  late SharedPreferences _pref;

  LocalStorage() {
    init();
  }

  Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  Future<void> saveData(String key, String value) async {
    await _pref.setString(key, value);
  }

  Future<String?> getData(String key) async {
    return _pref.getString(key);
  }

  Future<void> removeData(String key) async {
    await _pref.remove(key);
  }

  Future<void> clearData() async {
    await _pref.clear();
  }

  Future<void> saveBool(String key, bool value) async {
    await _pref.setBool(key, value);
  }

  Future<bool?> getBool(String key) async {
    return _pref.getBool(key);
  }
}
