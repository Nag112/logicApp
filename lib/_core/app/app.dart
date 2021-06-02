import 'package:logic/views/authentication/otp/otp.dart';
import 'package:logic/views/calculation/calcyScreen.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:logic/_core/services/firebaseService.dart';
import 'package:logic/_core/services/connectivityService.dart';

import 'package:logic/_core/services/utilsService.dart';
import 'package:logic/views/authentication/login/loginScreen.dart';

import 'package:logic/views/profile/profileScreen.dart';
import 'package:logic/views/splashScreen/splashScreen.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashScreen, initial: true),
    MaterialRoute(page: LoginScreen),
    MaterialRoute(page: OTPScreen),
    MaterialRoute(page: ProfileScreen),
    MaterialRoute(page: CalcyScreen)
  ],
  dependencies: [
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: UtilsService),
    LazySingleton(classType: ConnectivityService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: FirebaseService),
  ],
)
class AppSetup {}
