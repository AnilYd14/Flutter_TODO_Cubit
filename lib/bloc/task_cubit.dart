import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/bloc/task_state.dart';

import '../task.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(InitialState());

  void addTask(String newTextTitle) {
    if (newTextTitle.isEmpty) {
      emit(ToDoErrorState('error'));
    }
    final currentState = state;
    if (currentState is AddedState) {
      final taskList = [
        ...currentState.allTasks,
        Task(taskTitle: newTextTitle)
      ];
      emit(currentState.copyWith(taskList));
    } else if (currentState is InitialState) {
      final List<Task> list = [Task(taskTitle: newTextTitle)];
      emit(AddedState(allTasks: list));
    }
  }
}
