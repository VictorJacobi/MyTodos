import 'dart:developer';

import 'package:hive/hive.dart';

part 'task.g.dart';


@HiveType(typeId: 0)
class Tasks extends HiveObject {

  @HiveField(0)
  String? text;
  @HiveField(1)
  bool? checkTile;

  Tasks({this.text,this.checkTile=false});
  factory Tasks.update(Tasks task,{String? text,bool? checkTile})  {
    return
    Tasks(text: text??task.text,checkTile: checkTile??task.checkTile);
  }



  @override
  String toString() => """
  text: $text,
  checkTile: $checkTile""";
}

