import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/data/api/core/api_request_models/login/login_request.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/forget_password/forget_password_response_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/forget_password/reset_password_response_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/forget_password/verify_reset_code_response_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/login/login_response.dart';
import 'package:super_fitness_app/src/data/data_source/offline_data_source/auth/auth_offline_data_source/auth_offline_data_source.dart';
import 'package:super_fitness_app/src/data/data_source/online_data_source/auth/auth_online_data_source.dart';
import 'package:super_fitness_app/src/data/repository/auth/auth_repository_impl.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/forget_password_request_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/forget_password_response_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/reset_password_request_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/reset_password_response_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/verify_reset_code_request_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/verify_reset_code_response_entity.dart';

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
  group("forgetPassword function", () {
    const email = "fakeemail@fake.com";
    final request = ForgetPasswordRequestEntity(email: email);
    final mockResponse = ForgetPasswordResponseEntity();
    final onlineDataResponse = ForgetPasswordResponseModel();
    final successResult = Success<ForgetPasswordResponseEntity>(data: mockResponse);
    final failureResult = Failures<ForgetPasswordResponseEntity>(exception: Exception("API Error"));

    test("should return Success when API call is successful", () async {
      provideDummy<ApiResult<ForgetPasswordResponseEntity>>(successResult);
      when(authOnlineDataSource.forgetPassword(any))
          .thenAnswer((_) async => onlineDataResponse);

      final result = await authRepositoryImpl.forgetPassword(request);

      expect(result, isA<Success<ForgetPasswordResponseEntity>>());
      verify(authOnlineDataSource.forgetPassword(any)).called(1);
    });

    test("should return Failure when API call fails", () async {
      provideDummy<ApiResult<ForgetPasswordResponseEntity>>(failureResult);
      when(authOnlineDataSource.forgetPassword(any))
          .thenThrow(Exception("API Error"));

      final result = await authRepositoryImpl.forgetPassword(request);

      expect(result, isA<Failures<ForgetPasswordResponseEntity>>());
      verify(authOnlineDataSource.forgetPassword(any)).called(1);
    });
    test("should return Failure when API call fails because of empty email", () async {
      provideDummy<ApiResult<ForgetPasswordResponseEntity>>(failureResult);
      when(authOnlineDataSource.forgetPassword(any))
          .thenThrow(Exception("email should not be empty"));

      final result = await authRepositoryImpl.forgetPassword(ForgetPasswordRequestEntity(email: ""));

      expect(result, isA<Failures<ForgetPasswordResponseEntity>>());
      verify(authOnlineDataSource.forgetPassword(any)).called(1);
    });
  });
  group("verifyResetCode function", () {
    const otpCode = "123456";
    final request = VerifyResetCodeRequestEntity(resetCode: otpCode);
    final mockResponse = VerifyResetCodeResponseEntity();
    final onlineDataResponse = VerifyResetCodeResponseModel();
    final successResult = Success<VerifyResetCodeResponseEntity>(data: mockResponse);
    final failureResult = Failures<VerifyResetCodeResponseEntity>(exception: Exception("API Error"));

    test("should return Success when API call is successful", () async {
      provideDummy<ApiResult<VerifyResetCodeResponseEntity>>(successResult);
      when(authOnlineDataSource.verifyResetCode(any))
          .thenAnswer((_) async => onlineDataResponse);

      final result = await authRepositoryImpl.verifyResetCode(request);

      expect(result, isA<Success<VerifyResetCodeResponseEntity>>());
      verify(authOnlineDataSource.verifyResetCode(any)).called(1);
    });

    test("should return Failure when API call fails", () async {
      provideDummy<ApiResult<VerifyResetCodeResponseEntity>>(failureResult);
      when(authOnlineDataSource.verifyResetCode(any))
          .thenThrow(Exception("API Error"));

      final result = await authRepositoryImpl.verifyResetCode(request);

      expect(result, isA<Failures<VerifyResetCodeResponseEntity>>());
      verify(authOnlineDataSource.verifyResetCode(any)).called(1);
    });
    test("should return Failure when API call fails because opt code should be 6 numbers", () async {
      provideDummy<ApiResult<VerifyResetCodeResponseEntity>>(failureResult);
      when(authOnlineDataSource.verifyResetCode(any))
          .thenThrow(Exception("Otp code should be 6 numbers"));

      final result = await authRepositoryImpl.verifyResetCode(VerifyResetCodeRequestEntity(resetCode: "123"));

      expect(result, isA<Failures<VerifyResetCodeResponseEntity>>());
      verify(authOnlineDataSource.verifyResetCode(any)).called(1);
    });
  });
  group("ResetPassword function", () {
    const email = "fackemail@fake.com";
    const password = "newPassword";
    final request = ResetPasswordRequestEntity(email: email,newPassword: password);
    final mockResponse = ResetPasswordResponseEntity();
    final onlineDataResponse = ResetPasswordResponseModel();
    final successResult = Success<ResetPasswordResponseEntity>(data: mockResponse);
    final failureResult = Failures<ResetPasswordResponseEntity>(exception: Exception("API Error"));

    test("should return Success when API call is successful", () async {
      provideDummy<ApiResult<ResetPasswordResponseEntity>>(successResult);
      when(authOnlineDataSource.resetPassword(any))
          .thenAnswer((_) async => onlineDataResponse);

      final result = await authRepositoryImpl.resetPassword(request);

      expect(result, isA<Success<ResetPasswordResponseEntity>>());
      verify(authOnlineDataSource.resetPassword(any)).called(1);
    });

    test("should return Failure when API call fails", () async {
      provideDummy<ApiResult<ResetPasswordResponseEntity>>(failureResult);
      when(authOnlineDataSource.resetPassword(any))
          .thenThrow(Exception("API Error"));

      final result = await authRepositoryImpl.resetPassword(request);

      expect(result, isA<Failures<ResetPasswordResponseEntity>>());
      verify(authOnlineDataSource.resetPassword(any)).called(1);
    });
    test("should return Failure when API call fails because email is empty", () async {
      provideDummy<ApiResult<ResetPasswordResponseEntity>>(failureResult);
      when(authOnlineDataSource.resetPassword(any))
          .thenThrow(Exception("email should not be empty"));

      final result = await authRepositoryImpl.resetPassword(ResetPasswordRequestEntity(email: "",newPassword: password));

      expect(result, isA<Failures<ResetPasswordResponseEntity>>());
      verify(authOnlineDataSource.resetPassword(any)).called(1);
    });
    test("should return Failure when API call fails because password less than 8", () async {
      provideDummy<ApiResult<ResetPasswordResponseEntity>>(failureResult);
      when(authOnlineDataSource.resetPassword(any))
          .thenThrow(Exception("weak password"));

      final result = await authRepositoryImpl.resetPassword(ResetPasswordRequestEntity(email: "",newPassword: "123"));

      expect(result, isA<Failures<ResetPasswordResponseEntity>>());
      verify(authOnlineDataSource.resetPassword(any)).called(1);
    });
  });

}
