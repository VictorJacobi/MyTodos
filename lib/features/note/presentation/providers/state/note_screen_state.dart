class NoteData{
  List<dynamic>? myNoteList;
  NoteData({required this.myNoteList});
  factory  NoteData.fromState(NoteData state,{List<dynamic>? myNoteList}){
    return NoteData(myNoteList: myNoteList??state.myNoteList);
  }
  @override
  String toString() => """myNoteList: $myNoteList""";
}

///Data should contain all models relating to  the screen.