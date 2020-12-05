import 'package:dio/dio.dart';
import 'package:flutter_start_repo/di/appModule.dart';
import 'package:flutter_start_repo/utils/storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<GetIt> configureDependencies(GetIt get, {
String environment,
    EnvironmentFilter environmentFilter}) async
{
  final gh = GetItHelper(get, environment, environmentFilter);
  final appModule = $AppModule();
  gh.lazySingleton<Dio>(() => appModule.dio());
  final sharedPreferences = await appModule.sharedPreferences;
  gh.factory<SharedPreferences>(() => sharedPreferences);
  gh.lazySingleton<Storage>(() => Storage(sharedPreferences));
  return get;
}

class $AppModule extends AppModule {}