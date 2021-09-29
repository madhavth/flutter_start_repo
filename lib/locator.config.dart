// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import 'di/appModule.dart' as _i11;
import 'features/login/data/data_sources/user_repo_local_data_source.dart'
    as _i5;
import 'features/login/data/data_sources/user_repository_remote_data_source.dart'
    as _i7;
import 'features/login/data/repositories/user_repo_local_data_source_impl.dart'
    as _i6;
import 'features/login/data/repositories/user_repository_remote_data_source_impl.dart'
    as _i8;
import 'features/login/data/repositories/UserRepositoryImpl.dart' as _i10;
import 'features/login/domain/repositories/UserRepository.dart' as _i9;

const String _dev = 'dev';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.factory<_i3.Dio>(() => appModule.dio());
  await gh.factoryAsync<_i4.SharedPreferences>(
      () => appModule.sharedPreferences,
      preResolve: true);
  gh.factory<_i5.UserRepoLocalDataSource>(
      () => _i6.UserRepoLocalDataSourceImpl(get<_i4.SharedPreferences>()));
  gh.factory<_i7.UserRepositoryRemoteDataSource>(
      () => _i8.UserRepoRemoteDataSourceImpl(get<_i3.Dio>()));
  gh.factory<_i9.UserRepository>(
      () => _i10.UserRepositoryImpl(
          remoteDataSource: get<_i7.UserRepositoryRemoteDataSource>(),
          localDataSource: get<_i5.UserRepoLocalDataSource>()),
      registerFor: {_dev});
  return get;
}

class _$AppModule extends _i11.AppModule {}
