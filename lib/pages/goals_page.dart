import 'package:budgetting_app/widgets/extra_pages_app_bar.dart';
import 'package:flutter/material.dart';

class GoalsPage extends StatefulWidget {
  const GoalsPage({Key? key}) : super(key: key);

  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const ExtraPagesAppBar(
          title: 'Goals',
          image:
              'https://cdn1.iconfinder.com/data/icons/business-456/500/success-128.png',
        ),
        body: Container());
  }
}
