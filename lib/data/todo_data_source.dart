import 'package:flutter_application_todo/model/todo.dart';

class TodoDataSource {
  final List<Todo> _todoList = [];

  Future<List<Todo>> getTodoList() async {
    return _todoList;
  }

  Future<void> addTodo(Todo todo) async {
    _todoList.add(todo);
  }

  Future<void> removeTodo(int index) async {
    _todoList.removeAt(index);
  }
}
