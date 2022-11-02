import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notely/models/todoModels/create_todo_models.dart';
import 'package:notely/repository/todo_repository/create_todo_repository.dart';

part 'create_todo_event.dart';
part 'create_todo_state.dart';

class CreateTodoBloc extends Bloc<CreateTodoEvent, CreateTodoState> {
  final CreateTodoRepository _createTodoRepository;
  CreateTodoBloc(this._createTodoRepository) : super(CreateTodoInitial()) {
    on<CreateTodoEvent>((event, emit) async {
      emit(CreateTodoLoading());
      try {
        String noteTitle = event.noteTitle;
        String noteContent = event.noteContent;
        final createTodos =
            await _createTodoRepository.createTodos(noteTitle, noteContent);
        emit(CreateTodoSuccess(createTodos!));
      } catch (e) {
        emit(CreateTodoError(error: e));
      }
    });
  }
}
