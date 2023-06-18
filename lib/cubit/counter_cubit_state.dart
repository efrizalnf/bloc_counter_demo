part of 'counter_cubit_cubit.dart';

enum Status { initial, loading, success, error }

class CounterCubitState extends Equatable {
  const CounterCubitState({
    required this.counter,
    required this.counterStatus,
    required this.errorMessage,
  });
  factory CounterCubitState.initial() => const CounterCubitState(
        counter: 0,
        counterStatus: Status.initial,
        errorMessage: '',
      );

  final int counter;
  final Status counterStatus;
  final String errorMessage;

  @override
  List<Object> get props => [counter, counterStatus, errorMessage];

  @override
  String toString() =>
      'CounterCubitState(counter: $counter, counterStatus: $counterStatus, errorMessage: $errorMessage)';

  CounterCubitState copyWith({
    int? counter,
    Status? counterStatus,
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
