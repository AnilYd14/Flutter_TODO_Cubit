


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/bloc/task_state.dart';

import '../task.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(const TaskState(allTasks: []));

  void addTask(String newTextTitle) {
    final taskList = [...state.allTasks, Task(taskTitle: newTextTitle)];
    emit(TaskState(allTasks: taskList));
  }
}