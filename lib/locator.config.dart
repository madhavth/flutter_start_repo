// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import 'di/app_module.dart' as _i20;
import 'features/login/data/data_sources/user_repo_local_data_source.dart'
    as _i5;
import 'features/login/data/data_sources/user_repository_remote_data_source.dart'
    as _i7;
import 'features/login/data/repositories/user_repo_local_data_source_impl.dart'
    as _i6;
import 'features/login/data/repositories/user_repository_impl.dart' as _i10;
import 'features/login/data/repositories/user_repository_remote_data_source_impl.dart'
    as _i8;
import 'features/login/domain/repositories/user_repository.dart' as _i9;
import 'features/login/domain/use_cases/authentication/fetch_user_info_use_case.dart'
    as _i11;
import 'features/login/domain/use_cases/authentication/logout_use_case.dart'
    as _i14;
import 'features/login/domain/use_cases/authentication/persist_user_use_case.dart'
    as _i15;
import 'features/login/domain/use_cases/authentication/use_cases.dart' as _i18;
import 'features/login/domain/use_cases/login/login_use_case.dart' as _i12;
import 'features/login/domain/use_cases/login/use_cases.dart' as _i13;
import 'features/login/presentation/cubits/auth/authentication_bloc.dart'
    as _i19;
import 'features/register/domain/usecaes/register_use_case.dart' as _i16;
import 'features/register/domain/usecaes/use_cases.dart' as _i17;

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
  gh.factory<_i11.FetchUserInfoUseCase>(
      () => _i11.FetchUserInfoUseCase(get<_i9.UserRepository>()));
  gh.factory<_i12.LoginUseCase>(
      () => _i12.LoginUseCase(get<_i9.UserRepository>()));
  gh.factory<_i13.LoginUseCases>(
      () => _i13.LoginUseCases(get<_i12.LoginUseCase>()));
  gh.factory<_i14.LogoutUseCase>(
      () => _i14.LogoutUseCase(get<_i9.UserRepository>()));
  gh.factory<_i15.PersistUserInfoUseCase>(
      () => _i15.PersistUserInfoUseCase(get<_i9.UserRepository>()));
  gh.factory<_i16.RegisterUseCase>(
      () => _i16.RegisterUseCase(get<_i9.UserRepository>()));
  gh.factory<_i17.RegisterUseCases>(
      () => _i17.RegisterUseCases(get<_i16.RegisterUseCase>()));
  gh.factory<_i18.AuthenticationUseCases>(() => _i18.AuthenticationUseCases(
      get<_i14.LogoutUseCase>(),
      get<_i15.PersistUserInfoUseCase>(),
      get<_i11.FetchUserInfoUseCase>()));
  gh.factory<_i19.AuthenticationBloc>(() => _i19.AuthenticationBloc(
      authenticationUseCases: get<_i18.AuthenticationUseCases>()));
  return get;
}

class _$AppModule extends _i20.AppModule {}
