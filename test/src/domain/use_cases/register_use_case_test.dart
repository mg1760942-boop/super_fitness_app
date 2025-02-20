import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/data/api/core/api_request_models/register/register_request_model.dart';
import 'package:super_fitness_app/src/domain/entities/app_user_entity/app_user_entity.dart';
import 'package:super_fitness_app/src/domain/repositories/auth/auth_repository.dart';

import 'register_use_case_test.mocks.dart';

@GenerateMocks([AuthRepository, AppUserEntity, RegisterRequestModel])
void main() {
  test(
      'should return  Success<AppUserEntity> when call authRepository.register is Success ',
      () async {
    AuthRepository authRepository = MockAuthRepository();
    AppUserEntity appUserEntity = MockAppUserEntity();
    RegisterRequestModel registerRequestModel = MockRegisterRequestModel();
    var successResult = Success<AppUserEntity>(data: appUserEntity);
    provideDummy<ApiResult<AppUserEntity>>(successResult);
    when(authRepository.register(registerRequest: registerRequestModel))
        .thenAnswer((_) async => successResult);
    var actual =
        await authRepository.register(registerRequest: registerRequestModel);
    expect(actual, successResult);
  });
}
