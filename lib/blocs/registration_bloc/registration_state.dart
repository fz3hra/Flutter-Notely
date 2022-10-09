part of 'registration_bloc.dart';

@immutable
abstract class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

class RegistrationInitial extends RegistrationState {}

class RegistrationLoading extends RegistrationState {}

class RegistrationSuccess extends RegistrationState {
  final UserModel user;

  const RegistrationSuccess(this.user);
}

class RegistrationError extends RegistrationState {
  final error;
  const RegistrationError({this.error});

  @override
  List<Object> get props => [];
}
