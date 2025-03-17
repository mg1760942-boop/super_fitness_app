import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:super_fitness_app/src/data/api/api_services.dart';
import 'package:super_fitness_app/src/data/api/core/api_request_models/login/login_request.dart';
import 'package:super_fitness_app/src/data/api/core/api_request_models/register/register_request_model.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/login/login_response.dart';
import 'package:super_fitness_app/src/data/api/core/api_response_models/register/register_response_model.dart';
import 'package:super_fitness_app/src/data/api/upload_api_manger/upload_api_manger.dart';
import 'package:super_fitness_app/src/data/data_source/online_data_source/auth/auth_online_data_source.dart';
import 'package:super_fitness_app/src/data/data_source/online_data_source/auth/auth_online_data_source_impl.dart';
import 'package:super_fitness_app/src/domain/entities/app_user_entity/app_user_entity.dart';

import 'auth_online_data_source_impl_test.mocks.dart';

@GenerateMocks([
  ApiServices,
  AppUserEntity,
  RegisterRequestModel,
  RegisterResponseModel,
  LoginResponse,
  LoginRequest
])
void main() {
  late MockApiServices apiService;
  late AuthOnlineDataSource authOnlineDataSource;

  setUp(() {
    apiService = MockApiServices();
    authOnlineDataSource = AuthOnlineDataSourceImpl( apiService,UploadApiManagerImpl());
  });
  test(
      'should return <AppUserEntity,String> whe call apiServices.register is Success ',
      () async {
    var appUserEntity = MockAppUserEntity();
    var registerRequestModel = MockRegisterRequestModel();
    var registerResponseModel = MockRegisterResponseModel();
    String token = "token";

    when(apiService.register(registerRequestModel: registerRequestModel))
        .thenAnswer(
      (realInvocation) async => registerResponseModel,
    );
    when(registerResponseModel.toAppUserEntity()).thenReturn(appUserEntity);
    when(registerResponseModel.token).thenReturn(token);


    var actual = await authOnlineDataSource.register(registerRequestModel);
    expect(actual, (appUserEntity, token));
  });

  group('login', () {
    test('should return LoginResponse with a non-empty token when successful',
        () async {
      final loginRequest = MockLoginRequest();
      final loginResponse = MockLoginResponse();
      const token = "token";


      when(apiService.login(loginRequest))
          .thenAnswer((_) async => loginResponse);
      when(loginResponse.token).thenReturn(token);

      final result = await authOnlineDataSource.login(loginRequest);

      expect(result, equals(loginResponse));
      expect(result.token, equals(token));
      verify(apiService.login(loginRequest)).called(1);
    });

    test(
        'should return LoginResponse with a null token if loginResponse.token is null',
        () async {
      final loginRequest = MockLoginRequest();
      final loginResponse = MockLoginResponse();

      when(apiService.login(loginRequest))
          .thenAnswer((_) async => loginResponse);
      when(loginResponse.token).thenReturn(null);

      final result = await authOnlineDataSource.login(loginRequest);

      expect(result.token, isNull);
      verify(apiService.login(loginRequest)).called(1);
    });

    test(
        'should return LoginResponse with an empty token if loginResponse.token is empty',
        () async {
      final loginRequest = MockLoginRequest();
      final loginResponse = MockLoginResponse();

      when(apiService.login(loginRequest))
          .thenAnswer((_) async => loginResponse);
      when(loginResponse.token).thenReturn('');

      final result = await authOnlineDataSource.login(loginRequest);

      expect(result.token, equals(''));
      verify(apiService.login(loginRequest)).called(1);
    });

    test('should throw an exception when apiServices.login fails', () async {
      final loginRequest = MockLoginRequest();

      when(apiService.login(loginRequest)).thenThrow(Exception("Login Failed"));

      expect(
        () async => await authOnlineDataSource.login(loginRequest),
        throwsException,
      );
      verify(apiService.login(loginRequest)).called(1);
    });

    test('should call apiServices.login exactly once per login call', () async {
      final loginRequest = MockLoginRequest();
      final loginResponse = MockLoginResponse();
      const token = "token";
      when(apiService.login(loginRequest))
          .thenAnswer((_) async => loginResponse);
      when(loginResponse.token).thenReturn(token);

      final result1 = await authOnlineDataSource.login(loginRequest);
      final result2 = await authOnlineDataSource.login(loginRequest);

      expect(result1.token, equals(token));
      expect(result2.token, equals(token));
      verify(apiService.login(loginRequest)).called(2);
    });
  });
}
