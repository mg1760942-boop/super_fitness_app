import '../../../../core/common/apis/api_result.dart';
import '../../../data/api/core/api_request_models/register/register_request_model.dart';
import '../../entities/app_user_entity/app_user_entity.dart';
import '../../entities/auth/forget_password/forget_password_request_entity.dart';
import '../../entities/auth/forget_password/forget_password_response_entity.dart';
import '../../entities/auth/forget_password/reset_password_request_entity.dart';
import '../../entities/auth/forget_password/reset_password_response_entity.dart';
import '../../entities/auth/forget_password/verify_reset_code_request_entity.dart';
import '../../entities/auth/forget_password/verify_reset_code_response_entity.dart';

abstract interface class AuthRepository {
  Future<ApiResult<ForgetPasswordResponseEntity>> forgetPassword(
      ForgetPasswordRequestEntity request);
  Future<ApiResult<VerifyResetCodeResponseEntity>> verifyResetCode(
      VerifyResetCodeRequestEntity request);
  Future<ApiResult<ResetPasswordResponseEntity>> resetPassword(
      ResetPasswordRequestEntity request);
  Future<ApiResult<void>> login(String email, String password);

  Future<ApiResult<AppUserEntity>> register(
      {required RegisterRequestModel registerRequest});
  Future<ApiResult<AppUserEntity?>> getUserData();
}
