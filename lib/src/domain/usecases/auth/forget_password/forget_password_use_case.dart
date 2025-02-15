
import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/forget_password_request_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/forget_password_response_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/reset_password_request_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/reset_password_response_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/verify_reset_code_request_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/verify_reset_code_response_entity.dart';
import 'package:super_fitness_app/src/domain/repositories/auth/auth_repository.dart';

@injectable
class ForgetPasswordUseCase{
  final AuthRepository _authRepository;
  ForgetPasswordUseCase(this._authRepository);

  Future<ApiResult<ForgetPasswordResponseEntity>> forgetPassword(ForgetPasswordRequestEntity request) async{
    return await _authRepository.forgetPassword(request);
  }

  Future<ApiResult<VerifyResetCodeResponseEntity>> verifyResetCode(VerifyResetCodeRequestEntity request) async {
    return await _authRepository.verifyResetCode(request);
  }

  Future<ApiResult<ResetPasswordResponseEntity>> resetPassword(ResetPasswordRequestEntity request) async {
    return await _authRepository.resetPassword(request);
  }
}