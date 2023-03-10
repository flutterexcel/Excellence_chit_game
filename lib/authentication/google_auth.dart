// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors, duplicate_ignore, avoid_print, unused_import

// ignore: unused_import
import 'package:chit_game_android/auth/profileF.dart';
// ignore: unused_import
import 'package:chit_game_android/auth/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';
// import 'google_controller.dart';

// import 'package:chit_game/login_controller.dart';
class GoogleAuth extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  GoogleAuth({super.key});

  @override
  State<GoogleAuth> createState() => _GoogleAuthState();
}

class _GoogleAuthState extends State<GoogleAuth> {
  final controller = Get.put(LoginController());
  // var check;

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();

    // ignore: duplicate_ignore
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Center(child: Text('Welcome to Chit Game')),
          backgroundColor: Colors.pink),
      // ignore: prefer_const_constructors
      // body: Profile(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/images/Blue Wallpaper.png',
          ),
        )),
        child: Builder(builder: (context) {
          print('pppp${controller.userData}');
          return Center(
              child: controller.userData == null
                  ? buildloginbutton(context)
                  : SizedBox()

              // Obx(() {
              //   if (controller.userData == null) {
              //     return buildloginbutton(context);
              //   } else {
              //     return SizedBox();
              //   }
              //   // else {
              //   //   return buildprofileview();
              //   // }
              // }),
              );
        }),
      ),
    );
  }

  // Column buildprofileview() {
  Widget buildloginbutton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Container(
            height: 300,
            width: 300,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/logoss.png',
                  ),
                )),
          ),
          SizedBox(
            height: 100,
          ),
          FloatingActionButton.extended(
            heroTag: null,
            onPressed: (() {
              // check = 1;
              controller.login(context);
            }),
            icon: Image.asset(
              'assets/images/google_logo.png',
              height: 32,
              width: 32,
            ),
            label: const Text('Sign in with Google'),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton.extended(
            heroTag: null,
            // onPressed: (() {
            //   // facebookLogin(context);
            //   // print()
            //   // FacebookAuthh();
            //   // Navigator.of(context).pushReplacement(
            //   //     MaterialPageRoute(builder: (context) => FacebookAuthh()));
            //   // FacebookAuthh(context)._login();
            //   ani._login();
            // }),
            // onPressed: () => ani.loginn(),
            onPressed: () {
              // controller.checkIfisLoggedIn(context);
              // check = 2;
              controller.loginn(context);
            },
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
}
