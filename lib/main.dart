import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_start_repo/bloc/authentication/bloc.dart';
import 'package:flutter_start_repo/locator.dart';
import 'package:flutter_start_repo/repository/UserRepository.dart';
import 'package:flutter_start_repo/ui/extra/loading.dart';
import 'package:flutter_start_repo/ui/home/home_screen.dart';
import 'package:flutter_start_repo/ui/login/login_screen.dart';
import 'package:flutter_start_repo/ui/screen/splash_screen.dart';
import 'package:flutter_start_repo/utils/color.dart';
import 'package:flutter_start_repo/utils/router.dart';
import 'package:flutter_start_repo/utils/simple_bloc_delegate.dart';
import 'package:injectable/injectable.dart';

String environment = Environment.dev;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  setupDependencies(environment);
  final userRepository = UserRepository();
  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider<UserRepository>(create: (context) => userRepository),
    ],
    child: BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userRepository: userRepository);
      },
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Doctor',
      theme: ThemeData(
          fontFamily: 'Avenir',
          textTheme: TextTheme(
              bodyText1: TextStyle(color: CustomColor.DEFAULT_TEXT_COLOR),
              bodyText2: TextStyle(
                color: CustomColor.DEFAULT_TEXT_COLOR,
                fontSize: 15,
              ),
              headline6: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
          primaryColor: CustomColor.PRIMARY_COLOR,
          accentColor: CustomColor.ACCENT_COLOR,
          appBarTheme: AppBarTheme(
              brightness: Brightness.dark,
              iconTheme: IconThemeData(color: Colors.white))),
      onGenerateRoute: (settings) => Router.onGenerateRoute(settings),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
            return HomeScreen();
          }
          if (state is AuthenticationUnauthenticated) {
            return LoginScreen();
            // return RegisterScreen();
          }
          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }
          return SplashScreen();
        },
      ),
    );
  }
}
