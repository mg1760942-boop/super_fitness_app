
import 'package:flutter_test/flutter_test.dart';
import 'package:super_fitness_app/src/data/data_source/offline_data_source/auth/auth_offline_data_source/auth_offline_data_source.dart';
import 'package:super_fitness_app/src/data/data_source/offline_data_source/auth/auth_offline_data_source/auth_offline_data_source_impl.dart';

/*
*   @override
  Future<void> saveToken({required String? token}) async {
    if (token != null) {
      return await SharedPrefHelper.setSecureString(
          SharedPrefKeys.tokeKey, "Bearer $token");
    } else {
      throw Exception("Token Is Empty");
    }
  }

* */
void main() {
    TestWidgetsFlutterBinding.ensureInitialized();

    AuthOfflineDataSource authOfflineDataSource=AuthOfflineDataSourceImpl();
    test('should save token when call authOfflineDataSource.saveToken is not Empty ',() async{
      var token="token";
      expect(() async => await authOfflineDataSource.saveToken(token: token), isA<void>());
    });
    test("should throw Exception when call authOfflineDataSource.saveToken is Empty ", () async{
        expect(() async => await authOfflineDataSource.saveToken(token: null),  throwsA(isA<Exception>()));
    });
    }
