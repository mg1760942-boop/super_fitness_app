import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/core/common/apis/api_executer.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/api/core/api_request_models/register_request_model/register_request_model.dart';
import 'package:super_fitness_app/src/domain/entities/app_user_entity/app_user_entity.dart';
import 'package:super_fitness_app/src/domain/repositories/auth/auth_repository.dart';

import '../data_source/online_data_source/auth/auth_online_data_source.dart';

@Injectable(as:AuthRepository )
class AuthRepositoryImpl implements AuthRepository{
  final AuthOnlineDataSource _authOnlineDataSource;
  AuthRepositoryImpl( this._authOnlineDataSource);
  @override
  Future<ApiResult<AppUserEntity>> register({required RegisterRequestModel registerRequest}) async{
    return executeApi<AppUserEntity>(apiCall: ()async {
      var response =await _authOnlineDataSource.register(registerRequest);
      return response.$1;
    },);
  }
}