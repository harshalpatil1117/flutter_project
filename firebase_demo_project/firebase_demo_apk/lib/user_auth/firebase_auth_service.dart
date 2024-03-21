import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../model/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Auth {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  User? _firebaseUser(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(user.uid, user.email, '');
  }

  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_firebaseUser);
  }

  //SignIn
  Future<User?> handleSignInEmail(String email, String password) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _firebaseUser(result.user);
    } catch (e) {
      Fluttertoast.showToast(
          msg: '$e',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      print('Sign-in error: $e');
      return null;
    }
  }

  //SignUp
  Future<User?> handleSignUp(String email, String password) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _firebaseUser(result.user);
    } catch (e) {
      Fluttertoast.showToast(
          msg: '$e',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      print('Sign-up error: $e');
      return null;
    }
  }

  //Get User Data
  Future<String?> writeData(String username, String age,String email) async {
    final String key = email.replaceAll('.', '_');
    try {
      await _database.child('usersData').child(key).set({
        'username': username,
        'age': age,
        'email': email,
      });
      print('Data written successfully');
      return key;
    } catch (error) {
      print('Error writing data: $error');
      return null;
    }
  }

  //Read User data
  // Future<List<User>?> readData() async {
  //   List<User> userDataList = [];
  //
  //   _database.child('users').onValue.listen((event) {
  //     final snapshot = event.snapshot;
  //     final Map<dynamic, dynamic>? values =
  //         snapshot.value as Map<dynamic, dynamic>?;
  //
  //     if (values != null) {
  //       values.forEach((key, value) {
  //         final String email = value['email'] ?? '';
  //         final String password = value['password'] ?? '';
  //
  //         User _user = User('', email, password);
  //         userDataList.add(_user);
  //       });
  //
  //     } else {
  //       print('No data available');
  //     }
  //   }, onError: (error) {
  //     print('Error reading data: $error');
  //   });
  //   return userDataList;
  // }

  //Update user data
  Future<String?> updateData(String key, String newUsername, String newAge) async {
    try {
      await _database.child('usersData').child(key).update({
        'username': newUsername,
        'age': newAge,
      });
      print('User data updated successfully');
    } catch (e) {
      print('Error updating user data: $e');
    }
  }

  //Remove user data From realtime database
  void deleteUserData(String key) async {
    try {
      await _database.child('usersData').child(key).remove();
      print('User data deleted Successfully');
    } catch (e) {
      print('Error deleting user data: $e');
    }
  }

  //User Logout
  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      Fluttertoast.showToast(
          msg: '$e',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      print('Sign-out error: $e');
    }
  }
}
