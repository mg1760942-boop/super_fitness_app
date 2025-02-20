import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/forget_password_request_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/forget_password_response_entity.dart';
import 'package:super_fitness_app/src/domain/repositories/auth/auth_repository.dart';
import 'package:super_fitness_app/src/domain/usecases/auth/forget_password/forget_password_use_case.dart';

import '../../login/login_usecase_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late ForgetPasswordUseCase forgetPasswordUseCase;
  late MockAuthRepository authRepo;
  setUp((){
    authRepo = MockAuthRepository();
    forgetPasswordUseCase = ForgetPasswordUseCase(authRepo);
  });
  group("This is forgetPassword function", () {
    var email = "fakeemail@fake.com";
    var successMockedResult = Success<ForgetPasswordResponseEntity>(
        data: ForgetPasswordResponseEntity());
    var failureMockedResult = Failures<ForgetPasswordResponseEntity>(
        exception: Exception());
    final request = ForgetPasswordRequestEntity(email: email);
    test(
        "When call forgetPassword should call _authRepository with correct parameters should return success",
            () async {
          provideDummy<ApiResult<ForgetPasswordResponseEntity>>(successMockedResult);
          when(authRepo.forgetPassword(request))
              .thenAnswer((_) async => successMockedResult);

          var result = await forgetPasswordUseCase.forgetPassword(request);
          expect(result, successMockedResult);
          verify(
              authRepo.forgetPassword(request)).called(1);
        });
    test("When call forgetPassword should call _authRepository with correct parameters should return success", ()async{
      provideDummy<ApiResult<ForgetPasswordResponseEntity>>(failureMockedResult);
      when(authRepo.forgetPassword(request)).thenAnswer((_)async=> failureMockedResult);
      var result = await forgetPasswordUseCase.forgetPassword(request);
      expect(result,failureMockedResult);
      verify(authRepo.forgetPassword(request)).called(1);
    });
  });

}
