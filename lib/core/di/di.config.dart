// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../src/data/api/api_services.dart' as _i318;
import '../../src/data/api/network_factory.dart' as _i801;
import '../../src/data/data_source/offline_data_source/auth/auth_offline_data_source/auth_offline_data_source.dart'
    as _i506;
import '../../src/data/data_source/offline_data_source/auth/auth_offline_data_source/auth_offline_data_source_impl.dart'
    as _i122;
import '../../src/data/data_source/online_data_source/auth/auth_online_data_source.dart'
    as _i599;
import '../../src/data/data_source/online_data_source/auth/auth_online_data_source_impl.dart'
    as _i299;
import '../../src/data/repository/auth/auth_repository_impl.dart' as _i478;
import '../../src/domain/repositories/auth/auth_repository.dart' as _i701;
import '../../src/domain/usecases/auth/forget_password/forget_password_use_case.dart'
    as _i673;
import '../../src/domain/usecases/auth/login/login_usecase.dart' as _i1005;
import '../../src/domain/usecases/auth/register/register_use_case.dart'
    as _i545;
import '../../src/presentation/managers/forget_password/controller_manager.dart'
    as _i753;
import '../../src/presentation/managers/forget_password/forget_password_screen_view_model.dart'
    as _i340;
import '../../src/presentation/managers/forget_password/validation_manager.dart'
    as _i92;
import '../../src/presentation/managers/login/login_viewmodel.dart' as _i475;
import '../../src/presentation/managers/register/register_viewmodel.dart'
    as _i278;
import '../helpers/shared_pref/shared_pref_moduel.dart' as _i802;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final sharedPrefModule = _$SharedPrefModule();
    final dioProvider = _$DioProvider();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPrefModule.sharedPreferences,
      preResolve: true,
    );
    gh.singleton<_i753.ForgetPasswordScreenControllerManger>(
        () => _i753.ForgetPasswordScreenControllerManger());
    gh.singleton<_i92.ForgetPasswordScreenValidatorManager>(
        () => _i92.ForgetPasswordScreenValidatorManager());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => sharedPrefModule.secureStorage);
    gh.lazySingleton<_i361.Dio>(() => dioProvider.dioProvider());
    gh.lazySingleton<_i528.PrettyDioLogger>(() => dioProvider.providePretty());
    gh.factory<_i506.AuthOfflineDataSource>(
        () => _i122.AuthOfflineDataSourceImpl());
    gh.singleton<_i318.ApiServices>(() => _i318.ApiServices(gh<_i361.Dio>()));
    gh.factory<_i599.AuthOnlineDataSource>(
        () => _i299.AuthOnlineDataSourceImpl(gh<_i318.ApiServices>()));
    gh.factory<_i701.AuthRepository>(() => _i478.AuthRepositoryImpl(
          gh<_i599.AuthOnlineDataSource>(),
          gh<_i506.AuthOfflineDataSource>(),
        ));
    gh.factory<_i1005.LoginUsecase>(
        () => _i1005.LoginUsecase(gh<_i701.AuthRepository>()));
    gh.factory<_i475.LoginViewmodel>(
        () => _i475.LoginViewmodel(gh<_i1005.LoginUsecase>()));
    gh.factory<_i673.ForgetPasswordUseCase>(
        () => _i673.ForgetPasswordUseCase(gh<_i701.AuthRepository>()));
    gh.factory<_i545.RegisterUseCase>(
        () => _i545.RegisterUseCase(gh<_i701.AuthRepository>()));
    gh.factory<_i278.RegisterViewModel>(
        () => _i278.RegisterViewModel(gh<_i545.RegisterUseCase>()));
    gh.factory<_i340.ForgetPasswordScreenViewModel>(
        () => _i340.ForgetPasswordScreenViewModel(
              gh<_i673.ForgetPasswordUseCase>(),
              gh<_i753.ForgetPasswordScreenControllerManger>(),
              gh<_i92.ForgetPasswordScreenValidatorManager>(),
            ));
    return this;
  }
}

class _$SharedPrefModule extends _i802.SharedPrefModule {}

class _$DioProvider extends _i801.DioProvider {}
