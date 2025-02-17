import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:super_fitness_app/src/api/api_services.dart';
import 'package:super_fitness_app/src/api/core/api_request_models/register_request_model/register_request_model.dart';
import 'package:super_fitness_app/src/api/core/api_response_models/register_respone_model/register_response_model.dart';
import 'package:super_fitness_app/src/data/data_source/online_data_source/auth/auth_online_data_source.dart';
import 'package:super_fitness_app/src/data/data_source/online_data_source/auth/auth_online_data_source_impl.dart';
import 'package:super_fitness_app/src/domain/entities/app_user_entity/app_user_entity.dart';
import 'auth_online_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiServices ,AppUserEntity,RegisterRequestModel,RegisterResponseModel])
void main() {
  var apiService=MockApiServices();
  test('should return <AppUserEntity,String> whe call apiServices.register is Success ', () async{
    var appUserEntity=MockAppUserEntity();
    var registerRequestModel=MockRegisterRequestModel();
    var registerResponseModel=MockRegisterResponseModel();
    String token="token";
    AuthOnlineDataSource authOnlineDataSource=AuthOnlineDataSourceImpl(apiService);
    when(apiService.register(registerRequestModel: registerRequestModel)).thenAnswer((realInvocation) async=>registerResponseModel,);
    when(registerResponseModel.toAppUserEntity()).thenReturn(appUserEntity);
    when(registerResponseModel.token).thenReturn(token);
    var actual=await authOnlineDataSource.register(registerRequestModel);
      expect(actual, (appUserEntity, token));

  });
}