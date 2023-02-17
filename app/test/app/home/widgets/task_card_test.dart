import 'package:flutter_test/flutter_test.dart';
import 'package:listinha/app/home/widgets/task_card.dart';
import 'package:listinha/app/shared/services/realm/models/task_model.dart';
import 'package:realm/realm.dart';

void main() {
  final board = TaskBoardModel(
    Uuid.v4(),
    'Nova lista de tarefas 1',
  );

  testWidgets('getProgress', (tester) async {
    final tasks = [
      TaskModel(Uuid.v4(), '', completed: true),
      TaskModel(Uuid.v4(), '', completed: true),
      TaskModel(Uuid.v4(), ''),
      TaskModel(Uuid.v4(), ''),
    ];

    final progress = TaskCard(board: board).getProgress(tasks);
    expect(progress, 0.5);
  });
}
