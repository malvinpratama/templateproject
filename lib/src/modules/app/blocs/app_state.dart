import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  final bool isAuth;

  const AppState({
    this.isAuth = false,
  });

  AppState copyWith({
    bool? isAuth,
  }) {
    return AppState(
      isAuth: isAuth ?? this.isAuth,
    );
  }

  @override
  List<Object?> get props => [isAuth];
}
