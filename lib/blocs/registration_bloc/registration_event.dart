part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  get name => "";
  get email => "";
  get password => "";

  @override
  List<Object> get props => [];
}

class RegisteringEvent extends RegistrationEvent {
  final String name, email, password;

  const RegisteringEvent({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [name, email, password];
}
