import 'package:blocwithcleanarchitecture/features/counterApp/presentation/bloc/counter_evnet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';
import '../bloc/counter_state.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter page"),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
        int counterValue = 0;

        if (state is CounterInitial || state is CounterValue) {
          counterValue = (state is CounterInitial)
              ? state.counter
              : (state as CounterValue).counter;
        }
        return Center(
          child: Text('$counterValue'),
        );
      }),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(IncrementEvent()),
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(DecrementEvent()),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
