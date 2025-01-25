import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EmailAuthServices {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // create account
  Future<String?> registration({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      // Create the user with email and password
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Update the user's display name
      await userCredential.user?.updateDisplayName(name);
      await userCredential.user?.reload();

      // Save user data to Firestore
      await _firestore.collection('users').doc(userCredential.user?.uid).set({
        'name': name,
        'email': email,
        'createdAt': Timestamp.now(),
      });

      return "Success";
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        return "The password provided is too weak!";
      } else if (e.code == "email-already-in-use") {
        return "The account already exists for that email!";
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }


  // log in

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "Success";
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        return "No user found for this email";
      } else if (e.code == "wrong-password") {
        return "Wrong password provided for that user.";
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }
}
