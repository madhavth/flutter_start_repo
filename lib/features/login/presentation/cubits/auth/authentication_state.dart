import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
   @override
  List<Object> get props => [];
}

  
class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState{}

class AuthenticationUnauthenticated extends AuthenticationState {

}

class AuthenticationFailure extends AuthenticationState {
  final String error;

  AuthenticationFailure(this.error);
}

class AuthenticationLoading extends AuthenticationState {}

