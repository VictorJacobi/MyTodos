class HomeData{
  List<dynamic>? myTaskList;
  HomeData({required this.myTaskList});
  factory  HomeData.fromState(HomeData state,{List<dynamic>? myTaskList}){
    return HomeData(myTaskList: myTaskList??state.myTaskList);
  }
  @override
  String toString() => """myTaskList: $myTaskList""";
}

///Data should contain all models relating to  the screen.