import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/domain/entities/app_user_entity/app_user_entity.dart';

import '../../../api/core/api_request_models/register_request_model/register_request_model.dart';

abstract class AuthRepository {
  Future<ApiResult<AppUserEntity>>register({required RegisterRequestModel registerRequest});
}