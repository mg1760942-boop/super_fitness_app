
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:super_fitness_app/src/api/core/constants/api_base_url.dart';

part 'api_services.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApiBaseUrl.baseUrl)
abstract interface class ApiServices {
  @factoryMethod
  factory ApiServices(Dio dio) = _ApiServices;

}
