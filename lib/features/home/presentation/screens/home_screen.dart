import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todos/Utilities/Constants.dart';
import 'package:my_todos/app/app_provider.dart';
import 'package:my_todos/features/home/presentation/providers/home_screen_state_provider.dart';
import 'package:my_todos/features/note/presentation/screens/note_screen.dart';
import 'package:my_todos/features/home/presentation/widgets/myTaskTile.dart';


class HomeScreen extends ConsumerWidget {
  static String id ='HomeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: (){
          ref.read(myDataStateNotifierProvider.notifier).showBottomSheet();
          // showModalBottomSheet(context: context,
          //     backgroundColor: Color(0xFF757575),
          //     builder: (BuildContext context){
          //
          //       return AddTaskSheet();
          //     });
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
                      PopupMenuButton(
                        onSelected: (value){
                          log('$value');
                        },
                        itemBuilder: (context) => Features.values//The safe box is  to keep  words, links and other things that might be referenced to later.
                            .map(
                              (feature) => PopupMenuItem(

                              onTap: () {
                               feature.navigate(ref);
                              },
                              child: Text('${feature.getName()}',)),
                        )
                            .toList(),
                        child:    CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.list,
                            color: Colors.lightBlueAccent,
                          ),
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
                        '${ref.watch(myDataStateNotifierProvider).myTaskList?.length} tasks',
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
                  child: ListView.builder(
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
enum Features{
  safeBox,
  notes
}

extension on Features{
  String getName(){
    switch(this){
      case Features.safeBox:
        return 'Safe box';
      case Features.notes:
        return 'notes';
    }
  }
  void navigate(WidgetRef ref){
    switch(this){
      case Features.safeBox:
        // TODO: Handle this case.
        break;
      case Features.notes:
        // TODO: Handle this case.
      ref.watch(routerProvider).push('/${NoteScreen.id}');
        break;
    }
  }
}