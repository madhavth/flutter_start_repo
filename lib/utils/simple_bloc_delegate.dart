import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {

  @override
  void onChange(Cubit cubit, Change change) {
    super.onChange(cubit, change);
    print('onChange cubit $change, $cubit');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(cubit, Object error, StackTrace stacktrace) {
    super.onError(cubit, error, stacktrace);
    print(error);
  }
}
