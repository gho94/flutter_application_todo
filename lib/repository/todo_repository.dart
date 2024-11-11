import 'package:flutter_application_todo/data/todo_data_source.dart';
import 'package:flutter_application_todo/model/todo.dart';

class TodoRepository {
  final TodoDataSource _dataSource = TodoDataSource();

  Future<List<Todo>> getTodoList() async {
    return _dataSource.getTodoList();
  }

  Future<void> addTodo(Todo todo) async {
    return _dataSource.addTodo(todo);
  }

  Future<void> removeTodo(int index) async {
    return _dataSource.removeTodo(index);
  }
}
