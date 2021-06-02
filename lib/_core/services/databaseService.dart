import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  addItem(uid, data) {
    firestore.collection("items").doc(uid).collection("item").add(data);
  }
}
