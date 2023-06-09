import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(const LoginState());

  Future<void> login() async {
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(isAuth: true));
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(isAuth: false));
  }
}
