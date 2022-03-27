import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_module.dart';

Future<GetIt> configureDependencies(
  GetIt get, {
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
  final gh = GetItHelper(get, environment, environmentFilter);
  final appModule = $AppModule();
  gh.lazySingleton<Dio>(() => appModule.dio());
  final sharedPreferences = await appModule.sharedPreferences;
  gh.factory<SharedPreferences>(() => sharedPreferences);
  return get;
}

class $AppModule extends AppModule {}
