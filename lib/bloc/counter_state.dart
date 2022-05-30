part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterLoading extends CounterState {}

class CounterSuccess extends CounterState {
  final String message;

  CounterSuccess(this.message);
}

class CounterFailed extends CounterState {
  final String message;

  CounterFailed(this.message);
}
