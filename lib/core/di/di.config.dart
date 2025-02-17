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

import '../../src/api/api_services.dart' as _i587;
import '../../src/api/network_factory.dart' as _i1041;
import '../../src/data/data_source/online_data_source/auth/auth_online_data_source.dart'
    as _i599;
import '../../src/data/data_source/online_data_source/auth/auth_online_data_source_impl.dart'
    as _i299;
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
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => sharedPrefModule.secureStorage);
    gh.lazySingleton<_i361.Dio>(() => dioProvider.dioProvider());
    gh.lazySingleton<_i528.PrettyDioLogger>(() => dioProvider.providePretty());
    gh.singleton<_i587.ApiServices>(() => _i587.ApiServices(gh<_i361.Dio>()));
    gh.factory<_i599.AuthOnlineDataSource>(
        () => _i299.AuthOnlineDataSourceImpl(gh<_i587.ApiServices>()));
    return this;
  }
}

class _$SharedPrefModule extends _i802.SharedPrefModule {}

class _$DioProvider extends _i1041.DioProvider {}
