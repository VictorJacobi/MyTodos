import 'dart:developer';

import 'package:hive/hive.dart';

part 'note.g.dart';


@HiveType(typeId: 1)
class Notes extends HiveObject {

  @HiveField(0)
  String? content;
  @HiveField(1)
  String? title;
  @HiveField(2)
  DateTime? date;
  @HiveField(3)
  bool? isRead;

  Notes({this.content,this.isRead=false,this.title,this.date});
  factory Notes.update(Notes note,{String? content,String? title,bool? isRead,DateTime? date})  {
    return
      Notes(content: content??note.content,isRead: isRead??note.isRead,date: date??note.date,title: title??note.title);
  }



  @override
  String toString() => """
  title: $title,
  content: $content,
  isRead: $isRead,
  date: $date
  """;
}

