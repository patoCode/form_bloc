import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';

part 'counter_event.dart';

part 'counter_state.dart';

// * Controlador de estado

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    // * handler o manejador de los eventos
    // * La linea de abajo es lo mismo q hacer on<CounterIncresed>((event, emit) => _onCounterEncreased(event, emit))
    on<CounterIncresed>(_onCounterEncreased);
    // * EXPLICACION => hacer lo de arriba solo funciona cuando la primera funcion enviara los mismos parametros en el mismo orden en el que los recibe a la otra funcion
    // * ["on" enviara los mismos parametros en el mismo orden a la funcion "_onCounterEncrease"]
  }

  void _onCounterEncreased(CounterIncresed event, Emitter<CounterState> emit) {
    emit(state.copyWith(
        counter: state.counter + event.values,
        transactionCount: state.transactionCount + 1));
  }
}
