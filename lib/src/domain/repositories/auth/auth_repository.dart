abstract interface class AuthRepository {
import 'package:super_fitness_app/src/domain/entities/app_user_entity/app_user_entity.dart';
  Future<ApiResult<ForgetPasswordResponseEntity>> forgetPassword(
      ForgetPasswordRequestEntity request);
  Future<ApiResult<VerifyResetCodeResponseEntity>> verifyResetCode(
      VerifyResetCodeRequestEntity request);
  Future<ApiResult<ResetPasswordResponseEntity>> resetPassword(
      ResetPasswordRequestEntity request);
  Future<ApiResult<void>> login(String email, String password);
}
import '../../../api/core/api_request_models/register_request_model/register_request_model.dart';

abstract class AuthRepository {
  Future<ApiResult<AppUserEntity>>register({required RegisterRequestModel registerRequest});
}