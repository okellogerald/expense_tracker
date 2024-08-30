import '../utils/platform_utils.dart';
import '/extensions/source.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLoadingIndicator extends StatelessWidget {
  final Color? color;
  const AppLoadingIndicator({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    final c = color ?? context.colorScheme.primary;
    return isIOS
        ? CupertinoActivityIndicator(color: c, radius: 10)
        : CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(c),
          );
  }
}
