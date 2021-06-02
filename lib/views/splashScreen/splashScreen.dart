import 'package:flutter/material.dart';
import 'package:logic/_core/app/app.locator.dart';
import 'package:logic/_core/app/app.router.dart';
import 'package:logic/_core/services/userService.dart';
import 'package:logic/constants.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  NavigationService _nav = locator<NavigationService>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      UserService _user = locator<UserService>();
      _user.checkLogin().then((val) {
        if (val != null) {
          _nav.replaceWith(Routes.profileScreen);
        } else {
          _nav.replaceWith(Routes.loginScreen);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/icons/ic_launcher.png',
                height: size.height * 0.1,
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                "Welcome",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: kPrimaryColor,
                  fontSize: size.width * 0.10,
                ),
              ),
            ]),
      ),
    );
  }
}
