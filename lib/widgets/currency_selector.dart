import 'package:budgetting_app/providers/user_details_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../source.dart';
import '../utils/navigation_logic.dart';
import 'app_divider.dart';

class CurrencySelector extends ConsumerStatefulWidget {
  const CurrencySelector({Key? key}) : super(key: key);

  @override
  ConsumerState<CurrencySelector> createState() => _CurrencySelectorState();
}

class _CurrencySelectorState extends ConsumerState<CurrencySelector> {
  @override
  Widget build(BuildContext context) {
    var user = ref.watch(userDetailsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 10.dw),
            child: AppText('Currency',
                size: 16.dw, color: AppColors.onBackground2)),
        AppTextButton(
            height: 50.dh,
            buttonColor: AppColors.surface,
            onPressed: () => _showOptionsDialog(context),
            alignment:
                user.currency.isEmpty ? Alignment.center : Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 15.dw),
            margin: EdgeInsets.only(top: 10.dh),
            child: AppText(
                user.currency.isEmpty ? 'Tap to select' : user.currency,
                size: 15.dw,
                color: user.currency.isEmpty
                    ? AppColors.onBackground2
                    : AppColors.onBackground)),
      ],
    );
  }

  _showOptionsDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
              insetPadding: EdgeInsets.symmetric(horizontal: 10.dw),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.dw))),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20.dw)),
                  child: SizedBox(
                      height: 700.dh,
                      child:
                          Column(children: [_buildTitle(), _buildOptions()]))));
        });
  }

  _buildTitle() {
    return Container(
        height: 60.dh,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.dw),
                topRight: Radius.circular(20.dw))),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 15.dw),
        child: AppText('Choose Currency',
            color: AppColors.onPrimary, size: 16.dw));
  }

  _buildOptions() {
    return Expanded(
      child: Scrollbar(
        child: ListView.separated(
            separatorBuilder: (_, __) =>
                const AppDivider(margin: EdgeInsets.zero),
            itemBuilder: (_, index) => _buildOption(index),
            itemCount: currencies.length,
            shrinkWrap: true),
      ),
    );
  }

  _buildOption(int index) {
    final currencyCode = currencies.keys.toList()[index];
    final currencyFullName = currencies.values.toList()[index];
    final isSelected = currencyCode == ref.watch(userDetailsProvider).currency;
    return GestureDetector(
      onTap: () {
        if (isSelected) _updateCurrency('');
        if (!isSelected) _updateCurrency(currencyCode);
      },
      child: Container(
          height: 40.dh,
          padding: EdgeInsets.only(left: 15.dw),
          color: isSelected ? AppColors.background : Colors.white,
          alignment: Alignment.centerLeft,
          child: AppText('$currencyCode - $currencyFullName',
              size: 16.dw,
              color: isSelected ? AppColors.onBackground : AppColors.background,
              maxLines: 1)),
    );
  }

  _updateCurrency(String value) {
    pop();
    updateUserDetails(ref, currency: value);
  }
}
