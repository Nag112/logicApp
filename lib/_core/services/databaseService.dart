import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  addItem(uid, data) {
    try {
      firestore.collection("items").doc(uid).collection(DateTime.now().millisecondsSinceEpoch.toString()).add(data);
    } catch (e) {
      print(e);
    }
  }
}
