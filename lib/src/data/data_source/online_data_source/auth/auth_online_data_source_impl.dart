import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/src/data/api/api_services.dart';
import 'package:super_fitness_app/src/data/api/core/api_request_models/forget_password/forget_password_request_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/logout/logout_response_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/upload_image_response/upload_image_response.dart';
import 'package:super_fitness_app/src/data/api/upload_api_manger/upload_api_manger.dart';

import '../../../../domain/entities/app_user_entity/app_user_entity.dart';
import '../../../api/core/api_request_models/edit_profile_request/edit_profile_request.dart';
import '../../../api/core/api_request_models/forget_password/reset_password_request_model.dart';
import '../../../api/core/api_request_models/forget_password/verify_reset_code_request_model.dart';
import '../../../api/core/api_request_models/login/login_request.dart';
import '../../../api/core/api_request_models/register/register_request_model.dart';
import '../../../api/core/api_response_models/forget_password/forget_password_response_model.dart';
import '../../../api/core/api_response_models/forget_password/reset_password_response_model.dart';
import '../../../api/core/api_response_models/forget_password/verify_reset_code_response_model.dart';
import '../../../api/core/api_response_models/login/login_response.dart';
import 'auth_online_data_source.dart';

@Injectable(as: AuthOnlineDataSource)
class AuthOnlineDataSourceImpl implements AuthOnlineDataSource {
  final ApiServices apiServices;
  final UploadApiManager uploadApiManager;
  AuthOnlineDataSourceImpl(this.apiServices, this.uploadApiManager);
  @override
  Future<(AppUserEntity, String)> register(
      RegisterRequestModel registerRequest) async {
    var response =
        await apiServices.register(registerRequestModel: registerRequest);
    var token = response.token ?? "";
    return (response.toAppUserEntity(), token);
  }

  @override
  Future<ForgetPasswordResponseModel> forgetPassword(
      ForgetPasswordRequestModel forgetPasswordRequestModel) async {
    return await apiServices.forgetPassword(forgetPasswordRequestModel);
  }

  @override
  Future<ResetPasswordResponseModel> resetPassword(
      ResetPasswordRequestModel resetPasswordRequestModel) async {
    return await apiServices.resetPassword(resetPasswordRequestModel);
  }

  @override
  Future<VerifyResetCodeResponseModel> verifyResetCode(
      VerifyResetCodeRequestModel verifyResetCodeRequestModel) async {
    return await apiServices.verifyResetCode(verifyResetCodeRequestModel);
  }

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    return await apiServices.login(loginRequest);
  }

  @override
  Future<LoginResponse> getUserData() async {
    return await apiServices.getUserData();
  }

  @override
  Future<AppUserEntity> editProfile(
      EditProfileRequest editProfileRequest) async {
    var response = await apiServices.editProfile(
        editProfileRequestModel: editProfileRequest);
    return (response.toAppUserEntity());
  }

  @override
  Future<UploadImageResponse> uploadImage(String token, File image) async {
    var response =
        await uploadApiManager.uploadImage(image: image, token: token);
    return response;
  }

  @override
  Future<LogoutResponseModel> logout() async {
    return await apiServices.logout();
  }
}
