import 'package:hive/hive.dart';

part 'userCredentialModel.g.dart';

@HiveType(typeId: 0)
class Usercredentialmodel extends HiveObject {
  @HiveField(0)
  String? providerId;
  @HiveField(1)
  String? signInMethod;
  @HiveField(2)
  int? token;
  Usercredentialmodel(this.providerId, this.signInMethod, this.token);
}
