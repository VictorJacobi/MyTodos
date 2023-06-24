import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:my_todos/app/locator.dart';
import 'package:my_todos/models/task.dart';
import 'package:my_todos/services/hive_service.dart';

class MyDataProvider extends ChangeNotifier {
  HiveDataBaseService _hive = locator<HiveDataBaseService>();
  MyDataProvider(
      ){
    myTaskList = locator<HiveDataBaseService>().tasks??[];
    log('$myTaskList');
  }

  List<dynamic>? myTaskList = [];
  void addTask(addedTask){
    var taskTileText = Tasks(text: addedTask);
    myTaskList?.add(taskTileText);
    _hive.updateTasks(myTaskList);
    notifyListeners();

  }
  void listen(){
    notifyListeners();
  }
  void deleteTask(index){
    myTaskList?.remove(index);
    _hive.updateTasks(myTaskList);
    notifyListeners();
  }
  void checkBox(int index){
    if(myTaskList?[index].checkTile!=null){
      myTaskList?[index].checkTile = !myTaskList![index].checkTile!;
    }else{
      myTaskList?[index].checkTile = false;
    }

    _hive.updateTasks(myTaskList);
    log('${myTaskList?[index].checkTile}');
    notifyListeners();
  }
}