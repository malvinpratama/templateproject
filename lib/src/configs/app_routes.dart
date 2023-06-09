import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../modules/app/blocs/app_bloc.dart';
import '../modules/counter/views/counter_page.dart';
import '../modules/login/views/login_page.dart';

class AppRoutes {
  static final GoRouter _router = GoRouter(
    initialLocation: LoginPage.route,
    routes: [
      GoRoute(
        path: LoginPage.route,
        pageBuilder: (context, state) {
          return const MaterialPage(child: LoginPage());
        },
      ),
      GoRoute(
        path: CounterPage.route,
        pageBuilder: (context, state) {
          return const MaterialPage(child: CounterPage());
        },
      ),
    ],
    redirect: (context, state) {
      final AppBloc bloc = context.read<AppBloc>();
      if (bloc.isAuth()) {
        return CounterPage.route;
      } else {
        return LoginPage.route;
      }
    },
    debugLogDiagnostics: true,
  );

  static GoRouter get router => _router;
}
