// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:chit_game_android/auth/result.dart';
import 'package:chit_game_android/screens/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';
// import 'google_controller.dart';

// import 'package:chit_game/login_controller.dart';
class GoogleAuth extends StatelessWidget {
  GoogleAuth({super.key});
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Welcome to Chit Game')),
        backgroundColor: Colors.deepPurple,
      ),
      // ignore: prefer_const_constructors
      // body: Profile(),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                // transform: GradientRotation(15.0),
<<<<<<< HEAD
                // ignore: prefer_const_literals_to_create_immutables
=======
>>>>>>> 3497621ca99aa036f4fe5fee42c09bda5596c21a
                colors: <Color>[
              Color(0xffC33764),
              Color(0xffC1D2671),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Center(
          child: Obx(() {
            if (controller.googleAccount.value == null) {
              return buildloginbutton(context);
            } else {
              return SizedBox();
            }
            // else {
            //   return buildprofileview();
            // }
          }),
        ),
      ),
    );
  }

  // Column buildprofileview() {
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       CircleAvatar(
  //         backgroundImage:
  //             Image.network(controller.googleAccount.value?.photoUrl ?? '')
  //                 .image,
  //         radius: 100,
  //       ),
  //       const SizedBox(
  //         height: 30,
  //       ),
  //       Text(
  //         controller.googleAccount.value?.displayName ?? '',
  //         style: Get.textTheme.bodyText1,
  //       ),
  //       Text(
  //         controller.googleAccount.value?.email ?? '',
  //         style: Get.textTheme.bodyText1,
  //       ),
  //       // ignore: prefer_const_constructors
  //       SizedBox(
  //         height: 16,
  //       ),
  //       ActionChip(
  //         avatar: const Icon(Icons.logout),
  //         label: const Text('Logout'),
  //         onPressed: () {
  //           controller.logout();
  //         },
  //       )
  //     ],
  //   );
  // }

  Widget buildloginbutton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 170),
      child: Column(
        children: [
          const SizedBox(
            height: 90,
          ),
          FloatingActionButton.extended(
            onPressed: (() {
              controller.login(context);
              // FirebaseFirestore.instance.collection('users').doc(googl.data!.docs[index]
              //                             .id)
            }),
            icon: Image.asset(
              'assets/images/google_logo.png',
              height: 32,
              width: 32,
            ),
            label: const Text('Sign in with Google'),
<<<<<<< HEAD
            backgroundColor: Color.fromARGB(255, 232, 231, 230),
=======
            backgroundColor: Colors.white,
>>>>>>> 3497621ca99aa036f4fe5fee42c09bda5596c21a
            foregroundColor: Colors.black,
          ),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton.extended(
            onPressed: (() {
              facebookLogin(context);
            }),
            icon: Image.asset(
              'assets/images/facebook_logo.png',
              height: 32,
              width: 32,
            ),
            label: const Text('Sign in with Facebook'),
            backgroundColor: Color.fromARGB(255, 86, 131, 207),
            foregroundColor: Colors.black,
          )
        ],
      ),
    );
  }

  Future facebookLogin(BuildContext context) async {
    print("FaceBook");
    try {
      final result =
          await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
      print("ghghgh");
      if (result.status == LoginStatus.success) {
        final userData = await FacebookAuth.i.getUserData();
        print("hello");
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Result(userData)));

        print(userData['name']);
        print('AAAAAAA');
      }
      print("agsgsg");
    } catch (error) {
      print(error);
    }
  }

  // FloatingActionButton buildlogifnbutton(context) {
  //   return FloatingActionButton.extended(
  //     onPressed: (() {
  //       facebookLogin(context);
  //     }),
  //     icon: Image.asset(
  //       'assets/images/facebook_logo.png',
  //       height: 32,
  //       width: 32,
  //     ),
  //     label: const Text('Sign in with facebook'),
  //     backgroundColor: Colors.white,
  //     foregroundColor: Colors.black,
  //   );
  // }
}
