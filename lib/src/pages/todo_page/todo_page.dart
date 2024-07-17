import 'package:cubit_casestudy/src/pages/todo_page/cubit/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController todoEC = TextEditingController();
    final todoCubit = BlocProvider.of<TodoCubit>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Todo'),
      ),
      body: SizedBox(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: todoEC,
                )),
                IconButton(
                    onPressed: () => todoCubit.addTodo(todoEC.text),
                    icon: const Icon(Icons.add))
              ],
            )
          ],
        ),
      ),
    );
  }
}
