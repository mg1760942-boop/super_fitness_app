abstract interface class AuthOfflineDataSource {
  Future<void> saveToken({String? token});
  Future<String> getToken();
  Future<void> saveLanguage({String? language});
  Future<String> getLanguage();
}
