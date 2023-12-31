part of 'counter_cubit_cubit.dart';

enum CounterCubitStatus { initial, loading, success, error }

class CounterCubitState extends Equatable {
  const CounterCubitState({
    required this.counter,
    required this.counterStatus,
    required this.errorMessage,
  });
  factory CounterCubitState.initial() => const CounterCubitState(
        counter: 0,
        counterStatus: CounterCubitStatus.initial,
        errorMessage: '',
      );

  final int counter;
  final CounterCubitStatus counterStatus;
  final String errorMessage;

  @override
  List<Object> get props => [counter, counterStatus, errorMessage];

  @override
  String toString() =>
      'CounterCubitState(counter: $counter, counterStatus: $counterStatus, errorMessage: $errorMessage)';

  CounterCubitState copyWith({
    int? counter,
    CounterCubitStatus? counterStatus,
    String? errorMessage,
  }) {
    return CounterCubitState(
      counter: counter ?? this.counter,
      counterStatus: counterStatus ?? this.counterStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

// class CounterCubitInitial extends CounterCubitState {}
