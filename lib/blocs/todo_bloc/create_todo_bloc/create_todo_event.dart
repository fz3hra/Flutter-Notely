part of 'create_todo_bloc.dart';

abstract class CreateTodoEvent extends Equatable {
  const CreateTodoEvent();

  get noteUserId => '';
  get noteTitle => '';
  get noteContent => '';

  @override
  List<Object> get props => [];
}

class CreatingTodoEvent extends CreateTodoEvent {
  final String noteUserId;
  final String noteTitle, noteContent;

  const CreatingTodoEvent({
    required this.noteUserId,
    required this.noteTitle,
    required this.noteContent,
  });

  @override
  List<Object> get props => [noteUserId, noteTitle, noteContent];
}
