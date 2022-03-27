import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'locator.config.dart';

final g = GetIt.instance;

@InjectableInit(initializerName: r"$initGetIt")
Future<void> setupDependencies(String environment) async {
  await $initGetIt(g, environment: environment);
}
