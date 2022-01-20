import '../source.dart';

class SettingsPageBloc extends Cubit<SettingsPageState> {
  SettingsPageBloc(this.userService) : super(SettingsPageState.initial());

  final UserService userService;

  void init() {
    var client = state.client;
    emit(SettingsPageState.loading(client));
    client = userService.getClient;
    emit(SettingsPageState.content(client));
  }
}
