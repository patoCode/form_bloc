// ! Esta clase es el !!!ESTADO !!!!
// * Este archivo es parte de counter_cubit
part of 'counter_cubit.dart';

// * Lo siguiente debe eliminarse cuando cambiemos el package de bloc a flutter_bloc, para referencias yo solo lo comento
// @immutable
// sealed class CounterState {}
// final class CounterInitial extends CounterState {}
// * esto es lo nuevo
class CounterState extends Equatable {
  final int counter;
  final int transactionCount;

  const CounterState({
    this.counter = 0,
    this.transactionCount = 0,
  });

  // * Siempre se recomienda tener un metodo copyWith
  copyWith({
    int? counter,
    int? transactionCount,
  }) =>
      CounterState(
        counter: counter ?? this.counter,
        transactionCount: transactionCount ?? this.transactionCount,
      );

  // * Obligado despues de extender de Equatable. Los props se mandan como una lista de campos
  @override
  List<Object> get props => [counter, transactionCount];
}
