import 'package:flutter/material.dart';
import 'package:flutter_application_todo/repository/todo_repository.dart';
import 'package:flutter_application_todo/screen/home_screen.dart';
import 'package:flutter_application_todo/screen/list_screen.dart';
import 'package:flutter_application_todo/service/todo_service.dart';
import 'package:flutter_application_todo/view_model/todo_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TodoViewModel(
            todoService: TodoService(
              repository: TodoRepository(),
            ),
          ),
        ),
      ],
      // child: MaterialApp(
      //   title: "Flutter Demo",
      //   theme: ThemeData(
      //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //     useMaterial3: true,
      //   ),
      //   home: const HomeScreen(
      //     title: "Todo App",
      //   ),
      // ),
      child: MaterialApp.router(
        routerConfig: _router,
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen(
          title: "Todo App",
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: "list",
          builder: (BuildContext context, GoRouterState state) {
            return const ListScreen();
          },
        ),
      ],
    ),
  ],
);
