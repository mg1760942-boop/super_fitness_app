import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:super_fitness_app/core/common/apis/api_result.dart';
import 'package:super_fitness_app/src/api/core/api_request_models/register_request_model/register_request_model.dart';
import 'package:super_fitness_app/src/data/data_source/offline_data_source/auth/auth_offline_data_source/auth_offline_data_source.dart';
import 'package:super_fitness_app/src/data/data_source/online_data_source/auth/auth_online_data_source.dart';
import 'package:super_fitness_app/src/data/repositories_impl/auth_repository_impl.dart';
import 'package:super_fitness_app/src/domain/entities/app_user_entity/app_user_entity.dart';

import 'auth_repository_impl_test.mocks.dart';

@GenerateMocks([AuthOnlineDataSource , AuthOfflineDataSource,AppUserEntity,RegisterRequestModel ])
void main() {
   var authOnlineDataSource=MockAuthOnlineDataSource();
   var authOfflineDataSource=MockAuthOfflineDataSource();
   var authRepositoryImpl=AuthRepositoryImpl(authOnlineDataSource, authOfflineDataSource);
  group("Auth Repository Impl Tester ", () {
      group("Test Method : register ", () {
     test("should return appUserEntity when call  authOnlineDataSource.register and"
         "  call authOfflineDataSource.saveToken is Success", ()async {
        var appUserEntity=MockAppUserEntity();
        var registerRequestModel=MockRegisterRequestModel();
        var response=(appUserEntity,"token");
        when(authOnlineDataSource.register(registerRequestModel)).thenAnswer((realInvocation) async=>response);
        when(authOfflineDataSource.saveToken(token: "token")).thenAnswer((_) async => Success<void>());
        var actual = await authRepositoryImpl.register(registerRequest: registerRequestModel);
         expect(actual, isA<Success<AppUserEntity>>());
     });
      },);
     test("should return ApiError when call  authOnlineDataSource.register and call authOfflineDataSource.saveToken is Error ", () async{
       var registerRequestModel=MockRegisterRequestModel();
       when(authOnlineDataSource.register(registerRequestModel)).thenThrow(Exception());
       when(authOfflineDataSource.saveToken(token: "token")).thenAnswer((_) async => Success<void>());
       var actual = await authRepositoryImpl.register(registerRequest: registerRequestModel);
       expect(actual, isA<Failures<AppUserEntity>>());
     },);

  },);
}