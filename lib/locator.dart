import 'package:flutter_start_repo/locator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final g = GetIt.instance;

@InjectableInit()
setupDependencies(String environment){
  $initGetIt(g, environment: environment);
}
