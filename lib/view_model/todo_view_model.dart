import 'package:flutter/material.dart';
import 'package:flutter_application_todo/model/todo.dart';
import 'package:flutter_application_todo/service/todo_service.dart';

class TodoViewModel with ChangeNotifier {
  late TodoService todoService;

  late List<Todo> _todoList = [];
  late Todo _todo;

  TodoViewModel({required this.todoService});

  List<Todo> get todoList => _todoList;
  Todo get todo => _todo;

  Future<List<Todo>> getTodoList() async {
    _todoList = await todoService.getTodoList();
    notifyListeners();

    return _todoList;
  }

  Future<void> addTodo(Todo todo) async {
    _todoList.add(todo);
    notifyListeners();
  }

  Future<void> removeTodo(int index) async {
    _todoList.removeAt(index);
    notifyListeners();
  }
}
