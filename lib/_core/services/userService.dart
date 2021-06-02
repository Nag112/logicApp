import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:logic/_core/models/userCredentialModel.dart';

class UserService {
  User? loggedUser;
  String? userToken;
  String? phone;

  Future checkLogin() async {
    var box = Hive.box("user");
    Usercredentialmodel? _temp = box.get("userCredential");
    if (_temp == null) {
      UserCredential _tempUser =
          await FirebaseAuth.instance.signInWithCredential(
        AuthCredential(
            providerId: _temp!.providerId!,
            signInMethod: _temp.signInMethod!,
            token: _temp.token!),
      );
      loggedUser = _tempUser.user;
      return userToken = _tempUser.user?.uid;
    } else {
      return null;
    }
  }

  saveUserCredentials(credential) async {
    var box = Hive.box("user");
    box.put(
      "userCredential",
      Usercredentialmodel(
        credential.providerId,
        credential.signInMethod,
        credential.token,
      ),
    );
  }
}
