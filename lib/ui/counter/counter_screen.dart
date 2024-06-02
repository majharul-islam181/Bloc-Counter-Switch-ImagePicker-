import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practise/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_practise/bloc/counter/counter_event.dart';
import 'package:flutter_bloc_practise/bloc/counter/counter_state.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
            return Column(
              children: [
                Center(
                  child: Text(
                    state.counterValue.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    state.conterTotall.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            );
          }),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(IncrementCounter());
                },
                child: const Text('Increment'),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(DecrementCounter());
                },
                child: const Text('Decrement '),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
            return  Text(state.sumValue.toString());
          }),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              context.read<CounterBloc>().add(Sumbutton());
            },
            child: const Text('Sum '),
          ),
        ],
      ),
    );
  }
}
