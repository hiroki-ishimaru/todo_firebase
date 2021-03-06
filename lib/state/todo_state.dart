import 'package:todo_firebase/db/db.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_state.freezed.dart';

@freezed //flutter pub run build_runner build --delete-conflicting-outputs
abstract class TodoState with _$TodoState {
  const factory TodoState({
    @Default(false) bool isLoading,
    @Default(false) bool isReadyData,
    List<TodoItemData> todoItems,
  }) = _TodoState;
}