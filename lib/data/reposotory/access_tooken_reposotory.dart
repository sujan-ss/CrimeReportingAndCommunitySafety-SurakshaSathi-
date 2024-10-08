import 'package:suraksha_saathi/data/reposotory/local_storage_reposotory.dart';

class AccessTokenRepo {
  final LocalStorage _localStorage = LocalStorage();
  Future<void> saveAccessToken(String token) async {
    await _localStorage.saveData('access_token', token);
  }

  Future<String?> getAccessToken() async {
    return _localStorage.getData('access_token');
  }

  Future<void> removeAccessToken() async {
    await _localStorage.removeData('access_token');
  }
}
