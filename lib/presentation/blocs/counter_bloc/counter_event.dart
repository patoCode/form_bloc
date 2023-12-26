part of 'counter_bloc.dart';

// * Ete permite defirnir que tipos de eventos puede recibir

sealed class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class CounterIncresed extends CounterEvent {
  final int values;

  const CounterIncresed(this.values);
}
