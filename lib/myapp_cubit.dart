import 'package:bloc_demo/cubit/counter_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

class MyAppCubit extends StatefulWidget {
  const MyAppCubit({super.key, required this.title});

  final String title;

  @override
  State<MyAppCubit> createState() => _MyAppCubitState();
}

class _MyAppCubitState extends State<MyAppCubit> {
  @override
  Widget build(BuildContext context) {
    print('===run build===');
    initStatus() {
      print(CounterCubitState.initial() == CounterCubitStatus.success);
      CounterCubitState.initial() == CounterCubitStatus.success;
      // if (CounterState.initial() == CounterStatus.loading) {
      //   return const Center(
      //     child: CircularProgressIndicator(),
      //   );
      // }
    }

    return Scaffold(
        body: Center(
          child: BlocBuilder<CounterCubitCubit, CounterCubitState>(
            buildWhen: initStatus(),
            builder: (context, state) {
              print(CounterCubitState.initial() == CounterCubitStatus.success);
              print('===run cubit===');
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '${state.counter}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                BlocProvider.of<CounterCubitCubit>(context).increment();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                BlocProvider.of<CounterCubitCubit>(context).decrement();
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ));
  }
}
