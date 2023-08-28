import 'package:templateproject/src/utils/blocs.dart';
import 'package:templateproject/src/utils/pages.dart';

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
