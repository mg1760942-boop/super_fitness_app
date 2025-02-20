
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:super_fitness_app/src/data/api/core/api_request_models/forget_password/forget_password_request_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_request_models/forget_password/verify_reset_code_request_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/forget_password/forget_password_response_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/forget_password/reset_password_response_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/forget_password/verify_reset_code_response_model.dart';
import 'package:super_fitness_app/src/data/api/core/constants/api_end_points.dart';

import 'core/api_request_models/forget_password/reset_password_request_model.dart';
import 'core/constants/api_base_url.dart';

part 'api_services.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApiBaseUrl.baseUrl)
abstract interface class ApiServices {
  @factoryMethod
  factory ApiServices(Dio dio) = _ApiServices;


  @POST(ApiEndPoints.forgetPassword)
  Future<ForgetPasswordResponseModel> forgetPassword(ForgetPasswordRequestModel forgetPasswordRequestModel);

  @POST(ApiEndPoints.verifyReset)
  Future<VerifyResetCodeResponseModel> verifyResetCode(VerifyResetCodeRequestModel verifyResetCodeRequestModel);

  @PUT(ApiEndPoints.resetPassword)
  Future<ResetPasswordResponseModel> resetPassword(ResetPasswordRequestModel resetPasswordRequestModel);
}
