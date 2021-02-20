import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hundreddays/constants/colors.dart';
import 'package:hundreddays/providers/task_provider.dart';
import 'package:hundreddays/widgets/calendar_widget.dart';
import 'package:hundreddays/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

CalendarController _calendarController = new CalendarController();

class ProgressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var taskProvider = Provider.of<TaskProvider>(context, listen: false);
    taskProvider.getCalendarTask(DateTime.now());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.zero,
                  topRight: Radius.zero
              ),
            ),
            padding: EdgeInsets.only(top: 32, left: 8, right: 8, bottom: 8),
            child: TheCalendar(_calendarController),
          ),
          Consumer<TaskProvider>(
            builder: (context, TaskProvider task, child) {
              print(task.selected.length.toString());
              print(task.selected.toString());
              return Expanded(
                child: ListView.builder(
                  itemCount: task.selected.length,
                  itemBuilder: (context, index) {
                    return TaskListTile(task.selected[index]);
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

