import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/bloc/task_state.dart';
import 'package:todo_cubit/task.dart';
import 'package:todo_cubit/tasks_list.dart';

import 'add_task_screen.dart';
import 'bloc/task_cubit.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TaskCubit>().state;
    List<Task> list = [];
    if (state is AddedState) {
      list = state.allTasks;
    }
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => AddTaskScreen((newTextTile) {
                    BlocProvider.of<TaskCubit>(context).addTask(newTextTile);

                    Navigator.pop(context);
                  }));
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        padding: const EdgeInsets.only(
            left: 30.0, right: 30.0, top: 60.0, bottom: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              child: Icon(Icons.list),
              backgroundColor: Colors.white,
            ),
            const SizedBox(height: 20),
            const Text(
              "TODO",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            Text('${list.length} Tasks',
                style: const TextStyle(fontSize: 20, color: Colors.white)),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                height: 300.0,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
                child: BlocBuilder<TaskCubit, TaskState>(
                    builder: (context, state) {
                  if (state is AddedState) {
                    return TaskList(state.allTasks);
                  }
                  return TaskList(list);
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
