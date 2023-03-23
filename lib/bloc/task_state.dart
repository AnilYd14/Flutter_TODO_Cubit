import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../task.dart';

@immutable
abstract class TaskState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends TaskState {}

class AddedState extends TaskState {
  final List<Task> allTasks;

  AddedState({required this.allTasks});

  @override
  List<Object?> get props => [allTasks];

  AddedState copyWith(List<Task>? taskList) {
    return AddedState(allTasks: taskList ?? allTasks);
  }
}

class ToDoErrorState extends TaskState {
  final String errorString;

  ToDoErrorState(this.errorString);
}
