import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../mock/mockNetwork.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final _service = MockDelayService();

  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, showState) async {
      if (event is TriggerNumberEvent) {
        try {
          showState(CounterLoading());
          var v = await _service.delay();
          if (v is int) {
            showState(CounterSuccess('$v'));
          } else {
            showState(CounterFailed('This is not an integer value'));
          }
        } catch (e) {
          showState(CounterFailed('This is an unknown data type: $e'));
        }
      }
    });
  }
}
