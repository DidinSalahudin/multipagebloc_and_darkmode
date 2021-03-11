import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'counter_event.dart';
part 'counter_state.dart';
part 'counter_bloc.freezed.dart';

@injectable
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(_DataValue(0));

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    yield* event.map(
      increament: (_) async* {
        int nilai = state.value;
        yield CounterState.dataValue(nilai + 1);
      },
      decrement: (_) async* {
        int nilai = state.value;
        print(nilai);
        yield CounterState.dataValue(nilai - 1);
      },
    );
  }
}
