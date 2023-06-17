part of 'counter_bloc.dart';

enum CounterStatus { initial, loading, success, error }

class CounterState extends Equatable {
  const CounterState({
    required this.counter,
    required this.counterStatus,
    required this.error,
  });
  final int counter;
  final CounterStatus counterStatus;
  final String error;

  factory CounterState.initial() => const CounterState(
        counter: 0,
        counterStatus: CounterStatus.initial,
        error: '',
      );

  @override
  List<Object> get props => [counter, counterStatus, error];

  @override
  bool get stringify => true;

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
      counterStatus: counterStatus ?? this.counterStatus,
      error: error ?? this.error,
    );
  }

  @override
  String toString() =>
      'CounterState(counter: $counter, counterState : $counterStatus, error : $error)';
}

// class CounterInitial extends CounterState {
//   CounterInitial({required super.counter});
// }
