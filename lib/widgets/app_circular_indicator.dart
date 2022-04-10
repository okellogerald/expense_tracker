// ignore_for_file: unused_element

import '../source.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator._(
      {this.isUsingScaffold = false, required this.loadingMessage, Key? key})
      : super(key: key);

  final bool isUsingScaffold;
  final String? loadingMessage;

  const AppLoadingIndicator.withScaffold([String? message, Key? key])
      : isUsingScaffold = true,
        loadingMessage = message,
        super(key: key);

  const AppLoadingIndicator([String? message, Key? key])
      : isUsingScaffold = false,
        loadingMessage = message,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return isUsingScaffold ? Scaffold(body: _child()) : _child();
  }

  _child() {
    final hasMessage = loadingMessage != null;
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        SizedBox(height: hasMessage ? 20.dh : 0),
        hasMessage
            ? AppText(loadingMessage!,
                color: AppColors.onBackground, family: kFontFam2, size: 15.dw)
            : Container()
      ],
    ));
  }
}
