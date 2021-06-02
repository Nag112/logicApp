import 'package:firebase_auth/firebase_auth.dart';
import 'package:logic/_core/app/app.locator.dart';
import 'package:logic/_core/services/utilsService.dart';

import 'userService.dart';

class FirebaseService {
  String? _verificationId;
  UtilsService _utils = locator<UtilsService>();
  UserService _user = locator<UserService>();
  Future<void> sendOTP(mobile) async {
    _user.phone = mobile;
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
    sendOTP(_user.phone!);
  }

  Future verifyOTP(otp) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: otp,
      );
      UserCredential _temp =
          await FirebaseAuth.instance.signInWithCredential(credential);

      _user.loggedUser = _temp.user;
      _user.userToken = _temp.user?.uid;

      _user.saveUserCredentials(credential);

      return true;
    } catch (e) {
      _utils.showToast("Invalid OTP");
      return false;
    }
  }
}
