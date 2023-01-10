import 'dart:convert';

import 'package:chit_game_android/auth/profileF.dart';
import 'package:chit_game_android/authentication/google_auth.dart';
import 'package:chit_game_android/screens/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
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
  AccessToken? _accessToken;
  // var check;
  // bool _checking = true;
  Map<String, dynamic>? userData;
  _demoStore(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("id_value", id);
  }

  signinmethod(String check) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("checking", check);
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
      if (prefs.getString("id_value") == null) {
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
        print('iuiu$googleuser');
        await FirebaseFirestore.instance
            .collection('users')
            .doc(googleAccount.value!.id)
            .set(googleuser, SetOptions(merge: true));
      }
    }
    // check = 1;
    if (prefs.getString("checking") == null) {
      signinmethod('google');
    }
  }

  // checkIfisLoggedIn(context) async {
  //   final accessToken = await FacebookAuth.instance.accessToken;
  //   print('bbbbb${accessToken!.toJson()}');

  //   if (accessToken != null) {
  //     print(accessToken.toJson());
  //     userData = await FacebookAuth.instance.getUserData();
  //     _accessToken = accessToken;
  //     Navigator.of(context)
  //         .pushReplacement(MaterialPageRoute(builder: (context) => ProfileF()));
  //   } else {
  //     loginn(context);
  //   }
  // }

  loginn(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    print('oooo');
    final LoginResult result = await FacebookAuth.instance
        .login(permissions: ['public_profile', 'email']);

    // print('dddd$_accessToken');
    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken;
      // print('dddd$_accessToken');

      final userDataa = await FacebookAuth.instance.getUserData();
      userData = {
        "email": userDataa['email'],
        "userName": userDataa['name'],
        "photo": userDataa['picture']['data']['url'],
        "id": userDataa['id'],
      };
      // prefs.setString("userData", json.encode(userData));
      // if (prefs.getString("id_value") == null) {
      //   _demoStore(userData!['id']);
      // }
      if (userData != null) {
        prefs.setString("userData", json.encode(userData));
      }
      print('eeee$userData');
      if (userData!['email'] != null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Profile()));
        if (prefs.getString("id_value") == null) {
          _demoStore(userData!['id']);
        }
        print('iyuuhy${prefs.getString("id_value")}');
        print('bhggt${userData!['id']}');
        if (userData!['id'] != prefs.getString("id_value")) {
          print('ppp$userData');
          final googleuser = {
            "name": userDataa['name'],
            "email": userDataa['email'],
            "id": userDataa['id'],
            "photoUrl": userDataa['picture']['data']['url'],
            "Credit": 10,
            "Winingprice": 0
          };
          print('yyy$googleuser');
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userData!['id'])
              .set(googleuser, SetOptions(merge: true));
        }
      }
      print("nvg$userData");
    } else {
      print(result.status);
      print(result.message);
    }
    // setState(() {
    //   _checking = false;
    // });
    // if (userData!['id'] != prefs.getString("id_value")) {
    //   print('ppp$userData');
    //   final facebooku = {
    //     "name": userData!['name'],
    //     "email": userData!['email'],
    //     "id": userData!['id'],
    //     "photoUrl": userData!['picture']['data']['url'],
    //     "Credit": 10,
    //     "Winingprice": 0
    //   };
    //   print('yyy$facebooku');
    //   await FirebaseFirestore.instance
    //       .collection('fuser')
    //       .doc(userData!['id'])
    //       .set(facebooku, SetOptions(merge: true));
    // }

    if (prefs.getString("checking") == null) {
      signinmethod('facebook');
    }
  }

  logoutt(context) async {
    print('mmmmmmm');
    await FirebaseAuth.instance.signOut();
    FacebookAuth.instance.logOut();
    // accessToken = null;
    // LoginResult result = null;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userData = null;
    prefs.remove("userData");

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => GoogleAuth()));
    //  setState(() {});
  }

  logout(context) async {
    print('vvvv');
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

//implementation of facebook_auth_flutter ?