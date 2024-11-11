import 'package:flutter/material.dart';

class TodoModel extends ChangeNotifier {
  List<String> todoItems = [];

  void addItem(String item) {
    todoItems.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    todoItems.removeAt(index);
    notifyListeners();
  }
}
