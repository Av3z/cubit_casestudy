import 'package:cubit_casestudy/src/models/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<TodoModel>> {
  TodoCubit() : super([]);

  void addTodo(String todo) {
    final newTodo =
        TodoModel(title: todo, description: DateTime.now().toString());
    emit([...state, newTodo]);
  }
}
