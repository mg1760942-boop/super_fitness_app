import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/src/domain/repositories/auth/auth_repository.dart';

import '../../../core/common/apis/api_result.dart';
import '../../api/core/api_request_models/register_request_model/register_request_model.dart';
import '../entities/app_user_entity/app_user_entity.dart';

@injectable
class RegisterUseCase {
  final AuthRepository _authRepository;
  RegisterUseCase(this._authRepository);

  Future<ApiResult<AppUserEntity>> register(
      {required RegisterRequestModel registerRequest}) async {
    return await _authRepository.register(registerRequest: registerRequest);
  }
}
