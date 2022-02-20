import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_start_repo/features/login/domain/use_cases/authentication/use_cases.dart';
import 'package:flutter_start_repo/locator.dart';
import 'package:flutter_start_repo/utils/simple_bloc_delegate.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import 'core/extras/http_override.dart';
import 'features/login/domain/repositories/UserRepository.dart';
import 'features/login/presentation/cubits/auth/authentication_bloc.dart';
import 'my_app.dart';

String environment = Environment.dev;

var logger = Logger(
    filter: kDebugMode ? DevelopmentFilter() : ProductionFilter(),
    printer: PrettyPrinter(),
    level: kDebugMode ? null : Level.error);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
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
            return AuthenticationBloc(
                authenticationUseCases: g<AuthenticationUseCases>()
            );
          },
        )
      ],
      child: InitScreen(),
    ),
  ));
}
