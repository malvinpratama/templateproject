import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final String title;
  final int counterValue;

  const CounterState({
    this.title = "Counter Page",
    this.counterValue = 0,
  });

  CounterState copyWith({
    String? title,
    int? counterValue,
  }) {
    return CounterState(
      title: title ?? this.title,
      counterValue: counterValue ?? this.counterValue);
  }

  @override
  List<Object?> get props => [title, counterValue];
}
