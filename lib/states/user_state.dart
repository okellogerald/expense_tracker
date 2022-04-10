import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.loading([String? message]) = _Loading;
  const factory UserState.content() = _Content;
  const factory UserState.done() = _Done;
  const factory UserState.failed(String message) = _Failed;

  factory UserState.initial() => const UserState.content();
}
