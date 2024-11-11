import 'package:flutter/material.dart';
import 'package:flutter_application_todo/model/todo.dart';
import 'package:flutter_application_todo/view_model/todo_view_model.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("투두 리스트"),
      ),
      body: Consumer<TodoViewModel>(
        builder: (context, provider, child) {
          return Expanded(
            child: ListView.builder(
              itemCount: provider.todoList.length,
              itemBuilder: (BuildContext context, int index) {
                final Todo todo = provider.todoList[index];
                return ListTile(
                  title: Text(todo.todo!),
                  trailing: IconButton(
                      onPressed: () {
                        Provider.of<TodoViewModel>(context, listen: false).removeTodo(index);
                      },
                      icon: const Icon(Icons.delete)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
