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
  Map<String, int> get input => _input;
  List<String> textFields = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ];
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
    Map<String, int> _temp = {..._input};
    _temp['result'] = result;
    _database.addItem(_firebase.loggedUser?.uid, _temp);
    showResult = true;
    notifyListeners();
  }
}
