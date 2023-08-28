import 'package:templateproject/src/utils/blocs.dart';
part 'app_state.dart';

class AppBloc extends Cubit<AppState> {
  AppBloc() : super(const AppState());

  Future<void> login() async {
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(isAuth: true));
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(isAuth: false));
  }

  bool isAuth() => state.isAuth;
}
