import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:super_fitness_app/src/data/data_source/offline_data_source/auth/auth_offline_data_source/auth_offline_data_source.dart';
import 'package:super_fitness_app/src/data/data_source/offline_data_source/auth/auth_offline_data_source/auth_offline_data_source_impl.dart';

void main() {
  // Ensure the binding is initialized.
  TestWidgetsFlutterBinding.ensureInitialized();

  // Set up a mock handler for the flutter_secure_storage channel.
  const MethodChannel secureStorageChannel =
      MethodChannel('plugins.it_nomads.com/flutter_secure_storage');

  secureStorageChannel.setMockMethodCallHandler((MethodCall methodCall) async {
    // You can inspect methodCall.method to customize behavior.
    if (methodCall.method == 'write') {
      // Simulate a successful write.
      return null;
    } else if (methodCall.method == 'read') {
      // Simulate a read returning a token.
      return "Bearer token";
    } else if (methodCall.method == 'delete') {
      // Simulate delete success.
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
        // Arrange
        const token = "token";

        // Act
        await authOfflineDataSource.saveToken(token: token);

        // Assert: getToken should now return the token prefixed with "Bearer "
        final storedToken = await authOfflineDataSource.getToken();
        expect(storedToken, equals("Bearer $token"));
      });

      test('should throw Exception when a null token is provided', () async {
        // Act & Assert
        expect(() async => await authOfflineDataSource.saveToken(token: null),
            throwsA(isA<Exception>()));
      });
    });

    group('getToken', () {
      test('should return the saved token if it exists', () async {
        // Arrange
        const token = "token";
        await authOfflineDataSource.saveToken(token: token);

        // Act
        final result = await authOfflineDataSource.getToken();

        // Assert
        expect(result, equals("Bearer $token"));
      });

      test('should throw Exception when no token is saved', () async {
        // In this case, since our mock returns "Bearer token" for read,
        // you might need to simulate no token by clearing the stored value.
        // For demonstration, let's simulate that by setting a different handler.

        secureStorageChannel
            .setMockMethodCallHandler((MethodCall methodCall) async {
          if (methodCall.method == 'read') {
            // Simulate no token saved by returning null.
            return null;
          }
          return null;
        });

        // Act & Assert
        expect(() async => await authOfflineDataSource.getToken(),
            throwsA(isA<Exception>()));

        // Reset the handler to the original behavior after test.
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
