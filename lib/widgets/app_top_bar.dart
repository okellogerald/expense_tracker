// ignore_for_file: constant_identifier_names
import '../source.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.onBackground2))),
      padding: EdgeInsets.fromLTRB(15.dw, 15.dh, 15.dw, 10.dh),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            title,
            size: 24.dw,
            color: AppColors.onBackground,
            family: kFontFam2,
          ),
          AppIconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icons.close,
            iconColor: AppColors.onBackground,
          )
        ],
      ),
    );
  }

  static final _appBar = AppBar();

  @override
  Size get preferredSize => _appBar.preferredSize;
}
