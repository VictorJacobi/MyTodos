import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todos/UI/bottom_sheets/add_task_sheet.dart';
import 'package:my_todos/Utilities/myTaskList.dart';
import 'package:my_todos/Utilities/Constants.dart';
import 'package:my_todos/app/app_provider.dart';
import 'package:my_todos/dashboard/presentation/providers/dash_board_state_provider.dart';


class ToDos extends ConsumerWidget {
  const ToDos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      // drawer: Drawer(
      //   width: MediaQuery.of(context).size.width - 114,
      //   child: Column(
      //     children: <Widget>[
      //       Padding(
      //         padding: const EdgeInsets.only(top: 36.0),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Text('My Details'),
      //             Padding(
      //               padding: const EdgeInsets.only(left: 19.0),
      //               child: IconButton(
      //                 icon: const Icon(Icons.clear, size: 34),
      //                 onPressed: () {
      //                   Navigator.pop(context);
      //                 },
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //
      //     ],
      //   ),
      // ),
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
                        itemBuilder: (context) => ['safe box','notes',]//The safe box is  to keep  words, links and other things that might be referenced to later.
                            .map(
                              (value) => PopupMenuItem(

                              onTap: () {
                                if(value=='safe box'){

                                }
                              },
                              child: Text('$value',)),
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
