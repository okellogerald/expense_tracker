import 'package:freezed_annotation/freezed_annotation.dart';

import '../source.dart';

part 'settings_page_state.freezed.dart';

@freezed
class SettingsPageState with _$SettingsPageState {
  const factory SettingsPageState.loading(Client client) = _Loading;
  const factory SettingsPageState.content(Client client) = _Content;

  factory SettingsPageState.initial() => SettingsPageState.content(Client.empty());
}
