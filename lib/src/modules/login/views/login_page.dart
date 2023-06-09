import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../utils/app_text_styles.dart';
import '../../app/blocs/app_bloc.dart';
import '../../counter/views/counter_page.dart';
import '../../shared/widget/custom_bloc_provider.dart';
import '../blocs/login_bloc.dart';
import '../blocs/login_state.dart';

class LoginPage extends StatelessWidget {
  static const String route = '/login-page';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBlocProvider<LoginBloc, LoginState>(
      create: (context) => LoginBloc(),
      listener: (context, state) async {
        if (state.isAuth) {
          final AppBloc appBloc = context.read<AppBloc>();
          await appBloc.login();
          if (context.mounted) context.go(CounterPage.route);
        }
      },
      builder: (context, state) {
        final LoginBloc bloc = context.read<LoginBloc>();
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Login",
              style: AppTextStyles.kParagraph6SemiBold,
            ),
          ),
          body: Center(
            child: ElevatedButton(
              onPressed: () => bloc.login(),
              child: const Center(
                child: Text("Login"),
              ),
            ),
          ),
        );
      },
    );
  }
}
