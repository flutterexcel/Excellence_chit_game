import 'package:chit_game_android/authentication/google_auth.dart';
import 'package:chit_game_android/screens/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final _googleSignin = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);
  late String myCredit;

  login(context) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    void inputData() {
      final User? user = auth.currentUser;
      final uid = user!.uid;
      // here you write the codes to input the data into firestore
    }

    print("errrr");

    googleAccount.value = await _googleSignin.signIn();
    print("object${googleAccount.value}");

    if (googleAccount.value!.displayName != null) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Profile()));
      print("gfg");
      final googleuser = {
        "name": googleAccount.value!.displayName,
        "email": googleAccount.value!.email,
        "id": googleAccount.value!.id,
        "photoUrl": googleAccount.value!.photoUrl,
        "Credit": 10,
      };
      await FirebaseFirestore.instance
          .collection('users')
          .doc(googleAccount.value!.id)
          .set(googleuser, SetOptions(merge: true));
      //     Future<User> _fetchUserInfo(String id) async {
      //   User fetchedUser;
      //   var snapshot =
      //       await Firestore.instance.collection('user').document(id).get();
      //   return User(snapshot);
      // }

      // FirebaseFirestore.instance
      //     .collection("users")
      //     .doc(googleAccount.value!.id)
      //     .snapshots()
      //     .listen((event) {
      //   print("higuybh${event.data()!['Credit']}");
      //   var cred = {event.data()!['Credit']};
      // });

      // DocumentSnapshot docRef = await FirebaseFirestore.instance
      //     .collection("users")
      //     .doc(
      //       googleAccount.value!.id,
      //     )
      //     .get();
      // // print("dfsdfs${docRef.data()!.Credit}");
      // // docRef.get().then(
      // //   (DocumentSnapshot doc) {
      // //     final data = doc.data() as Map<String, dynamic>;
      // //     // ...
      // //   },
      // //   onError: (e) => print("Error getting document: $e"),
      // // );
    }
  }

  logout(context) async {
    googleAccount.value = await _googleSignin.disconnect();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => GoogleAuth()));
  }
}
