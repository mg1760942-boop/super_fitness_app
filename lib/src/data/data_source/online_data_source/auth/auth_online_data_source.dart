import 'package:super_fitness_app/src/data/api/core/api_request_models/forget_password/forget_password_request_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/forget_password/forget_password_response_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/forget_password/reset_password_response_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/forget_password/verify_reset_code_response_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/login/login_response.dart';

import '../../../../domain/entities/app_user_entity/app_user_entity.dart';
import '../../../api/core/api_request_models/forget_password/reset_password_request_model.dart';
import '../../../api/core/api_request_models/forget_password/verify_reset_code_request_model.dart';
import '../../../api/core/api_request_models/login/login_request.dart';
import '../../../api/core/api_request_models/register/register_request_model.dart';

abstract interface class AuthOnlineDataSource {
  Future<ForgetPasswordResponseModel> forgetPassword(
      ForgetPasswordRequestModel forgetPasswordRequestModel);
  Future<VerifyResetCodeResponseModel> verifyResetCode(
      VerifyResetCodeRequestModel verifyResetCodeRequestModel);
  Future<ResetPasswordResponseModel> resetPassword(
      ResetPasswordRequestModel resetPasswordRequestModel);
  Future<LoginResponse> login(LoginRequest loginRequest);
  Future<(AppUserEntity, String)> register(
      RegisterRequestModel registerRequest);
}
