import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:templateproject/src/modules/counter/blocs/counter_state.dart';
import 'package:templateproject/src/modules/counter/blocs/couter_bloc.dart';
import 'package:templateproject/src/modules/shared/widget/custom_bloc_provider.dart';
import 'package:templateproject/src/utils/app_text_styles.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBlocProvider<CounterBloc, CounterState>(
      create: (context) => CounterBloc(),
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(
            state.title,
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
                '${state.counterValue}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () => context.read<CounterBloc>().decrement(),
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: () => context.read<CounterBloc>().increment(),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
