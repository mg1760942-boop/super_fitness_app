import 'package:injectable/injectable.dart';
import '../../../../../../core/helpers/shared_pref/shared_pref_helper.dart';
import '../../../../../../core/helpers/shared_pref/shared_pref_keys.dart';
import 'auth_offline_data_source.dart';

@Injectable(as: AuthOfflineDataSource)
class AuthOfflineDataSourceImpl implements AuthOfflineDataSource {
  @override
  Future<void> saveToken({ String? token}) async {
    if (token != null) {
      return await SharedPrefHelper.setSecureString(
          SharedPrefKeys.tokeKey, "Bearer $token");
    } else {
      throw Exception("Token Is Empty");
    }
  }

}
