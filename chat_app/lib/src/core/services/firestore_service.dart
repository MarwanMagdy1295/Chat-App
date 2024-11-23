import 'package:chat_app/src/modules/chat_screen/data/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class FirestoreService {
  final CollectionReference userCollectionRef =
      FirebaseFirestore.instance.collection('users');

  Future createUser(User user) async {
    try {
      userCollectionRef.doc(user.id).set(user.toJson());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      e.toString();
    }
  }
}
