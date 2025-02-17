
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:super_fitness_app/src/api/core/api_response_models/register_respone_model/register_response_model.dart';
import 'package:super_fitness_app/src/api/core/constants/api_base_url.dart';

import 'core/api_request_models/register_request_model/register_request_model.dart';

part 'api_services.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApiBaseUrl.baseUrl)
abstract interface class ApiServices {
  @factoryMethod
  factory ApiServices(Dio dio) = _ApiServices;

  Future<RegisterResponseModel>register({@Body() required RegisterRequestModel registerRequestModel});


}
