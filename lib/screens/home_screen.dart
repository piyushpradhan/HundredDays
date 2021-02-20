import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hundreddays/constants/colors.dart';
import 'package:hundreddays/models/task.dart';
import 'package:hundreddays/providers/task_provider.dart';
import 'package:hundreddays/providers/task_provider.dart';
import 'package:hundreddays/providers/task_provider.dart';
import 'package:provider/provider.dart';

TextEditingController _titleController = new TextEditingController();
TextEditingController _descController = new TextEditingController();

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    int date = DateTime.now().day;
    int monthIndex = DateTime.now().month;
    List<String> months = ['January', 'Februrary', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'November', "December"
    ];
    String month = months[monthIndex - 1];

    String suffix;
    switch(date % 10) {
      case 1 : suffix = "st"; break;
      case 2 : suffix = "nd"; break;
      case 3 : suffix = "rd"; break;
      default: suffix = "th"; break;
    }

    var taskProvider = Provider.of<TaskProvider>(context, listen: false);
    taskProvider.getCalendarTask(DateTime.now());

    return Scaffold(
      backgroundColor: primary,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 120,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Today, ${date}$suffix $month",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "What are you upto today?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40,),
            TaskCard(),
          ],
        ),
      )
    );
  }
}

class TaskCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
                  child: TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(239, 239, 239, 100),
                      hintText: "Title of the task",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 0.0),
                        child: TextField(
                          controller: _descController,
                          maxLines: null,
                          minLines: 16,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(239, 239, 239, 100),
                            hintText: "Desciption of the task",
                            hintStyle: TextStyle(
                                color: Colors.grey
                            ),
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      backgroundColor: primary,
                      mini: true,
                      heroTag: "save",
                      child: Icon(
                        Icons.save_rounded,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _addTask(_titleController.text, _descController.text, context);
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

void _addTask(String title, String desc, BuildContext context) {
  var taskProvider = Provider.of<TaskProvider>(context, listen: false);
  taskProvider.addNewTask(Task(title, desc, DateTime.now()));
}

