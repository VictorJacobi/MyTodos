import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todos/dashboard/presentation/providers/dash_board_state_provider.dart';
import 'myTaskTile.dart';

class TaskList extends ConsumerWidget {
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return ListView.builder(
          itemBuilder: (context,index){
            return Material(
              color: Colors.white,
              child: TextButton(
                onLongPress: (){
                  ref.read(myDataStateNotifierProvider.notifier).deleteTask(ref.watch(myDataStateNotifierProvider).myTaskList?[index]);
                },
                onPressed: (){
                  return;
                },
                child: TaskTile(myTasks: ref.watch(myDataStateNotifierProvider).myTaskList?[index].text,checkTile: ref.watch(myDataStateNotifierProvider).myTaskList?[index].checkTile,callBackTicker: (value){
                  ref.read(myDataStateNotifierProvider.notifier).checkBox(index);
                }),
              ),
            );
          },
          itemCount: ref.watch(myDataStateNotifierProvider).myTaskList?.length ,
        );

  }
}
