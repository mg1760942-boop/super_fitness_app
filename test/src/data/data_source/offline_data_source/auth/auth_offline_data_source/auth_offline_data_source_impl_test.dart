import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:super_fitness_app/src/data/data_source/offline_data_source/auth/auth_offline_data_source/auth_offline_data_source.dart';
import 'package:super_fitness_app/src/data/data_source/offline_data_source/auth/auth_offline_data_source/auth_offline_data_source_impl.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const MethodChannel secureStorageChannel =
      MethodChannel('plugins.it_nomads.com/flutter_secure_storage');

  secureStorageChannel.setMockMethodCallHandler((MethodCall methodCall) async {
    if (methodCall.method == 'write') {
      return null;
    } else if (methodCall.method == 'read') {
      return "Bearer token";
    } else if (methodCall.method == 'delete') {
      return null;
    }
    return null;
  });

  group('AuthOfflineDataSource', () {
    late AuthOfflineDataSource authOfflineDataSource;

    setUp(() {
      authOfflineDataSource = AuthOfflineDataSourceImpl();
    });

    group('saveToken', () {
      test('should save token when a non-null token is provided', () async {
        const token = "token";

        await authOfflineDataSource.saveToken(token: token);

        final storedToken = await authOfflineDataSource.getToken();
        expect(storedToken, equals("Bearer $token"));
      });

      test('should throw Exception when a null token is provided', () async {
        expect(() async => await authOfflineDataSource.saveToken(token: null),
            throwsA(isA<Exception>()));
      });
    });

    group('getToken', () {
      test('should return the saved token if it exists', () async {
        const token = "token";
        await authOfflineDataSource.saveToken(token: token);

        final result = await authOfflineDataSource.getToken();

        expect(result, equals("Bearer $token"));
      });

      test('should throw Exception when no token is saved', () async {
        secureStorageChannel
            .setMockMethodCallHandler((MethodCall methodCall) async {
          if (methodCall.method == 'read') {
            return null;
          }
          return null;
        });

        expect(() async => await authOfflineDataSource.getToken(),
            throwsA(isA<Exception>()));

        secureStorageChannel
            .setMockMethodCallHandler((MethodCall methodCall) async {
          if (methodCall.method == 'write') {
            return null;
          } else if (methodCall.method == 'read') {
            return "Bearer token";
          } else if (methodCall.method == 'delete') {
            return null;
          }
          return null;
        });
      });
    });
  });
}
