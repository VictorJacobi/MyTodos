
import'package:hive_flutter/hive_flutter.dart';
import'package:hive/hive.dart';
import 'package:my_todos/models/task.dart';
import'dart:developer';

import 'package:my_todos/database/hive_database.dart';


class HiveDataBaseService {
  final Box tokenBox = HiveDatabase.getTasks();

  // final Box navigationStateBox = HiveDatabase.getNavigationState();
  // final Box uidBox = HiveDatabase.getUID();
  // final Box profileBox = HiveDatabase.getProfile();
  // final Box addressBox = HiveDatabase.getAddress();
  List<dynamic>? get tasks => getTasks();
  // String get uid => uidBox.get('UID');
  // ProfileModel get profile => profileBox.get('profile');
  // NavigationState get navigationState => navigationStateBox.get('appNavigationState');
  List<dynamic>? getTasks(){

    List<dynamic> myTasks = tokenBox.get('tasks');
    log('${myTasks}\n\n${myTasks.runtimeType}');
    return myTasks;
  }
  void updateTasks(List<dynamic>? tasks){
    tokenBox.put('tasks', tasks);
    log('Token updated successfully: $tasks');
    // log('Token updated successfully: ${this.token}');
  }
  // ProfileModel? getProfile(){
  //   try{
  //     // log('${profileBox.get('profile')}');
  //     return  profileBox.get('profile');
  //   }catch(e){
  //     log('Error ${e.runtimeType}\n$e');
  //     return null;
  //   }
  //   // return null;
  // }
  // WalletInfo? getWallet(){
  //   try{
  //     return  walletBox.get('wallet');
  //   }catch(e){
  //     log('Error ${e.runtimeType}\n$e');
  //     return null;
  //   }
  //   // return null;
  // }
  // void updateProfile(ProfileModel? profile){
  //   if(profile!=null){
  //     profileBox.put('profile', profile);
  //     log('profile saved in hive: $profile');
  //   }
  //   // log('Profile: $profile');
  // }

// Meta meta = metaBox.get('meta');
// profileInfo = profileInfoBox.get('profileInfo');
// address = addressBox.get('address');
}