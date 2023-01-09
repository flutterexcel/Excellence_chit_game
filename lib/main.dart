// ignore_for_file: unused_local_variable, unrelated_type_equality_checks

// ignore: unused_import
import 'package:chit_game_android/screens/bottomsheet.dart';
// ignore: unused_import
import 'package:chit_game_android/screens/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:shared_preferences/shared_preferences.dart';
// ignore: unused_import
import 'authentication/google_auth.dart';
import 'authentication/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  CollectionReference db = FirebaseFirestore.instance.collection("users");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: SplashScreen(),
    );
    // return FutureBuilder(
    //     future: SharedPreferences.getInstance(),
    //     builder:
    //         (BuildContext context, AsyncSnapshot<SharedPreferences> prefs) {
    //       var x = prefs.data;
    //       if (prefs.hasData) {
    //         if (x!.getInt('id') ==
    //             FirebaseFirestore.instance
    //                 .collection("users")
    //                 .doc(controller.googleAccount.value!.id)) {
    //           return MaterialApp(home: Profile());
    //         } else
    //           // ignore: curly_braces_in_flow_control_structures
    //           return MaterialApp(home: GoogleAuth());
    //       }

    //       return const MaterialApp(home: SplashScreen());
    //     });
  }
}
