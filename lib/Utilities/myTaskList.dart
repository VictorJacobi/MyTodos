import 'package:flutter/material.dart';
import '../providers/taskData.dart';
import 'package:provider/provider.dart';
import 'myTaskTile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyDataProvider>(
      builder: (context,providerData,child){
        return ListView.builder(
          itemBuilder: (context,index){
            return Material(
              color: Colors.white,
              child: TextButton(
                onLongPress: (){
                  providerData.deleteTask(providerData.myTaskList?[index]);
                },
                onPressed: (){
                  return;
                },
                child: TaskTile(myTasks: providerData.myTaskList?[index].text,checkTile: providerData.myTaskList?[index].checkTile,callBackTicker: (value){
                  providerData.checkBox(index);
                  providerData.listen();
                }),
              ),
            );
          },
          itemCount: Provider.of<MyDataProvider>(context).myTaskList?.length ,
        );
      },
    );
  }
}
