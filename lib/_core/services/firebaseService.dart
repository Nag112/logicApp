import 'package:firebase_auth/firebase_auth.dart';
import 'package:logic/_core/app/app.locator.dart';
import 'package:logic/_core/services/utilsService.dart';

class FirebaseService {
  String? _verificationId;
  UtilsService _utils = locator<UtilsService>();
  String? phone;
  User? get loggedUser => FirebaseAuth.instance.currentUser;
  Future<void> sendOTP(mobile) async {
    phone = mobile;
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      this._verificationId = verId;
    };
    final PhoneCodeSent smsCodeSent = (String verId, int? forceCodeResent) {
      this._verificationId = verId;
      _utils.showToast("An OTP has been sent");
    };

    final PhoneVerificationCompleted verifiedSuccess = (AuthCredential auth) {
      print("verification complete ${auth.token}");
    };
    final PhoneVerificationFailed verifyFailed = (FirebaseAuthException e) {
      print('${e.message}');
    };
    return await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91$mobile",
      timeout: const Duration(seconds: 5),
      verificationCompleted: verifiedSuccess,
      verificationFailed: verifyFailed,
      codeSent: smsCodeSent,
      codeAutoRetrievalTimeout: autoRetrieve,
    );
  }

  login() async {}
  resendOTP() async {
    sendOTP(phone!);
  }

  Future verifyOTP(otp) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: otp,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      return true;
    } catch (e) {
      _utils.showToast("Invalid OTP");
      return false;
    }
  }
}
