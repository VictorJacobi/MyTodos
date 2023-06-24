
import 'package:get_it/get_it.dart';
import 'package:my_todos/services/hive_service.dart';

GetIt locator = GetIt.instance;
const String authRoute = 'Auth';
void setupLocator(){
  locator.registerLazySingleton(() => HiveDataBaseService());
}
