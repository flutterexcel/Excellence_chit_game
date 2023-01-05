import 'dart:convert';

import 'package:chit_game_android/authentication/google_auth.dart';
import 'package:chit_game_android/screens/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final _googleSignin = GoogleSignIn();
  // ignore: unused_field
  late FirebaseAuth _auth;
  final FirebaseAuth auth = FirebaseAuth.instance;
  var googleAccount = Rx<GoogleSignInAccount?>(null);
  late String myCredit;
  late String match;
  Map<String, dynamic>? userData;
  _demoStore(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("id_value", id);
  }

  login(context) async {
    googleAccount.value = await _googleSignin.signIn();
    // ignore: avoid_print
    print("object${googleAccount.value}");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userData = {
      "email": googleAccount.value!.email,
      "userName": googleAccount.value!.displayName,
      "photo": googleAccount.value!.photoUrl,
      "id": googleAccount.value!.id
    };

    if (googleAccount.value != null) {
      prefs.setString("userData", json.encode(userData));
    }
    if (googleAccount.value!.displayName != null) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Profile()));
      if (prefs.get("id_value") == null) {
        _demoStore(googleAccount.value!.id);
      }
      if (googleAccount.value!.id != prefs.getString("id_value")) {
        final googleuser = {
          "name": googleAccount.value!.displayName,
          "email": googleAccount.value!.email,
          "id": googleAccount.value!.id,
          "photoUrl": googleAccount.value!.photoUrl,
          "Credit": 10,
          "Winingprice": 0
        };
        await FirebaseFirestore.instance
            .collection('users')
            .doc(googleAccount.value!.id)
            .set(googleuser, SetOptions(merge: true));
      }
    }
  }

  logout(context) async {
    googleAccount.value = await _googleSignin.disconnect();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userData = null;
    prefs.remove("userData");
    // Navigator.pop(context);
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => GoogleAuth()));
  }

  getUserDetails(context, userDataa) {
    userData = {
      "email": userDataa!['email'],
      "userName": userDataa!['userName'],
      "photo": userDataa!['photo'],
      "id": userDataa!['id']
    };
  }
}
