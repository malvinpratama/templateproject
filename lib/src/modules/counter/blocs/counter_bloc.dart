import 'package:templateproject/src/utils/blocs.dart';
part 'counter_state.dart';

class CounterBloc extends Cubit<CounterState> {
  CounterBloc() : super(const CounterState());

  void increment() {
    final int newValue = state.counterValue + 1;
    emit(state.copyWith(counterValue: newValue));
  }

void decrement() {
    final int newValue = state.counterValue - 1;
    if (newValue >= 0) {
      emit(state.copyWith(counterValue: newValue));
    }
  }
}
