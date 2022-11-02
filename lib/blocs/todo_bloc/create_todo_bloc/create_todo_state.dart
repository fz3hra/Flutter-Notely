part of 'create_todo_bloc.dart';

abstract class CreateTodoState extends Equatable {
  const CreateTodoState();

  @override
  List<Object> get props => [];
}

class CreateTodoInitial extends CreateTodoState {}

class CreateTodoLoading extends CreateTodoState {}

class CreateTodoSuccess extends CreateTodoState {
  final CreateTodoModel createTodoModel;

  CreateTodoSuccess(this.createTodoModel);
}

class CreateTodoError extends CreateTodoState {
  final error;

  CreateTodoError({this.error});
}
