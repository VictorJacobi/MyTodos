
import'package:hive_flutter/hive_flutter.dart';
import 'package:my_todos/models/task.dart';
// import'package:hive/hive.dart';


class HiveDatabase {
  static Box<List<dynamic>?> getTasks() => Hive.box<List<dynamic>?>('tasks');
  // static Box<ProfileModel> getProfile() => Hive.box<ProfileModel>('profile');
  // static Box<ProfileModel> getWalletInfo() => Hive.box<ProfileModel>('wallet');
  static Future<void> registerHives() async {
    await Hive.initFlutter();
    // await Hive.openBox<bool>('isAdmin');
    // Hive.registerAdapter(ProfileModelAdapter());
    Hive.registerAdapter(TasksAdapter());
    // Hive.registerAdapter(WalletInfoAdapter());
    await Hive.openBox<List<dynamic>?>('tasks');
  }
  // static Box<Meta> getMeta() => Hive.box<Meta>('meta');
  // static Box<ProfileInfo> getProfileInfo() => Hive.box<ProfileInfo>('profileInfo');
  // static Box<WalletInfo> getWalletInfo() => Hive.box<WalletInfo>('walletInfo');
  // static Box<NotificationMessage> getNotification() => Hive.box<NotificationMessage>('notification');
}
