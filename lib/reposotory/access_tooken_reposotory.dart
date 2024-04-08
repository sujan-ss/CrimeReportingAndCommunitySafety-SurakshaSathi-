import 'package:suraksha_saathi/reposotory/local_storage_reposotory.dart';

class AccessTokenRepo {
  static final LocalStorage _localStorage = LocalStorage();
  static Future<void> saveAccessToken(String token) async {
    await _localStorage.saveData('access_token', token);
  }

  static Future<String?> getAccessToken() async {
    return _localStorage.getData('access_token');
  }

  static Future<void> removeAccessToken() async {
    await _localStorage.removeData('access_token');
  }
}
