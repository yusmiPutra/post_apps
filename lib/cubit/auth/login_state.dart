part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final ResLogin? resLogin;
  LoginSuccess(this.resLogin);
}

class LoginError extends LoginState {
  final String? message;
  LoginError(this.message);
}

class LoginFailed extends LoginState {
  final String? message;
  LoginFailed(this.message);
}
