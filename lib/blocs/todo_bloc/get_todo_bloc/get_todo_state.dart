part of 'get_todo_bloc.dart';

abstract class GetTodoState extends Equatable {
  const GetTodoState();
  
  @override
  List<Object> get props => [];
}

class GetTodoInitial extends GetTodoState {}
