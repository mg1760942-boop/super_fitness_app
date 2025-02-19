import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/data/api/core/api_request_models/login/login_request.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/login/login_response.dart';
import 'package:super_fitness_app/src/data/data_source/offline_data_source/auth/auth_offline_data_source/auth_offline_data_source.dart';
import 'package:super_fitness_app/src/data/data_source/online_data_source/auth/auth_online_data_source.dart';
import 'package:super_fitness_app/src/data/repository/auth/auth_repository_impl.dart';

import 'auth_repository_impl_test.mocks.dart';

@GenerateMocks([
  AuthOnlineDataSource,
  AuthOfflineDataSource,
  LoginResponse,
])
void main() {
  late MockAuthOnlineDataSource authOnlineDataSource;
  late MockAuthOfflineDataSource authOfflineDataSource;
  late AuthRepositoryImpl authRepositoryImpl;

  const email = "test@example.com";
  const password = "password";

  setUp(() {
    authOnlineDataSource = MockAuthOnlineDataSource();
    authOfflineDataSource = MockAuthOfflineDataSource();
    authRepositoryImpl = AuthRepositoryImpl(
      authOnlineDataSource,
      authOfflineDataSource,
    );
  });

  group("Auth Repository Impl - login", () {
    test("should return Success when login is successful", () async {
      final loginResponse = MockLoginResponse();
      when(authOnlineDataSource.login(any))
          .thenAnswer((_) async => loginResponse);
      when(loginResponse.token).thenReturn("token");
      when(authOfflineDataSource.saveToken(token: anyNamed("token")))
          .thenAnswer((_) async => Success<void>());

      final result = await authRepositoryImpl.login(email, password);

      expect(result, isA<Success<void>>());
      verify(authOnlineDataSource.login(any)).called(1);
      verify(authOfflineDataSource.saveToken(token: "token")).called(1);
    });

    test(
        "should return ApiError when authOnlineDataSource.login throws exception",
        () async {
      when(authOnlineDataSource.login(any))
          .thenThrow(Exception("Login failed"));

      final result = await authRepositoryImpl.login(email, password);

      expect(result, isA<Failures<void>>());
      verify(authOnlineDataSource.login(any)).called(1);
      verifyNever(authOfflineDataSource.saveToken(token: anyNamed("token")));
    });

    test(
        "should return ApiError when authOfflineDataSource.saveToken throws exception",
        () async {
      final loginResponse = MockLoginResponse();
      when(authOnlineDataSource.login(any))
          .thenAnswer((_) async => loginResponse);
      when(loginResponse.token).thenReturn("token");
      when(authOfflineDataSource.saveToken(token: anyNamed("token")))
          .thenThrow(Exception("Saving token failed"));

      final result = await authRepositoryImpl.login(email, password);

      expect(result, isA<Failures<void>>());
      verify(authOnlineDataSource.login(any)).called(1);
      verify(authOfflineDataSource.saveToken(token: "token")).called(1);
    });

    test("should call authOnlineDataSource.login with correct LoginRequest",
        () async {
      final loginResponse = MockLoginResponse();
      when(authOnlineDataSource.login(any))
          .thenAnswer((_) async => loginResponse);
      when(loginResponse.token).thenReturn("token");
      when(authOfflineDataSource.saveToken(token: anyNamed("token")))
          .thenAnswer((_) async => Success<void>());

      await authRepositoryImpl.login(email, password);

      final captured = verify(authOnlineDataSource.login(captureAny)).captured;
      expect(captured.length, equals(1));
      final loginRequest = captured.first as LoginRequest;
      expect(loginRequest.email, equals(email));
      expect(loginRequest.password, equals(password));
    });
  });
}
