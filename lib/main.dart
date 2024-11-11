import 'package:flutter/material.dart';
import 'package:flutter_application_todo/model/todo_model.dart';
import 'package:flutter_application_todo/screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoModel()),
      ],
      child: MaterialApp(
        title: "Flutter Demo",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(
          title: "Todo App",
        ),
      ),
    );
  }
}
