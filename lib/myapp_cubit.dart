import 'package:bloc_demo/cubit/counter_cubit_cubit.dart';
import 'package:bloc_demo/detail_screen.dart';
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
          //BlockCunsumer has listener and Build property, if you need listener only use BlocListener
          child: BlocConsumer<CounterCubitCubit, CounterCubitState>(
            listener: (context, state) {
              //jika nilai counter == 3
              if (state.counter == 3) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text('Nilai counter = ${state.counter}'),
                      );
                    });
              } else if (state.counter == -1) {
                // jika nilai counter == -1
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailScreen(),
                  ),
                );
              }
            },
            builder: (context, state) {
              print(CounterCubitState.initial() == CounterCubitStatus.success);
              print('===run cubit===');
              return state.counterStatus == CounterCubitStatus.loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Center(
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
                context.read<CounterCubitCubit>().increment();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              heroTag: null,
              onPressed: () {
                context.read<CounterCubitCubit>().decrement();
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ));
  }
}
