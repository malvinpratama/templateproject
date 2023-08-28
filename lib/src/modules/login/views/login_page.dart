
import 'package:templateproject/src/modules/shared/widget/custom_bloc_provider.dart';
import 'package:templateproject/src/utils/app_text_styles.dart';
import 'package:templateproject/src/utils/blocs.dart';
import 'package:templateproject/src/utils/pages.dart';

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
