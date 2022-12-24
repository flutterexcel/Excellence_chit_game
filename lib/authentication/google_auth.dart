// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text("Login Page"),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 60.0),
//             child: Center(
//               child: Column(
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.all(12),
//                     child: Text(
//                       "Welcome to Login page",
//                       style: TextStyle(
//                         color: Colors.orange,
//                         fontSize: 30,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 40,
//                   ),
//                   Container(
//                     height: 100,
//                     width: 250,
//                     decoration: BoxDecoration(
//                         color: Colors.blue,
//                         borderRadius: BorderRadius.circular(20)),

//                     //   child: ElevatedButton(
//                     //     onPressed: () {
//                     //       // Navigator.push(context,
//                     //       //     MaterialPageRoute(builder: (_) => HomePage()));
//                     //     },
//                     //     child: Row(
//                     //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //       children: [
//                     //         SizedBox(
//                     //           height: 30,
//                     //           width: 40,
//                     //           child: Image.asset('assets/logo/google_logo.png'),
//                     //         ),
//                     //         const Padding(
//                     //           padding: EdgeInsets.only(right: 20),
//                     //           child: Text(
//                     //             'Login with google',
//                     //             style:
//                     //                 TextStyle(color: Colors.black, fontSize: 18),
//                     //           ),
//                     //         ),
//                     //       ],
//                     //     ),
//                     //   ),
//                     // ),
//                     // const SizedBox(
//                     //   height: 30,
//                     // ),
//                     // Container(
//                     //   height: 50,
//                     //   width: 250,
//                     //   decoration: BoxDecoration(
//                     //       color: Colors.blue,
//                     //       borderRadius: BorderRadius.circular(20)),
//                     //   child: ElevatedButton(
//                     //     onPressed: () {
//                     //       // Navigator.push(context,
//                     //       //     MaterialPageRoute(builder: (_) => HomePage()));
//                     //     },
//                     //     child: Row(
//                     //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //       children: [
//                     //         SizedBox(
//                     //           height: 30,
//                     //           width: 40,
//                     //           child:
//                     //               Image.asset('assets/images/facebook_logo.png'),
//                     //         ),
//                     //         const Text(
//                     //           'Login with Facebook',
//                     //           style: TextStyle(color: Colors.black, fontSize: 18),
//                     //         ),
//                     //       ],
//                     //     ),
//                     //   ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
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
    return Scaffold(
      backgroundColor: Colors.lime,
      appBar: AppBar(
        title: const Text('Welcome to login page'),
        backgroundColor: Colors.brown,
      ),
      // ignore: prefer_const_constructors
      body: Center(
        child: Obx(() {
          if (controller.googleAccount.value == null) {
            return buildloginbutton(context);
          } else {
            return buildprofileview();
          }
        }),
      ),
    );
  }

  Column buildprofileview() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundImage:
              Image.network(controller.googleAccount.value?.photoUrl ?? '')
                  .image,
          radius: 100,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          controller.googleAccount.value?.displayName ?? '',
          style: Get.textTheme.bodyText1,
        ),
        Text(
          controller.googleAccount.value?.email ?? '',
          style: Get.textTheme.bodyText1,
        ),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 16,
        ),
        ActionChip(
          avatar: const Icon(Icons.logout),
          label: const Text('Logout'),
          onPressed: () {
            controller.logout();
          },
        )
      ],
    );
  }

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
              controller.login();
            }),
            icon: Image.asset(
              'assets/images/google_logo.png',
              height: 32,
              width: 32,
            ),
            label: const Text('Sign in with Google'),
            backgroundColor: Colors.orange,
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
            label: const Text('Sign in with Google'),
            backgroundColor: Colors.blueAccent,
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
  //     label: const Text('Sign in with Google'),
  //     backgroundColor: Colors.white,
  //     foregroundColor: Colors.black,
  //   );
  // }
}
