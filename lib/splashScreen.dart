// ignore: file_names
import 'dart:async';

// ignore: depend_on_referenced_packages
// import 'package:chit_game/login_page.dart';
import 'package:chit_game_android/login_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
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
