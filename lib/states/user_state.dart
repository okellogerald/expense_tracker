import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.loading() = _Loading;
  const factory UserState.content([@Default({}) Map<String, String?> errors]) =
      _Content;
  const factory UserState.done() = _Done;
  const factory UserState.failed({String? message}) = _Error;

  factory UserState.initial() => const UserState.content();
}
