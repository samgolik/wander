import 'package:cloud_firestore/cloud_firestore.dart' as firebase_auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wander/model/user.dart' as user_model;

class UserService {
  final firebase_auth.FirebaseFirestore _firestore =
      firebase_auth.FirebaseFirestore.instance;

  Future<void> createUserInFirestore(User user) async {
    final userDoc =
        FirebaseFirestore.instance.collection('users').doc(user.uid);

    final userExists = (await userDoc.get()).exists;

    if (!userExists) {
      await userDoc.set({
        'email': user.email,
        'categories': [],
      });
      print("User document created in Firestore.");
    } else {
      print("User document already exists in Firestore.");
    }
  }

  Future<void> saveUser(user_model.User user) async {
    await _firestore.collection('users').doc(user.uid).set(
          user.toFirestore(),
          firebase_auth.SetOptions(merge: true),
        );
  }

  Future<user_model.User?> getUser() async {
    print("Fetching current user...");
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user == null) {
      print("No authenticated user found.");
      return null;
    }

    final uid = user.uid;
    print("Authenticated user UID: $uid");

    final userDoc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (!userDoc.exists) {
      print("User document does not exist in Firestore.");
      return null;
    }

    final userData = userDoc.data();

    return user_model.User.fromFirestore(userData!, uid);
  }
}
