import 'package:budgetting_app/source.dart';
import 'package:budgetting_app/widgets/app_divider.dart';

class ExtraPagesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ExtraPagesAppBar({required this.title, required this.image, super.key});

  final String title, image;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(80.dh),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.dw, right: 15.dw),
              child: Row(
                children: [
                  Image.network(
                    image,
                    height: 50.dw,
                    width: 50.dw,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 50.dw),
                  AppText(title, family: kFontFam2, size: 22.dw)
                ],
              ),
            ),
            const AppDivider()
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(110.dh);
}
