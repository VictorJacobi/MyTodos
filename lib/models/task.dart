import 'package:hive/hive.dart';

part 'task.g.dart';


@HiveType(typeId: 0)
class Tasks extends HiveObject {

  @HiveField(0)
  String? text;
  @HiveField(1)
  bool checkTile;

  Tasks({this.text,this.checkTile=false});

  @override
  String toString() => """
  text: $text,
  checkTile: $checkTile""";
}