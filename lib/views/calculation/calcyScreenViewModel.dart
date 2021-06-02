import 'package:logic/_core/app/app.locator.dart';
import 'package:logic/_core/app/app.router.dart';
import 'package:logic/_core/services/databaseService.dart';
import 'package:logic/_core/services/firebaseService.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CalcyScreenViewModel extends BaseViewModel {
  int result = 0;
  bool showResult = false;
  Map<String, int> _input = {};
  NavigationService _nav = locator<NavigationService>();
  FirebaseService _firebase = locator<FirebaseService>();
  DatabaseService _database = locator<DatabaseService>();
  onText(type, val) {
    _input[type] = int.tryParse(val) ?? 0;

    notifyListeners();
  }

  openHistory() {
    _nav.navigateTo(Routes.profileScreen);
  }

  calculate() {
    result = 0;
    _input.values.forEach((element) {
      print(element);
      result += element;
    });
    _input['result'] = result;
    _database.addItem(_firebase.loggedUser?.uid, _input);
    showResult = true;
    notifyListeners();
  }
}
