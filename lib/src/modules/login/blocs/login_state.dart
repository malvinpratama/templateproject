import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool isAuth;

  const LoginState({
    this.isAuth = false,
  });

  LoginState copyWith({
    bool? isAuth,
  }) {
    return LoginState(
      isAuth: isAuth ?? this.isAuth,
    );
  }

  @override
  List<Object?> get props => [isAuth];
}
