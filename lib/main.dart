import 'package:flutter/material.dart';
import 'package:my_todos/Utilities/taskData.dart';
import 'package:my_todos/screens/to_do_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> MyDataProvider(),
      child: MaterialApp(
        home: ToDos(),
      ),
    );
  }
}
