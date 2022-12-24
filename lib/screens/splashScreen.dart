// ignore_for_file: file_names, duplicate_ignore
import 'dart:async';
//import 'package:chit_game/login_page.dart';
import 'package:chit_game_android/screens/google_auth.dart';
import 'package:flutter/material.dart';
// import 'package:chit_game_android/auth/facebook_auth.dart';

// import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => GoogleAuth(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,

        // ignore: prefer_const_constructors
        child: Center(
            child: const CircularProgressIndicator(
          color: Colors.white,
        )),
      ),
    );
  }
}
