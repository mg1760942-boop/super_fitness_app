import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/core/common/apis/api_executer.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/data/api/core/api_request_models/forget_password/forget_password_request_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_request_models/forget_password/verify_reset_code_request_model.dart';
import 'package:super_fitness_app/src/data/data_source/online_data_source/auth/auth_online_data_source.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/forget_password_request_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/forget_password_response_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/reset_password_request_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/reset_password_response_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/verify_reset_code_request_entity.dart';
import 'package:super_fitness_app/src/domain/entities/auth/forget_password/verify_reset_code_response_entity.dart';
import 'package:super_fitness_app/src/domain/repositories/auth/auth_repository.dart';

import '../../api/core/api_request_models/forget_password/reset_password_request_model.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository{
  
  final AuthOnlineDataSource _authOnlineDataSource;
  AuthRepositoryImpl(this._authOnlineDataSource);
  @override
  Future<ApiResult<ForgetPasswordResponseEntity>> forgetPassword(ForgetPasswordRequestEntity request)  async{
    return await executeApi(apiCall: ()async{
      var response = await _authOnlineDataSource.forgetPassword(ForgetPasswordRequestModel.fromDomain(request));
      return response.toDomain();
    });
  }

  @override
  Future<ApiResult<ResetPasswordResponseEntity>> resetPassword(ResetPasswordRequestEntity request) async{
    return await executeApi(apiCall: ()async{
      var response = await _authOnlineDataSource.resetPassword(ResetPasswordRequestModel.fromDomain(request));
      return response.toDomain();
    });
  }

  @override
  Future<ApiResult<VerifyResetCodeResponseEntity>> verifyResetCode(VerifyResetCodeRequestEntity request) async{
    return await executeApi(apiCall: ()async{
      var response = await _authOnlineDataSource.verifyResetCode(VerifyResetCodeRequestModel.fromDomain(request));
      return response.toDomain();
    });
  }
  
}