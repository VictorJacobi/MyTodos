import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todos/app/app_provider.dart';
import 'package:my_todos/features/home/presentation/screens/home_screen.dart';
import 'package:my_todos/app/hive_database.dart';

void main() async {
  await HiveDatabase.registerHives();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return MaterialApp.router(
      title: 'Todo App',
      routerConfig: ref.watch(routerProvider),
      debugShowCheckedModeBanner: false,
    );
  }
}
