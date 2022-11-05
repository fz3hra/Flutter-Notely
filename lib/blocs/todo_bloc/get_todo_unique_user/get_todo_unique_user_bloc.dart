import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notely/models/todoModels/get_todo_unique_user_models.dart';
import 'package:notely/repository/todo_repository/get_todo_unique_user_repository.dart';

part 'get_todo_unique_user_event.dart';
part 'get_todo_unique_user_state.dart';

class GetTodoUniqueUserBloc
    extends Bloc<GetTodoUniqueUserEvent, GetTodoUniqueUserState> {
  final GetTodoUniqueUser getTodoUniqueUsers;
  GetTodoUniqueUserBloc(this.getTodoUniqueUsers)
      : super(GetTodoUniqueUserLoading()) {
    on<GetTodoUniqueUserEvent>((event, emit) async {
      emit(GetTodoUniqueUserLoading());
      try {
        final todoUniqueUserss = await getTodoUniqueUsers.getTodoUniqueUsers();
        emit(GetTodoUniqueUserLoaded(todoUniqueUserss));
      } catch (e) {
        emit(GetTodoUniqueUserError(e.toString()));
      }
    });
  }
}
