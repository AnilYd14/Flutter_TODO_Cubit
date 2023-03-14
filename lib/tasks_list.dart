import 'package:flutter/material.dart';
import 'package:todo_cubit/task.dart';


class TaskList extends StatelessWidget {
  final List<Task> tasks;
  TaskList(this.tasks, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: tasks.length, itemBuilder: (context,index){
          return ListTile(title: Text(tasks[index].taskTitle));
    });
  }
}
