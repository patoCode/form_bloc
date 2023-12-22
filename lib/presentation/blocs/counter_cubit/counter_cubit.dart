// ! Esta clase es la encargada de manejar el ESTADO <counter_state> :: Manejador de estado
// * Cambiar el package de bloc por flutter_bloc
// import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// * la siguiente linea no es necesaria seria mejor eliminarla, pero la dejo como referencia
// import 'package:meta/meta.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  // * Mucho ojo!!! aca reemplaze <CounterState> a mano, no feu generado por la extension Bloc
  CounterCubit() : super(CounterState(counter: 5));

  void increaseBy(int value) {
    // * Este "modificara" el valor del estado => a esto en Cubit se le llama EMITIR un nuevo estado
    emit(state.copyWith(
      counter: state.counter + 1,
      transactionCount: state.transactionCount + 1,
    ));
  }

  void reset() {
    emit(state.copyWith(
      counter: 0,
      transactionCount: state.transactionCount + 1,
    ));
  }
}
