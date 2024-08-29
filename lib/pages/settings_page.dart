import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../source.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: const Center(
          child: AppText("Settings Page"),
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: AppText(
        'Preferences',
        size: 24.dw,
        family: kFontFam2,
        color: AppColors.onBackground,
      ),
      elevation: 0,
      backgroundColor: AppColors.background,
      leading: AppIconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icons.arrow_back,
        iconColor: AppColors.onBackground,
      ),
    );
  }
}
