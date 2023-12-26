import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';

part 'counter_event.dart';

part 'counter_state.dart';

// * Controlador de estado

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    // * handler o manejador de los eventos
    on<CounterIncresed>((event, emit) {
      emit(state.copyWith(
          counter: state.counter + event.values,
          transactionCount: state.transactionCount + 1));
    });
  }
}
