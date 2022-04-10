import '../source.dart';

class OnBoardingPagesTitle extends StatelessWidget {
  const OnBoardingPagesTitle(
      {required this.title,
      required this.subtitle,
      required this.image,
      this.hasNetworkImage = true,
      Key? key})
      : super(key: key);

  final String title, image;
  final String? subtitle;
  final bool hasNetworkImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60.dh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60.dh),
          Center(
              child: hasNetworkImage
                  ? Image.network(image, height: 80.dh, fit: BoxFit.contain)
                  : Image.asset(image, height: 60.dh, fit: BoxFit.contain)),
          SizedBox(height: 100.dh),
          AppText(title,
              size: 32.dw,
              family: kFontFam2,
              isBolded: true,
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
