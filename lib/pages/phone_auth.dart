import 'package:firebase_auth/firebase_auth.dart';

import '../source.dart';

class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({Key? key}) : super(key: key);

  @override
  State<PhoneAuthPage> createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  final controller = TextEditingController();
  final phoneImpl = PhoneImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: controller,
            style: const TextStyle(color: AppColors.onBackground),
          ),
          const SizedBox(height: 20),
          AppTextButton(
            onPressed: () => phoneImpl.sendOTP(controller.text),
            text: 'Send OTP',
            textColor: AppColors.onBackground,
          ),
          const SizedBox(height: 20),
          AppTextButton(
            onPressed: () => phoneImpl.verifyOTP('172934'),
            text: 'Verify OTP',
            textColor: AppColors.onBackground,
          )
        ],
      ),
    );
  }
}

enum AuthState { initial, loading, failed, success }

class PhoneImpl extends ChangeNotifier {
  var _authState = AuthState.initial;

  var id = '';

  void sendOTP(String phoneNumber) async {
    FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  void verifyOTP(String code) async {
    final credential =
        PhoneAuthProvider.credential(verificationId: id, smsCode: code);
    await FirebaseAuth.instance.signInWithCredential(credential);
    log('success');
  }

  void verificationCompleted(PhoneAuthCredential phoneAuthCredential) {
    log('verification completed');
    log(phoneAuthCredential.smsCode ?? 'no code was given');
  }

  void verificationFailed(FirebaseAuthException error) {
    log('verification failed');
    log('$error');
  }

  void codeSent(String verificationId, int? forceResendingToken) {
    id = verificationId;
    log('code sent');
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    id = verificationId;
    log('connection time-out');
  }
}
