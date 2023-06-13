import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class FirestoreProvider with ChangeNotifier {
 var log = Logger();
 final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  TextEditingController totext = TextEditingController();

  Future addtext() async {
    try{
      await _firebaseFirestore
        .collection('messages')
        .add({'message': totext.text,'uid': FirebaseAuth.instance.currentUser?.uid,'timestamp': DateTime.now()});
      log.i(totext.text);  
    }catch(e){
      log.i(e);
    }
    
        
  }
}
