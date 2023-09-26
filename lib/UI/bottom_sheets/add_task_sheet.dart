import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todos/Utilities/Constants.dart';
import 'package:my_todos/features/home/presentation/providers/home_screen_state_provider.dart';

class AddTaskSheet extends ConsumerWidget {
  const AddTaskSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
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
                controller: ref.watch(myDataStateNotifierProvider.notifier).textFieldController,
                autofocus: true,
                decoration: InputDecoration(
                ),
                // onChanged: (value){
                //   addedTask = value;
                // },
              ),
              SizedBox(height: 20,),
              Flexible(
                child: Material(
                  color: Colors.lightBlueAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: TextButton(
                      onPressed: (){
                        ref.read(myDataStateNotifierProvider.notifier).addTask();
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
  }
}
