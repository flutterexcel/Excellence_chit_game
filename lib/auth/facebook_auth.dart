// import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class LoginFb extends StatelessWidget {
//   const LoginFb({super.key});

//   facebookLogin(BuildContext context) async {
//     print("FaceBook");
//     try {
//       final result =
//           await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
//       if (result.status == LoginStatus.success) {
//         final userData = await FacebookAuth.i.getUserData();
//         // Navigator.push(
//         //   context,
//         //   MaterialPageRoute(builder: (context) => Result(userData)),
//         // );

//         print(userData['name']);
//         print('AAAAAAA');
//       }
//     } catch (error) {
//       print(error);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
