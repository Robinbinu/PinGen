import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
//import 'package:provider/provider.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  UserCredential? result;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var log = Logger();

  AuthProvider() {
    _auth.authStateChanges().listen((event) {
      user = _auth.currentUser;
      notifyListeners();
    });
  }

  //Login
  Future login(BuildContext context) async {
    try {
      result = await _auth.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      user = result?.user;
      log.i("${user?.email.toString()}"
          "${user?.uid.toString()}");
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error:${e.toString()}')));
      log.i(e);
    }
  }

  Future register(BuildContext context) async {
    try {
      result = await _auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      log.i("User created");
      log.i("${user?.email.toString()}"
          "${user?.uid.toString()}");
      Navigator.pop(context);
    } catch (e) {
      // _scaffoldKey.currentState.showSnackBar(snackBar);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error:${e.toString()}')));
      log.i(e);
    }
  }

  Future loginguest(BuildContext context) async {
    try {
      result = await _auth.signInAnonymously();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error:${e.toString()}')));
      log.i(e);
    }
  }

  Future logOut() async {
    try {
      await _auth.signOut();
      log.i('logged out');
    } catch (e) {
      log.i(e);
    }
  }
}
