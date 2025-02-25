import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import 'core/api_request_models/forget_password/forget_password_request_model.dart';
import 'core/api_request_models/forget_password/reset_password_request_model.dart';
import 'core/api_request_models/forget_password/verify_reset_code_request_model.dart';
import 'core/api_request_models/login/login_request.dart';
import 'core/api_request_models/register/register_request_model.dart';
import 'core/api_response_models/forget_password/forget_password_response_model.dart';
import 'core/api_response_models/forget_password/reset_password_response_model.dart';
import 'core/api_response_models/forget_password/verify_reset_code_response_model.dart';
import 'core/api_response_models/login/login_response.dart';
import 'core/api_response_models/register/register_response_model.dart';
import 'core/constants/api_base_url.dart';
import 'core/constants/api_end_points.dart';

part 'api_services.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApiBaseUrl.baseUrl)
abstract interface class ApiServices {
  @factoryMethod
  factory ApiServices(Dio dio) = _ApiServices;

  @POST(ApiEndPoints.forgetPassword)
  Future<ForgetPasswordResponseModel> forgetPassword(
      @Body() ForgetPasswordRequestModel forgetPasswordRequestModel);

  @POST(ApiEndPoints.verifyReset)
  Future<VerifyResetCodeResponseModel> verifyResetCode(
      @Body() VerifyResetCodeRequestModel verifyResetCodeRequestModel);

  @PUT(ApiEndPoints.resetPassword)
  Future<ResetPasswordResponseModel> resetPassword(
      @Body() ResetPasswordRequestModel resetPasswordRequestModel);

  @POST(ApiEndPoints.login)
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @POST(ApiEndPoints.register)
  Future<RegisterResponseModel> register(
      {@Body() required RegisterRequestModel registerRequestModel});

  @GET(ApiEndPoints.getUserData)
  Future<LoginResponse> getUserData();
}
