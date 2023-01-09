// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors, duplicate_ignore, avoid_print

import 'package:chit_game_android/auth/result.dart';
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
        // gradient: LinearGradient(
        //     // transform: GradientRotation(15.0) ,
        //     // ignore: prefer_const_literals_to_create_immutables
        //     colors: <Color>[
        //   Color(0xffC33764),
        //   Color(0xffC1D2671),
        // ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Center(
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
            //
            // Card(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(50.0),
            //   ),
            //   color: Color(0xff009696),
            //   // color: Color.fromARGB(255, 217, 168, 155),
            //   elevation: 10,
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     // ignore: prefer_const_literals_to_create_immutables
            //     children: <Widget>[],
            //   ),
            // ),
          ),
          SizedBox(
            height: 100,
          ),
          FloatingActionButton.extended(
            heroTag: null,
            onPressed: (() {
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
    // ignore: avoid_print
    print("FaceBook");
    try {
      final result =
          await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
      // ignore: avoid_print
      print("ghghgh");
      if (result.status == LoginStatus.success) {
        final userData = await FacebookAuth.i.getUserData();
        print('cccc$userData');
        // ignore: avoid_print
        print("hello");
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Result(userData)));

        // ignore: avoid_print
        print(userData['name']);
        // ignore: avoid_print
        print('AAAAAAA');
      }
      print("sgsgsg");
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
