import 'package:flutter/cupertino.dart';

class VSpace extends StatelessWidget {
  final num? size;
  const VSpace({super.key}) : size = 20;

  /// Custom size
  const VSpace.c(this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (size ?? 20).toDouble(),
    );
  }
}

class HSpace extends StatelessWidget {
  final num? size;
  const HSpace({super.key}) : size = 20;

  /// Custom size
  const HSpace.c(this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (size ?? 20).toDouble(),
    );
  }
}
