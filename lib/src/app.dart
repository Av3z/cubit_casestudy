import 'package:cubit_casestudy/src/cubit/counter_cubit.dart';
import 'package:cubit_casestudy/src/cubit/dark_mode_cubit.dart';
import 'package:cubit_casestudy/src/pages/home_page.dart';
import 'package:cubit_casestudy/src/pages/todo_page/cubit/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CounterCubit()),
          BlocProvider(create: (_) => DarkModeCubit()),
          BlocProvider(
            create: (context) => TodoCubit(),
          )
        ],
        child: BlocBuilder<DarkModeCubit, bool>(builder: (context, isDarkMode) {
          return MaterialApp(
            theme: isDarkMode
                ? ThemeData.dark(useMaterial3: true)
                : ThemeData.light(useMaterial3: true),
            home: const HomePage(),
          );
        }));
  }
}
