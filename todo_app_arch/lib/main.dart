import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_arch/data/repositories/mock_task_repository.dart';
import 'package:todo_app_arch/domain/repositories/task_repository.dart';
import 'package:todo_app_arch/presentation/bloc/task_bloc.dart';
import 'package:todo_app_arch/presentation/bloc/task_event.dart';
import 'package:todo_app_arch/presentation/pages/tasks_page.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final TaskRepository taskRepository = MockTaskRepository();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ToDo App Architecture",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (context) => TaskBloc(taskRepository: taskRepository)..add(LoadTasksEvent()),
        child: TasksPage(),
      ),
    );
  }
}
