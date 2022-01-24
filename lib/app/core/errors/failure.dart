import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List props = const <dynamic>[]]);
}

class ServerFailure extends Failure {
  @override
  List<Object> get props => const [];
}

class LoginInfoError extends Failure {
  @override
  List<Object?> get props => [];
}

class ConnectionError extends Failure {
  @override
  List<Object?> get props => [];
}
