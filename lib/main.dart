import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_start_repo/features/login/presentation/manager/auth/bloc.dart';
import 'package:flutter_start_repo/locator.dart';
import 'package:flutter_start_repo/features/login/data/repositories/UserRepositoryImpl.dart';
import 'package:flutter_start_repo/utils/simple_bloc_delegate.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import 'features/login/domain/repositories/UserRepository.dart';
import 'my_app.dart';

String environment = Environment.dev;

var logger = Logger(
    filter: kDebugMode ? DevelopmentFilter() : ProductionFilter(),
    printer: PrettyPrinter(),
    level: kDebugMode ? null : Level.error);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await setupDependencies(environment);
  final userRepository = g<UserRepository>();
  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider<UserRepository>(create: (context) => userRepository),
    ],
    child: MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) {
            return AuthenticationBloc(userRepository: userRepository);
          },
        )
      ],
      child: InitScreen(),
    ),
  ));
}
