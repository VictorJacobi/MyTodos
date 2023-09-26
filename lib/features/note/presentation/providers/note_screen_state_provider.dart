import 'package:my_todos/app/app_provider.dart';
import 'package:my_todos/features/note/presentation/providers/state/note_screen_notifier.dart';
import 'package:my_todos/features/note/presentation/providers/state/note_screen_state.dart';
import 'package:riverpod/riverpod.dart';

final noteStateNotifierProvider = StateNotifierProvider<NoteProvider,NoteData>((ref) {
  final hiveService = ref.watch(hiveServiceProvider);
  final bottomSheetService = ref.watch(bottomSheetServiceProvider);
  final dialogService = ref.watch(dialogServiceProvider);
  return NoteProvider(hiveService,bottomSheetService,dialogService);
});