import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/forget_password_request_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/forget_password_response_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/reset_password_request_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/verify_reset_code_request_entity.dart';
import 'package:super_fitness_app/src/domain/repositories/auth/auth_repository.dart';
import 'package:super_fitness_app/src/domain/usecases/auth/forget_password/forget_password_use_case.dart';

import 'forget_password_use_case_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  var forgetPasswordUseCase = ForgetPasswordUseCase(MockAuthRepository());
  var authRepo = MockAuthRepository();
  var email = "fakeemail@fake.com";
  var otpCode = "432146";
  var newPassword = "newPassword";
  group("This is forgetPassword function", () {
    var mockedResult = Success<ForgetPasswordResponseEntity>(data: ForgetPasswordResponseEntity());
    test(
        "When call forgetPassword should call _authRepository with correct parameters",
        () {
      provideDummy<ApiResult<ForgetPasswordResponseEntity>>(mockedResult);
      when(authRepo.forgetPassword(ForgetPasswordRequestEntity(email: email)))
          .thenAnswer((_) async => mockedResult);

      forgetPasswordUseCase.forgetPassword(ForgetPasswordRequestEntity(email: email));
      verify(
          authRepo.forgetPassword(ForgetPasswordRequestEntity(email: email)));
    });
  });
  group("This is verifyResetCode function", () {
    test(
        "When call verifyResetCode should call _authRepository with correct parameters",
        () {
      verify(authRepo
          .verifyResetCode(VerifyResetCodeRequestEntity(resetCode: otpCode)));
    });
  });
  group("This is ResetPassword function", () {
    test(
        "When call ResetPassword should call _authRepository with correct parameters",
        () {
      verify(authRepo.resetPassword(
          ResetPasswordRequestEntity(email: email, newPassword: newPassword)));
    });
  });
}
