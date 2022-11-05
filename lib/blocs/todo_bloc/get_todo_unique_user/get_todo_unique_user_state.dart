part of 'get_todo_unique_user_bloc.dart';

abstract class GetTodoUniqueUserState extends Equatable {
  const GetTodoUniqueUserState();

  @override
  List<Object> get props => [];
}

class GetTodoUniqueUserLoading extends GetTodoUniqueUserState {}

class GetTodoUniqueUserLoaded extends GetTodoUniqueUserState {
  final List<GetToDoUniqueUserModel> getTodoUniqueUsers;
  GetTodoUniqueUserLoaded(this.getTodoUniqueUsers);
  List<Object> get props => [getTodoUniqueUsers];
}

class GetTodoUniqueUserError extends GetTodoUniqueUserState {
  final String error;
  GetTodoUniqueUserError(this.error);
  List<Object> get props => [error];
}
