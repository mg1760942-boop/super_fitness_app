import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/forget_password_request_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/forget_password_response_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/reset_password_request_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/reset_password_response_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/verify_reset_code_request_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/verify_reset_code_response_entity.dart';
import 'package:super_fitness_app/src/domain/repositories/auth/auth_repository.dart';
import 'package:super_fitness_app/src/domain/usecases/auth/forget_password/forget_password_use_case.dart';

import '../../login/login_usecase_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late ForgetPasswordUseCase forgetPasswordUseCase;
  late MockAuthRepository authRepo;
  setUp(() {
    authRepo = MockAuthRepository();
    forgetPasswordUseCase = ForgetPasswordUseCase(authRepo);
  });

  group("This is forgetPassword function", () {
    var email = "fakeemail@fake.com";
    var emptyEmail = "";
    var successMockedResult = Success<ForgetPasswordResponseEntity>(
        data: ForgetPasswordResponseEntity());
    var failureMockedResult = Failures<ForgetPasswordResponseEntity>(
        exception: Exception("email can not be empty"));
    final request = ForgetPasswordRequestEntity(email: email);
    test(
        "When call forgetPassword should call _authRepository with correct parameters should return success",
        () async {
      provideDummy<ApiResult<ForgetPasswordResponseEntity>>(
          successMockedResult);
      when(authRepo.forgetPassword(request))
          .thenAnswer((_) async => successMockedResult);

      var result = await forgetPasswordUseCase.forgetPassword(request);
      expect(result, successMockedResult);
      verify(authRepo.forgetPassword(request)).called(1);
    });
    test(
        "When call forgetPassword should call _authRepository with fail parameters should return fail",
        () async {
      provideDummy<ApiResult<ForgetPasswordResponseEntity>>(
          failureMockedResult);
      when(authRepo.forgetPassword(any))
          .thenAnswer((_) async => failureMockedResult);
      var result = await forgetPasswordUseCase
          .forgetPassword(ForgetPasswordRequestEntity(email: emptyEmail));
      expect(result, failureMockedResult);
      verify(authRepo.forgetPassword(any)).called(1);
    });
    test(
        "When call forgetPassword should call _authRepository with fail parameters should return fail",
        () async {
      provideDummy<ApiResult<ForgetPasswordResponseEntity>>(
          failureMockedResult);
      when(authRepo.forgetPassword(any))
          .thenAnswer((_) async => failureMockedResult);
      var result = await forgetPasswordUseCase
          .forgetPassword(ForgetPasswordRequestEntity(email: emptyEmail));
      expect(result, failureMockedResult);
      verify(authRepo.forgetPassword(any)).called(1);
    });
    test(
        "When forgetPassword encounters a network failure, should return failure",
        () async {
      final networkErrorResult = Failures<ForgetPasswordResponseEntity>(
          exception: Exception("No internet connection"));

      when(authRepo.forgetPassword(any))
          .thenAnswer((_) async => networkErrorResult);

      var result = await forgetPasswordUseCase.forgetPassword(request);

      expect(result, networkErrorResult);
      verify(authRepo.forgetPassword(any)).called(1);
    });
  });

  group("This is VerifyCode function", () {
    final request = VerifyResetCodeRequestEntity(resetCode: "123456");
    final mockSuccessResult = Success<VerifyResetCodeResponseEntity>(
        data: VerifyResetCodeResponseEntity());
    final mockFailResult =
        Failures<VerifyResetCodeResponseEntity>(exception: Exception());
    test(
        "When call verifyResetCode should call _authRepository with correct parameters should return success",
        () async {
      provideDummy<ApiResult<VerifyResetCodeResponseEntity>>(mockSuccessResult);
      when(authRepo.verifyResetCode(any))
          .thenAnswer((_) async => mockSuccessResult);
      var result = await forgetPasswordUseCase.verifyResetCode(request);
      expect(result, mockSuccessResult);
      verify(authRepo.verifyResetCode(any)).called(1);
    });
    test(
        "When call verifyResetCode should call _authRepository with fail parameters should return fail",
        () async {
      provideDummy<ApiResult<VerifyResetCodeResponseEntity>>(mockFailResult);
      when(authRepo.verifyResetCode(any))
          .thenAnswer((_) async => mockFailResult);
      var result = await forgetPasswordUseCase.verifyResetCode(request);
      expect(result, mockFailResult);
      verify(authRepo.verifyResetCode(any)).called(1);
    });
    test(
        "When verifyResetCode is called with an incorrect code, should return failure",
        () async {
      final invalidRequest = VerifyResetCodeRequestEntity(resetCode: "000000");
      final mockFailResult = Failures<VerifyResetCodeResponseEntity>(
          exception: Exception("Invalid reset code"));

      when(authRepo.verifyResetCode(any))
          .thenAnswer((_) async => mockFailResult);

      var result = await forgetPasswordUseCase.verifyResetCode(invalidRequest);

      expect(result, mockFailResult);
      verify(authRepo.verifyResetCode(any)).called(1);
    });
  });

  group("This is ResetPassword function", () {
    var email = "fakeemail@fake.com";
    var newPassword = "newPassword";
    final request =
        ResetPasswordRequestEntity(email: email, newPassword: newPassword);
    final mockSuccessResult = Success<ResetPasswordResponseEntity>(
        data: ResetPasswordResponseEntity());
    final mockFailResult =
        Failures<ResetPasswordResponseEntity>(exception: Exception());
    test(
        "When call ResetPassword should call _authRepository with correct parameters should return success",
        () async {
      provideDummy<ApiResult<ResetPasswordResponseEntity>>(mockSuccessResult);
      when(authRepo.resetPassword(any))
          .thenAnswer((_) async => mockSuccessResult);
      var result = await forgetPasswordUseCase.resetPassword(request);
      expect(result, mockSuccessResult);
      verify(authRepo.resetPassword(any)).called(1);
    });
    test(
        "When call ResetPassword should call _authRepository with fail parameters should return fail",
        () async {
      provideDummy<ApiResult<ResetPasswordResponseEntity>>(mockFailResult);
      when(authRepo.resetPassword(any)).thenAnswer((_) async => mockFailResult);
      var result = await forgetPasswordUseCase.resetPassword(request);
      expect(result, mockFailResult);
      verify(authRepo.resetPassword(any)).called(1);
    });
    test(
        "When resetPassword is called with a weak password, should return failure",
        () async {
      final weakPasswordRequest =
          ResetPasswordRequestEntity(email: email, newPassword: "123");
      final mockFailResult = Failures<ResetPasswordResponseEntity>(
          exception: Exception("Password too weak"));

      when(authRepo.resetPassword(any)).thenAnswer((_) async => mockFailResult);

      var result =
          await forgetPasswordUseCase.resetPassword(weakPasswordRequest);

      expect(result, mockFailResult);
      verify(authRepo.resetPassword(any)).called(1);
    });
  });
}
