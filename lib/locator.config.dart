// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'di/appModule.dart';
import 'utils/storage.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<GetIt> $initGetIt(
  GetIt get, {
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
  final gh = GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.lazySingleton<Dio>(() => appModule.dio());
  final sharedPreferences = await appModule.sharedPreferences;
  gh.factory<SharedPreferences>(() => sharedPreferences);
  gh.lazySingleton<Storage>(() => Storage(sharedPreferences));
  return get;
}

class _$AppModule extends AppModule {}
