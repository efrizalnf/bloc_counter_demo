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
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${BlocProvider.of<CounterBloc>(context, listen: true).state.counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                BlocProvider.of<CounterBloc>(context)
                    .add(CounterIncrementEvent());
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                BlocProvider.of<CounterBloc>(context)
                    .add(CounterDecrementEvent());
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ));
  }
}
