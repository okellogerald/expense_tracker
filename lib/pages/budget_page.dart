import '../source.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({Key? key}) : super(key: key);

  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.fromLTRB(15.dw, 30.dh, 15.dw, 0),
      children: [
        AppText('Plan your budget', size: 25.dw),
        //_buildSectionTitle('Set an overall budget'),
        _buildTextButton('Set overall budget'),
      ],
    ));
  }

  _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 20.dh),
      child: AppText(
        title,
        color: AppColors.textColor2,
        size: 18.dw,
      ),
    );
  }

  _buildTextButton(String text) {
    return Padding(
      padding: EdgeInsets.only(top: 20.dh),
      child: AppTextButton(
        onPressed: () {},
        alignment: Alignment.centerLeft,
        textColor: AppColors.primaryColor,
        fontSize: 16.dw,
        useButtonSizeOnly: false,
        text: text,
      ),
    );
  }
}
