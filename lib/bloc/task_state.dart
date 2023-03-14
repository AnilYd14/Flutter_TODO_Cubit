

import 'package:equatable/equatable.dart';

import '../task.dart';

class TaskState extends Equatable {
  final List<Task> allTasks;

  const TaskState({this.allTasks = const <Task>[]});

  @override
  List<Object?> get props => [allTasks];

  TaskState copyWith({
    List<Task>? taskList,
  }) {
    return TaskState(
      allTasks: taskList ?? allTasks,
    );
  }
}