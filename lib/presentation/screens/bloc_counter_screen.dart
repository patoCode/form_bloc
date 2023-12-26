import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_bloc/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // * BlocProvider => es el widget que permite acceder a los estados del bloc dentro de un screen
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const BlocCounterView(),
    );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });

  void increaseCounterBy(BuildContext ctx, [int value = 1]) {
    ctx.read<CounterBloc>().add(CounterIncresed(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select(
          (CounterBloc bloc) => Text(
            "Bloc counter ${bloc.state.transactionCount}",
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => context.read<CounterBloc>().add(CounterReset()),
            icon: const Icon(Icons.refresh_rounded),
          )
        ],
      ),
      body: Center(
        child: context.select(
          (CounterBloc counterBloc) =>
              Text("Counter values: ${counterBloc.state.counter}"),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: const Text("+3"),
            onPressed: () => increaseCounterBy(context, 3),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: '2',
            child: const Text("+2"),
            onPressed: () => increaseCounterBy(context, 2),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: '3',
            child: const Text("+1"),
            onPressed: () => increaseCounterBy(context),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
