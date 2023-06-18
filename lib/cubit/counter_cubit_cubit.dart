import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_cubit_state.dart';

class CounterCubitCubit extends Cubit<CounterCubitState> {
  CounterCubitCubit() : super(CounterCubitState.initial());

  increment() async {
    emit(state.copyWith(
      counterStatus: CounterCubitStatus.loading,
    ));
    await Future.delayed(const Duration(seconds: 2));
    emit(
      state.copyWith(
        counter: state.counter + 1,
        counterStatus: CounterCubitStatus.success,
      ),
    );
  }

  decrement() async {
    emit(state.copyWith(
      counterStatus: CounterCubitStatus.loading,
    ));
    await Future.delayed(const Duration(seconds: 2));
    emit(
      state.copyWith(
        counter: state.counter - 1,
        counterStatus: CounterCubitStatus.success,
      ),
    );
  }
}
