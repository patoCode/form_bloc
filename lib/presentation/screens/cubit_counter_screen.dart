import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_bloc/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // * Para poder asociar el CUBIT a alguna vista se usa el widget <BlocProdiver>
    return BlocProvider(
      // * y en el <create> retornamos la instancia del Cubit que se hara cargo del estado
      create: (context) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  void increseCounterBy(BuildContext ctx, [int value = 1]) {
    ctx.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    // * Al igual que Riverpod podemos escuchar los cambios del estado utilizando la siguiente linea
    final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text("Cubit counter ${counterState.transactionCount}"),
        actions: [
          IconButton(
            onPressed: () => context.read<CounterCubit>().reset(),
            icon: const Icon(Icons.refresh_rounded),
          )
        ],
      ),
      body: Center(
        // * BlocBuilder => permite manejar el estado CounterState usando el CounterCubit
        child: BlocBuilder<CounterCubit, CounterState>(
          // * La sgte linea permite reconstruir el elemento solo cuando se cumple la condicion
          // buildWhen: (previous, current) => current.counter != previous.counter,
          builder: (context, state) {
            print("Counter cambio");
            return Text(
              "Counter cubits ${state.counter}",
              style: const TextStyle(
                fontSize: 20,
              ),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: const Text("+3"),
            onPressed: () => increseCounterBy(context, 3),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: '2',
            child: const Text("+2"),
            onPressed: () => increseCounterBy(context, 2),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: '3',
            child: const Text("+1"),
            onPressed: () => increseCounterBy(context),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
