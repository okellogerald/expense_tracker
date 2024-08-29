import '../source.dart';

class OnBoardingPagesTitle extends StatelessWidget {
  const OnBoardingPagesTitle(
      {required this.title,
      required this.subtitle,
      this.icon,
      this.image,
      super.key});

  final String title;
  final IconData? icon;
  final String? subtitle, image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60.dh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.dh),
          Center(
              child: image != null
                  ? Image.asset(image!, height: 100.dw, fit: BoxFit.contain)
                  : Icon(icon, size: 100.dw, color: AppColors.primary)),
          SizedBox(height: 100.dh),
          AppText(title,
              size: 32.dw,
              family: kFontFam2,
              weight: FontWeight.bold,
              alignment: TextAlign.left),
          SizedBox(height: 10.dh),
          subtitle == null
              ? Container()
              : AppText(subtitle!, size: 16.dw, color: AppColors.onBackground2)
        ],
      ),
    );
  }
}
