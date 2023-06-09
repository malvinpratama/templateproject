import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:templateproject/src/modules/login/blocs/login_state.dart';
import 'package:templateproject/src/modules/login/views/login_page.dart';

import '../../../utils/app_text_styles.dart';
import '../../app/blocs/app_bloc.dart';
import '../../login/blocs/login_bloc.dart';
import '../blocs/counter_bloc.dart';
import '../blocs/counter_state.dart';

class CounterPage extends StatelessWidget {
  static const String route = '/counter-page';

  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
      ],
      child: BlocConsumer<CounterBloc, CounterState>(
        listener: (context, counterState) {},
        builder: (context, counterState) {
          final CounterBloc counterBloc = context.read<CounterBloc>();

          return BlocConsumer<LoginBloc, LoginState>(
            listener: (context, loginState) async {
              if (!loginState.isAuth) {
                final AppBloc appBloc = context.read<AppBloc>();
                await appBloc.logout();
                if (context.mounted) context.go(LoginPage.route);
              }
            },
            builder: (context, loginState) {
              final LoginBloc loginBloc = context.read<LoginBloc>();

              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    counterState.title,
                    style: AppTextStyles.kParagraph6SemiBold,
                  ),
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'You have pushed the button this many times:',
                      ),
                      Text(
                        '${counterState.counterValue}',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                floatingActionButton: Padding(
                  padding: REdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FloatingActionButton(
                        onPressed: () => counterBloc.decrement(),
                        tooltip: 'Decrement',
                        child: const Icon(Icons.remove),
                      ),
                      FloatingActionButton(
                        onPressed: () => loginBloc.logout(),
                        tooltip: 'Logout',
                        child: const Icon(Icons.exit_to_app),
                      ),
                      FloatingActionButton(
                        onPressed: () => context.go(CounterPage.route),
                        tooltip: 'Force Logout',
                        child: const Icon(Icons.close),
                      ),
                      FloatingActionButton(
                        onPressed: () => counterBloc.increment(),
                        tooltip: 'Increment',
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
