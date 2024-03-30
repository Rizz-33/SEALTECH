import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //instances of auth and firestore
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Stream for listening to changes in user authentication state
  Stream<User?> get userStream => _auth.authStateChanges();

  //get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  //sign in
  Future<UserCredential> signInWithEmailPassword(String email, password, String name) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);

      // save user if it doesn't already exist
      await _firestore.collection("Users").doc(userCredential.user!.uid).set(
        {
          'uid' : userCredential.user!.uid,
          'email' : email,
          'name' : name, // Save user's name
        }
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign up
  Future<UserCredential> signUpWithEmailAndPassword(String email, password, String name) async {
    try {
      //create user
      UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(email: email, password: password);
      

      // save user
      await _firestore.collection("Users").doc(userCredential.user!.uid).set(
        {
          'uid' : userCredential.user!.uid,
          'email' : email,
          'name' : name, // Save user's name
        }
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign out
  Future<void> signOut() async {
    return await _auth.signOut();
  }

  //errors
}
