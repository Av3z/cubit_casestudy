import 'package:cubit_casestudy/src/cubit/counter_cubit.dart';
import 'package:cubit_casestudy/src/cubit/dark_mode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    final darkModeCubit = context.read<DarkModeCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            counterCubit.increment();
          }),
      body: Column(
        children: [
          BlocBuilder<DarkModeCubit, bool>(builder: (context, isDarkMode) {
            return Switch(
                value: isDarkMode,
                onChanged: (value) {
                  darkModeCubit.changeMode(value);
                });
          }),
          Center(
            child: BlocBuilder<CounterCubit, int>(builder: (context, counter) {
              return Text("$counter");
            }),
          ),
        ],
      ),
    );
  }
}
