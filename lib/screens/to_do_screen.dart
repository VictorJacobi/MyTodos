import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_todos/Utilities/myTaskList.dart';
import 'package:my_todos/Utilities/Constants.dart';
import 'package:my_todos/app/locator.dart';
import 'package:my_todos/providers/taskData.dart';
import 'package:my_todos/services/hive_service.dart';
import 'package:provider/provider.dart';


String? addedTask;
TaskList myTask = TaskList();
TextEditingController textFieldController = TextEditingController();

class ToDos extends StatefulWidget {

  @override
  State<ToDos> createState() => _ToDosState();
}

class _ToDosState extends State<ToDos> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: (){
          showModalBottomSheet(context: context,
              backgroundColor: Color(0xFF757575),
              builder: (BuildContext context){

            return Container(
              height: 400,
              decoration: decoratedBox,
              child: Padding(
                padding: const EdgeInsets.only(
                  left:30.0,
                  top: 15,
                  right: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:15.0),
                      child: Center(
                        child: Text(
                          'Add Task',
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
              TextField(
                controller: textFieldController,
                autofocus: true,
                decoration: InputDecoration(
                ),
                onChanged: (value){
                    addedTask = value;
                },
              ),
                    SizedBox(height: 20,),
                    Flexible(
                      child: Material(
                        color: Colors.lightBlueAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: TextButton(
                            onPressed: (){
                              Provider.of<MyDataProvider>(context,listen: false).addTask(addedTask);
                              textFieldController.clear();
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Add',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        },
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Container(
          color: Colors.lightBlueAccent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.list,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Todoey',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '${Provider.of<MyDataProvider>(context).myTaskList?.length} tasks',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Expanded(
                child: Container(
                 padding: EdgeInsets.symmetric(
                   horizontal: 30),
                  decoration: decoratedBox,
                  child: TaskList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





