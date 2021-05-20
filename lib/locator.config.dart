// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import 'di/appModule.dart' as _i7;
import 'repository/UserRepository.dart' as _i6;
import 'utils/storage.dart' as _i5;

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
  gh.lazySingleton<_i5.Storage>(() => _i5.Storage(get<_i4.SharedPreferences>()),
      registerFor: {_dev}, dispose: (i) => i.dispose());
  gh.factory<_i6.UserRepository>(() => _i6.UserRepository(),
      registerFor: {_dev});
  return get;
}

class _$AppModule extends _i7.AppModule {}
