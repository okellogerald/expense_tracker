import 'package:flutter/material.dart';

class FocusWrapper extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  const FocusWrapper({super.key, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        if (onTap != null) onTap!();
      },
      child: child,
    );
  }
}
