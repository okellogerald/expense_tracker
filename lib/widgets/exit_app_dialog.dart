import 'package:flutter/services.dart';
import '../source.dart';
import '../utils/navigation_logic.dart';

class ExitAppDialog extends AlertDialog {
  const ExitAppDialog({super.key});

  @override
  Widget? get title => AppText('Are you sure to close the application ?',
      size: 16.dw, color: AppColors.onBackground);

  @override
  EdgeInsetsGeometry get contentPadding =>
      EdgeInsets.fromLTRB(15.dw, 25.dh, 15.dw, 15.dh);

  @override
  Widget? get content => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: AppTextButton(
                onPressed: SystemNavigator.pop,
                text: 'Exit',
                height: 40.dh,
                buttonColor: AppColors.disabled),
          ),
          SizedBox(width: 15.dw),
          Expanded(
            child: AppTextButton(
                onPressed: pop,
                text: 'Cancel',
                height: 40.dh,
                textColor: AppColors.onPrimary,
                buttonColor: AppColors.primary),
          )
        ],
      );
}
