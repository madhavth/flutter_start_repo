import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {

  final String errorMessage;
  final List _properties;
  // If the subclasses have some properties, they'll get passed to this constructor
  // so that Equatable can perform value comparison.
  Failure(this.errorMessage, [this._properties = const <dynamic>[]]);


  @override
  List<Object?> get props => [errorMessage, ..._properties];
}