import 'package:budgetting_app/widgets/extra_pages_app_bar.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const ExtraPagesAppBar(
          title: 'Account',
          image:
              'https://cdn3.iconfinder.com/data/icons/galaxy-open-line-gradient-i/200/account-128.png',
        ),
        body: Container());
  }
}
