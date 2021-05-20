import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_start_repo/main.dart';

class SimpleBlocObserver extends BlocObserver {


  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logger.i(transition);
  }

  @override
  void onError(cubit, Object error, StackTrace stacktrace) {
    super.onError(cubit, error, stacktrace);
    logger.e(error);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logger.d('onChange cubit $change, $bloc');
  }
}
