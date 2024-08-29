import 'package:budgetting_app/utils/utils.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'app_icon_button.dart';

class AppFloatingActionButton extends StatelessWidget {
  const AppFloatingActionButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
        onPressed: onPressed,
        buttonColor: AppColors.primary,
        icon: Icons.add,
        iconColor: AppColors.onPrimary,
        height: 55.dw,
        width: 55.dw,
        spreadRadius: 30.dw,
        iconSize: 30.dw);
  }
}
