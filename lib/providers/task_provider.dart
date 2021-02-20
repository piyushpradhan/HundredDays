import 'package:flutter/cupertino.dart';
import 'package:hundreddays/models/task.dart';
import 'package:hive/hive.dart';

class TaskProvider extends ChangeNotifier {
  List _taskList = new List();
  List _selected = new List();

  List get taskList => _taskList;
  List get selected => _selected;

  getTask() async {
    final taskBox = await Hive.openBox('tasks');
    _taskList = taskBox.values.toList();
    notifyListeners();
  }

  getCalendarTask(DateTime selectedDate) async {
    final taskBox = await Hive.openBox('tasks');
    _selected.clear();
    taskBox.values.toList().where((element) => (
        element.date.day == selectedDate.day
            && element.date.month == selectedDate.month
            && element.date.year == selectedDate.year
    ))
      .forEach((element) {
        _selected.add(element);
      });
    notifyListeners();
  }

  void addNewTask(Task task) async {
    _taskList.add(task);
    _selected.add(task);
    var taskBox = await Hive.openBox('tasks');
    taskBox.add(task);
    notifyListeners();
  }
}
