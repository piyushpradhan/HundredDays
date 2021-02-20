import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hundreddays/constants/colors.dart';
import 'package:hundreddays/providers/task_provider.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class TheCalendar extends StatelessWidget {

  final CalendarController _calendarController;

  const TheCalendar(this._calendarController);

  @override
  Widget build(BuildContext context) {
    var taskProvider = Provider.of<TaskProvider>(context, listen: false);
    return TableCalendar(
      initialCalendarFormat: CalendarFormat.week,
      calendarController: _calendarController,
      startingDayOfWeek: StartingDayOfWeek.monday,
      daysOfWeekStyle: DaysOfWeekStyle(
          weekendStyle: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
          ),
          weekdayStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          )
      ),
      calendarStyle: CalendarStyle(
        todayColor: primary,
        selectedColor: Colors.white,
        selectedStyle: TextStyle(
          color: primary,
          fontWeight: FontWeight.bold,
        ),
        weekendStyle: TextStyle(
            color: Colors.white70
        ),
        weekdayStyle: TextStyle(
            color: Colors.white
        ),
      ),
      headerStyle: HeaderStyle(
          leftChevronIcon: Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
          rightChevronIcon: Icon(
            Icons.chevron_right,
            color: Colors.white,
          ),
          formatButtonDecoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          formatButtonTextStyle: TextStyle(
            color: Colors.white,
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          )
      ),
      onDaySelected: (day, events, _) async {
        await taskProvider.getCalendarTask(day);
        print(taskProvider.selected.toString());
      },
    );
  }
}

