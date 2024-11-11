import 'package:flutter/material.dart';
import 'package:flutter_application_todo/model/todo.dart';
import 'package:flutter_application_todo/screen/list_screen.dart';
import 'package:flutter_application_todo/view_model/todo_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: const Duration(seconds: 1), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _animationController.forward(from: 0);
                    },
                    child: const Text(
                      "투두 추가하기",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ],
              ),
            ),
            RotationTransition(
              turns: _animationController,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: 'Enter an item',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        Provider.of<TodoViewModel>(context, listen: false).addTodo(Todo(todo: _controller.text));
                        _controller.clear();
                      },
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ListScreen(),
                ));
              },
              child: const Text("리스트 보러 가기"),
            )
          ],
        ),
      ),
    );
  }
}
