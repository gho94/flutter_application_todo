import 'package:flutter/material.dart';
import 'package:flutter_application_todo/model/todo_model.dart';
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
      body: Consumer<TodoModel>(
        builder: (context, todoModel, child) {
          return Expanded(
            child: ListView.builder(
              itemCount: todoModel.todoItems.length,
              itemBuilder: (BuildContext context, int index) {
                final item = todoModel.todoItems[index];
                return ListTile(
                  title: Text(item),
                  trailing: IconButton(
                      onPressed: () {
                        Provider.of<TodoModel>(context, listen: false).removeItem(index);
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
