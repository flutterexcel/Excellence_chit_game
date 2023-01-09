// ignore_for_file: file_names, duplicate_ignore, use_build_context_synchronously
import 'dart:async';
import 'dart:convert';
//import 'package:chit_game/login_page.dart';
import 'package:chit_game_android/auth/profileF.dart';
import 'package:chit_game_android/authentication/google_auth.dart';
import 'package:chit_game_android/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/profile.dart';
// import 'package:chit_game_android/auth/facebook_auth.dart';

// import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const SplashScreen({key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = Get.put(LoginController());

  @override
  void initState() {
    super.initState();

    checkUser();
  }

  // removeData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.remove("userData");
  //   print("jouihyguhbjn");
  // }

  checkUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var rt = prefs.getString("userData");
    // ignore: avoid_print
    print("jhvhbvg$rt");
    if (rt == null) {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => GoogleAuth(),
            ));
      });
    } else {
      Map userData = jsonDecode(rt);
      controller.getUserDetails(context, userData);
      print('qqqq$userData');
      if (controller.check == 1) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Profile()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ProfileF()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.blue,
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
            // ignore: prefer_const_constructors
            image: DecorationImage(
          fit: BoxFit.cover,
          // ignore: prefer_const_constructors
          image: AssetImage(
            'assets/images/Blue Wallpaper.png',
          ),
        )
            // ignore: prefer_const_constructors
            // gradient: LinearGradient(
            //     // transform: GradientRotation(15.0),
            //     // ignore: prefer_const_literals_to_create_immutables
            //     colors: <Color>[
            //   // ignore: prefer_const_constructors
            //   Color(0xffC33764),
            //   // ignore: use_full_hex_values_for_flutter_colors
            //   const Color(0xffC1D2671),
            // ], begin: Alignment.topCenter, end: Alignment.bottomCenter)

            ),

        // ignore: prefer_const_constructors
        child: Center(
            child: const CircularProgressIndicator(
          color: Colors.white,
        )),
      ),
    );
  }
}
