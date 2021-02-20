import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String desc;
  @HiveField(2)
  final DateTime date;

  Task(this.title, this.desc, this.date);
}
