part of 'counter_bloc.dart';

@freezed
abstract class CounterState with _$CounterState {
  const factory CounterState.dataValue(int value) = _DataValue;
}
