// import 'package:chit_game_android/auth/result.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'result.dart';

// class FaceBookAuth extends StatelessWidget {
//   const FaceBookAuth({super.key});

//   Future facebookLogin(BuildContext context) async {
//     print("FaceBook");
//     try {
//       final result =
//           await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
//       print("ghghgh");
//       if (result.status == LoginStatus.success) {
//         final userData = await FacebookAuth.i.getUserData();
//         print("hello");
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => Result(userData)),
//         );

//         print(userData['name']);
//         print('AAAAAAA');
//       }
//       print("agsgsg");
//     } catch (error) {
//       print(error);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login Screen'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           child: Text('Login with Facebook'),
//           onPressed: () {
//             facebookLogin(context);
//           },
//         ),
//       ),
//     );
//   }
// }
