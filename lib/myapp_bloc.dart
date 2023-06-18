import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

class MyAppBloc extends StatefulWidget {
  const MyAppBloc({super.key, required this.title});

  final String title;

  @override
  State<MyAppBloc> createState() => _MyAppBlocState();
}

class _MyAppBlocState extends State<MyAppBloc> {
  @override
  Widget build(BuildContext context) {
    print('===build method run====');
    final counterState =
        BlocProvider.of<CounterBloc>(context, listen: true).state;
    Widget body = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '${counterState.counter}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );

    if (counterState.counterStatus == CounterStatus.loading) {
      body = const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (counterState.counterStatus == CounterStatus.success) {
      body;
    }
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: body,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                BlocProvider.of<CounterBloc>(context)
                    .add(CounterIncrementEvent());
                print('===bloc run====');
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
