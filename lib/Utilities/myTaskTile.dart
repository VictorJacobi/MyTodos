import 'package:flutter/material.dart';
import 'package:my_todos/providers/taskData.dart';
import 'package:provider/provider.dart';

class TaskTile extends StatelessWidget {
  TaskTile({this.myTasks,this.checkTile, required this.callBackTicker});
  final String? myTasks;
  final bool? checkTile;
  final void Function(bool?) callBackTicker;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        myTasks??'',
        style: TextStyle(
          decoration:checkTile==true? TextDecoration.lineThrough:TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        value: checkTile,
        onChanged: callBackTicker,
      ),
    );
  }
}