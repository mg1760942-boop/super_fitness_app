import 'package:injectable/injectable.dart';

import '../../../../../../core/helpers/shared_pref/shared_pref_helper.dart';
import '../../../../../../core/helpers/shared_pref/shared_pref_keys.dart';
import 'auth_offline_data_source.dart';

@Injectable(as: AuthOfflineDataSource)
class AuthOfflineDataSourceImpl implements AuthOfflineDataSource {
  @override
  Future<void> saveToken({String? token}) async {
    if (token != null) {
      return await SharedPrefHelper.setSecureString(
          SharedPrefKeys.token, "Bearer $token");
    } else {
      throw Exception("Token Is Empty");
    }
  }

  @override
  Future<String> getToken() async {
    try {
      String? token =
          await SharedPrefHelper.getSecureString(SharedPrefKeys.token);
      if (token != null) {
        return token;
      } else {
        throw Exception("Token Is Empty");
      }
    } catch (e) {
      throw Exception("Token Is Empty");
    }
  }

  @override
  Future<String> getLanguage() async {
    try {
      String? language =
          await SharedPrefHelper.getString(SharedPrefKeys.language);
      if (language != null) {
        return language;
      } else {
        throw Exception("Language Is Empty");
      }
    } catch (e) {
      throw Exception("Language Is Empty");
    }
  }

  @override
  Future<void> saveLanguage({String? language}) async {
    if (language != null) {
      return await SharedPrefHelper.setDate(SharedPrefKeys.language, language);
    } else {
      throw Exception("Language Is Empty");
    }
  }
}
