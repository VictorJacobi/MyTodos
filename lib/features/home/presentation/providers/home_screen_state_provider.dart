import 'package:my_todos/app/app_provider.dart';
import 'package:my_todos/features/home/presentation/providers/state/home_screen_state.dart';
import 'package:my_todos/features/home/presentation/providers/state/home_screen_notifier.dart';
import 'package:riverpod/riverpod.dart';

final myDataStateNotifierProvider = StateNotifierProvider<MyDataProvider,HomeData>((ref) {
  final hiveService = ref.watch(hiveServiceProvider);
  final bottomSheetService = ref.watch(bottomSheetServiceProvider);
  final dialogService = ref.watch(dialogServiceProvider);
  return MyDataProvider(hiveService,bottomSheetService,dialogService);
});