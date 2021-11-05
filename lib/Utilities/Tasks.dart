
class Tasks{
  Tasks({this.text,this.checkTile = false});
  String text;
  bool checkTile;
  void checkBox(){
    checkTile=!checkTile;
    print(checkTile);
  }
}