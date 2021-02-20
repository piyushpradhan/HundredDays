import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hundreddays/constants/colors.dart';
import 'package:hundreddays/models/task.dart';

class TaskListTile extends StatelessWidget {

  final Task task;

  const TaskListTile(this.task);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                "${task.date.day}/${task.date.month}/${task.date.year}",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10
                ),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    task.title.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox.shrink(
                  child: Checkbox(
                    value: false,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onChanged: (value) {}
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 4,),
          Row(
            children: [
              Text(
                task.desc.toString(),
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 12
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
