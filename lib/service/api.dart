import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class GetAPI {
  // firebase
  static FirebaseAuth auth = FirebaseAuth.instance;
  static String get uid => auth.currentUser!.uid;

  static FirebaseFirestore fireStore = FirebaseFirestore.instance;

  static FirebaseStorage storage = FirebaseStorage.instance;
}
