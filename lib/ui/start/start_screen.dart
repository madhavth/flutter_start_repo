import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_start_repo/notifiers/authentication/authentication_notifier.dart';
import 'package:flutter_start_repo/notifiers/authentication/notifiers.dart';
import 'package:flutter_start_repo/repository/UserRepository.dart';
import 'package:flutter_start_repo/ui/extra/loading.dart';
import 'package:flutter_start_repo/ui/home/home_screen.dart';
import 'package:flutter_start_repo/ui/login/login_screen.dart';
import 'package:flutter_start_repo/ui/screen/splash_screen.dart';

final userRepositoryProvider = Provider<UserRepository>((ref){
  return UserRepository();
});

final authenticationNotifierProvider =
    StateNotifierProvider<AuthenticationNotifier>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return AuthenticationNotifier(userRepository: userRepository);
});

class StartScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final state = watch(authenticationNotifierProvider.state);

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
  }
}
