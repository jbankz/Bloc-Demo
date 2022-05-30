part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class TriggerNumberEvent extends CounterEvent {}

class TriggerAlphabetEvent extends CounterEvent {}
