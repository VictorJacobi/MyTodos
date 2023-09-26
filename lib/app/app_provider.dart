
import 'package:adoption/adoption.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_todos/UI/bottom_sheets/add_task_sheet.dart';
import 'package:my_todos/features/home/presentation/screens/home_screen.dart';
import 'package:my_todos/features/note/presentation/screens/note_screen.dart';
import 'package:my_todos/enums/bottomsheet_type.dart';
import 'package:my_todos/enums/dialog_type.dart';
import 'package:my_todos/services/hive_service.dart';

// GetIt locator = GetIt.instance;
// const String authRoute = 'Auth';
// void setupLocator(){
//   locator.registerLazySingleton(() => HiveDataBaseService());
// }
final hiveServiceProvider = Provider((ref) => HiveDataBaseService());
final navigationServiceProvider = Provider((ref) => NavigationService());
final dialogServiceProvider = Provider((ref) {
  final navigationService = ref.watch(navigationServiceProvider);
  DialogService dialogService = DialogService(navigatorKey: navigationService.navigatorKey);
  final builders = {
    DialogType.basic: ({String? title, String? description}) { return
      const SizedBox();
    },
    DialogType.policyWarning: ({String? title, String? description}) =>
    const SizedBox(),
  };

  dialogService.setDialogBuilders(builders);

  return dialogService;
});
final bottomSheetServiceProvider = Provider((ref) {
  final navigationService = ref.watch(navigationServiceProvider);
    BottomSheetService bottomSheetService = BottomSheetService(navigatorKey: navigationService.navigatorKey);
  final builders = {
    BottomSheetType.basic: ({String? title, String? description}) { return
      const SizedBox();
    },
    BottomSheetType.Generic: ({String? title, String? description}) =>
    const SizedBox(),
    BottomSheetType.generateToken: ({String? title, String? description}) => AddTaskSheet(),

  };

  bottomSheetService.setCustomSheetBuilders(builders,);

  return bottomSheetService;
});
final routerProvider = Provider((ref) {
  final navigationService = ref.watch(navigationServiceProvider);
  return GoRouter(
      navigatorKey: navigationService.navigatorKey,
      debugLogDiagnostics: true,
      initialLocation: '/',
      routes: [
        GoRoute(
            path: '/',
            builder: (context, GoRouterState state) {
              return const HomeScreen();
            },
          routes: [
            GoRoute(
                path: '${NoteScreen.id}',
                builder: (context, GoRouterState state) {
                  return const NoteScreen();
                },),
          ]
        ),

      ]);
});

