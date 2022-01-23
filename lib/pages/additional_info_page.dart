import '../source.dart';

class AdditionalInfoPage extends StatefulWidget {
  const AdditionalInfoPage(this.client, {Key? key}) : super(key: key);

  final User client;

  static void navigateTo(BuildContext context, User client) => Navigator.push(
      context, MaterialPageRoute(builder: (_) => AdditionalInfoPage(client)));

  @override
  _AdditionalInfoPageState createState() => _AdditionalInfoPageState();
}

class _AdditionalInfoPageState extends State<AdditionalInfoPage> {
  @override
  Widget build(BuildContext context) {
    final client = widget.client;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 40.dh, left: 15.dw, right: 15.dw),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.network(client.photoUrl, height: 150.dh, fit: BoxFit.contain),
          AppText(
            'Hey ${widget.client.displayName}',
            size: 24.dw,
            family: kFontFam2,
          ),
          SizedBox(height: 8.dh),
          AppText(
            'Choose a currency you will be using',
            size: 18.dw,
            color: AppColors.onBackground2,
          ),
        ]),
      ),
    );
  }
}
