import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/src/data/api/api_services.dart';
import 'package:super_fitness_app/src/data/api/core/api_request_models/forget_password/forget_password_request_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_request_models/forget_password/reset_password_request_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_request_models/forget_password/verify_reset_code_request_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_request_models/login/login_request.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/forget_password/forget_password_response_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/forget_password/reset_password_response_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/forget_password/verify_reset_code_response_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/login/login_response.dart';

import 'auth_online_data_source.dart';

@Injectable(as: AuthOnlineDataSource)
class AuthOnlineDataSourceImpl implements AuthOnlineDataSource {
  final ApiServices _apiServices;
  AuthOnlineDataSourceImpl(this._apiServices);
  @override
  Future<ForgetPasswordResponseModel> forgetPassword(
      ForgetPasswordRequestModel forgetPasswordRequestModel) async {
    return await _apiServices.forgetPassword(forgetPasswordRequestModel);
  }

  @override
  Future<ResetPasswordResponseModel> resetPassword(
      ResetPasswordRequestModel resetPasswordRequestModel) async {
    return await _apiServices.resetPassword(resetPasswordRequestModel);
  }

  @override
  Future<VerifyResetCodeResponseModel> verifyResetCode(
      VerifyResetCodeRequestModel verifyResetCodeRequestModel) async {
    return await _apiServices.verifyResetCode(verifyResetCodeRequestModel);
  }

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    return await _apiServices.login(loginRequest);
  }
}
