import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_cubit/bloc/task_cubit.dart';
import 'package:todo_cubit/bloc/task_state.dart';
import 'package:todo_cubit/task.dart';

void main() {
  late TaskCubit taskCubit;
  group('TODO cubit Testing', () {
    setUp(() {
      taskCubit = TaskCubit();
    });

    test('test Initial state', () {
      expect(taskCubit.state, InitialState());
    });

    blocTest<TaskCubit, TaskState>(
      'empty state test',
      build: () => taskCubit,
      act: (bloc) => bloc.addTask(""),
      expect: () => <TaskState>[ToDoErrorState('error')],
    );

    blocTest<TaskCubit, TaskState>(
      'result state test',
      build: () => taskCubit,
      act: (bloc) => bloc.addTask('Hello'),
      expect: () => <TaskState>[
        AddedState(allTasks: const [Task(taskTitle: 'Hello')])
      ],
    );
  });
}
