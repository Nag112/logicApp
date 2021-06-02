import 'package:logic/_core/app/app.locator.dart';
import 'package:logic/_core/app/app.router.dart';
import 'package:logic/_core/services/firebaseService.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  FirebaseService _firebase = locator<FirebaseService>();
  NavigationService _nav = locator<NavigationService>();
  logout() async {
    await _firebase.logout();
    _nav.clearTillFirstAndShow(Routes.splashScreen);
  }
}
