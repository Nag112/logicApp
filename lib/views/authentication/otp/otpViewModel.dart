import 'package:flutter/material.dart';
import 'package:logic/_core/app/app.locator.dart';
import 'package:logic/_core/app/app.router.dart';
import 'package:logic/_core/services/firebaseService.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OTPViewModel extends BaseViewModel {
  TextEditingController otpController = new TextEditingController();
  NavigationService _nav = locator<NavigationService>();
  FirebaseService _firebase = locator<FirebaseService>();

  final FocusNode pinPutFocusNode = FocusNode();
  bool enableOtp = true;
  String otp = "";

  onSubmit() async {
    if (otp.length == 6) {
      _firebase.verifyOTP(otp).then((value) {
        if (value) {
          _nav.clearStackAndShow(Routes.profileScreen);
        }
      }).catchError((e) {
        print(e);
      });
    }
  }

  resend() {
    _firebase.resendOTP();
  }

  onEnter(val) {
    otp = val;
  }
}
