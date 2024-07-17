import 'package:cubit_casestudy/src/cubit/dark_mode_cubit.dart';
import 'package:cubit_casestudy/src/models/todo_model.dart';
import 'package:cubit_casestudy/src/pages/todo_page/cubit/todo_cubit.dart';
import 'package:cubit_casestudy/src/pages/todo_page/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final darkModeCubit = context.read<DarkModeCubit>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Cubit'),
          centerTitle: true,
          actions: [
            BlocBuilder<DarkModeCubit, bool>(builder: (context, isDarkMode) {
              return Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    darkModeCubit.changeMode(value);
                  });
            }),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TodoPage(),
                  ));
            }),
        body: BlocBuilder<TodoCubit, List<TodoModel>>(
          builder: (context, todos) {
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todos[index].title),
                );
              },
            );
          },
        ));
  }
}
