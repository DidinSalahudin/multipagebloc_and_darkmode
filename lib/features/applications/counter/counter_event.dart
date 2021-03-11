part of 'counter_bloc.dart';

@freezed
abstract class CounterEvent with _$CounterEvent {
  const factory CounterEvent.increament() = _Increament;
  const factory CounterEvent.decrement() = _Decrement;
}
