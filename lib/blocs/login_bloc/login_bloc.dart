import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:notely/models/userModels/userLoginModel.dart';
import 'package:notely/repository/userAuth_repository/loginRepository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _loginRepository;
  LoginBloc(this._loginRepository) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      final storage = const FlutterSecureStorage();
      emit(LoginLoading());
      try {
        String email = event.email;
        String password = event.password;
        final loginUser = await _loginRepository.loginUsers(email, password);
        await storage.write(key: "KEY_TOKEN", value: loginUser!.token);
        emit(LoginSuccess(loginUser!));
      } catch (loginError) {
        emit(LoginError(loginError: loginError));
      }
    });
  }
}
