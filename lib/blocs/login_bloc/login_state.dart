part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserLoginModel loginUser;

  const LoginSuccess(this.loginUser);
}

class LoginError extends LoginState {
  final loginError;

  const LoginError({this.loginError});

  @override
  List<Object> get props => [];
}
