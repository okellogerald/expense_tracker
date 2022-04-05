import '../source.dart';
import '../utils/navigation_logic.dart';
import 'app_divider.dart';

class CurrencySelector extends StatefulWidget {
  const CurrencySelector({Key? key, required this.onCurrencySelected})
      : super(key: key);

  final ValueChanged<String> onCurrencySelected;

  @override
  State<CurrencySelector> createState() => _CurrencySelectorState();
}

class _CurrencySelectorState extends State<CurrencySelector> {
  var selectedCurrency = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppText('Currency'),
        AppTextButton(
            height: 50.dh,
            buttonColor: AppColors.surface,
            onPressed: () => _showOptionsDialog(context),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 15.dw),
            margin: EdgeInsets.only(top: 10.dh),
            child: AppText(
                selectedCurrency.isEmpty ? 'Tap to select' : selectedCurrency)),
      ],
    );
  }

  _showOptionsDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
              child: SizedBox(
                  height: 500.dh,
                  child: Column(children: [_buildTitle(), _buildOptions()])));
        });
  }

  _buildTitle() {
    return Container(
        height: 40.dh,
        width: double.infinity,
        alignment: Alignment.center,
        color: AppColors.primary,
        child: const AppText('CHOOSE CURRENCY', color: AppColors.onPrimary));
  }

  _buildOptions() {
    return ListView.separated(
        separatorBuilder: (_, __) => const AppDivider(margin: EdgeInsets.zero),
        itemBuilder: (_, index) => _buildOption(index),
        itemCount: currencies.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics());
  }

  _buildOption(int index) {
    final currencyCode = currencies.keys.toList()[index];
    final currencyFullName = currencies.values.toList()[index];
    return AppTextButton(
        height: 40.dh,
        alignment: Alignment.centerLeft,
        onPressed: () {
          pop();
          widget.onCurrencySelected(currencyCode);
          setState(() {});
        },
        child: AppText('$currencyCode - $currencyFullName'));
  }
}
