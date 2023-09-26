import 'dart:developer';
import 'package:adoption/adoption.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_todos/app/app_provider.dart';
import 'package:my_todos/features/home/data/tasks/task.dart';
import 'package:my_todos/features/home/presentation/providers/state/home_screen_state.dart';
import 'package:my_todos/enums/bottomsheet_type.dart';
import 'package:my_todos/features/note/presentation/providers/state/note_screen_state.dart';
import 'package:my_todos/services/hive_service.dart';
import 'package:riverpod/riverpod.dart';


class NoteProvider extends StateNotifier<NoteData> {
  final HiveDataBaseService _hiveService;
  final BottomSheetService _bottomSheetService;
  final DialogService _dialogService;
  NoteProvider(this._hiveService,this._bottomSheetService,this._dialogService) :super(NoteData(myNoteList: [])){
    state = NoteData.fromState(state,myNoteList: _hiveService.tasks??[] );
  }
  TextEditingController textFieldController = TextEditingController();

  void addNote(){
    // var taskTileText = Tasks(text: textFieldController.text);
    // state = HomeData.fromState(state,myTaskList: [...state.myTaskList!,taskTileText] );
    // _hiveService.updateTasks(state.myTaskList);
    // textFieldController.clear();

  }
  // void listen(){
  //   notifyListeners();
  // }
  void deleteNote(myTask){
  // state = HomeData.fromState(state,myTaskList: [...state.myTaskList!.where((task) => task != myTask)]);
  //   _hiveService.updateTasks(state.myTaskList);
  }
  void completeNote(int index){
    // if(state.myTaskList?[index].checkTile!=null){
    //   state = HomeData.fromState(state,myTaskList: state.myTaskList!.map((value) {
    //     return value == state.myTaskList![index] ? Tasks.update(value,checkTile: !value.checkTile,) : value;
    //   }).toList());
    // }else{
    //   state = HomeData.fromState(state,myTaskList: state.myTaskList!.map((value) => value == state.myTaskList![index] ? Tasks.update(value,checkTile: false) : value).toList());
    //
    // }
    //
    // _hiveService.updateTasks(state.myTaskList);
    // log('${state.myTaskList?[index].checkTile}');
    // notifyListeners();
  }
  void showBottomSheet(){
    // _bottomSheetService.showCustomSheet(variant: BottomSheetType.generateToken);
  }
}