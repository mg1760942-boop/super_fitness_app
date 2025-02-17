import 'package:injectable/injectable.dart';
import 'package:super_fitness_app/src/api/core/api_request_models/register_request_model/register_request_model.dart';
import 'package:super_fitness_app/src/domain/entities/app_user_entity/app_user_entity.dart';

import '../../../../api/api_services.dart';
import 'auth_online_data_source.dart';
@Injectable(as: AuthOnlineDataSource)
class AuthOnlineDataSourceImpl  implements AuthOnlineDataSource{
  final ApiServices _apiServices;
  AuthOnlineDataSourceImpl(this._apiServices);
  @override
  Future<(AppUserEntity,String)> register( RegisterRequestModel registerRequest) async{
    var response = await _apiServices.register(registerRequestModel: registerRequest);
    var token=response.token ?? "";
    return (response.toAppUserEntity(), token);
  }

}