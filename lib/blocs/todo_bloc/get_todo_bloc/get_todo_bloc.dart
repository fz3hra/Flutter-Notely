import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_todo_event.dart';
part 'get_todo_state.dart';

class GetTodoBloc extends Bloc<GetTodoEvent, GetTodoState> {
  GetTodoBloc() : super(GetTodoInitial()) {
    on<GetTodoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
