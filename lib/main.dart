import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/task_screen.dart';

import 'bloc/task_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskCubit>(create: (_)=>TaskCubit(),
       child: MaterialApp(home: TaskScreen(),),
    );
  }
}