import 'package:flutter_application_todo/model/todo.dart';
import 'package:flutter_application_todo/repository/todo_repository.dart';

class TodoService {
  late final TodoRepository repository;
  TodoService({required this.repository});

  Future<List<Todo>> getTodoList() async {
    return repository.getTodoList();
  }

  Future<void> addTodo(Todo todo) async {
    return repository.addTodo(todo);
  }

  Future<void> removeTodo(int index) async {
    return repository.removeTodo(index);
  }
}
