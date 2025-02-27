import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/core/common/apis/api_executer.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/data/api/core/api_request_models/edit_profile_request/edit_profile_request.dart';
import 'package:super_fitness_app/src/data/api/core/api_request_models/forget_password/verify_reset_code_request_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_request_models/login/login_request.dart';
import 'package:super_fitness_app/src/data/data_source/offline_data_source/auth/auth_offline_data_source/auth_offline_data_source.dart';
import 'package:super_fitness_app/src/data/data_source/online_data_source/auth/auth_online_data_source.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/reset_password_request_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/reset_password_response_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/verify_reset_code_request_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/verify_reset_code_response_entity.dart';
import 'package:super_fitness_app/src/domain/repositories/auth/auth_repository.dart';

import '../../../domain/entities/app_user_entity/app_user_entity.dart';
import '../../../domain/entities/auth/forget_password/forget_password_request_entity.dart';
import '../../../domain/entities/auth/forget_password/forget_password_response_entity.dart';
import '../../api/core/api_request_models/forget_password/forget_password_request_model.dart';
import '../../api/core/api_request_models/forget_password/reset_password_request_model.dart';
import '../../api/core/api_request_models/register/register_request_model.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthOnlineDataSource _authOnlineDataSource;
  final AuthOfflineDataSource _authOfflineDataSource;
  AuthRepositoryImpl(this._authOnlineDataSource, this._authOfflineDataSource);
  @override
  Future<ApiResult<AppUserEntity>> register(
      {required RegisterRequestModel registerRequest}) async {
    return executeApi<AppUserEntity>(
      apiCall: () async {
        var response = await _authOnlineDataSource.register(registerRequest);
        await _authOfflineDataSource.saveToken(token: response.$2);
        return response.$1;
      },
    );
  }

  @override
  Future<ApiResult<ForgetPasswordResponseEntity>> forgetPassword(
      ForgetPasswordRequestEntity request) async {
    return await executeApi(apiCall: () async {
      var response = await _authOnlineDataSource
          .forgetPassword(ForgetPasswordRequestModel.fromDomain(request));
      return response.toDomain();
    });
  }

  @override
  Future<ApiResult<ResetPasswordResponseEntity>> resetPassword(
      ResetPasswordRequestEntity request) async {
    return await executeApi(apiCall: () async {
      var response = await _authOnlineDataSource
          .resetPassword(ResetPasswordRequestModel.fromDomain(request));
      return response.toDomain();
    });
  }

  @override
  Future<ApiResult<VerifyResetCodeResponseEntity>> verifyResetCode(
      VerifyResetCodeRequestEntity request) async {
    return await executeApi(apiCall: () async {
      var response = await _authOnlineDataSource
          .verifyResetCode(VerifyResetCodeRequestModel.fromDomain(request));
      return response.toDomain();
    });
  }

  @override
  Future<ApiResult<void>> login(String email, String password) async {
    return await executeApi(apiCall: () async {
      var loginRequest = LoginRequest(email: email, password: password);
      var response = await _authOnlineDataSource.login(loginRequest);
      await _authOfflineDataSource.saveToken(token: response.token!);
    });
  }

  @override
  Future<ApiResult<AppUserEntity?>> getUserData() async {
    return await executeApi(apiCall: () async {
      var response = await _authOnlineDataSource.getUserData();
      return response.user?.toAppUserEntity();
    });
  }

  @override
  Future<ApiResult<AppUserEntity>> editProfile({required EditProfileRequest editProfileRequest}) async{
    return await executeApi(apiCall: () async {
      var response = await _authOnlineDataSource.editProfile(editProfileRequest);
      return response;
    });
  }

  @override
  Future<ApiResult<String>> uploadImage({required File image}) async{
    return await executeApi(apiCall: () async {
      var token = await _authOfflineDataSource.getToken();
      var response = await _authOnlineDataSource.uploadImage(token, image);
      return response.message.toString();
    });
  }
}
