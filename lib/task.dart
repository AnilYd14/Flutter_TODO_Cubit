import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String taskTitle;

  const Task({required this.taskTitle});

  @override
  List<Object?> get props => [taskTitle];
}