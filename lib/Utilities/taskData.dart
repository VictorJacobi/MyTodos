import 'package:flutter/foundation.dart';
import 'package:my_todos/Utilities/Tasks.dart';

class MyDataProvider extends ChangeNotifier{
  List<Tasks> myTaskList = [];
  void addTask(addedTask){

    var taskTileText = Tasks(text: addedTask);
    myTaskList.add(taskTileText);
    notifyListeners();

  }
  void listen(){
    notifyListeners();
  }
  void deleteTask(index){
    myTaskList.remove(index);
    notifyListeners();
  }

}