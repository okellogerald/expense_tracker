import 'package:budgetting_app/widgets/extra_pages_app_bar.dart';
import 'package:flutter/material.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({Key? key}) : super(key: key);

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const ExtraPagesAppBar(
          title: 'Expected Income',
          image:
              'https://cdn0.iconfinder.com/data/icons/investing-and-finance-1/240/money_bag-128.png',
        ),
        body: Container());
  }
}
