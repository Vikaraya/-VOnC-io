import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

// firebase signup
  Future<String> signUp({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    String res = "Some error occurred";
    try {
      // Check if fields are not empty
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          confirmPassword.isNotEmpty) {
        // Check if passwords match
        if (password != confirmPassword) {
          return "Passwords do not match";
        }

        // Create user with email and password
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Store user information in Firestore
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'id': cred.user!.uid,
          'email': email,
        });

        res = "success"; // Return success message
      } else {
        return "Please fill in all fields"; // Return error if fields are empty
      }
    } catch (e) {
      print("Error during sign up: ${e.toString()}"); // Log the error
      res = e.toString(); // Return the error message
    }
    return res; // Return the result
  }

  // firebase login
  Future<String> signIn({
    required String email,
    required String password,
    required AuthenticationService authService,
  }) async {
    String res = "some error occured";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await AuthenticationService()
            ._auth
            .signInWithEmailAndPassword(email: email, password: password);
        return "success";
      } else {
        return "Please enter all the fields";
      }
    } catch (e) {
      print(e.toString());
    }
    return res;
  }
}
