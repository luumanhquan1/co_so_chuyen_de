import 'package:ccvc_mobile/config/default_env.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseSetup {
  late CollectionReference usersCollection;
  late CollectionReference postsCollection;

  Future<void> setUp() async {
    await Firebase.initializeApp();
    usersCollection = FirebaseFirestore.instance
        .collection(DefaultEnv.appCollection)
        .doc(DefaultEnv.developDoc)
        .collection(DefaultEnv.usersCollection);
    postsCollection = FirebaseFirestore.instance
        .collection(DefaultEnv.appCollection)
        .doc(DefaultEnv.developDoc)
        .collection(DefaultEnv.postsCollection);
  }
}
