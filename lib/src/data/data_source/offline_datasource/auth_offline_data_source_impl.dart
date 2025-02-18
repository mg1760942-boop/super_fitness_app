import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/core/helpers/shared_pref/shared_pref_keys.dart';
import 'package:super_fitness_app/src/data/data_source/offline_datasource/auth_offline_data_source.dart';

import '../../../../core/helpers/shared_pref/shared_pref_helper.dart';

@Injectable(as: AuthOfflineDataSource)
class AuthOfflineDataSourceImpl implements AuthOfflineDataSource {
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
  Future<void> saveToken(String token) async {
    return await SharedPrefHelper.setSecureString(
        SharedPrefKeys.token, "Bearer $token");
  }
}
