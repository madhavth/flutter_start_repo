import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class InitialRegisterState extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisteringState extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterError extends RegisterState {
  final String error;

  RegisterError(this.error);
  @override
  List<Object> get props => [error];
}

class RegisterSuccess extends RegisterState {
  @override
  List<Object> get props => [];
}
