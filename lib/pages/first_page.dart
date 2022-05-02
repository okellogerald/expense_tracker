import 'package:budgetting_app/providers/user_notifier.dart';
import 'package:budgetting_app/source.dart';
import 'package:budgetting_app/states/user_state.dart';
import 'package:budgetting_app/utils/navigation_logic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirstPage extends ConsumerStatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  ConsumerState<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends ConsumerState<FirstPage> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      ref.read(userNotifierProvider.notifier).autoLogIn();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(userNotifierProvider, (UserState? previous, UserState? next) {
      next!.maybeWhen(
          done: () => pushAndRemoveUntil(const MainPage()),
          failed: (_) => pushAndRemoveUntil(const LoginPage()),
          orElse: () {});
    });
    return const AppLoadingIndicator.withScaffold('Trying auto-login');
  }
}
