import 'package:budgetting_app/widgets/extra_pages_app_bar.dart';
import 'package:flutter/material.dart';

class BackUpPage extends StatefulWidget {
  const BackUpPage({Key? key}) : super(key: key);

  @override
  State<BackUpPage> createState() => _BackUpPageState();
}

class _BackUpPageState extends State<BackUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const ExtraPagesAppBar(
          title: 'Back-up',
          image:
              'https://cdn4.iconfinder.com/data/icons/internet-security-flat-2/32/Internet_Security_cloud_data_safe_shield_back_up-128.png',
        ),
        body: Container());
  }
}
