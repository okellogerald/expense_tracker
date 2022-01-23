import 'package:freezed_annotation/freezed_annotation.dart';

import '../source.dart';

part 'settings_page_state.freezed.dart';

@freezed
class SettingsPageState with _$SettingsPageState {
  const factory SettingsPageState.loading(User client) = _Loading;
  const factory SettingsPageState.content(User client) = _Content;

  factory SettingsPageState.initial() => SettingsPageState.content(User.empty());
}
