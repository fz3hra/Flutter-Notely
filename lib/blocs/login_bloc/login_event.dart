part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  get email => '';
  get password => '';

  @override
  List<Object> get props => [];
}

class LoginingEvent extends LoginEvent {
  final String email, password;

  const LoginingEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
