import 'package:my_todos/app/app_provider.dart';
import 'package:my_todos/dashboard/presentation/providers/state/dash_board_state.dart';
import 'package:my_todos/dashboard/presentation/providers/state/dash_board_notifier.dart';
import 'package:riverpod/riverpod.dart';

final myDataStateNotifierProvider = StateNotifierProvider<MyDataProvider,HomeData>((ref) {
  final hiveService = ref.watch(hiveServiceProvider);
  final bottomSheetService = ref.watch(bottomSheetServiceProvider);
  final dialogService = ref.watch(dialogServiceProvider);
  return MyDataProvider(hiveService,bottomSheetService,dialogService);
});