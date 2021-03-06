import 'package:flutter/material.dart';
import 'package:logic/_core/app/app.locator.dart';
import 'package:logic/_core/app/app.router.dart';
import 'package:logic/_core/services/firebaseService.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  NavigationService _nav = locator<NavigationService>();
  FirebaseService _firebase = locator<FirebaseService>();
  TextEditingController otpController = new TextEditingController();
  String _phone = "";

  onPhone(val) {
    _phone = val;
  }

  final FocusNode pinPutFocusNode = FocusNode();
  bool enableOtp = true;
  String otp = "";

  onSubmit() async {
    if (formKey.currentState?.validate() ?? false) {
      _firebase.sendOTP(_phone).then((value) {
        _nav.navigateTo(Routes.oTPScreen);
      }).catchError((err) {
        print(err);
      });
    }
  }
}
