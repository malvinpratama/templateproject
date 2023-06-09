import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocProvider<B extends StateStreamableSource<S>, S> extends StatelessWidget {
  final B Function(BuildContext context) create;
  final void Function(BuildContext context, S state) listener;
  final Widget Function(BuildContext context, S state) builder;
  final bool? lazy;

  const CustomBlocProvider(
      {super.key,
      required this.create,
      required this.listener,
      required this.builder, this.lazy});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: create,
      lazy: lazy ?? true,
      child: BlocConsumer<B, S>(
        listener: listener,
        builder: builder,
      ),
    );
  }
}
