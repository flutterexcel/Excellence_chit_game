import 'package:chit_game_android/authentication/google_auth.dart';
import 'package:chit_game_android/screens/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final _googleSignin = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  login(context) async {
    print("errrr");

    googleAccount.value = await _googleSignin.signIn();
    print("object${googleAccount.value}");

    if (googleAccount.value!.displayName != null) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Profile()));
      final googleuser = {
        "name": googleAccount.value!.displayName,
        "email": googleAccount.value!.email,
        "id": googleAccount.value!.id,
        "photoUrl": googleAccount.value!.photoUrl,
        "Credit": 10,
      };
      FirebaseFirestore.instance
          .collection('users')
          .doc(googleAccount.value!.id)
          .set(googleuser, SetOptions(merge: true));
      // final docRef = FirebaseFirestore.instance.collection('users').doc(
      //       googleAccount.value!.id,
      //     );
      // const source = Source.cache;
      // var Credit;
      // docRef.get(const GetOptions(source: source)).then(
      //       (res) => print("object$res"),
      //       onError: (e) => print("Error completing: $e"),
      //     );
      // print("object${googleuser!.Credit}")
    }
    // print("object${googleAccount.value}");
  }

  logout(context) async {
    googleAccount.value = await _googleSignin.disconnect();
    // if (googleAccount.value!.displayName == null) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => GoogleAuth()));
    // }

    // print("object${googleAccount.value}");
  }
}
