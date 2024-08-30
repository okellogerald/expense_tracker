// check this out @https://github.com/fluttercommunity/flutter_after_layout/blob/master/lib/after_layout.dart

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin AfterLayoutMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.endOfFrame.then(
      (_) {
        if (mounted) afterFirstLayout(context);
      },
    );
  }

  FutureOr<void> afterFirstLayout(BuildContext context);
}

abstract class TemboState<T extends StatefulWidget> extends State<T>
    with AfterLayoutMixin {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context);
}

abstract class TemboConsumerState<T extends ConsumerStatefulWidget>
    extends ConsumerState<T> with AfterLayoutMixin {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context);
}

abstract class TemboPage extends StatelessWidget {
  const TemboPage({super.key});

  String get name;
}

abstract class TemboStatefulPage extends StatefulWidget {
  const TemboStatefulPage({super.key});

  String get name;
}

abstract class TemboConsumerPage extends ConsumerStatefulWidget {
  const TemboConsumerPage({super.key});

  String get name;
}
