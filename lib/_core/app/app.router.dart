// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../views/authentication/login/loginScreen.dart';
import '../../views/authentication/otp/otp.dart';
import '../../views/calculation/calcyScreen.dart';
import '../../views/profile/profileScreen.dart';
import '../../views/splashScreen/splashScreen.dart';

class Routes {
  static const String splashScreen = '/';
  static const String loginScreen = '/login-screen';
  static const String oTPScreen = '/o-tp-screen';
  static const String profileScreen = '/profile-screen';
  static const String calcyScreen = '/calcy-screen';
  static const all = <String>{
    splashScreen,
    loginScreen,
    oTPScreen,
    profileScreen,
    calcyScreen,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreen, page: SplashScreen),
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.oTPScreen, page: OTPScreen),
    RouteDef(Routes.profileScreen, page: ProfileScreen),
    RouteDef(Routes.calcyScreen, page: CalcyScreen),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SplashScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashScreen(),
        settings: data,
      );
    },
    LoginScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginScreen(),
        settings: data,
      );
    },
    OTPScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => OTPScreen(),
        settings: data,
      );
    },
    ProfileScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProfileScreen(),
        settings: data,
      );
    },
    CalcyScreen: (data) {
      var args = data.getArgs<CalcyScreenArguments>(
        orElse: () => CalcyScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => CalcyScreen(key: args.key),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// CalcyScreen arguments holder class
class CalcyScreenArguments {
  final Key? key;
  CalcyScreenArguments({this.key});
}
